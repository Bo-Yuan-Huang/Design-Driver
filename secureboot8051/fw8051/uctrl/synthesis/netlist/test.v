
module oc8051_fv_top ( clk, rst, wbd_dat_i, wbi_dat_i, wbd_err_i, wbd_ack_i, 
        wbi_err_i, wbi_ack_i, p0_in, p1_in, p2_in, p3_in, rxd_i, t0_i, t1_i, 
        t2_i, t2ex_i, assert_valid );
  input [7:0] wbd_dat_i;
  input [31:0] wbi_dat_i;
  input [7:0] p0_in;
  input [7:0] p1_in;
  input [7:0] p2_in;
  input [7:0] p3_in;
  input clk, rst, wbd_err_i, wbd_ack_i, wbi_err_i, wbi_ack_i, rxd_i, t0_i,
         t1_i, t2_i, t2ex_i;
  output assert_valid;
  wire   pc_log_change, n0, n10, n2, n3, n4, n50, n60, n70, n80, n90, n100,
         n11, n12, n13, n14, n15, n16, n17, n51, n71, n81, n91,
         oc8051_top_1_n4, oc8051_top_1_n3, oc8051_top_1_n2,
         oc8051_top_1__5_net_, oc8051_top_1_comp_wait, oc8051_top_1__3_net_,
         oc8051_top_1_reti, oc8051_top_1_int_ack, oc8051_top_1_intr,
         oc8051_top_1_sfr_bit, oc8051_top_1_bank_sel_0_,
         oc8051_top_1_bank_sel_1_, oc8051_top_1_cy, oc8051_top_1_dptr_lo_0_;
  wire   [15:0] pc_log_prev;
  wire   [15:0] pc_log;
  wire   [7:0] oc8051_top_1_sp;
  wire   [7:0] oc8051_top_1_sp_w;
  wire   [5:0] oc8051_top_1_int_src;
  wire   [31:0] oc8051_top_1_idat_i;
  OR2_X0P5M_A12TS u9 ( .A(n71), .B(rst), .Y(n51) );
  NOR2_X0P5A_A12TS u10 ( .A(pc_log_change), .B(n17), .Y(n71) );
  NOR2_X0P5A_A12TS u11 ( .A(n81), .B(n91), .Y(assert_valid) );
  NAND2_X0P5A_A12TS u12 ( .A(n17), .B(n16), .Y(n91) );
  INV_X0P5B_A12TS u13 ( .A(pc_log_change), .Y(n81) );
  INV_X0P5B_A12TS oc8051_top_1_u7 ( .A(oc8051_top_1_wr_addr_7_), .Y(
        oc8051_top_1_n4) );
  NOR2_X0P5A_A12TS oc8051_top_1_u6 ( .A(oc8051_top_1_n4), .B(
        oc8051_top_1_wr_ind), .Y(oc8051_top_1_n3) );
  INV_X0P5B_A12TS oc8051_top_1_u5 ( .A(oc8051_top_1_wr_o), .Y(oc8051_top_1_n2)
         );
  NOR2_X0P5A_A12TS oc8051_top_1_u4 ( .A(oc8051_top_1_n3), .B(oc8051_top_1_n2), 
        .Y(oc8051_top_1__0_net_) );
  AND2_X0P5M_A12TS oc8051_top_1_u3 ( .A(oc8051_top_1_pc_wr), .B(
        oc8051_top_1_comp_wait), .Y(oc8051_top_1__3_net_) );
  NOR2_X0P5A_A12TS oc8051_top_1_u2 ( .A(oc8051_top_1_wr_ind), .B(
        oc8051_top_1_n2), .Y(oc8051_top_1__5_net_) );
  NOR2_X0P5A_A12TS oc8051_top_1_oc8051_decoder1_u951 ( .A(
        oc8051_top_1_oc8051_decoder1_state_0_), .B(
        oc8051_top_1_oc8051_decoder1_state_1_), .Y(
        oc8051_top_1_oc8051_decoder1_n215) );
  INV_X0P5B_A12TS oc8051_top_1_oc8051_decoder1_u950 ( .A(
        oc8051_top_1_oc8051_decoder1_n215), .Y(
        oc8051_top_1_oc8051_decoder1_n247) );
  NOR2_X0P5A_A12TS oc8051_top_1_oc8051_decoder1_u949 ( .A(
        oc8051_top_1_oc8051_decoder1_n247), .B(oc8051_top_1_wait_data), .Y(
        oc8051_top_1_rd) );
  NOR2_X0P5A_A12TS oc8051_top_1_oc8051_decoder1_u948 ( .A(oc8051_top_1_rd), 
        .B(oc8051_top_1_mem_wait), .Y(oc8051_top_1_oc8051_decoder1_n867) );
  NAND2_X0P5A_A12TS oc8051_top_1_oc8051_decoder1_u947 ( .A(
        oc8051_top_1_oc8051_decoder1_op_0_), .B(
        oc8051_top_1_oc8051_decoder1_n867), .Y(
        oc8051_top_1_oc8051_decoder1_n884) );
  NAND2_X0P5A_A12TS add_131_u11 ( .A(pc_log_prev[9]), .B(add_131_n12), .Y(
        add_131_n11) );
  NAND2_X0P5A_A12TS add_131_u10 ( .A(add_131_n10), .B(add_131_n11), .Y(n90) );
  INV_X1B_A12TS add_131_u9 ( .A(pc_log_prev[7]), .Y(add_131_n5) );
  INV_X1B_A12TS add_131_u8 ( .A(pc_log_prev[11]), .Y(add_131_n3) );
  INV_X1B_A12TS add_131_u7 ( .A(pc_log_prev[5]), .Y(add_131_n6) );
  INV_X1B_A12TS add_131_u6 ( .A(pc_log_prev[3]), .Y(add_131_n7) );
  INV_X1B_A12TS add_131_u5 ( .A(pc_log_prev[1]), .Y(add_131_n8) );
  INV_X1B_A12TS add_131_u4 ( .A(pc_log_prev[9]), .Y(add_131_n4) );
  INV_X1B_A12TS add_131_u3 ( .A(pc_log_prev[0]), .Y(n0) );
  INV_X1B_A12TS add_131_u2 ( .A(add_131_n39), .Y(add_131_n1) );
  INV_X1B_A12TS add_131_u1 ( .A(add_131_n42), .Y(add_131_n2) );
  DFFQ_X1M_A12TS oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_reg_63__0_ ( 
        .D(oc8051_top_1_oc8051_ram_top1_oc8051_idata_n10506), .CK(clk), .Q(
        oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_63__0_) );
  DFFQ_X1M_A12TS oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_reg_63__1_ ( 
        .D(oc8051_top_1_oc8051_ram_top1_oc8051_idata_n10507), .CK(clk), .Q(
        oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_63__1_) );
  DFFQ_X1M_A12TS oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_reg_63__2_ ( 
        .D(oc8051_top_1_oc8051_ram_top1_oc8051_idata_n10508), .CK(clk), .Q(
        oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_63__2_) );
  DFFQ_X1M_A12TS oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_reg_63__3_ ( 
        .D(oc8051_top_1_oc8051_ram_top1_oc8051_idata_n10509), .CK(clk), .Q(
        oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_63__3_) );
  DFFQ_X1M_A12TS oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_reg_63__4_ ( 
        .D(oc8051_top_1_oc8051_ram_top1_oc8051_idata_n10510), .CK(clk), .Q(
        oc8051_top_1_oc8051_ram_top1_oc8051_idata_buff_63__4_) );
  DFFQN_X1M_A12TS first_instr_reg ( .D(n51), .CK(clk), .QN(n17) );
  DFFSRPQ_X1M_A12TS oc8051_top_1_oc8051_decoder1_src_sel3_reg ( .D(
        oc8051_top_1_oc8051_decoder1_n935), .CK(clk), .R(rst), .SN(1'b1), .Q(
        oc8051_top_1_src_sel3) );
  DFFSRPQ_X1M_A12TS oc8051_top_1_oc8051_decoder1_src_sel1_reg_2_ ( .D(
        oc8051_top_1_oc8051_decoder1_n959), .CK(clk), .R(rst), .SN(1'b1), .Q(
        oc8051_top_1_src_sel1[2]) );

endmodule

