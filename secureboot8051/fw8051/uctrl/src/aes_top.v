/*
 * This wrapper was written by Pramod Subramanyan.
 *
 * Email: pramod.subramanyan@gmail.com
 */ 

module aes_top(clk, rst, wr, addr, data_in, data_out, ack, stb);

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

input clk, wr, stb, rst;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;

// The addresses of the registers.
localparam AES_REG_KEY00   = 16'hff00;
localparam AES_REG_KEY01   = 16'hff02;
localparam AES_REG_KEY02   = 16'hff04;
localparam AES_REG_KEY03   = 16'hff06;
localparam AES_REG_KEY04   = 16'hff08;
localparam AES_REG_KEY05   = 16'hff0a;
localparam AES_REG_KEY06   = 16'hff0c;
localparam AES_REG_KEY07   = 16'hff0e;

// spramod: I left ff10-ff80 empty in case we upgrade to AES256,
// or add more keys.
localparam AES_REG_OP      = 16'hff80;
localparam AES_REG_STATE   = 16'hff82;
localparam AES_REG_OPADDR  = 16'hff84;
localparam AES_REG_OPLEN   = 16'hff86;

// The operations supported by this module.
localparam AES_OP_ENCRYPT       = 1'b0;
localparam AES_OP_DECRYPT       = 1'b1;

// The current state of the AES module.
localparam AES_STATE_IDLE       = 2'd0;
localparam AES_STATE_ENCRYPTING = 2'd1;
localparam AES_STATE_DECRYPTING = 2'd2;

reg [127:0] aes_reg_key;
reg         aes_reg_op;
reg [1:0]   aes_reg_state;
reg [15:0]  aes_reg_opaddr;
reg [15:0]  aes_reg_oplen;

wire reg_addr_key0 = addr == AES_REG_KEY00;
wire reg_addr_key1 = addr == AES_REG_KEY01;
wire reg_addr_key2 = addr == AES_REG_KEY02;
wire reg_addr_key3 = addr == AES_REG_KEY03;
wire reg_addr_key4 = addr == AES_REG_KEY04;
wire reg_addr_key5 = addr == AES_REG_KEY05;
wire reg_addr_key6 = addr == AES_REG_KEY06;
wire reg_addr_key7 = addr == AES_REG_KEY07;

wire [15:0] aes_key_out = 
    (reg_addr_key0) ? aes[15:0]     :
    (reg_addr_key1) ? aes[31:16]    :
    (reg_addr_key2) ? aes[47:32]    :
    (reg_addr_key3) ? aes[63:48]    :
    (reg_addr_key4) ? aes[79:64]    :
    (reg_addr_key5) ? aes[95:80]    :
    (reg_addr_key6) ? aes[111:96]   :
    (reg_addr_key7) ? aes[127:112]  : 16'hx;

wire aes_wr;

wire aes_key00_next = aes_wr_key0 ? data_in : aes[15:0];
wire aes_key01_next = aes_wr_key1 ? data_in : aes[31:16];
wire aes_key02_next = aes_wr_key2 ? data_in : aes[47:32];
wire aes_key03_next = aes_wr_key3 ? data_in : aes[63:48];
wire aes_key04_next = aes_wr_key4 ? data_in : aes[79:64];
wire aes_key05_next = aes_wr_key5 ? data_in : aes[95:80];
wire aes_key06_next = aes_wr_key6 ? data_in : aes[111:96];
wire aes_key07_next = aes_wr_key7 ? data_in : aes[127:112];

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        aes_reg_key     <= 0;
        aes_reg_state   <= AES_STATE_IDLE;
        aes_reg_op      <= 0;
        aes_reg_opaddr  <= 0;
        aes_reg_oplen   <= 0;
    end
    else begin
    end
end
