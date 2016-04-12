#ifdef C
#include <openssl/sha.h>
#include <openssl/bn.h>
#include <stdio.h>
#define XDATA_VAR(addr, type, name) type name
#define XDATA_ARR(addr, size, type, name) type name[size]
#define XDATA_PTR(addr, type, name) type* name
#define XDATA_STRUCT(addr, type, name) struct type name
#define XDATA
#define CODE
#define BUFF_SIZE 0x2000
#else
#include <reg51.h>
#define XDATA_VAR(addr, type, name) __xdata __at(addr) type name
#define XDATA_ARR(addr, size, type, name) __xdata __at(addr) type name[size]
#define XDATA_PTR(addr, type, name) __xdata type* __xdata __at(addr) name
#define XDATA_STRUCT(addr, type, name) __xdata __at(addr) struct type name
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
#ifdef CBMC 
#define N 16
#define H 4
#define K1 4
#define K2 4
#else
#define N 256
#define H 20
#define K1 16
#define K2 16
#endif

struct RSAmsg{
    unsigned char padbyte;
    unsigned char m[N-K2-K1-1];
    unsigned char zeros[K1];
    unsigned char r[K2];
} *decrypted;

struct acc_regs{
    unsigned char start;
    unsigned char state;
    XDATA unsigned char *rd_addr;
    XDATA unsigned char *wr_addr;
    unsigned int len;
};

XDATA_VAR(0xFE00, struct acc_regs, sha_regs);
XDATA_VAR(0xF9F0, struct acc_regs, memwr_regs);

struct {
    struct RSAmsg m;
    unsigned char exp[N];
    unsigned char n[N];
    unsigned char start;
    unsigned char state;
    unsigned char *opaddr;
} XDATA_VAR(0xFA00, , rsa_regs);

#ifndef C
// page table permissions
XDATA_ARR(0xFF80, 32, unsigned char, pt_wren);
XDATA_ARR(0xFFA0, 32, unsigned char, pt_rden);
#endif

// state of PRG for G in OAEP
XDATA_ARR(0xF8E0, H, unsigned char, gprg);

#ifdef C
#define PAGES 11
struct {
    unsigned char* start[PAGES];
    unsigned char* end[PAGES];
    unsigned char locked[PAGES];
} pt = {{(unsigned char*)&memwr_regs,
	 (unsigned char*)&rsa_regs.m, 
	 (unsigned char*)&rsa_regs.exp, 
	 (unsigned char*)&rsa_regs.start,
	 (unsigned char*)&sha_regs, 
	 gprg},
	{(unsigned char*)(&memwr_regs+1),
	 (unsigned char*)&rsa_regs.exp,
	 (unsigned char*)&rsa_regs.start,
	 (unsigned char*)(&rsa_regs+1),
	 (unsigned char*)(&sha_regs+1),
	 (unsigned char*)(&gprg+1)},
	{1,1,1,1,1,1}};
#endif

// for locking and unlocking memory
// lock/unlock the pages spanning [startaddr, endaddr)
// return 1 if succeed, 0 if fail
int lock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
#ifdef C
    int found = 0;
    unsigned int i;
    for(i=0; i < PAGES; i++)
    {
	if(startaddr >= pt.start[i] && endaddr <= pt.end[i]){
	    found = 1;
	    pt.locked[i] = 1;
	    break;
	}
    }
#else
    // index of pt_wren
    unsigned int curr = (unsigned int)startaddr >> 11;
    unsigned int end = (unsigned int)endaddr-1 >> 11;
    // range of pages in pt_wren[i]
    unsigned int lowpage = (unsigned int)startaddr >> 8 & 7;
    unsigned int highpage = (unsigned int)endaddr-1 >> 8 & 7;

    // no memory in range
    if(startaddr > endaddr)
	return 0;

    // all pages are in the same index of pt_wren
    if(curr == end)
	pt_wren[curr] &= (1 << highpage+1) - (1 << lowpage) ^ 0xFF;
    else{
	// don't unlock pages below lowpage
	pt_wren[curr] &= (unsigned char)(0xFF << lowpage & 0xFF);
	for(;curr < end; curr++)
	    pt_wren[curr] = 0x00;
	// don't unlock pages above highpage
	pt_wren[end] &= (1 << highpage+1) - 1 ^ 0xFF;
    }
    return 1;
#endif
}

int unlock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
#ifdef C
    unsigned int i;
    int found = 0;
    for(i=0; i < PAGES; i++)
    {
	if(startaddr >= pt.start[i] && endaddr <= pt.end[i]){
	    found = 1;
	    pt.locked[i] = 0;
	    break;
	}
    }    
    return found;
#else
    unsigned int curr = (unsigned int)startaddr >> 11;
    unsigned int end = (unsigned int)endaddr-1 >> 11;
    unsigned int lowpage = (unsigned int)startaddr >> 8 & 7;
    unsigned int highpage = (unsigned int)endaddr-1 >> 8 & 7;

    if(startaddr >= endaddr)
	return 0;

    // similar to lock, except OR replaces AND, and the bits to write are flipped
    if(curr == end)
	pt_wren[curr] |= (1 << highpage+1) - (1 << lowpage);
    else{
	pt_wren[curr] |= (unsigned char)(0xFF << lowpage & 0xFF);
	for(;curr < end; curr++)
	    pt_wren[curr] = 0xFF;
	pt_wren[end] |= (1 << highpage+1) - 1;
    }
    return 1;
#endif
}

#ifdef CBMC
//void assert(int a);
//unsigned char nondet_uchar();
//unsigned int nondet_uint();
/*
// compare 2 arrays of length len
// return 0 if equal
int cmparr(unsigned char* a, unsigned char* b, unsigned int len)
{
    unsigned int i;
    for(i=0; i<len; i++)
	if(a[i] != b[i])
	    return 1;
    return 0;
}
*/
// return array of n nondet bytes
unsigned char* gen(unsigned char* out, unsigned int n)
{
    unsigned int i;
    for(i=0; i<n; i++)
	out[i] = nondet_uchar();
    return out;
}

// uninterpreted function that takes input array, input length
// produces output array of H bytes
unsigned char* uninterp_sha(unsigned char* input, unsigned int inlen, unsigned char* output, unsigned char save)
{
    static char* inputs[4];
    static unsigned int lens[4];
    static char outputs[4][H];
    static int total = 0;
    int i, j;
    unsigned int match;

    if(!save)
    {
	for(i=0; i<H; i++)
	    output[i] = nondet_uchar();
	return output;
    }

    // try and find a match of input with previously seen inputs
    for(i=0; i<total; i++){
	if(lens[i] != inlen)  
	    continue;   // stop comparing if lengths differ
	for(j=0; j < inlen; j++)
	    if(input[j] != inputs[i][j])  
		break;  // stop comparing on first wrong char
	break;  // input match
    }
    if(i < total) // found input match
	return outputs[i];
    
    // make a new random output to return
    for(i=0; i<H; i++)
    {
	output[i] = nondet_uchar();
	outputs[total][i] = output[i];
    }
    return outputs[total++];
}

unsigned char* uninterp_rsa(unsigned char* input, unsigned char* output)
{
    static char* inputs[2];
    static char outputs[2][N];
    static int total = 0;
    int i, j;
    unsigned int match;

    // try and find a match of input with previously seen inputs
    for(i=0; i<total; i++){
	for(j=0; j < N; j++)
	    if(input[j] != inputs[i][j])  
		break;  // stop comparing on first wrong char
	break;  // input match
    }
    if(i < total) // found input match
	return outputs[i];
    
    // make a new random output to return
    for(i=0; i<N; i++)
    {
	output[i] = nondet_uchar();
	outputs[total][i] = output[i];
    }
    return outputs[total++];
}

unsigned char sig_val, addr_val;

void makeimage(unsigned char* arr);
#endif

#ifdef C
// return number of unlocked bytes, starting at start addr
unsigned int writable(unsigned char* start, unsigned char* end)
{
    unsigned int bytes = 0;
    unsigned int tot = end-start;
    unsigned int i;
    
    if(end <= start)
	return 0;

    for(i=0; i<PAGES; i++)
    {
	if(start >= pt.start[i] && start < pt.end[i])
	{
	    if(!pt.locked[i])
		bytes = (unsigned int)((end > pt.end[i] ? pt.end[i] : end) - start);
	    break;
	}
    }
    if(!bytes)
	printf("checking %p, %p, %d\n", start, end, bytes);
    assert(bytes <= (unsigned int) (end-start));
    return bytes;
}

// write len bytes from data to addr
int writecarr(unsigned char* addr, unsigned char* data, unsigned int len)
{
    unsigned int i;
    len = writable(addr, addr+len);
    for(i=0; i<len; i++)
	addr[i] = data[i];
    if(!len) printf("%p locked!\n", addr);
    return len;
}

// write H bytes from data to addr
int writecarrH(unsigned char* addr, unsigned char* data)
{
    unsigned int i;
    unsigned int len = writable(addr, addr+H);
#ifdef CBMC
    assert(len < H);
#endif
    for(i=0; i<len; i++)
	addr[i] = data[i];
    if(!len) printf("%p locked!\n", addr);
    return len;
}

// write data to addr
int writec(unsigned char* addr, unsigned char data)
{
    unsigned char unlocked = writable(addr, addr+1);
    if(unlocked)
	*addr = data;
    else printf("%p locked!\n", addr);
    return unlocked;
}
int writei(unsigned int* addr, unsigned int data)
{
    unsigned char unlocked = writable((unsigned char*)addr, (unsigned char*)(addr+1));
    if(unlocked)
	*addr = data;
    else printf("%p locked!\n", addr);
    return unlocked;
}
int writeptr(unsigned char** addr, unsigned char* data)
{
    unsigned char unlocked = writable((unsigned char*)addr, (unsigned char*)(addr+1));
    if(unlocked)
	*addr = data;
    else printf("%p locked!\n", addr);
    return unlocked;
}

unsigned char P0 = 0xFF;

// c abstraction of memwr
// return 1 if succeed, 0 if fail
int c_load(unsigned char skipread)
{
    static unsigned char buff[BUFF_SIZE];
    static unsigned char initial = 1;
    static unsigned int max;
    unsigned int stop;
    unsigned int i = 0;

    writec(&memwr_regs.start, 0);
    writec(&memwr_regs.state, 1);

    // make a program image
    if(initial)
    {
#ifndef CBMC
	unsigned int hex;
        // read in image
	while(scanf("%x",&hex)!=EOF && i < BUFF_SIZE)
	{
	    buff[i] = hex;
	    i++;
	}
	max = i;
#else
	makeimage(buff);
#endif
	initial = 0;
    }

    if(!skipread){
	stop = memwr_regs.len > BUFF_SIZE ? BUFF_SIZE : memwr_regs.len;
	if(stop > max) max = stop;
	for(i=0; i < stop; i++)
	    buff[i] = memwr_regs.rd_addr[i];
    }
    else stop = max > memwr_regs.len ? memwr_regs.len : max;

    memwr_regs.state = 2;
    writecarr(memwr_regs.wr_addr, buff, stop);
    memwr_regs.state = 0;    
}

// generate some H byte output
// save result in buffer if indicated
void c_sha(int len, unsigned char save)
{
    unsigned int i;
    unsigned char hash[H];
    writec(&sha_regs.start, 0);
    writec(&sha_regs.state, 1);
#ifndef CBMC
    SHA1(sha_regs.rd_addr, len, hash);
#else
    uninterp_sha(sha_regs.rd_addr, len, hash, save);
#endif
    writecarrH(sha_regs.wr_addr, hash);

    writec(&sha_regs.state, 0);
}

// C implementation of modular exponentiation
// return 1 if succeed, 0 if fail
int c_exp()
{
#ifndef CBMC
    BIGNUM *r = BN_new();
    BIGNUM *a = BN_new();
    BIGNUM *p = BN_new();
    BIGNUM *m = BN_new();
    BN_CTX *ctx = BN_CTX_new(); // temp variables
    if(!ctx)
	return 0;

    writec(&rsa_regs.start, 0);
    writec(&rsa_regs.state, 1);

    // initialize values
    a = BN_bin2bn((unsigned char*)&rsa_regs.m, N, a);
    p = BN_bin2bn(rsa_regs.exp, N, p);
    m = BN_bin2bn(rsa_regs.n, N, m);

    // do exponentiation
    BN_mod_exp(r, a, p, m, ctx); //r = a^p mod m
    // write back
    writec(&rsa_regs.state, 2);
    if(writable(rsa_regs.opaddr, rsa_regs.opaddr+N) != N || BN_bn2bin(r, rsa_regs.opaddr) != N)
	return 0;

    // clear and free
    BN_CTX_free(ctx);
    BN_free(r);
    BN_free(a);
    BN_free(p);
    BN_free(m);
#else
    writec(&rsa_regs.start, 0);
    writec(&rsa_regs.state, 1);

    uninterp_rsa((unsigned char*)&rsa_regs.m, rsa_regs.opaddr);
#endif
    writec(&rsa_regs.state, 0);
    return 1;
}
#else
#define writecarr(addr, data, len) for(i=0; i<len; i++) addr[i]=data[i];
#define writecarrH(addr, data) for(i=0; i<H; i++) addr[i]=data[i];
#define writec(addr, data) *(addr) = data;
#define writei(addr, data) *(addr) = data;
#define writeptr(addr, data) *(addr) = data;
#define c_load(skipread)
#define c_sha(len, save)
#define c_exp()
#endif

// set up data transfer
// copy data of length bytes to startaddr
// if skipread, don't read from data, just write values already in memwr buffer to startaddr
void load(unsigned char* data, unsigned int length, unsigned char* startaddr, unsigned char skipread)
{
    writeptr(&memwr_regs.rd_addr,(XDATA unsigned char*)data);
    writeptr(&memwr_regs.wr_addr, (XDATA unsigned char*)startaddr);
    writei(&memwr_regs.len, length);
    writec(&memwr_regs.start, (unsigned char)(skipread << 1 | 1)); // load in HW

    c_load(skipread);  // load in SW
#ifndef CBMC
    // wait for load to finish
    while(memwr_regs.state != 0);
#endif
}

void RSAinit()
{
    decrypted = (struct RSAmsg*)rsa_regs.opaddr;
}

// returns length of message
int unpad()
{
  int len;

  for(len = sizeof(rsa_regs.m.m)-1; len>=0; len--)
  {
      if(decrypted->m[len] == 1)
	  break;
      else if(decrypted->m[len] != 0)
	  return -1;
  }
  return len;
}

// set up message and compute SHA
void sha1(unsigned char *m, unsigned int len, unsigned char save)
{
    unsigned int i;
    unsigned int mlen;
#ifdef CBMC
    unsigned char* zeros;
#endif
    (void) save;
    // setup data
    mlen = ((len+4) & 0xFFC0) + 64; // round len+5 up to multiple of 64
    unlock_wr(sha_regs.rd_addr, sha_regs.rd_addr+mlen);

    if(m != sha_regs.rd_addr) // don't copy if already in right address
	load(m, len, sha_regs.rd_addr, 0); // copy m

    // add 100.. padding
    writec(sha_regs.rd_addr+len, 0x80);
#ifndef CBMC
    for(i=len+1; i<mlen; i++)
	writec(sha_regs.rd_addr+i, 0);
#else
    zeros = (unsigned char*)calloc(mlen-len-1,1);
    writecarr(sha_regs.rd_addr+len+1, zeros, mlen-len-1);
#endif
    // insert length in bits
    writec(sha_regs.rd_addr+mlen-1, (len << 3) & 0xFF);
    writec(sha_regs.rd_addr+mlen-2, (len >> 5) & 0xFF);
    writec(sha_regs.rd_addr+mlen-3, (len >> 13) & 0xFF);

    // encrypt with sha1
    lock_wr(sha_regs.rd_addr, sha_regs.rd_addr+mlen);
    unlock_wr(sha_regs.wr_addr, sha_regs.wr_addr+H);
    unlock_wr(&sha_regs.start, (unsigned char*)(&sha_regs.len));
    writei(&sha_regs.len, mlen);
    writec(&sha_regs.start, 1);  // start HW

    c_sha(len, save);         // do SW
#ifndef CBMC
    while(sha_regs.state != 0);
#endif
    lock_wr(sha_regs.wr_addr, sha_regs.wr_addr+H);
    unlock_wr(&sha_regs.start, (unsigned char*)(&sha_regs.len));
}

// HMAC computed and written to sha_regs.wr_addr
void HMAC(const unsigned char *key, unsigned int klen, const unsigned char *message, unsigned int mlen)
{
    unsigned int i;
#ifdef C
    unsigned char *buff = (unsigned char*)malloc(64 + (mlen > H ? mlen : H));

    // inner hash
    unlock_wr(sha_regs.rd_addr, sha_regs.rd_addr+mlen+64);
    for(i=0; i<klen; i++)
	buff[i] = key[i] ^ 0x36;
    for(i=klen; i<64;i++)
	buff[i] = 0x36;
    for(i=0; i<mlen; i++)
	buff[i+64] = message[i];

    writecarr(sha_regs.rd_addr, buff, mlen+64);
    sha1(sha_regs.rd_addr, 64+mlen, 0);

    // outer hash
    unlock_wr(sha_regs.rd_addr, sha_regs.rd_addr+84);
    for(i=0; i<klen; i++)
	buff[i] = key[i] ^ 0x5c;
    for(i=klen; i<64;i++)
	buff[i] = 0x5c;
    for(i=0; i<H; i++)
	buff[i+64] = sha_regs.wr_addr[i];

    writecarr(sha_regs.rd_addr, buff, H + 64);
    sha1(sha_regs.rd_addr, 64 + H, 0);
#else
    // inner hash
    unlock_wr(sha_regs.rd_addr, sha_regs.rd_addr+mlen+64);
    for(i=0; i<klen; i++)
	writec(sha_regs.rd_addr+i, key[i] ^ 0x36);
    for(i=klen; i<64;i++)
	writec(sha_regs.rd_addr+i, 0x36);
    for(i=0; i<mlen; i++)
	writec(sha_regs.rd_addr+i+64, message[i]);

    sha1(sha_regs.rd_addr, 64+mlen, 0);

    // outer hash
    unlock_wr(sha_regs.rd_addr, sha_regs.rd_addr+84);
    for(i=0; i<klen; i++)
	writec(sha_regs.rd_addr+i, key[i] ^ 0x5c);
    for(i=klen; i<64;i++)
	writec(sha_regs.rd_addr+i, 0x5c);
    for(i=0; i<H; i++)
	writec(sha_regs.rd_addr+i+64, sha_regs.wr_addr[i]);

    sha1(sha_regs.rd_addr, 64 + H, 0);
#endif
}

// copy seed into the PRG state
void PRGinit(unsigned char *seed, unsigned int slen, unsigned char *state)
{
    unsigned int i;
    if(slen > H) slen = H;
    unlock_wr(state, state+H);
    writecarr(state, seed, slen);
    for(i=slen; i<H; i++)
	writec(state+i, 0);
    lock_wr(state, state+H);
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
    unsigned int i;
    unsigned char next[H];

    // compute next state
    HMAC(state, H, one, 32);
    for(i=0; i<H; i++)
	next[i] = sha_regs.wr_addr[i];

    // computer next output
    HMAC(state, H, zero, 32);
    unlock_wr(state, state+H);
    writecarrH(state, next);
    lock_wr(state, state+H);
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

// remove OAEP from message at location rsa_regs.opaddr
void removeOAEP()
{
    unsigned int i,j;

    // compute r
    HMAC(Hseed, H, decrypted->m, N-K2-1);
    // copy r to message
    unlock_wr((unsigned char*)decrypted, (unsigned char*)decrypted + N);
    for(i=0; i< K2; i++)
	writec(decrypted->r+i,decrypted->r[i] ^ sha_regs.wr_addr[i]);
    lock_wr((unsigned char*)decrypted, (unsigned char*) decrypted+N);

    // find m
    PRGinit(decrypted->r, K2, gprg);
    PRG(gprg);
    unlock_wr((unsigned char*)decrypted, (unsigned char*)decrypted + N);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == H)
	{
	    lock_wr((unsigned char*)decrypted, (unsigned char*) decrypted+N);
	    PRG(gprg);
	    j = 0;
	    unlock_wr((unsigned char*)decrypted, (unsigned char*)decrypted + N);
	}
	writec(decrypted->m+i, decrypted->m[i] ^ sha_regs.wr_addr[j]);
	i++;
	j++;
    }
    lock_wr((unsigned char*)decrypted, (unsigned char*) decrypted+N);
}

// decrypt msg, puts decrypted text in rsa_regs.opaddr
// returns length of decrypted message
int decrypt(unsigned char* msg){
    unsigned int i;

    // copy msg into RSA m register
    if(msg != (unsigned char*)&rsa_regs.m)
    {
	unlock_wr((unsigned char*)&rsa_regs.m, (unsigned char*)&rsa_regs.m+N);
	//load(msg, N, (unsigned int)rsa_regs.m, 0);
	for(i=0; i<N; i++)
	    writec((unsigned char*)&rsa_regs.m+i, msg[i]);

	// lock message during exponentiation
	lock_wr((unsigned char*)&rsa_regs.m, (unsigned char*)&rsa_regs.m + N);
    }

    // decrypt
    unlock_wr(rsa_regs.opaddr, rsa_regs.opaddr+N);
    unlock_wr(&rsa_regs.start, (unsigned char*)(&rsa_regs.state+1));    
    writec(&rsa_regs.start, 1);

    c_exp();  // c abstraction
#ifndef CBMC
    while(rsa_regs.state != 0);
#endif
    lock_wr(rsa_regs.opaddr, rsa_regs.opaddr+N);
    lock_wr(&rsa_regs.start, (unsigned char*)(&rsa_regs.state+1));    

    // check pad byte
    if(decrypted->padbyte != 1)
	return -1;
    
    removeOAEP();

    return unpad();
}

unsigned char verifySignature(unsigned char* msg, unsigned int len, unsigned char* signature){
    unsigned int i;
    int slen;

    // decrypt the signature
    slen = decrypt(signature);

    // compare with hash of msg
    if(slen != H)
	return 0;
    else{
	sha1(msg, len, 1);
	for(i=0; i<H; i++){
	    P0 = decrypted->m[i];
	    if(sha_regs.wr_addr[i] != decrypted->m[i])
		return 0;
	}
	P0 = 0xFF;
	return 1;
    }
}

