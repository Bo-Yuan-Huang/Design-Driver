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

__xdata __at(0xFE00) unsigned char aes_reg_start;
__xdata __at(0xFE01) unsigned char aes_reg_state;
__xdata __at(0xFE02) unsigned int aes_reg_rd_addr;
__xdata __at(0xFE04) unsigned int aes_reg_wr_addr;
__xdata __at(0xFE06) unsigned int aes_reg_len;
__xdata __at(0xE000) unsigned char d1[64];
__xdata __at(0xE100) unsigned char d2[128];
__xdata __at(0xE200) unsigned char hash[20];

/*---------------------------------------------------------------------------*/

void main() {
    
    int i;
    int good=1;

    // test writing to XRAM.
    for(i=0; i < 64; i++) {
        d1[i]=0x41;
    }
    for(i=0; i < 128; i++) {
        d2[i] = i;
    }

    // setup address, length, counter and key.
    aes_reg_rd_addr = (unsigned int) &d1;
    aes_reg_wr_addr = (unsigned int) &hash;
    aes_reg_len = 64;

    // now start encryption.
    aes_reg_start = 1;
    // now wait for encryption to complete.
    while(aes_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 20; i++) {
        P1 = 1;
        P0 = hash[i];
    }

    aes_reg_rd_addr = (unsigned int) &d2;
    aes_reg_len = 128;
    // now start encryption.
    aes_reg_start = 1;
    // now wait for encryption to complete.
    while(aes_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 20; i++) {
        P1 = 2;
        P0 = hash[i];
    }


    // finish.
    quit();
}
