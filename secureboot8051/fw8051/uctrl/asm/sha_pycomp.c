#include <reg51.h>

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/

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
__xdata __at(0xE000) unsigned char d1[64];
__xdata __at(0xE100) unsigned char d2[128];
__xdata __at(0xE200) unsigned char hash[20];

/*---------------------------------------------------------------------------*/

void main() {

    unsigned char pyhash[20];    
    int i;
    int good=1;
    int N = 128;
    int start_size = N-64;
    int end_size = start_size+8;

    #include "pyhash.c"

    // test writing to XRAM. little endian in 64 byte blocks
    for(i=0; i < start_size; i++) {
        d2[i] = i;
    }

    // put message size (in bits) in last 2 words of last block
    // leave space for 8 bytes of size and 1 byte for appended bit
    d2[i++] = (N-9) << 3 & 0xFF;  
    d2[i++] = (N-9) >> 5 & 0xFF;

    for(; i<end_size; i++)
    {
      d2[i] = 0;
    }

    // append 1 to end of message, then pad 0s
    d2[i++] = 0x80;

    // rest of message
    for(; i<N; i++)
    {
      d2[i] = i;
    }

    sha_reg_rd_addr = (unsigned int) &d2;
    sha_reg_wr_addr = (unsigned int) &hash;
    sha_reg_len = N;
    
    // now start encryption.
    sha_reg_start = 1;
    // now wait for encryption to complete.
    while(sha_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 20; i++) {
        P1 = 2;
        P0 = hash[i];
        if(hash[i] != pyhash[i])
        {
          good = 0;
          break;
        }
    }

    P0 = good;

    // finish.
    quit();
}
