#include <8051.h>

// Program tests all instructions except:
// ACALL, LCALL, MOVX(1-4), NOP, RET,and RETI


void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}


void main() {

	__asm;

        INC     0x40
        INC     @R0
        NOP
        NOP
        NOP

    DONE:
	__endasm;

    quit();
}

