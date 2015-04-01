#include <iostream>
#include <iomanip>

#include <assert.h>
#include <stdint.h>

#include <verilated.h>
#include "Voc8051_xiommu.h"
#include "aes_harness.h"

Voc8051_xiommu* top;
vluint64_t main_time = 0;

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


void setWData(WDataOutP reg, uint8_t* data, int len)
{
    for(unsigned i=0; i != len; i++) {
        int dword = i >> 2; // div 4
        int byte = i & 3;
        uint32_t mask = ~((uint32_t) 0xFF <<  byte);
        reg[dword] &= mask;
        reg[dword] |= (data[i] << byte);
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
    for(int i=0; i != 65536; i++) {
        top->v__DOT__oc8051_xram_i__DOT__buff[i] = def;
    }
}

int get_xram_val(int i)
{
    return top->v__DOT__oc8051_xram_i__DOT__buff[i];
}

int main(int argc, char* argv[])
{
    Verilated::commandArgs(argc, argv);
    top = new Voc8051_xiommu;
    
    test_aes_harness();

    return 0;
}
