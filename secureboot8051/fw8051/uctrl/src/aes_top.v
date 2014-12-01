/*
 * This wrapper was written by Pramod Subramanyan.
 *
 * Email: pramod.subramanyan@gmail.com
 */ 

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module aes_top (
    clk, 
    rst, 
    wr, 
    addr, 
    data_in, 
    data_out, 
    ack, 
    stb, 
    in_addr_range,
    xram_addr,      // AES ==> XRAM
    xram_data_out,  // AES ==> XRAM
    xram_data_in,   // XRAM ==> AES
    xram_ack,       // XRAM ==> AES
    xram_stb,       // AES ==> XRAM
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

// 8051 <=> AES
input clk, wr, stb, rst;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;
output in_addr_range;
// AES <=> XRAM
output [15:0] xram_addr;
output [7:0] xram_data_out;
input [7:0] xram_data_in;
input xram_ack;
output xram_stb;
output xram_wr;

wire [15:0] xram_addr = 16'hDEAD;
wire [7:0] xram_data_out = 16'hBE;
wire xram_stb = 0;
wire xram_wr = 0;

// FIRST ADDRESS ALLOCATED TO THIS UNIT.
localparam AES_ADDR_START  = 16'hff00;
// see also AES_ADDR_END.

// The addresses of the registers.
localparam AES_REG_START   = 16'hff00; // 1 byte.
localparam AES_REG_STATE   = 16'hff01; // 1 byte.
localparam AES_REG_ADDR    = 16'hff02; // 2 bytes
localparam AES_REG_LEN     = 16'hff04; // 2 bytes.

// some empty space for more registers and keys
localparam AES_REG_KEY0    = 16'hff20;
localparam AES_REG_KEY1    = 16'hff30;

// END OF THE ADDRESS RANGE ALLOCATED TO THIS UNIT.
localparam AES_ADDR_END    = 16'hff40;
// see also AES_ADDR_START.

wire in_addr_range = addr >= AES_ADDR_START && addr < AES_ADDR_END;
wire ack = stb && in_addr_range;

wire sel_reg_state = addr == AES_REG_STATE;
wire sel_reg_addr  = {addr[15:1], 1'b0} == AES_REG_ADDR;
wire sel_reg_len   = {addr[15:1], 1'b0} == AES_REG_LEN;
wire sel_reg_key0  = {addr[15:4], 4'b0} == AES_REG_KEY0;
wire sel_reg_key1  = {addr[15:4], 4'b0} == AES_REG_KEY1;


// The current state of the AES module.
localparam AES_STATE_IDLE       = 2'd0;
localparam AES_STATE_READ_DATA  = 2'd1;
localparam AES_STATE_OPERATE    = 2'd2;
localparam AES_STATE_WRITE_DATA = 2'd3;

// state register.
reg [1:0]  aes_reg_state;
wire [7:0] data_out = sel_reg_state ? aes_reg_state : 8'dz;

// address register.
wire [15:0] aes_reg_opaddr;
reg2byte aes_reg_opaddr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_addr),
    .wr         (sel_reg_addr && wr),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (aes_reg_opaddr)
);

// length register.
wire [15:0] aes_reg_oplen;
reg2byte aes_reg_oplen_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_len),
    .wr         (sel_reg_len && wr),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (aes_reg_oplen)
);

// key0 register.
wire [127:0] aes_reg_key0;
reg16byte aes_reg_key0_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_key0),
    .wr         (sel_reg_key0 && wr),
    .addr       (addr[3:0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (aes_reg_key0)
);

// key1 register.
wire [127:0] aes_reg_key1;
reg16byte aes_reg_key1_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_key1),
    .wr         (sel_reg_key1 && wr),
    .addr       (addr[3:0]),
    .data_in    (data_in),
    .data_out   (data_out),
    .reg_out    (aes_reg_key1)
);

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        aes_reg_state   <= AES_STATE_IDLE;
    end
    else begin
    end
end

endmodule
