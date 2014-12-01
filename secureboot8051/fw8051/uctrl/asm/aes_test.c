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

__xdata __at(0xFF02) unsigned int aes_reg_addr;
__xdata __at(0xFF04) unsigned int aes_reg_len;
__xdata __at(0xFF20) unsigned char aes_reg_key0[16];
__xdata __at(0xE000) unsigned int data[8];

/*---------------------------------------------------------------------------*/

void main() {
    
    int i;

    // test writing to XRAM.
    for(i=0; i < 8; i++) {
        if(i > 0) { 
            data[i] = i*i + data[i-1];
        } else {
            data[i] = 0;
        }
    }

    // test writing to the address register.
    aes_reg_addr = 0x1234;
    P0 = (unsigned char) (aes_reg_addr & 0xFF);
    P0 = (unsigned char) ((aes_reg_addr) >> 8);
    aes_reg_len = 0x5678;
    P0 = (unsigned char) (aes_reg_len & 0xFF);
    P0 = (unsigned char) ((aes_reg_len) >> 8);

    // test writing to the key register.
    for(i=0; i < 16; i++) { aes_reg_key0[i] = i | (i << 4); }
    for(i=0; i < 16; i++) { P0 = aes_reg_key0[i]; }

    // test reading from XRAM.
    for(i=0; i < 8; i++) {
        P0 = data[i];
    }

    // finish.
    quit();
}
