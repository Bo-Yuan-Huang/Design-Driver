#include <reg51.h>
#include "rsa.h"

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
#define MAX_PRG_SIZE 0x5000
#define MAX_IM_SIZE  0x2000

__xdata __at(0xFF80) unsigned char pt_wren[32];
__xdata __at(0xFFA0) unsigned char pt_rden[32];

__xdata __at(0x0000) unsigned char program[MAX_PRG_SIZE];
__xdata __at(0x5000) unsigned char boot[MAX_IM_SIZE];

__xdata __at(0xC000) unsigned char sha_in[0x2080];
__xdata __at(0xE080) unsigned char sha_out[20];
__xdata __at(0xE100) unsigned char rsa_out[N];

/*---------------------------------------------------------------------------*/

struct modules{
    unsigned int addr;
    unsigned int size;
    unsigned char hash[20];
};

struct image{
    unsigned char sig[N];  // signature of header
    unsigned char exp[N];
    unsigned char mod[N];  // n in modexp
    unsigned int num;      // total number of blocks
    struct modules module[1];
};

enum status{
    UNDET,
    FAIL,
    PASS
};

//public key hash
__code unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83, 
				   0x5F, 0xFC, 0xE0, 0x2B, 
				   0xC6, 0xEE, 0xCB, 0x81, 
				   0x6C, 0x92, 0x6C, 0x7C, 
				   0xBA, 0x79, 0xCB, 0x8F};

void main() {
    unsigned int i, j;
    int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned int size;
    unsigned int ldaddr;
    unsigned char* moddata;
    enum status pass = UNDET;

    // enable reading and writing everywhere for now
    for(i=0; i<32; i++)
    {
	pt_wren[i]=0xFF;
	pt_rden[i]=0xFF;
    }

    // STAGE 1: read image into RAM  
    unlock_wr((unsigned int)&boot, (unsigned int)boot+MAX_IM_SIZE);
    load(0, MAX_IM_SIZE, (unsigned int)&boot, 1);

    // image is loaded.
    // now we need to lock boot to boot + MAX_IM_SIZE
    lock_wr((unsigned int)boot, (unsigned int)boot+MAX_IM_SIZE);

    im  = (struct image*) boot;
    num = im->num;  // number of modules
    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - ((unsigned int)&(im->exp) -(unsigned int)im) + sizeof(struct modules) * (num-1);
    if(size > MAX_IM_SIZE)
    {
	P0 = 0;
	pass = FAIL; // FAIL: image too large
	quit();
    }

    // set SHA read and write addresses
    sha_reg_rd_addr = (unsigned int)&sha_in;
    sha_reg_wr_addr = (unsigned int)&sha_out;
    lock_wr((unsigned int)(&sha_reg_rd_addr), (unsigned int)(&sha_reg_rd_addr+1));
    lock_wr((unsigned int)(&sha_reg_wr_addr), (unsigned int)(&sha_reg_wr_addr+1));

    // set up RSA
    exp_reg_opaddr = (unsigned int)&rsa_out;  // set up address to write to
    lock_wr(exp_reg_opaddr, exp_reg_opaddr+2);
    RSAinit();

    // STAGE 2: check that key matches hash
    sha1(im->exp, 512);
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
    for(i=0; i<20; i++){
	if(sha_out[i] != pkhash[i]){
	    P0 = 0;
	    pass = FAIL;  // FAIL: key hash mismatch
	    quit();
	}
    }
    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);    

    // set signature key
    //load(im->exp, N, (unsigned int)exp_reg_exp, 0);
    for(i=0; i<N; i++)
	exp_reg_exp[i] = im->exp[i];

    lock_wr((unsigned int)exp_reg_exp, (unsigned int)exp_reg_exp+N);

    // set signature modulus
    //load(im->mod, N, (unsigned int)exp_reg_n, 0);
    for(i=0; i<N; i++)
	exp_reg_n[i] = im->mod[i];
    lock_wr((unsigned int)exp_reg_n, (unsigned int)exp_reg_n+N);


    // STAGE 3: verify signature in boot
    if(!verifySignature(im->exp, size, im->sig))
    {
	P0 = 0;
	pass = FAIL;  // FAIL: signature mismatch
	quit();
    }

    // STAGE 4: load blocks
    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module

    for(i=0; i<num; i++)
    {
	// check that size and address are valid
	size = block->size;     // size of current module
	ldaddr = block->addr;   // address to load this module into
	if(ldaddr < (unsigned int)program ||
	   size + ldaddr > (unsigned int)program + MAX_PRG_SIZE ||
	   (unsigned int)program + size < (unsigned int)program) // overflow
	{
	    P0 = 0;
	    pass = FAIL;  // FAIL: program write out of range
	    quit();
	}

	// load data
	load(moddata, size, ldaddr, 0);

	// lock newly loaded data
	lock_wr(ldaddr, ldaddr+size);

	// check module hash
	sha1((__xdata unsigned char*)ldaddr, size);
	lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	for(j=0; j<20; j++){
	    if(sha_out[j] != block->hash[j]){
		P0 = 0;
		pass = FAIL;  // FAIL: module hash mismatch
		quit();
	    }
	}
	unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);

	// update to next module
	moddata += size;
	block++;
    }

    // check that program loaded correctly, for testing only
    for(i=0; i<(unsigned int)moddata-(unsigned int)block; i++){
	P0 = program[i];
	if(program[i] != *((unsigned char*)block + i)){
	    pass = FAIL;  // FAIL
	    break;
	}
    }

    // PASS or FAIL
    if(pass != FAIL)
	pass = PASS;
    P0 = pass;
    quit();
}
