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

/*---------------------------------------------------------------------------*/

void main() {
    
    static volatile unsigned char __xdata * const aes_reg_addr = 0xFF02;
    aes_reg_addr[0] = 0x12;
    aes_reg_addr[1] = 0x34;
    
    P0 = aes_reg_addr[0];
    P0 = aes_reg_addr[1];

    quit();
}
