#ifndef _SIMULATE_H_DEFINED_
#define _SIMULATE_H_DEFINED_

#include <vector>

#include <stdint.h>
#include <verilated.h>
#include "Voc8051_xiommu.h"


extern Voc8051_xiommu* top;
extern vluint64_t main_time;
extern const int XRAM_SIZE;

struct xram_val_t {
    int def;
    std::vector< std::pair<int,int> > others;
};

double sc_time_stamp();
void incrtime(int nsteps);

// utility functions.
void setWData(WDataOutP reg, const uint8_t* data, int len);
void getWData(WDataOutP reg, uint8_t* data, int len);

// read and write functions.
int read_addr(uint16_t addr);
void write_addr(uint16_t addr, uint8_t data);
void init_xram(uint8_t def);
void set_xram_val(int addr, int val);
void set_xram_val(const xram_val_t& xv);
int get_xram_val(int addr);
void get_xram_val(xram_val_t& xv);

#endif
