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
    int good=1;

    // test writing to XRAM.
    for(i=0; i < 32; i++) {
        data[i]=i;
    }

    // setup address, length, counter and key.
    aes_reg_addr = 0xE000;
    aes_reg_len = 32;
    for(i=0; i < 16; i++) { aes_reg_ctr[i] = i*i*i; }
    for(i=0; i < 16; i++) { aes_reg_key0[i] = i | (i << 4); }

    // now start encryption.
    aes_reg_start = 1;
    // now wait for encryption to complete.
    while(aes_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 32; i++) {
        P0 = data[i];
    }

    // let us decrypt now.
    aes_reg_start = 1;
    while(aes_reg_state != 0);

    for(i=0; i < 32; i++) {
        if(data[i] != i) { 
            good =0;
            break;
        }
    }
    P0 = good;
    // finish.
    quit();
}
