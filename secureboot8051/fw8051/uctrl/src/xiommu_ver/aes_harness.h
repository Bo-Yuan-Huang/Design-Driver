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

void set_aes_addr(int value);
void set_aes_len(int value);
void set_aes_ctr(uint8_t* ctr);
void set_aes_key(uint8_t* ctr);

int test_aes_harness();

#endif
