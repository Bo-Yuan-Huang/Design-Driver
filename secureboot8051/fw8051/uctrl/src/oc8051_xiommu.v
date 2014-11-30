// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module oc8051_xiommu (clk, rst, wr, addr, data_in, data_out, ack, stb);

input clk, wr, stb, rst;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;

wire write_xram, write_aes;
wire ack_xram, ack_aes;
wire stb_xram, stb_aes;
wire aes_addr_range;

// STROBE.
assign stb_aes = stb && aes_addr_range;
assign stb_xram = stb && !aes_addr_range;

// WRITE.
assign write_xram = stb_xram && wr;
assign write_aes = stb_aes && wr;

// ACK OUTPUT.
wire ack = ack_xram || ack_aes;

// DATA OUT.
wire [7:0] data_out;
wire [7:0] data_out_xram;
wire [7:0] data_out_aes;

assign data_out = stb_aes ? data_out_aes : data_out_xram;


aes_top aes_top_i (
    .clk            ( clk            ), 
    .rst            ( rst            ), 
    .wr             ( write_aes      ), 
    .addr           ( addr           ), 
    .data_in        ( data_in        ), 
    .data_out       ( data_out_aes   ), 
    .ack            ( ack_aes        ), 
    .stb            ( stb_aes        ), 
    .in_addr_range  ( aes_addr_range ) 
);

oc8051_xram oc8051_xram_i (
    .clk      ( clk           ),
    .rst      ( rst           ),
    .wr       ( write_xram    ),
    .addr     ( addr          ),
    .data_in  ( data_in       ),
    .data_out ( data_out_xram ),
    .ack      ( ack_xram      ),
    .stb      ( stb_xram      ) 
);

endmodule
