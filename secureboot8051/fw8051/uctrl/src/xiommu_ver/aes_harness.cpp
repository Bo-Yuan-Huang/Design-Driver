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

int get_aes_addr()
{
    return top->v__DOT__aes_top_i__DOT__aes_reg_opaddr;
}

void set_aes_len(int value)
{
    top->v__DOT__aes_top_i__DOT__aes_reg_oplen = value;
}

int get_aes_len()
{
    return top->v__DOT__aes_top_i__DOT__aes_reg_oplen;
}

void set_aes_ctr(const uint8_t* ctr)
{
    setWData(top->v__DOT__aes_top_i__DOT__aes_reg_ctr, ctr, 16);
}

void get_aes_ctr(uint8_t* ctr)
{
    getWData(top->v__DOT__aes_top_i__DOT__aes_reg_ctr, ctr, 16);
}

void set_aes_key(const uint8_t* ctr)
{
    setWData(top->v__DOT__aes_top_i__DOT__aes_reg_key0, ctr, 16);
}

void get_aes_key(uint8_t* ctr)
{
    getWData(top->v__DOT__aes_top_i__DOT__aes_reg_key0, ctr, 16);
}

void set_aes_num_op_bytes(int value)
{
    top->v__DOT__aes_top_i__DOT__operated_bytes_count = value;
}

int get_aes_num_op_bytes()
{
    return top->v__DOT__aes_top_i__DOT__operated_bytes_count;
}

void eval_aes_state(
    AES_OP op,
    int addrin,
    int datain,
    int& dataout,
    const aes_state_t& state_in,
    aes_state_t& state_out
)
{
    if (op == AES_RD || op == AES_WR) {
        top->proc_wr = (op == AES_WR) ? 1 : 0; 
        top->proc_stb = 1; 
        top->proc_addr = addrin; 
        top->proc_data_in = datain;
        do {
            incrtime(10);
        } while(top->proc_ack == 0);
        top->proc_stb = 0; top->proc_wr = 0;

        dataout = top->proc_data_out;
    }
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
