#ifndef _AES_REGTEST_H_DEFINED_
#define _AES_REGTEST_H_DEFINED_

// ************* hw-cbmc interface ***********//
/* unwinding Bound */

extern const unsigned int bound;

/* next Timeframe  */

void next_timeframe(void);
void set_inputs(void);


/*
  type declarations
*/

typedef unsigned char _u8;
typedef unsigned short _u16;
typedef unsigned __CPROVER_bitvector[2] _u2;
typedef unsigned __CPROVER_bitvector[4] _u4;
typedef unsigned __CPROVER_bitvector[128] _u128;


/* Module Verilog::aes_top */
struct module_aes_top {
  _Bool clk;
  _Bool wr;
  _Bool stb;
  _Bool rst;
  _u8 data_in;
  _u16 addr;
  _u8 data_out;
  _Bool ack;
  _Bool in_addr_range;
  _u16 xram_addr;
  _u8 xram_data_out;
  _u8 xram_data_in;
  _Bool xram_ack;
  _Bool xram_stb;
  _Bool xram_wr;
  _u2 aes_state;
  _u16 aes_addr;
  _u16 aes_len;
  _u128 aes_ctr;
  _u128 aes_key0;
  _u128 aes_key1;
  _Bool aes_step;
  _u16 AES_ADDR_START;
  _u16 AES_REG_START;
  _u16 AES_REG_STATE;
  _u16 AES_REG_ADDR;
  _u16 AES_REG_LEN;
  _u16 AES_REG_CTR;
  _u16 AES_REG_KEY0;
  _u16 AES_REG_KEY1;
  _u16 AES_ADDR_END;
  _u2 AES_STATE_IDLE;
  _u2 AES_STATE_READ_DATA;
  _u2 AES_STATE_OPERATE;
  _u2 AES_STATE_WRITE_DATA;
  _Bool sel_reg_start;
  _Bool sel_reg_state;
  _Bool sel_reg_addr;
  _Bool sel_reg_len;
  _Bool sel_reg_ctr;
  _Bool sel_reg_key0;
  _Bool sel_reg_key1;
  _u2 aes_reg_state;
  _Bool aes_state_idle;
  _Bool aes_state_read_data;
  _Bool aes_state_operate;
  _Bool aes_state_write_data;
  _Bool wren;
  _Bool start_op;
  _u16 aes_reg_opaddr;
  _u8 aes_addr_dataout;
  struct module_reg2byte aes_reg_opaddr_i;
  _u16 aes_reg_oplen;
  _u8 aes_len_dataout;
  struct module_reg2byte aes_reg_oplen_i;
  _u128 aes_reg_ctr;
  _u8 aes_ctr_dataout;
  struct module_reg16byte aes_reg_ctr_i;
  _u128 aes_reg_key0;
  _u8 aes_key0_dataout;
  struct module_reg16byte aes_reg_key0_i;
  _u128 aes_reg_key1;
  _u8 aes_key1_dataout;
  struct module_reg16byte aes_reg_key1_i;
  _u16 operated_bytes_count;
  _u16 operated_bytes_count_next;
  _u16 block_counter;
  _u16 block_counter_next;
  _u4 byte_counter;
  _Bool reset_byte_counter;
  _Bool incr_byte_counter;
  _u4 byte_counter_next;
  _Bool last_byte_acked;
  _Bool more_blocks;
  _u2 aes_reg_state_next_idle;
  _u2 aes_reg_state_next_read_data;
  _u2 aes_reg_state_next_operate;
  _u2 aes_reg_state_next_write_data;
  _u2 aes_reg_state_next;
  _u128 mem_data_buf;
  _u128 mem_data_buf_next;
  _u128 aes_ctr_v;
  _u128 aes_out;
  _u128 encrypted_data;
  struct module_aes_128 aes_128_i;
  _u128 encrypted_data_buf;
  _u128 encrypted_data_buf_next;
};

// top module
extern struct module_aes_top aes_top;

#endif
