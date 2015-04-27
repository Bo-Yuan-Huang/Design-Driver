#ifndef _SHA_HARNESS_H_DEFINED_
#define _SHA_HARNESS_H_DEFINED_

#include "simulate.h"
#include <verilated.h>
#include "Voc8051_xiommu.h"

/** 
  * List of SHA registers.
  *
  * localparam SHA_REG_START   = 16'hfe00; // 1 byte.
  * localparam SHA_REG_STATE   = 16'hfe01; // 1 byte.
  * localparam SHA_REG_RD_ADDR = 16'hfe02; // 2 bytes
  * localparam SHA_REG_WR_ADDR = 16'hfe04; // 2 bytes
  * localparam SHA_REG_LEN     = 16'hfe06; // 2 bytes.
  */

void set_sha_state(int value);
int get_sha_state();

void set_sha_rdaddr(int value);
int get_sha_rdaddr();

void set_sha_wraddr(int value);
int get_sha_wraddr();

void set_sha_len(int value);
int get_sha_len();

void set_sha_bytes_read(int value);
int get_sha_bytes_read();

void set_sha_block_ctr(int value);
int get_sha_block_ctr();

enum SHA_OP { SHA_NOP, SHA_RD, SHA_WR };

struct sha_state_t {
    int reg_state;
    int reg_rdaddr;
    int reg_wraddr;
    int reg_len;
    int reg_bytes_read;
    int reg_block_ctr;

    xram_val_t xram;
};

void eval_sha_state(
    SHA_OP op,
    int addrin,
    int datain,
    int& dataout,
    const sha_state_t& state_in,
    sha_state_t& state_out
);

int test_sha_harness();
void test_sha_state_fns();
void sha_simulate(const char* filename);

#endif

