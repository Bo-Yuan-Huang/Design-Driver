#include <reg51.h>


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

__xdata __at(0xFE00) unsigned char sha_reg_start;
__xdata __at(0xFE01) unsigned char sha_reg_state;
__xdata __at(0xFE02) unsigned int sha_reg_rd_addr;
__xdata __at(0xFE04) unsigned int sha_reg_wr_addr;
__xdata __at(0xFE06) unsigned int sha_reg_len;

__xdata __at(0xFD00) unsigned char exp_reg_start;
__xdata __at(0xFD01) unsigned char exp_reg_state;
__xdata __at(0xFD02) unsigned int  exp_reg_opaddr;
__xdata __at(0xFC00) unsigned char exp_reg_n[N];
__xdata __at(0xFB00) unsigned char exp_reg_exp[N];
__xdata __at(0xFA00) struct RSAmsg exp_reg_m;

__xdata __at(0xFE40) unsigned char memwr_reg_start;
__xdata __at(0xFE41) unsigned char memwr_reg_state;
__xdata __at(0xFE42) unsigned int memwr_reg_rd_addr;
__xdata __at(0xFE44) unsigned int memwr_reg_wr_addr;
__xdata __at(0xFE46) unsigned int memwr_reg_len;

// state of PRG for R and G in OAEP
__xdata __at(0xFD10) unsigned char rprg[20];
__xdata __at(0xFD30) unsigned char gprg[20];

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
void lock_wr(unsigned int startaddr, unsigned int endaddr)
{
    // make unused argument warnings go away
    (void) startaddr;
    (void) endaddr;
}
void unlock_wr(unsigned int startaddr, unsigned int endaddr)
{
    // make unused argument warnings go away
    (void) startaddr;
    (void) endaddr;
}

// set up data transfer
void load(unsigned char* data, int length, unsigned int startaddr, unsigned char skipread)
{
    memwr_reg_rd_addr = (unsigned int)data;
    memwr_reg_wr_addr = startaddr;
    memwr_reg_len = length;
    memwr_reg_start = (unsigned char)(skipread << 1 | 1);

    // wait for load to finish
    while(memwr_reg_state != 0);
}

void RSAinit()
{
    decrypted = (__xdata struct RSAmsg*)exp_reg_opaddr;
    hash = (__xdata unsigned char*)sha_reg_wr_addr;
    data = (__xdata unsigned char*)sha_reg_rd_addr;
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
    sha_reg_len = mlen;
        
    
    if((unsigned int)m != sha_reg_rd_addr) // don't copy if already in right address
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
    sha_reg_start = 1;
    while(sha_reg_state != 0);
    unlock_wr(sha_reg_rd_addr, sha_reg_rd_addr+sha_reg_len);
}

// HMAC computed and written to sha_reg_wr_addr
void HMAC(unsigned char *key, int klen, unsigned char *message, int mlen)
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
	lock_wr((unsigned int)decrypted->m + i,(unsigned int)decrypted->m + i+1);
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
    if(msg != (unsigned char*)exp_reg_m)
	//load(msg, N, (unsigned int)exp_reg_m, 0);
	for(i=0; i<N; i++)
	    ((unsigned char*)exp_reg_m)[i] = msg[i];

    // lock message during exponentiation
    lock_wr((unsigned int)exp_reg_m, (unsigned int)exp_reg_m + N);

    // decrypt
    exp_reg_start = 1;
    while(exp_reg_state != 0);
    lock_wr(exp_reg_opaddr, exp_reg_opaddr+N);
    unlock_wr((unsigned int)exp_reg_m, (unsigned int)exp_reg_m + N);

    // check pad byte
    if(decrypted->padbyte != 1) return 0;
    
    if(!removeOAEP())
	return -1;

    return unpad();
}

unsigned char verifySignature(unsigned char* msg, int len, unsigned char* signature){
    int i;
    int slen;

    // decrypt the signature
    slen = decrypt(signature);
    lock_wr((unsigned int)decrypted->m, (unsigned int)decrypted->m+20);

    // compare with hash of msg
    if(slen != 20)
    {
	unlock_wr((unsigned int)decrypted->m, (unsigned int)decrypted->m+20);
	return 0;
    } else{
	sha1(msg, len);
	lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	for(i=0; i<slen; i++){
	    P0 = decrypted->m[i];
	    if(hash[i] != decrypted->m[i])
		return 0;
	}
	unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	P0 = 0xFF;
	return 1;
    }
}

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}
