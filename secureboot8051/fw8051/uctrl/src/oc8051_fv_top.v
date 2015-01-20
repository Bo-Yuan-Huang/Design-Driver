//////////////////////////////////////////////////////////////////////
//// OC8051 formal verification top module                      //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_fv_top(
    clk,
    rst,
    wbd_dat_i,
    wbi_dat_i,
    wbd_err_i,
    wbd_ack_i,
    wbi_err_i,
    wbi_ack_i,
`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    p0_in,             // port 0 input
 `endif
 `ifdef OC8051_PORT1
    p1_in,             // port 1 input
 `endif
 `ifdef OC8051_PORT2
    p2_in,             // port 2 input
 `endif
 `ifdef OC8051_PORT3
    p3_in,             // port 3 input
 `endif
`endif
`ifdef OC8051_UART
    rxd_i,            // receive
`endif

`ifdef OC8051_TC01
    t0_i,             // counter 0 input
    t1_i,             // counter 1 input
`endif

`ifdef OC8051_TC2
    t2_i,             // counter 2 input
    t2ex_i,           //
`endif
    assert_valid
);
    input clk;
    input rst;
    input [7:0] wbd_dat_i;
    input [31:0] wbi_dat_i;
    input wbd_ack_i;
    input wbi_ack_i;
    input wbd_err_i;
    input wbi_err_i;

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    input  [7:0]  p0_in;             // port 0 input
 `endif
 `ifdef OC8051_PORT1
    input  [7:0]  p1_in;             // port 1 input
 `endif
 `ifdef OC8051_PORT2
    input  [7:0]  p2_in;             // port 2 input
 `endif
 `ifdef OC8051_PORT3
    input  [7:0]  p3_in;             // port 3 input
 `endif
`endif

`ifdef OC8051_UART
input         rxd_i;            // receive
`endif

`ifdef OC8051_TC01
input         t0_i,             // counter 0 input
              t1_i;             // counter 1 input
`endif

`ifdef OC8051_TC2
input         t2_i,             // counter 2 input
              t2ex_i;           //
`endif


    output assert_valid;

    wire int0 = 0;
    wire int1 = 1;

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    wire [7:0]  p0_out;             // port 0 output
 `endif
 `ifdef OC8051_PORT1
    wire [7:0]  p1_out;             // port 1 output
 `endif
 `ifdef OC8051_PORT2
    wire [7:0]  p2_out;             // port 2 output
 `endif
 `ifdef OC8051_PORT3
    wire [7:0]  p3_out;             // port 3 output
 `endif
`endif

`ifdef OC8051_UART
    wire        txd_o;            // transnmit
`endif


    wire [7:0] data_out_uart, data_out_xram;
    wire wbd_we_o;
    wire wbd_stb_o;
    wire wbd_cyc_o;
    wire wbi_stb_o;
    wire wbi_cyc_o;
    wire [7:0] wbd_dat_o;
    wire [15:0] wbd_adr_o;
    wire [15:0] cxrom_addr;
    wire [31:0] cxrom_data_out = 32'b0;
    wire [15:0] wbi_adr_o;

    wire pc_log_change;
    wire [15:0] pc_log, pc_log_next;

    // pc_log_change => (pc_log_next = pc_log + 1).
    wire assert_valid = !pc_log_change || (pc_log_next == (pc_log+16'b1));


    oc8051_top oc8051_top_1(
         .wb_rst_i(rst), .wb_clk_i(clk),
         .int0_i(int0), .int1_i(int1),

         .wbd_dat_i(wbd_dat_i), .wbd_we_o(wbd_we_o), .wbd_dat_o(wbd_dat_o),
         .wbd_adr_o(wbd_adr_o), .wbd_err_i(wbd_err_i),
         .wbd_ack_i(wbd_ack_i), .wbd_stb_o(wbd_stb_o), .wbd_cyc_o(wbd_cyc_o),

         .wbi_adr_o(wbi_adr_o), .wbi_stb_o(wbi_stb_o), .wbi_ack_i(wbi_ack_i),
         .wbi_cyc_o(wbi_cyc_o), .wbi_dat_i(wbi_dat_i), .wbi_err_i(wbi_err_i),

         .cxrom_addr            ( cxrom_addr     ),
         .cxrom_data_out        ( cxrom_data_out ),

         .pc_log_change (pc_log_change),
         .pc_log        (pc_log),
         .pc_log_next   (pc_log_next),

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
         .p0_i(p0_in),
         .p0_o(p0_out),
 `endif
 `ifdef OC8051_PORT1
         .p1_i(p1_in),
         .p1_o(p1_out),
 `endif
 `ifdef OC8051_PORT2
         .p2_i(p2_in),
         .p2_o(p2_out),
 `endif
 `ifdef OC8051_PORT3
         .p3_i(p3_in),
         .p3_o(p3_out),
 `endif
`endif


   `ifdef OC8051_UART
         .rxd_i(rxd_i), .txd_o(txd_o),
   `endif

   `ifdef OC8051_TC01
         .t0_i(t0_i), .t1_i(t1_i),
   `endif

   `ifdef OC8051_TC2
         .t2_i(t2_i), .t2ex_i(t2ex_i),
   `endif

         .ea_in(1'b1));

endmodule
