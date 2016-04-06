#ifdef CBMC
#include <openssl/sha.h>
#include <openssl/bn.h>
#include <stdio.h>
#define XDATA_VAR(addr, type, name) type name
#define XDATA_ARR(addr, size, type, name) type name[size]
#define XDATA_PTR(addr, type, name) type* name
#define XDATA
#define CODE
#else
#include <reg51.h>
#define XDATA_VAR(addr, type, name) __xdata __at(addr) type name
#define XDATA_ARR(addr, size, type, name) __xdata __at(addr) type name[size]
#define XDATA_PTR(addr, type, name) __xdata type* __xdata __at(addr) name
#define XDATA __xdata
#define CODE __code
#endif

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

#define N 256
#define K1 16
#define K2 16

XDATA_VAR(0xFE00, unsigned char, sha_reg_start);
XDATA_VAR(0xFE01, unsigned char, sha_reg_state);
XDATA_PTR(0xFE02, unsigned char, sha_reg_rd_addr);
XDATA_PTR(0xFE04, unsigned char, sha_reg_wr_addr);
XDATA_VAR(0xFE06, unsigned int, sha_reg_len);

XDATA_VAR(0xFD00, unsigned char, exp_reg_start);
XDATA_VAR(0xFD01, unsigned char, exp_reg_state);
XDATA_PTR(0xFD02, unsigned char, exp_reg_opaddr);
XDATA_ARR(0xFC00, N, unsigned char, exp_reg_n);
XDATA_ARR(0xFB00, N, unsigned char, exp_reg_exp);
XDATA_VAR(0xFA00, struct RSAmsg, exp_reg_m);

XDATA_VAR(0xFE40, unsigned char, memwr_reg_start);
XDATA_VAR(0xFE41, unsigned char, memwr_reg_state);
XDATA_PTR(0xFE42, unsigned char, memwr_reg_rd_addr);
XDATA_PTR(0xFE44, unsigned char, memwr_reg_wr_addr);
XDATA_VAR(0xFE46, unsigned int, memwr_reg_len);

// state of PRG for R and G in OAEP
XDATA_ARR(0xFD10, 20, unsigned char, rprg);
XDATA_ARR(0xFD30, 20, unsigned char, gprg);

struct RSAmsg{
    unsigned char padbyte;
    unsigned char m[N-K2-K1-1];
    unsigned char zeros[K1];
    unsigned char r[K2];
};

struct RSAmsg *decrypted;
unsigned char *hash;
unsigned char *data;

// for locking and unlocking memory
void lock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
    // make unused argument warnings go away
    (void) startaddr;
    (void) endaddr;
}
void unlock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
    // make unused argument warnings go away
    (void) startaddr;
    (void) endaddr;
}

#ifdef CBMC
// c abstraction of memwr
// return 1 if succeed, 0 if fail
int c_load(unsigned char skipread)
{
    static unsigned char buff[0x2000];
    static unsigned char initial = 1;
    int i = 0;

    memwr_reg_start = 0;
    memwr_reg_state = 1;

    // make a program image
    if(initial)
    {
	unsigned int hex;
	// for now just read from stdin
	while(scanf("%x",&hex)!=EOF)
	{
	    buff[i] = hex;
	    i++;
	}
	initial = 0;
    }
    if(!skipread)
	for(i=0; i < memwr_reg_len; i++)
	    buff[i] = memwr_reg_rd_addr[i];
    memwr_reg_state = 2;
    for(i=0; i< memwr_reg_len; i++)
	memwr_reg_wr_addr[i] = buff[i];
    memwr_reg_state = 0;    
}

void c_sha(int len)
{
    sha_reg_start = 0;
    sha_reg_state = 1;
    SHA1(sha_reg_rd_addr, len, sha_reg_wr_addr);
    sha_reg_state = 0;
}

// C implementation of modular exponentiation
// return 1 if succeed, 0 if fail
int c_exp()
{
    BIGNUM *r = BN_new();
    BIGNUM *a = BN_new();
    BIGNUM *p = BN_new();
    BIGNUM *m = BN_new();
    BN_CTX *ctx = BN_CTX_new(); // temp variables
    if(!ctx)
	return 0;

    exp_reg_start = 0;
    exp_reg_state = 1;

    // initialize values
    a = BN_bin2bn((unsigned char*)&exp_reg_m, N, a);
    p = BN_bin2bn(exp_reg_exp, N, p);
    m = BN_bin2bn(exp_reg_n, N, m);

    // do exponentiation
    BN_mod_exp(r, a, p, m, ctx); //r = a^p mod m
    // write back
    exp_reg_state = 2;
    if(BN_bn2bin(r, exp_reg_opaddr) != N)
	return 0;

    // clear and free
    BN_CTX_free(ctx);
    BN_free(r);
    BN_free(a);
    BN_free(p);
    BN_free(m);

    exp_reg_state = 0;
}
#endif

// set up data transfer
// copy data of length bytes to startaddr
// if skipread, don't read from data, just write values already in memwr buffer to startaddr
void load(unsigned char* data, int length, unsigned char* startaddr, unsigned char skipread)
{
    memwr_reg_rd_addr = (XDATA unsigned char*)data;
    memwr_reg_wr_addr = (XDATA unsigned char*)startaddr;
    memwr_reg_len = length;
    memwr_reg_start = (unsigned char)(skipread << 1 | 1);
#ifdef CBMC
    c_load(skipread);
#endif

    // wait for load to finish
    while(memwr_reg_state != 0);
}

void RSAinit()
{
    decrypted = (struct RSAmsg*)exp_reg_opaddr;
    hash = sha_reg_wr_addr;
    data = sha_reg_rd_addr;
}

// returns length of message
int unpad()
{
    int len;

    for(len = N-K1-K2-2; len>=0; len--)
    {
	if(decrypted->m[len] == 1)
	    break;
	else if(decrypted->m[len] != 0)
	    return -1;
    }
    return len;
}

// set up message and compute SHA
void sha1(unsigned char *m, int len)
{
    int i;
    int mlen;

    // setup data
    mlen = ((len+4) & 0xFFC0) + 64; // round len+5 up to multiple of 64
    
    if(m != sha_reg_rd_addr) // don't copy if already in right address
	load(m, len, sha_reg_rd_addr, 0); // copy m

    // add 100.. padding
    data[len] = 0x80;

    for(i=len+1; i<mlen; i++)
	data[i] = 0;

    // insert length in bits
    data[mlen-1] = (len << 3) & 0xFF;
    data[mlen-2] = (len >> 5) & 0xFF;
    data[mlen-3] = (len >> 13) & 0xFF;
    data[mlen-4] = (len >> 21) & 0xFF;

    // encrypt with sha1
    lock_wr(sha_reg_rd_addr, sha_reg_rd_addr+sha_reg_len);
    sha_reg_len = mlen;
    sha_reg_start = 1;
#ifdef CBMC
    c_sha(len);
#endif
    while(sha_reg_state != 0);
    unlock_wr(sha_reg_rd_addr, sha_reg_rd_addr+sha_reg_len);
}

// HMAC computed and written to sha_reg_wr_addr
void HMAC(const unsigned char *key, int klen, const unsigned char *message, int mlen)
{
    int i;

    // inner hash
    for(i=0; i<klen; i++)
	data[i] = key[i] ^ 0x36;
    for(i=klen; i<64;i++)
	data[i] = 0x36;
    for(i=0; i<mlen; i++)
	data[i+64] = message[i];

    sha1(data, 64+mlen);
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);

    // outer hash
    for(i=0; i<klen; i++)
	data[i] = key[i] ^ 0x5c;
    for(i=klen; i<64;i++)
	data[i] = 0x5c;
    for(i=0; i<20; i++)
	data[i+64] = hash[i];

    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
    sha1(data, 84);
}

// copy seed into the PRG state
void PRGinit(unsigned char *seed, int slen, unsigned char *state)
{
    int i;
    for(i=0; i<slen && i < 20; i++)
	state[i] = seed[i];
    for(i=slen; i<20; i++)
	state[i] = 0;
}

// random zero and one for PRG
const unsigned char zero[] = {0x98, 0xBC, 0x1B, 0x58,
			     0xC2, 0x5B, 0x7B, 0x51,
			     0x48, 0x14, 0x83, 0xA7,
			     0xEA, 0xDB, 0x15, 0x2E,
			     0xCE, 0x7A, 0xE1, 0x0C,
			     0xF7, 0x1D, 0x96, 0xDE,
			     0xDE, 0x16, 0x68, 0x61,
			     0x48, 0x25, 0x99, 0x66};

const unsigned char one[] = {0xA2, 0x66, 0x95, 0x53,
			     0x0E, 0x13, 0x56, 0xA9,
			     0xDF, 0x42, 0x6F, 0x0F,
			     0x74, 0xA4, 0x06, 0xFF,
			     0xA0, 0x6D, 0x07, 0x17,
			     0x30, 0xAE, 0x16, 0xD2,
			     0x87, 0x76, 0x8A, 0x9B,
			     0x92, 0xAE, 0x36, 0xB9};


// generate random number, put in hash
void PRG(unsigned char* state)
{
    int i;
    unsigned char next[20];

    HMAC(state, 20, one, 32);
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
    for(i=0; i<20; i++)
	next[i] = hash[i];
    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);

    HMAC(state, 20, zero, 32);
    for(i=0; i<20; i++)
	state[i] = next[i];
}

// seed for computing H function in OAEP
const unsigned char Hseed[] = {
    0x66, 0x02, 0x5D, 0xC9,
    0x80, 0x48, 0xA5, 0x9F,
    0x2C, 0xB3, 0xAA, 0x6C,
    0x1A, 0x81, 0xA9, 0xAA,
    0xE8, 0x93, 0x21, 0x0E/*,
    0x24, 0x99, 0x6F, 0x06,
    0xEB, 0xC0, 0x4F, 0x3A,
    0x0D, 0x2F, 0x8F, 0x0A*/
};

// remove OAEP from message at location exp_reg_opaddr
// return 1 if succeed, 0 if fail
int removeOAEP()
{
    int i,j;

    // compute r
    HMAC(Hseed, 20, decrypted->m, N-K2-1);
    // lock hash and copy r to message
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr + 20);
    for(i=0; i< K2; i++)
	decrypted->r[i] = decrypted->r[i] ^ hash[i];
    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);

    // find m
    PRGinit(decrypted->r, K2, gprg);
    PRG(gprg);
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == 20)
	{
	    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	    PRG(gprg);
	    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	    j = 0;
	}
	decrypted->m[i] = decrypted->m[i] ^ hash[j];
	lock_wr(decrypted->m + i,decrypted->m + i+1);
	i++;
	j++;
    }
    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);

    // check zeros
    for(i = 0; i< K1; i++)
	if(decrypted->zeros[i])
	    return 0;
    return 1;
}

// decrypt msg, puts decrypted text in exp_reg_opaddr
// returns length of decrypted message
int decrypt(unsigned char* msg){
    int i;

    // copy msg into RSA m register
    if(msg != (unsigned char*)&exp_reg_m)
	//load(msg, N, (unsigned int)exp_reg_m, 0);
	for(i=0; i<N; i++)
	    ((unsigned char*)&exp_reg_m)[i] = msg[i];

    // lock message during exponentiation
    lock_wr((unsigned char*)&exp_reg_m, (unsigned char*)&exp_reg_m + N);

    // decrypt
    exp_reg_start = 1;

#ifdef CBMC
    c_exp();
#endif

    while(exp_reg_state != 0);
    lock_wr(exp_reg_opaddr, exp_reg_opaddr+N);
    unlock_wr((unsigned char*)&exp_reg_m, (unsigned char*)&exp_reg_m + N);

    // check pad byte
    if(decrypted->padbyte != 1)
    {
#ifdef CBMC
      printf("padbyte fail\n");
#endif
      return 0;
    }
    
    if(!removeOAEP())
	return -1;

    return unpad();
}

unsigned char verifySignature(unsigned char* msg, int len, unsigned char* signature){
    int i;
    int slen;

    // decrypt the signature
    slen = decrypt(signature);
    lock_wr(decrypted->m, decrypted->m+20);

    // compare with hash of msg
    if(slen != 20)
    {
	unlock_wr(decrypted->m, decrypted->m+20);
	return 0;
    } else{
	sha1(msg, len);
	lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	for(i=0; i<slen; i++){
#ifndef CBMC
	    P0 = decrypted->m[i];
#endif
	    if(hash[i] != decrypted->m[i])
		return 0;
	}
	unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
#ifndef CBMC	
	P0 = 0xFF;
#endif
	return 1;
    }
}

#ifndef CBMC
void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}
#endif
