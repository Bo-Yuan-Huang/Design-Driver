#include <iostream>
#include <iomanip>

#include <assert.h>
#include <stdint.h>

#include <verilated.h>
#include "Voc8051_xiommu.h"
#include "aes_harness.h"

#include <vector>
#include <map>

Voc8051_xiommu* top;
vluint64_t main_time = 0;
const int XRAM_SIZE = 65536;

double sc_time_stamp() {
    return main_time;
}

void incrtime(int nsteps) {
    for(int i=0; i < nsteps; i++) {
        if(main_time % 10 == 0) {
            top->clk = 1;
        } else if(main_time % 10 == 5) {
            top->clk = 0;
        }
        top->eval();
        main_time++;
    }
}


void setWData(WDataOutP reg, const uint8_t* data, int len)
{
    for(unsigned i=0; i != len; i++) {
        int dword = i >> 2; // div 4
        int byte = i & 3;
        uint32_t mask = ~((uint32_t) 0xFF <<  byte);
        reg[dword] &= mask;
        reg[dword] |= (data[i] << byte);
    }
}

void getWData(WDataOutP reg, uint8_t* data, int len)
{
    for(unsigned i=0; i != len; i++) {
        int dword = i >> 2; // div 4
        int byte = i & 3;
        data[i] = (reg[dword] >> byte);
    }
}

int read_addr(uint16_t addr)
{
    top->proc_wr = 0; top->proc_stb = 1; top->proc_addr = addr; 
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; top->proc_wr = 0;
    return (top->proc_data_out);
}

void write_addr(uint16_t addr, uint8_t data)
{
    top->proc_wr = 1; top->proc_stb = 1; top->proc_addr = addr; top->proc_data_in = data;
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; top->proc_wr = 0;
}

void init_xram(uint8_t def)
{
    for(int i=0; i != XRAM_SIZE; i++) {
        top->v__DOT__oc8051_xram_i__DOT__buff[i] = def;
    }
}

void set_xram_val(int addr, int val)
{
    top->v__DOT__oc8051_xram_i__DOT__buff[addr] = val;
}

void set_xram_val(const xram_val_t& xv)
{
    init_xram(xv.def);
    for(unsigned i=0; i != xv.others.size(); i++) {
        set_xram_val(xv.others[i].first, xv.others[i].second);
    }
}

int get_xram_val(int addr)
{
    return top->v__DOT__oc8051_xram_i__DOT__buff[addr];
}

void get_xram_val(xram_val_t& xv)
{
    std::map<int, int> counts;
    for(int i =0; i != XRAM_SIZE; i++) {
        counts[get_xram_val(i)] += 1;
    }

    int max_val = -1, max_count = 0;
    for(auto it=counts.begin(); it != counts.end(); it++) {
        if(it->second > max_count) {
            max_val = it->first;
        }
    }
    assert (max_val != -1);
    xv.def = max_val;
    for(int i=0; i != XRAM_SIZE; i++) {
        auto p = std::pair<int,int>(i, get_xram_val(i));
        xv.others.push_back(p);
    }
}

int main(int argc, char* argv[])
{
    Verilated::commandArgs(argc, argv);
    top = new Voc8051_xiommu;
    
    test_aes_harness();
    top->final();
    delete top;
}
