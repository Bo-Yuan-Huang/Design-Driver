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

XDATA_ARR(0xFF80, 32, unsigned char, pt_wren);
XDATA_ARR(0xFFA0, 32, unsigned char, pt_rden);

XDATA_ARR(0x0000, MAX_PRG_SIZE, unsigned char, program);
XDATA_ARR(0x5000, MAX_IM_SIZE, unsigned char, boot);

XDATA_ARR(0xC000, 0x2080, unsigned char, sha_in);
XDATA_ARR(0xE080, 20, unsigned char, sha_out);
XDATA_ARR(0xE100, N, unsigned char, rsa_out);

/*---------------------------------------------------------------------------*/
#ifdef CBMC
unsigned char P0 = 0xFF;
#define PACK(var, size)
#else
#define PACK(var, size) unsigned char var[size]
#endif

struct modules{
    unsigned int addr;
    PACK(p0,2);  // add extra bytes to account for different type sizes
    unsigned int size;
    PACK(p1,2);
    unsigned char hash[20];
};
struct image{
    unsigned char sig[N];  // signature of header
    unsigned char exp[N];
    unsigned char mod[N];  // n in modexp
    unsigned int num;      // total number of blocks
    PACK(p0, 2);
    struct modules module[1];
};

enum status{
    UNDET,
    FAIL,
    PASS
};

//public key hash
CODE unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83, 
				   0x5F, 0xFC, 0xE0, 0x2B, 
				   0xC6, 0xEE, 0xCB, 0x81, 
				   0x6C, 0x92, 0x6C, 0x7C, 
				   0xBA, 0x79, 0xCB, 0x8F};

void fail(unsigned char* failmes) {
#ifdef CBMC
  printf("%s\n", failmes);
#else
  (void)failmes;
  P0 = 0;
  quit();
#endif
}

void main() {
    unsigned int i, j;
    int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned int size;
    unsigned char* moddata;
    enum status pass = UNDET;
    // enable reading and writing everywhere for now
    for(i=0; i<32; i++)
    {
	pt_wren[i]=0xFF;
	pt_rden[i]=0xFF;
    }
    
    // STAGE 0: set up
    lock_wr(program, program + MAX_PRG_SIZE);
    // set SHA read and write addresses
    sha_reg_rd_addr = sha_in;
    sha_reg_wr_addr = sha_out;
    lock_wr(sha_reg_rd_addr, sha_reg_rd_addr+1);
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+1);

    // set up RSA
    exp_reg_opaddr = rsa_out;  // set up address to write to
    lock_wr(exp_reg_opaddr, exp_reg_opaddr+2);
    RSAinit();

    // STAGE 1: read image into RAM  
    load(0, MAX_IM_SIZE, boot, 1);

    // image is loaded.
    // now we need to lock boot to boot + MAX_IM_SIZE
    lock_wr(boot, boot+MAX_IM_SIZE);

    im  = (struct image*) boot;
    num = im->num & 0xFFFF;  // number of modules
    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - (im->exp -(unsigned char*)im) + sizeof(struct modules) * (num-1);
    if(size > MAX_IM_SIZE)
    {
	pass = FAIL; // FAIL: image too large
	fail("image too large");
	return;
    }

    // STAGE 2: check that key matches hash
    sha1(im->exp, 512);
    lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
    for(i=0; i<20; i++){
	if(sha_out[i] != pkhash[i]){
	    pass = FAIL;  // FAIL: key hash mismatch
	    fail("key hash mismatch");
	}
    }
    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);    

    // set signature key
    //load(im->exp, N, (unsigned int)exp_reg_exp, 0);
    for(i=0; i<N; i++)
	exp_reg_exp[i] = im->exp[i];

    lock_wr(exp_reg_exp, exp_reg_exp+N);

    // set signature modulus
    //load(im->mod, N, (unsigned int)exp_reg_n, 0);
    for(i=0; i<N; i++)
	exp_reg_n[i] = im->mod[i];
    lock_wr(exp_reg_n, exp_reg_n+N);


    // STAGE 3: verify signature in boot
    if(!verifySignature(im->exp, size, im->sig))
    {
	pass = FAIL;  // FAIL: signature mismatch
	fail("signature mismatch");
	return;
    }

    // STAGE 4: load blocks
    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module

    for(i=0; i<num; i++)
    {
        unsigned int ldaddr;
	// check that size and address are valid
	size = block->size & 0xFFFF;     // size of current module
	ldaddr = block->addr;   // address to load this module into
	if(size + ldaddr > MAX_PRG_SIZE ||
	   ldaddr + size < ldaddr) // overflow
	{
	    pass = FAIL;  // FAIL: program write out of range
	    fail("program write out of range");
	    return;
	}

	// load data
	unlock_wr(program+ldaddr, program+ldaddr+size);
	load(moddata, size, program+ldaddr, 0);

	// lock newly loaded data
	lock_wr(program+ldaddr, program+ldaddr+size);

	// check module hash
	sha1(program+ldaddr, size);
	lock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);
	for(j=0; j<20; j++){
	    if(sha_out[j] != block->hash[j]){
		pass = FAIL;  // FAIL: module hash mismatch
		fail("module hash mismatch");
	    }
	}
	unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+20);

	// update to next module
	moddata += size;
	block++;
    }

    // check that program loaded correctly, for testing only
    for(i=0; i<moddata-(unsigned char*)block; i++){
	P0 = program[i];
	if(program[i] != *((unsigned char*)block + i)){
	    pass = FAIL;  // FAIL
	    break;
	}
    }

    // PASS or FAIL
    if(pass != FAIL)
	pass = PASS;
    unlock_wr(boot, boot+MAX_IM_SIZE);
    unlock_wr(sha_reg_rd_addr, sha_reg_rd_addr+1);
    unlock_wr(sha_reg_wr_addr, sha_reg_wr_addr+1);
    unlock_wr(exp_reg_opaddr, exp_reg_opaddr+2);

    P0 = pass;
#ifdef CBMC
    printf("pass: %d\n", pass);
#else
    quit();
#endif
}

