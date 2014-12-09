/*
 * SHA module that interfaces with oc8051.
 *
 * This wrapper was written by Pramod Subramanyan.
 * Email: pramod.subramanyan@gmail.com
 */ 

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module sha_top (
    clk, 
    rst, 
    wr, 
    addr, 
    data_in, 
    data_out, 
    ack, 
    stb, 
    in_addr_range,
    xram_addr,      // SHA ==> XRAM
    xram_data_out,  // SHA ==> XRAM
    xram_data_in,   // XRAM ==> SHA
    xram_ack,       // XRAM ==> SHA
    xram_stb,       // SHA ==> XRAM
    xram_wr
);

//
// This is the exact same interface as oc8051_xram.
//
// clk          (in)  clock
// addr         (in)  addres
// data_in      (out) data input
// data_out     (in)  data output
// wr           (in)  write
// ack          (out) acknowlage
// stb          (in)  strobe
//

// 8051 <=> SHA
input clk, wr, stb, rst;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;
output in_addr_range;
// SHA <=> XRAM
output [15:0] xram_addr;
output [7:0] xram_data_out;
input [7:0] xram_data_in;
input xram_ack;
output xram_stb;
output xram_wr;

// FIRST ADDRESS ALLOCATED TO THIS UNIT.
localparam SHA_ADDR_START  = 16'hfe00;
// see also SHA_ADDR_END.

// The addresses of the registers.
localparam SHA_REG_START   = 16'hfe00; // 1 byte.
localparam SHA_REG_STATE   = 16'hfe01; // 1 byte.
localparam SHA_REG_RD_ADDR = 16'hfe02; // 2 bytes
localparam SHA_REG_WR_ADDR = 16'hfe04; // 2 bytes
localparam SHA_REG_LEN     = 16'hfe06; // 2 bytes.

// END OF THE ADDRESS RANGE ALLOCATED TO THIS UNIT.
localparam SHA_ADDR_END    = 16'hfe10;
// see also SHA_ADDR_START.

// response to the xiommu module.
wire in_addr_range = addr >= SHA_ADDR_START && addr < SHA_ADDR_END;
wire ack = stb && in_addr_range;

// register selector predicates.
wire sel_reg_start = addr == SHA_REG_START;
wire sel_reg_state = addr == SHA_REG_STATE;
wire sel_reg_rd_addr  = {addr[15:1], 1'b0} == SHA_REG_RD_ADDR;
wire sel_reg_wr_addr  = {addr[15:1], 1'b0} == SHA_REG_WR_ADDR;
wire sel_reg_len      = {addr[15:1], 1'b0} == SHA_REG_LEN;

// The current state of the AES module.
localparam SHA_STATE_IDLE       = 3'd0;
localparam SHA_STATE_READ_DATA  = 3'd1;
localparam SHA_STATE_OPERATE    = 3'd2;
localparam SHA_STATE_WRITE_DATA = 3'd3;

// state register.
reg [1:0]  sha_reg_state;
wire [7:0] data_out = sel_reg_state ? sha_reg_state : 8'dz;

// rd address register.
wire [15:0] sha_reg_rd_addr;
reg2byte sha_reg_rd_addr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_rd_addr),
    .wr         (sel_reg_rd_addr && wr),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (sha_reg_rd_addr)
);

// wr address register.
wire [15:0] sha_reg_wr_addr;
reg2byte sha_reg_wr_addr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_wr_addr),
    .wr         (sel_reg_wr_addr && wr),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (sha_reg_wr_addr)
);

// length register.
wire [15:0] sha_reg_len;
reg2byte sha_reg_len_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_len),
    .wr         (sel_reg_len && wr),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (sha_reg_len)
);

endmodule
