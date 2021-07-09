SRC=$HOME/Design-Driver/hw_sec_design_driver/secureboot8051/fw8051/uctrl/src

iverilog -o oc8051                     \
  -I $SRC                              \
  -Wno-timescale                       \
  -D OC8051_SIMULATION                 \
  $SRC/oc8051_tb_dc.v                  \
  $SRC/oc8051_xram.v                   \
  $SRC/oc8051_uart_test.v              \
  $SRC/oc8051_top.v                    \
  $SRC/oc8051_alu_src_sel.v            \
  $SRC/oc8051_alu.v                    \
  $SRC/oc8051_decoder.v                \
  $SRC/oc8051_divide.v                 \
  $SRC/oc8051_multiply.v               \
  $SRC/oc8051_memory_interface.v       \
  $SRC/oc8051_ram_top.v                \
  $SRC/oc8051_acc.v                    \
  $SRC/oc8051_comp.v                   \
  $SRC/oc8051_sp.v                     \
  $SRC/oc8051_dptr.v                   \
  $SRC/oc8051_cy_select.v              \
  $SRC/oc8051_psw.v                    \
  $SRC/oc8051_indi_addr.v              \
  $SRC/oc8051_ports.v                  \
  $SRC/oc8051_b_register.v             \
  $SRC/oc8051_uart.v                   \
  $SRC/oc8051_int.v                    \
  $SRC/oc8051_tc.v                     \
  $SRC/oc8051_tc2.v                    \
  $SRC/oc8051_icache.v                 \
  $SRC/oc8051_wb_iinterface.v          \
  $SRC/oc8051_sfr.v                    \
  $SRC/oc8051_cxrom.v                  \
  $SRC/oc8051_cxrom_copy.v             \
  $SRC/oc8051_rom.v                    \
  $SRC/oc8051_cache_ram.v              \
  $SRC/oc8051_ram_256x8_two_bist.v     \
  $SRC/oc8051_ram_64x32_dual_bist.v    \
  $SRC/oc8051_etr.v                    \
  $SRC/oc8051_priv_lvl.v               \
  $SRC/oc8051_page_table.v             \
  $SRC/aes_128.v                       \
  $SRC/aes_round.v                     \
  $SRC/aes_table.v                     \
  $SRC/reg2byte.v                      \
  $SRC/reg16byte.v                     \
  $SRC/reg256byte.v                    \
  $SRC/aes_top.v                       \
  $SRC/oc8051_procarbiter.v            \
  $SRC/oc8051_memarbiter.v             \
  $SRC/oc8051_xiommu.v                 \
  $SRC/sha1_core.v                     \
  $SRC/sha1_w_mem.v                    \
  $SRC/sha_top.v                       \
  $SRC/modmul.v                        \
  $SRC/modexp.v                        \
  $SRC/modexp_top.v                    \
  $SRC/mem_wr.v

