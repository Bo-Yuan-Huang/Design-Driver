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

// AES <=> XRAM signals
wire [15:0] aes_xram_addr;
wire [7:0] aes_xram_data_out;
wire [7:0] aes_xram_data_in;
wire aes_xram_ack;
wire aes_xram_stb;
wire aes_xram_wr;

aes_top aes_top_i (
    .clk           ( clk               ),
    .rst           ( rst               ),
    .wr            ( write_aes         ),
    .addr          ( addr              ),
    .data_in       ( data_in           ),
    .data_out      ( data_out_aes      ),
    .ack           ( ack_aes           ),
    .stb           ( stb_aes           ),
    .in_addr_range ( aes_addr_range    ),
    .xram_addr     ( aes_xram_addr     ),
    .xram_data_out ( aes_xram_data_out ),
    .xram_data_in  ( aes_xram_data_in  ),
    .xram_ack      ( aes_xram_ack      ),
    .xram_stb      ( aes_xram_stb      ),
    .xram_wr       ( aes_xram_wr       )
);

wire stb_out, ack_in, wr_out;
wire [15:0] addr_out;
wire [7:0] data_in_out;
wire [7:0] data_out_out;

oc8051_memarbiter oc8051_memarbiter_i (
    .clk        ( clk               ),
    .rst        ( rst               ),
   
    .stb_A      ( stb_xram          ),
    .ack_A      ( ack_xram          ),
    .wr_A       ( write_xram        ),
    .addr_A     ( addr              ),
    .data_in_A  ( data_in           ),
    .data_out_A ( data_out_xram     ),

    .stb_B      ( aes_xram_stb      ),
    .ack_B      ( aes_xram_ack      ),
    .wr_B       ( aes_xram_wr       ),
    .addr_B     ( aes_xram_addr     ),
    .data_in_B  ( aes_xram_data_out ),
    .data_out_B ( aes_xram_data_in  ),

    .stb        ( stb_out           ),
    .ack        ( ack_in            ),
    .wr         ( wr_out            ),
    .addr       ( addr_out          ),
    .data_in    ( data_in_out       ),
    .data_out   ( data_out_out      )
);

oc8051_xram oc8051_xram_i (
    .clk      ( clk           ),
    .rst      ( rst           ),
    .wr       ( wr_out        ),
    .addr     ( addr_out      ),
    .data_in  ( data_in_out   ),
    .data_out ( data_out_out  ),
    .ack      ( ack_in        ),
    .stb      ( stb_out       ) 
);

endmodule
