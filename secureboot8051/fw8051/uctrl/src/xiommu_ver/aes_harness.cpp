#include <iostream>
#include <iomanip>
#include <stdint.h>

#include <verilated.h>

#include "simulate.h"
#include "aes_harness.h"

void set_aes_addr(int value)
{
    top->v__DOT__aes_top_i__DOT__aes_reg_opaddr = value;
}

void set_aes_len(int value)
{
    top->v__DOT__aes_top_i__DOT__aes_reg_oplen = value;
}

void set_aes_ctr(uint8_t* ctr)
{
    setWData(top->v__DOT__aes_top_i__DOT__aes_reg_ctr, ctr, 16);
}

void set_aes_key(uint8_t* ctr)
{
    setWData(top->v__DOT__aes_top_i__DOT__aes_reg_key0, ctr, 16);
}

int test_aes_harness() {
    top->rst = 1;
    incrtime(50);

    top->rst = 0;
    incrtime(21);

    set_aes_addr(0x1000);
    set_aes_len(16);

    uint8_t ctr[] = {1, 2, 3, 4, 5, 6, 7, 8,
                   9, 10, 11, 12, 13, 14, 15, 16};
    uint8_t key[] = {0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88,
                   0x99, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16};

    set_aes_ctr(ctr);
    set_aes_key(key);
    init_xram(0);

    incrtime(100);

    // start encryption.
    write_addr(0xFF00, 1);
    incrtime(10);

    while(read_addr(0xFF01) != 0) {
        incrtime(10);
    }

    for(int i=0x1000; i < 0x1000+16; i++) {
        std::cout << std::hex << std::setw(2) << get_xram_val(i) << " ";
    }
    std::cout << std::endl;
    std::cout << "time: " << std::dec << main_time << std::endl;

    // start decryption..
    write_addr(0xFF00, 1);
    incrtime(10);

    while(read_addr(0xFF01) != 0) {
        incrtime(10);
    }

    for(int i=0x1000; i < 0x1000+16; i++) {
        std::cout << std::hex << std::setw(2) << get_xram_val(i) << " ";
    }
    std::cout << std::endl;
    std::cout << "time: " << std::dec << main_time << std::endl;

    top->final();
    delete top;
    return 0;
}
