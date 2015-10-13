#include <assert.h>
#include <stdint.h>
#include "aes_regtest.h"

uint8_t mem[65536];
void quit() {
    // FIXME: Do we need something here?
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
    int i;

    top.rst = 1;
    set_inputs();
    for(i=0; i < 10; i++) {
        next_timeframe();
    }

    top.rst = 0;
    top.proc_wr = 0; 
    top.proc_stb = 0;
    top.proc_data_in = 0;
    top.proc_addr = 0;
}

_u8 inb(_u16 addr)
{
    int cnt = 0;

    top.proc_wr = 0;
    top.proc_stb = 1;
    top.proc_addr = addr;
    set_inputs();
    next_timeframe();

    while(top.proc_ack == 0) {
        next_timeframe();
        cnt += 1;
        if (cnt >= 20) break;
    }
    assert (cnt < 20);
    
    top.proc_stb = 0;
    top.proc_addr = 0;
    return top.proc_data_out;
}

void outb(_u16 addr, _u8 data)
{
    int cnt = 0;

    top.proc_wr = 1;
    top.proc_stb = 1;
    top.proc_addr = addr;
    top.proc_data_in = data;
    set_inputs();
    next_timeframe();

    while(top.proc_ack == 0) {
        next_timeframe();
        cnt += 1;
        if (cnt >= 20) break;
    }
    assert (cnt < 20);
    
    top.proc_stb = 0;
    top.proc_addr = 0;
}


/*---------------------------------------------------------------------------*/

void main() {
    
    _u16 i;
    reset();

    // test writing to XRAM.
    for(i=0; i < 1; i++) {
        outb(DATA_ADDR+i, i);
    }
    //for(i=0; i < 1; i++) {
    //    assert(inb(DATA_ADDR+i) == i);
    //}

    quit();
}
