#include <reg51.h>
#include "rsa_keyin.h"

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/

#define N 256
#define K1 16
#define K2 16

int good = 1;

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

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

__xdata __at(0xE000) unsigned char data1[20];
__xdata __at(0xE014) unsigned char data2[20];
__xdata __at(0xE028) unsigned char d[320];

/*---------------------------------------------------------------------------*/

struct PRG
{
    unsigned char *state;
    unsigned int count;
    unsigned int seedlen;
};

void pad(int len)
{
    int i;

    exp_reg_m[len+1] = 1;
    for(i=len+2; i < N-K1-K2; i++)
	exp_reg_m[i] = 0;
}

// returns length of message
int unpad()
{
    int len;

    for(len = N-K1-K2-1; len>=0; len--)
    {
	P0 = exp_reg_m[len];
	if(exp_reg_m[len] == 1)
	    break;
	else if(exp_reg_m[len] != 0)
	{
	    good = 0;
	    break;
	}
    }
    return len-1;
}

void shadata(unsigned char *m, int len)
{
    int i;
    int mlen;

    // setup data
    mlen = ((len+2) & 0xFFC0) + 64; // round len+3 up to multiple of 64
    sha_reg_len = mlen;
        
    if(m == d)
    {
	for(i=len+1; i<mlen; i++)
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
    d[mlen-3] = d[mlen-3] | (len >> 13) & 0xFF;
}

// do sha, pick which location to write to
unsigned char* sha1(unsigned char which)
{
    sha_reg_wr_addr = which ? (unsigned int)&data2 : (unsigned int)&data1;
    // encrypt with sha1
    sha_reg_start = 1;
    while(sha_reg_state != 0);
    
    return which ? data2 : data1;
}

unsigned char* HMAC(unsigned char *key, int klen, unsigned char *message, int mlen, unsigned char which)
{
    int i;
    unsigned char *hash;
    
    // hash key to be 1 block long
    if(klen > 64)  
    {
	shadata(key, klen);
	key = sha1((unsigned char)0);
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

    hash = sha1((unsigned char)1);

    // outer hash
    for(i=0; i<klen; i++)
	d[i] = key[i] ^ 0x5c;
    for(i=klen; i<64;i++)
	d[i] = 0x5c;
    for(i=0; i<20; i++)
	d[i+64] = hash[i];
    shadata(d, 84);

    return sha1(which);
}

const unsigned char Hseed[] = {
    0x66, 0x02, 0x5D, 0xC9,
    0x80, 0x48, 0xA5, 0x9F,
    0x2C, 0xB3, 0xAA, 0x6C,
    0x1A, 0x81, 0xA9, 0xAA,
    0xE8, 0x93, 0x21, 0x0E,
    0x24, 0x99, 0x6F, 0x06,
    0xEB, 0xC0, 0x4F, 0x3A,
    0x0D, 0x2F, 0x8F, 0x0A
};

const unsigned char rseed[] = {
    0x14, 0xb8, 0xfb, 0x04,
    0x98, 0x43, 0x98, 0xa2,
    0x35, 0xd0, 0x3e, 0xca,
    0x38, 0xd9, 0x41, 0xaf
};

struct PRG* PRGinit(unsigned char *seed, unsigned int slen)
{
    __xdata struct PRG prg;

    prg.state = seed;
    prg.count = 0;
    prg.seedlen = slen;
    return &prg;
}

// generate random number, put in hash
unsigned char* PRG(struct PRG* prg)
{
    int i;
    unsigned int len = prg->count ? 20 : prg->seedlen;
    unsigned char hash[20];
    unsigned char *next;

    next = HMAC(prg->state, len, (unsigned char*)&prg->count, 2, 0);
    for(i=0; i<20; i++)
	hash[i] = next[i];

    prg->count = prg->count + 1;

    next = HMAC(prg->state, len, (unsigned char *)&prg->count, 2, 1);
    for(i=0; i<20; i++)
	prg->state[i] = next[i];
    return hash;
}

void OAEP(struct PRG* rprg)
{
    int i,j;
    __xdata unsigned char state[20];
    unsigned char *hash;
    struct PRG* gprg;

    // K1 0s
    for(i=N-K1-K2; i < N-K2; i++)
	exp_reg_m[i] = 0;

    // G
    hash = PRG(rprg);
    for(i=0; i<K2; i++)
    {
	exp_reg_m[N-K2+i] = hash[i];
	state[i] = hash[i];
    }
    gprg = PRGinit(state, K2);
    hash = PRG(gprg);
    i=1; j=0;
    while(i < N-K2)
    {
	exp_reg_m[i] = exp_reg_m[i] ^ hash[j];
	i++;
	j++;
	if(j == 20)
	{
	    hash = PRG(gprg);
	    j = 0;
	}
    }

    // H
    hash = HMAC(Hseed, 32, exp_reg_m+1, N-K2-1,1);
    for(i=0; i<K2; i++)
	exp_reg_m[i+N-K2] = exp_reg_m[i+N-K2] ^ hash[i];
}

void removeOAEP()
{
    int i,j;
    unsigned char *hash;
    unsigned char r[20];
    struct PRG *gprg;

    // find r
    hash = HMAC(Hseed, 32, exp_reg_m+1, N-K2-1,1);
    for(i=0; i< K2; i++)
	r[i] = exp_reg_m[N-K2+i] ^ hash[i];

    // find m
    gprg = PRGinit(r, 16);
    hash = PRG(gprg);
    i=1; j=0;
    while(i < N-K2)
    {
	exp_reg_m[i] = exp_reg_m[i] ^ hash[j];
	i++;
	j++;
	if(j == 20)
	{
	    hash = PRG(gprg);
	    j = 0;
	}
    }
}

void main() {
    int i;
    int LEN = 200;  // length of plain text, bytes
    unsigned char rstate[20];
    struct PRG *prg;

    // set up sha to generate r
    sha_reg_rd_addr = (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;

    for(i=0; i<16; i++)
	rstate[i] = rseed[i];
    prg = PRGinit(rstate, 16);

    // setup message
    for(i=1; i < LEN+1; i++)
	exp_reg_m[i] = i;
    pad(LEN);

    OAEP(prg);
    exp_reg_m[0] = 1;  // marker byte
 
    // setup address to write to
    exp_reg_opaddr = (unsigned int)&d;
    
    // exp = 0x10001 = 65537
    for(i=0; i<N; i++)
	exp_reg_exp[i] = 0;
    exp_reg_exp[0] = 1;
    exp_reg_exp[2] = 1;
    
    setN((unsigned long *)exp_reg_n);

    // now start encryption.
    exp_reg_start = 1;

    // now wait for encryption to complete.
    while(exp_reg_state != 0);

    // change to private key
    setPrivate((unsigned long *)exp_reg_exp);

    for(i=0; i<N; i++)
	exp_reg_m[i] = d[i];

    // decrypt
    exp_reg_start = 1;    
    while(exp_reg_state != 0);

    // copy back message
    for(i=0; i<N; i++)
	exp_reg_m[i] = d[i];

    // check marker byte
    if(exp_reg_m[0] != 1)
	good = 0;

    if(!good)
    {
	P0 = 0;
	quit();
    }
    else
    {
	int len;
	removeOAEP();
	len = unpad();
	if(len != LEN)
	    good = 0;
	P0 = len;
	P0 = 0xFF;
	if(!good)
	{
	    P0 = good;
	    quit();
	}
	for(i=1; i<=len; i++)
	{
	    P0 = exp_reg_m[i];
	    if(exp_reg_m[i] != i)
	    {
		good = 0;
		break;
	    }
	}
	}
    P0 = good;
    quit();
}
