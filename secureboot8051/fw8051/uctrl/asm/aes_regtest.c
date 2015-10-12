#include <stdint.h>
#include "aes_regtest.h"

uint8_t mem[65536];
void quit() {
    // FIXME: Do we need something here?
}

void outb(uint16_t addr, uint8_t data)
{
    // TODO; write data.
    mem[addr] = data;
}

#define AES_REG_START_ADDR 0xFF00
#define AES_REG_STATE_ADDR 0xFF01
#define AES_REG_ADDR_ADDR 0xFF02
#define AES_REG_LEN_ADDR 0xFF04
#define AES_REG_CTR_ADDR 0xFF10
#define AES_REG_KEY0_ADDR 0xFF20
#define AES_REG_KEY1_ADDR 0xFF30
#define DATA_ADDR 0xE000

void reset()
{
    aes_top.rst = 1;
    set_inputs();
    next_timeframe();

    aes_top.rst = 0;
    aes_top.wr = 0; 
    aes_top.stb = 0;
    aes_top.rst = 0;
    aes_top.data_in = 0;
    aes_top.addr = 0;
    aes_top.data_out = 0;
}

_u8 inb(_u16 addr)
{
}


/*---------------------------------------------------------------------------*/

void main() {
    
    int i;
    int good=1;

    // test writing to XRAM.
    for(i=0; i < 32; i++) {
        outb(DATA_ADDR+i, i);
    }
    for(i=0; i < 32; i++) {
        assert(inb(DATA_ADDR+i) == i);
    }

    quit();
}
