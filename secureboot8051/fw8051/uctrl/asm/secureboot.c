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
#define MAX_PRG_SIZE 0x2000
#define MAX_IM_SIZE  0x5000

__xdata __at(0xFE40) unsigned char memwr_reg_start;
__xdata __at(0xFE41) unsigned char memwr_reg_state;
__xdata __at(0xFE42) unsigned int memwr_reg_rd_addr;
__xdata __at(0xFE44) unsigned int memwr_reg_wr_addr;
__xdata __at(0xFE46) unsigned int memwr_reg_len;
__xdata __at(0x1000) unsigned char program[MAX_PRG_SIZE];
__xdata __at(0x3000) unsigned char boot[MAX_IM_SIZE];

/*---------------------------------------------------------------------------*/

struct modules{
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

//public key hash
__code unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83, 
				   0x5F, 0xFC, 0xE0, 0x2B, 
				   0xC6, 0xEE, 0xCB, 0x81, 
				   0x6C, 0x92, 0x6C, 0x7C, 
				   0xBA, 0x79, 0xCB, 0x8F};

// set up data transfer
void load(unsigned char* data, int length, unsigned char* startaddr, unsigned char skipread)
{
    // wait for previous load to finish first
    while(memwr_reg_state != 0);

    memwr_reg_rd_addr = (unsigned int)data;
    memwr_reg_wr_addr = (unsigned int)startaddr;
    memwr_reg_len = length;
    memwr_reg_start = (unsigned char)(skipread << 1 | 1);
}

void main() {
    int good = 1;
    unsigned int i, j;
    int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned char* hash;
    unsigned int size;
    unsigned int sum = 0;
    unsigned char* moddata;

    // read image into RAM
    load(0, MAX_IM_SIZE, boot, 1);
    while(memwr_reg_state != 0);

    im  = (struct image*) boot;
    num = im->num;

    sha_reg_rd_addr = (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;

    // check that key matches hash
    shadata(im->exp, 512);
    hash = sha1();
    for(i=0; i<20; i++){
	if(hash[i] != pkhash[i]){
	    P0 = 0;
	    quit();
	}
    }

    // set signature key
    for(i=0; i<N; i++)
	exp_reg_exp[i] = im->exp[i];

    // set signature modulus
    for(i=0; i<N; i++)
	exp_reg_n[i] = im->mod[i];

    // set up RSA
    exp_reg_opaddr = (unsigned int)&d;  // set up address to write to

    // sign header and check
    size = N*2 + 2 + num*(20+2); // size of header
    if(!verifySignature(im->exp, size, im->sig))
    {
	P0 = 0;
	quit();
    }

    // load blocks
    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module
    size = block->size;     // size of current block
    i = 0;
    while(i < num && sum + size <= MAX_PRG_SIZE)
    {
	// check module hash
	shadata(moddata + sum, size);
	hash = sha1();
	for(j=0; j<20; j++){
	    if(hash[j] != block->hash[j]){
		P0 = 0;
		quit();
	    }
	}

	// load data
	load(moddata+sum, size, program+sum, 0);
	block++;
	sum += size;
	size = block->size;
	i++;
    }

    // check that program loaded correctly
    moddata = (unsigned char*)(im->module + num);
    for(i=0; i<sum; i++){
	P0 = program[i];
	if(program[i] != moddata[i]){
	    good = 0;
	    break;
	}
    }


    P0 = good;
    quit();
}
