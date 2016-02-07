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

__xdata __at(0xFE40) unsigned char memwr_reg_start;
__xdata __at(0xFE41) unsigned char memwr_reg_state;
__xdata __at(0xFE42) unsigned int memwr_reg_rd_addr;
__xdata __at(0xFE44) unsigned int memwr_reg_wr_addr;
__xdata __at(0xFE46) unsigned int memwr_reg_len;
__xdata __at(0x1000) unsigned char program[0x2000];
__xdata __at(0x3000) unsigned char boot[0x5000];

/*---------------------------------------------------------------------------*/

//public key hash
__code unsigned char pkhash[20] = {0x36, 0xBF, 0x44, 0x9A, 
				   0x0B, 0xA9, 0xA4, 0x1C, 
				   0x5E, 0x04, 0x78, 0x53, 
				   0x08, 0x97, 0x42, 0x82,
				   0xE5, 0x94, 0xA2, 0xDB};

// set up data transfer
void load(unsigned char* data, int length, unsigned int startaddr)
{
    // wait for previous load to finish first
    while(memwr_reg_state != 0);

    memwr_reg_rd_addr = (unsigned int)data;
    memwr_reg_wr_addr = startaddr;
    memwr_reg_len = length;
    memwr_reg_start = 1;
}

void main() {
    int i;
    int good = 1;
    int num;   // total number of blocks
    unsigned char* header;
    unsigned char* block; // current block
    unsigned char* out;   // output of sha1
    unsigned char* pkey;  // public key
    unsigned int offset;  // offset to next block
    unsigned int hoffset;  // offset in header block 
    unsigned int memaddr;
    unsigned int* blocksize;
    unsigned int sum = 0;

    // want to write to here in xram
    memaddr = (unsigned int)&program;

    // bake program into xram somewhere
    header = boot;
    good = bootdata(header, 0x5000);
    if(!good)
    {
	P0 = 0;
	quit();
    }

    num = header[0] + ((unsigned int)header[1] << 8);  // number of modules to load

    pkey = header + 2;

    // check that key matches hash
    sha_reg_rd_addr = (unsigned int)&d;
    sha_reg_wr_addr = (unsigned int)&data1;
    shadata(pkey, 256);
    out = sha1();
    for(i=0; i<20; i++){
	if(out[i] != pkhash[i]){
	    P0 = 0;
	    quit();
	}
    }

    // set signature key
    for(i=0; i<N; i++)
	exp_reg_exp[i] = pkey[i];

    // set up RSA
    //RSAinit();
    exp_reg_opaddr = (unsigned int)&d;  // set up address to write to
    setN(exp_reg_n);  // setup N

    // sign header and check
    hoffset = N + 2;
    offset = hoffset + num*(20+2);

    if(!verifySignature(header, offset, header+offset))
    {
	P0 = 0;
	quit();
    }

    // load blocks
    block = header + offset + N;
    // size of current block
    blocksize = (unsigned int*)(header + 2 + N);
      for(i=0; i<num; i++)
    {
	// sign block and check
	good = sum + *blocksize <= 0x2000;
	good = good && verifySignature(block, *blocksize, block + *blocksize);
	if(good)
	{
	    load(block,*blocksize,memaddr+sum);
	    block += *blocksize + N;
	    sum += *blocksize;
	    blocksize += 11;  // 2 + 20 bytes / 2 = 11
	}
	else
	    break;
    }

    for(i=0; i<num; i++)
	readprogram(i,header+i*N);

    for(i=0; i<sum; i++){
	P0 = program[i];
	if(program[i] != header[i]){
	    good = 0;
	    break;
	}
    }

    P0 = good;
    quit();
}
