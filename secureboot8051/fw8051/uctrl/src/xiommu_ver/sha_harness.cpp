#include <iostream>
#include <iomanip>
#include <fstream>
#include <stdint.h>

#include <verilated.h>

#include "simulate.h"
#include "sha_harness.h"

void set_sha_state(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_state = value;
}

int get_sha_state()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_state;
}

void set_sha_rdaddr(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_rd_addr = value;
}

int get_sha_rdaddr()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_rd_addr;
}

void set_sha_wraddr(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_wr_addr = value;
}

int get_sha_wraddr()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_wr_addr;
}

void set_sha_len(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_len = value;
}

int get_sha_len()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_len;
}

void set_sha_block_ctr(int value)
{
    top->v__DOT__sha_top_i__DOT__block_counter = value;
}

int get_sha_block_ctr()
{
    return top->v__DOT__sha_top_i__DOT__block_counter;
}

void set_sha_bytes_read(int value)
{
    top->v__DOT__sha_top_i__DOT__reg_bytes_read = value;
}

int get_sha_bytes_read()
{
    return top->v__DOT__sha_top_i__DOT__reg_bytes_read;
}

void sha_init_state(const sha_state_t& state)
{
    set_sha_state(state.reg_state);
    set_sha_rdaddr(state.reg_rdaddr);
    set_sha_wraddr(state.reg_wraddr);
    set_sha_len(state.reg_len);
    set_sha_bytes_read(state.reg_bytes_read);
    set_sha_block_ctr(state.reg_block_ctr);
    set_xram_val(state.xram);
}

void sha_read_state(sha_state_t& state)
{
    state.reg_state = get_sha_state();
    state.reg_rdaddr = get_sha_rdaddr();
    state.reg_wraddr = get_sha_wraddr();
    state.reg_len = get_sha_len();
    state.reg_bytes_read = get_sha_bytes_read();
    state.reg_block_ctr = get_sha_block_ctr();
    get_xram_val(state.xram);
}

void eval_sha_state(
    SHA_OP op,
    int addrin,
    int datain,
    int& dataout,
    const sha_state_t& state_in,
    sha_state_t& state_out
)
{
    if (op == SHA_RD || op == SHA_WR) {
        top->proc_wr = (op == SHA_WR) ? 1 : 0; 
        top->proc_stb = 1; 
        top->proc_addr = addrin; 
        top->proc_data_in = datain;
        sha_init_state(state_in);

        do {
            incrtime(10);
        } while(top->proc_ack == 0);
        top->proc_stb = 0; top->proc_wr = 0;

        dataout = top->proc_data_out;
        sha_read_state(state_out);
    } else {
        top->proc_wr = 0;
        top->proc_stb = 0; 
        top->proc_addr = addrin; 
        top->proc_data_in = datain;

        sha_init_state(state_in);
        bool rpt_state = false;
        int orig_state = get_sha_state();
        while(1) {
            incrtime(10);
            int st = get_sha_state();

            if (st == 0) {
                break;
            } else if (rpt_state && st == orig_state) {
                break;
            } else if (st != orig_state) {
                rpt_state = true;
            }
        } 

        dataout = top->proc_data_out;
        sha_read_state(state_out);
    }
}

int test_sha_harness() {
    top->rst = 1;
    incrtime(50);

    top->rst = 0;
    incrtime(21);

    set_sha_rdaddr(0x1000);
    set_sha_wraddr(0x2000);
    set_sha_len(16);

    init_xram(0);

    incrtime(100);

    std::cout << "time [before_hash]: " << std::dec << main_time << std::endl;
    // start hashing.
    write_addr(0xFE00, 1);
    incrtime(10);
    
    // let's try to debug.
    top->proc_wr = 0; top->proc_stb = 1;
    top->proc_addr = 0xFE01;
    top->eval();
    std::cout << "stb-sha=" << (int) top->v__DOT__stb_sha << std::endl;
    std::cout << "sha-addr-range=" << (int) top->v__DOT__sha_addr_range << std::endl;
    std::cout << "ack=" << (int) top->proc_ack << std::endl;
    std::cout << "state=" << (int) top->v__DOT__sha_top_i__DOT__sha_reg_state << std::endl;
    std::cout << "data_out=" << (int) top->proc_data_out << std::endl;

    std::cout << "sha_state=" << read_addr(0xFE01) << std::endl;
    std::cout << "sha_state=" << get_sha_state() << std::endl;
    while(read_addr(0xFE01) != 0) {
        std::cout << "sha_state=" << get_sha_state() << std::endl;
        incrtime(10);
    }

    for(int i=0x2000; i < 0x2000+20; i++) {
        std::cout << std::hex << std::setw(2) << get_xram_val(i) << " ";
    }
    std::cout << std::endl;
    std::cout << "time [after_hash]: " << std::dec << main_time << std::endl;

    test_sha_state_fns();

    return 0;
}

void test_sha_state_fns()
{
    sha_state_t state_in, state_out;
    state_in.reg_state = 0;
    state_in.reg_rdaddr = 0x3000;
    state_in.reg_wraddr = 0x4000;
    state_in.reg_len = 0x40;
    state_in.reg_bytes_read = 0;
    state_in.xram.def = 32;

    int data_out;

    eval_sha_state( SHA_WR, 0xFE00, 1, data_out, state_in, state_out);
    std::cout << state_out.reg_state << std::endl;
    state_in = state_out;
    std::cout << "bytes=" << state_in.reg_bytes_read << std::endl;

    do {
        eval_sha_state( SHA_NOP, 0, 0, data_out, state_in, state_out);
        std::cout << state_out.reg_state << std::endl;
        state_in = state_out;
        std::cout << "bytes=" << state_in.reg_bytes_read << std::endl;
    } while(state_in.reg_state != 0);

    for(int i=0x2000; i < 0x2000+32; i++) {
        std::cout << std::hex << std::setw(2) << get_xram_val(i) << " ";
    }
    std::cout << std::endl;
    std::cout << "bytes=" << state_in.reg_bytes_read << std::endl;
    std::cout << "len=" << state_in.reg_len << std::endl;
}

void sha_simulate(const char* filename)
{
    std::ifstream in(filename);
    if(!in) {
        std::cerr << "Unable to open file " << filename << "." << std::endl;
        return;
    }

    sha_state_t state_in, state_out;
    // initialize state.
    in >> std::hex >> state_in.reg_state;
    in >> std::hex >> state_in.reg_rdaddr;
    in >> std::hex >> state_in.reg_wraddr;
    in >> std::hex >> state_in.reg_len;
    in >> std::hex >> state_in.reg_bytes_read;
    in >> std::hex >> state_in.reg_block_ctr;
    in >> state_in.xram;

    // read in op, addr and data in.
    int op;
    int addr, data_in, data_out;
    in >> std::hex >> op;
    in >> std::hex >> addr;
    in >> std::hex >> data_in;
    in >> std::dec;

    // run SHA module.
    top->rst = 1; incrtime(50);
    top->rst = 0; incrtime(21);
    eval_sha_state((SHA_OP) op, addr, data_in, data_out, state_in, state_out);

    // now output state.
    std::cout << std::hex << data_out << std::endl;
    std::cout << std::hex << state_out.reg_state << " ";
    std::cout << std::hex << state_out.reg_rdaddr << " ";
    std::cout << std::hex << state_out.reg_wraddr << " ";
    std::cout << std::hex << state_out.reg_len << " ";
    std::cout << std::hex << state_out.reg_bytes_read << " ";
    std::cout << std::hex << state_out.reg_block_ctr << std::endl;
    // xram.
    std::cout << state_out.xram << std::endl;
}

