#ifndef _AES_HARNESS_H_DEFINED_
#define _AES_HARNESS_H_DEFINED_

#include "simulate.h"
#include <verilated.h>
#include "Voc8051_xiommu.h"

/** 
  * List of AES registers.
  *
  * localparam AES_REG_START   = 16'hff00; // 1 byte.
  * localparam AES_REG_STATE   = 16'hff01; // 1 byte.
  * localparam AES_REG_ADDR    = 16'hff02; // 2 bytes
  * localparam AES_REG_LEN     = 16'hff04; // 2 bytes.
  * localparam AES_REG_CTR     = 16'hff10;
  * localparam AES_REG_KEY0    = 16'hff20;
  */

void set_aes_state(int value);
int get_aes_state();

void set_aes_addr(int value);
int get_aes_addr();

void set_aes_len(int value);
int get_aes_len();

void set_aes_ctr(const uint8_t* ctr);
void get_aes_ctr(uint8_t* ctr);

void set_aes_key(const uint8_t* ctr);
void get_aes_key(uint8_t* ctr);

void set_aes_num_op_bytes(int value);
int get_aes_num_op_bytes();

enum AES_OP { AES_NOP, AES_RD, AES_WR };

struct aes_state_t {
    int reg_state;
    int reg_addr;
    int reg_len;
    int reg_num_op_bytes;

    uint8_t reg_ctr[16];
    uint8_t reg_key[16];
    xram_val_t xram;
};

void eval_aes_state(
    AES_OP op,
    int addrin,
    int datain,
    int& dataout,
    const aes_state_t& state_in,
    aes_state_t& state_out
);

int test_aes_harness();
void test_aes_state_fns();

#endif
