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

__xdata __at(0xFF00) unsigned char aes_reg_start;
__xdata __at(0xFF01) unsigned char aes_reg_state;
__xdata __at(0xFF02) unsigned int aes_reg_addr;
__xdata __at(0xFF04) unsigned int aes_reg_len;
__xdata __at(0xFF10) unsigned char aes_reg_ctr[16];
__xdata __at(0xFF20) unsigned char aes_reg_key0[16];
__xdata __at(0xFF30) unsigned char aes_reg_key1[16];
__xdata __at(0xE000) unsigned char data[16];

/*---------------------------------------------------------------------------*/

void main() {
    
    int i;

    // test writing to XRAM.
    for(i=0; i < 8; i++) {
        if(i > 0) { 
            data[i] = i*i + data[i-1];
            data[i+8] = ~data[i];
        } else {
            data[i] = 0;
            data[i+8] = 0xff;
        }
    }

    // setup address, length, counter and key.
    aes_reg_addr = 0xE000;
    aes_reg_len = 16;
    for(i=0; i < 16; i++) { aes_reg_ctr[i] = i*i*i; }
    for(i=0; i < 16; i++) { aes_reg_key0[i] = i | (i << 4); }

    // now start encryption.
    aes_reg_start = 1;
    // now wait for encryption to complete.
    while(aes_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 16; i++) {
        P0 = data[i];
    }

    // finish.
    quit();
}
