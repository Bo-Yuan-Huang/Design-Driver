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
__xdata __at(0xFA00) unsigned char exp_reg_m[N];

__xdata __at(0xE000) unsigned char d[0x300];
__xdata __at(0xE300) unsigned char data2[0x200];
__xdata __at(0xE500) unsigned char data1[20];

struct RSAmsg{
    unsigned char padbyte;
    unsigned char m[N-K2-K1-1];
    unsigned char zeros[K1];
    unsigned char r[K2];
};

void pad(int len)
{
    int i;
    struct RSAmsg* rsamsg = (struct RSAmsg*)exp_reg_m; 
    
    rsamsg->m[len+1] = 1;
    for(i=len+1; i < N-K1-K2-1; i++)
	rsamsg->m[i] = 0;
}

// returns length of message
int unpad()
{
    int len;
    struct RSAmsg* rsamsg = (struct RSAmsg*)exp_reg_m; 

    for(len = N-K1-K2-2; len>=0; len--)
    {
	if(rsamsg->m[len] == 1)
	    break;
	else if(rsamsg->m[len] != 0)
	    return -1;
    }
    return len;
}

// set up message for sha. assumes sha_reg_rd_addr is d
void shadata(unsigned char *m, int len)
{
    int i;
    int mlen;

    // setup data
    mlen = ((len+4) & 0xFFC0) + 64; // round len+5 up to multiple of 64
    sha_reg_len = mlen;
        
    if((unsigned int)m == sha_reg_rd_addr)
    {
	for(i=len+1; i<mlen; i++) // start at len+1 to leave room for padding
	    d[i] = 0;
    }
    else
    {
	for(i=0; i<mlen; i++)
	    d[i] = 0;
	for(i=0; i<len; i++)
	    d[i] = m[i];
    }
    d[len] = 0x80;  // add 100.. padding

    // insert length in bits
    d[mlen-1] = (len << 3) & 0xFF;
    d[mlen-2] = (len >> 5) & 0xFF;
    d[mlen-3] = (len >> 13) & 0xFF;
    d[mlen-4] = (len >> 21) & 0xFF;
}

// do sha
unsigned char* sha1()
{
    // encrypt with sha1
    sha_reg_start = 1;
    while(sha_reg_state != 0);
    
    return data1;
}

unsigned char* HMAC(unsigned char *key, int klen, unsigned char *message, int mlen)
{
    int i;
    unsigned char *hash;
    
    // hash key to be 1 block long
    if(klen > 64)  
    {
	shadata(key, klen);
	key = sha1();
	klen = 20;
    }

    // inner hash
    for(i=0; i<klen; i++)
	d[i] = key[i] ^ 0x36;
    for(i=klen; i<64;i++)
	d[i] = 0x36;
    for(i=0; i<mlen; i++)
	d[i+64] = message[i];

    shadata(d, 64+mlen);

    hash = sha1();

    // outer hash
    for(i=0; i<klen; i++)
	d[i] = key[i] ^ 0x5c;
    for(i=klen; i<64;i++)
	d[i] = 0x5c;
    for(i=0; i<20; i++)
	d[i+64] = hash[i];
    shadata(d, 84);

    return sha1();
}

unsigned char* PRGinit(unsigned char *seed)
{
    __xdata unsigned char state[20];
    int i;

    for(i=0; i<20; i++)
	state[i] = seed[i];
    return state;
}
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
unsigned char* PRG(unsigned char* state)
{
    int i;
    unsigned char *hash;
    unsigned char next[20];

    hash = HMAC(state, 20, one, 32);
    for(i=0; i<20; i++)
	next[i] = hash[i];

    hash = HMAC(state, 20, zero, 32);
    for(i=0; i<20; i++)
	state[i] = next[i];

    return hash;
}

// seed for generating R in OAEP
const __xdata unsigned char rseed[] = {
    0x14, 0xb8, 0xfb, 0x04,
    0x98, 0x43, 0x98, 0xa2,
    0x35, 0xd0, 0x3e, 0xca,
    0x38, 0xd9, 0x41, 0xaf,
    0x00, 0x00, 0x00, 0x00
};

// PRG for generating R in OAEP padding
unsigned char* rprg;

void RSAinit()
{
    rprg = PRGinit(rseed);
    exp_reg_opaddr = (unsigned int)&d;  // setup address to write to
    //setN(exp_reg_n);  // setup N
}

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
    

void OAEP()
{
    int i,j;
    unsigned char *hash;
    unsigned char *gprg;
    struct RSAmsg* rsamsg = (struct RSAmsg*)exp_reg_m; 

    // K1 0s
    for(i=0; i<K1; i++)
	rsamsg->zeros[i] = 0;

    // do G to compute X
    hash = PRG(rprg); // make r
    for(i=K2; i<20; i++)
	hash[i] = 0;
    for(i=0; i<K2; i++)
	rsamsg->r[i] = hash[i];
    gprg = PRGinit(hash);
    hash = PRG(gprg);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == 20)
	{
	    hash = PRG(gprg);
	    j = 0;
	}
	rsamsg->m[i] = rsamsg->m[i] ^ hash[j];
	i++;
	j++;
    }

    // do H to compute Y
    hash = HMAC(Hseed, 20, rsamsg->m, N-K2-1);
    for(i=0; i<K2; i++)
	rsamsg->r[i] = rsamsg->r[i] ^ hash[i];

    rsamsg->padbyte = 1; // marker byte
}

void removeOAEP()
{
    int i,j;
    unsigned char *hash;
    __xdata unsigned char r[20];
    unsigned char *gprg;
    struct RSAmsg* rsamsg = (struct RSAmsg*)exp_reg_m; 

    // find r
    hash = HMAC(Hseed, 20, rsamsg->m, N-K2-1);
    for(i=0; i< K2; i++)
	r[i] = rsamsg->r[i] ^ hash[i];

    // find m
    gprg = PRGinit(r);
    hash = PRG(gprg);
    i=0; j=0;
    while(i < N-K2)
    {
	if(j == 20)
	{
	    hash = PRG(gprg);
	    j = 0;
	}
	rsamsg->m[i] = rsamsg->m[i] ^ hash[j];
	i++;
	j++;
    }
}

// encrypt message, len bytes
unsigned char* encrypt(unsigned char* msg, int len){
    int i;
    struct RSAmsg* rsamsg = (struct RSAmsg*)exp_reg_m; 

    sha_reg_rd_addr= (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;

    if(msg != rsamsg->m)
	for (i=0; i<len; i++)
	    rsamsg->m[i] = msg[i];
    pad(len);
    OAEP();

    exp_reg_start = 1;  // start encryption
    while(exp_reg_state != 0);  // wait for encryption to finish
    
    return d;
}

unsigned char* decrypt(unsigned char* msg, int* len){
    int i;

    sha_reg_rd_addr = (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;

    if(msg != exp_reg_m)
	for(i=0; i<N; i++)
	    exp_reg_m[i] = msg[i];
    // decrypt
    exp_reg_start = 1;
    while(exp_reg_state != 0);
    if(((struct RSAmsg*)d)->padbyte != 1) return 0;
    
    // copy back message
    for (i=0; i<N; i++)
    exp_reg_m[i] = d[i];

    removeOAEP();
    *len = unpad();
    if(*len == -1)
	return 0;

    return ((struct RSAmsg*)exp_reg_m)->m;
}

const unsigned char SIGNSEED[] = {
    0x22, 0x1B, 0x35, 0xA1,
    0xC2, 0x30, 0x6A, 0x0B,
    0xF6, 0xDA, 0xDE, 0x2C,
    0x7A, 0x2D, 0x58, 0x42,
    0x4C, 0xED, 0x43, 0x13,
    0x5E, 0x71, 0x6D, 0xA4,
    0x80, 0xBE, 0x9D, 0x47,
    0x4A, 0x9A, 0xAC, 0xA8
};

unsigned char* sign(unsigned char* message, int len){
    unsigned char* hash;
    sha_reg_rd_addr = (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;
    hash = HMAC(SIGNSEED, 32, message, len);
    return encrypt(hash,20);
}

unsigned char verifySignature(unsigned char* msg, int len, unsigned char* signature){
    int i;
    int slen;
    unsigned char* hash;
    unsigned char* sign;
    sha_reg_rd_addr = (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;
    sign = decrypt(signature, &slen);

    if(!sign) return 0;
    else{
	hash = HMAC(SIGNSEED, 32, msg, len);
	for(i=0; i<slen; i++){
	    P0 = sign[i];
	    if(hash[i] != sign[i])
		return 0;
	}
	return 1;
    }
}

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}
