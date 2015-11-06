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

__xdata __at(0xFD00) unsigned char exp_reg_start;
__xdata __at(0xFD01) unsigned char exp_reg_state;
__xdata __at(0xFD02) unsigned int  exp_reg_addr;
__xdata __at(0xFC00) unsigned char n[256];
__xdata __at(0xFB00) unsigned char exp[256];
__xdata __at(0xFA00) unsigned char m[256];
__xdata __at(0xE000) unsigned char data[256];
__xdata __at(0xE100) unsigned long comp[64];

/*---------------------------------------------------------------------------*/

void main() {
    int i;
    int good=1;

    // setup address, m, e, n
    exp_reg_addr = 0xE000;
    for(i=0; i < 256; i++) { exp[i] = i*i*i; }
    for(i=0; i < 256; i++) { n[i] = i | (i << 4); }
    for(i=0; i < 256; i++) { m[i] = i;}

    // now start encryption.
    exp_reg_start = 1;

    // now wait for encryption to complete.
    while(exp_reg_state != 0);

    #include "comparr"

    // read encrypted data and dump it to P0.
    for(i=0; i < 256; i++) {
        P0 = data[i];
        if(data[i] != *((unsigned char *)comp + i)) { 
            good =0;
            break;
        }
    }
    P0 = good;
    // finish.
    quit();
}
