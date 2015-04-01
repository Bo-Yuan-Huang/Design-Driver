#include <iostream>
#include <verilated.h>
#include "Voc8051_xiommu.h"

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

int main(int argc, char* argv[]) {
    Verilated::commandArgs(argc, argv);
    top = new Voc8051_xiommu;
    
    top->rst = 1;
    incrtime(20);

    top->rst = 0;
    incrtime(21);

    top->proc_wr = 1; top->proc_stb = 1; top->proc_addr = 0xFF02; top->proc_data_in = 0xA5;
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; top->proc_wr = 0;

    top->proc_wr = 1; top->proc_stb = 1; top->proc_addr = 0xFF03; top->proc_data_in = 0x5A;
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; top->proc_wr = 0;

    std::cout << std::hex << top->v__DOT__aes_top_i__DOT__aes_reg_opaddr << std::endl;

    top->proc_wr = 0; top->proc_stb = 1; top->proc_addr = 0xFF02;
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; 
    std::cout << "data: " << std::hex << (int) top->proc_data_out << std::endl;

    top->proc_wr = 0; top->proc_stb = 1; top->proc_addr = 0xFF03;
    do {
        incrtime(10);
    } while(top->proc_ack == 0);
    top->proc_stb = 0; 
    std::cout << "data: " << std::hex << (int) top->proc_data_out << std::endl;

    // VL_SIGW(v__DOT__aes_top_i__DOT__aes_reg_key0,127,0,4);
    // #define VL_BITISSET_W(data,bit) (data[VL_BITWORD_I(bit)] & (VL_UL(1)<<VL_BITBIT_I(bit)))

    top->final();
    delete top;
    return 0;
}
