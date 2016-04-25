/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
#include "rsa.h"
#ifdef C
#ifndef CBMC
#include <stdio.h>
#endif
#else
#include <reg51.h>
#endif

#ifdef CBMC
unsigned char* nondet_ptr();
unsigned int nondet_uint();
unsigned char nondet_uchar();
int nondet_int();
#endif

#ifdef C
unsigned char mem[MEM_SIZE];
#endif

XDATA_ARR(0x0000, MAX_PRG_SIZE, unsigned char, program);
XDATA_ARR(0x5000, MAX_IM_SIZE, unsigned char, boot);

XDATA_ARR(0xC000, MAX_IM_SIZE+0x40, unsigned char, sha_in);
XDATA_ARR(0xE100, H, unsigned char, sha_out);
XDATA_ARR(0xE200, N, unsigned char, rsa_out);

/*---------------------------------------------------------------------------*/
void main() {
#ifdef CBMC
   unsigned char before, after;
   const unsigned int compind = nondet_uint()%MAX_IM_SIZE;
#endif
#ifdef C
   // put new arrays into pt
   int page;
   boot = mem_add(MAX_IM_SIZE);
   page = pt_add(boot, MAX_IM_SIZE);
#endif
   // STAGE 1: read image into RAM
   assert(unlock(page, boot, boot+MAX_IM_SIZE));
   //assert(writec(page, boot, 5, 0));

   // something might break the image here
   if(nondet_uint())
	writec(nondet_uint(), nondet_ptr(), nondet_uchar(), 0);

   // image is loaded.
   // now we need to lock boot to boot + MAX_IM_SIZE
   //lock(page, boot, boot+MAX_IM_SIZE);

   before = boot[compind];
   //before = pt_valid(boot);

   if(nondet_uint())
       writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
   
   //after = pt_valid(boot);
   after = boot[compind];
   assert(after==before);
}

