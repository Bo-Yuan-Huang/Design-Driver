// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module oc8051_xiommu (
    clk, 
    rst, 
    proc_wr, 
    proc_addr, 
    proc_data_in, 
    proc_data_out, 
    proc_ack, 
    proc_stb
);

input clk, rst; 
input proc_wr, proc_stb;
input [7:0] proc_data_in;
input [15:0] proc_addr;
output [7:0] proc_data_out;
output proc_ack;

wire write_xram, write_aes, write_sha;
wire ack_xram, ack_aes, ack_sha;
wire stb_xram, stb_aes, stb_sha;
wire aes_addr_range, sha_addr_range;

// STROBE.
assign stb_aes = proc_stb && aes_addr_range;
assign stb_sha = proc_stb && sha_addr_range;
assign stb_xram = proc_stb && !(aes_addr_range || sha_addr_range);

// WRITE.
assign write_xram = stb_xram && proc_wr;
assign write_aes = stb_aes && proc_wr;
assign write_sha = stb_sha && proc_wr;

// ACK OUTPUT.
wire proc_ack = ack_xram || ack_aes || ack_sha;

// DATA OUT.
wire [7:0] proc_data_out;
wire [7:0] data_out_xram;
wire [7:0] data_out_aes;
wire [7:0] data_out_sha;

assign proc_data_out = stb_aes ? data_out_aes : 
                       stb_sha ? data_out_sha : data_out_xram;

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
    .addr          ( proc_addr         ),
    .data_in       ( proc_data_in      ),
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

// SHA <=> XRAM signals
wire [15:0] sha_xram_addr;
wire [7:0] sha_xram_data_out;
wire [7:0] sha_xram_data_in;
wire sha_xram_ack;
wire sha_xram_stb;
wire sha_xram_wr;

sha_top sha_top_i (
    .clk           ( clk               ),
    .rst           ( rst               ),
    .wr            ( write_sha         ),
    .addr          ( proc_addr         ),
    .data_in       ( proc_data_in      ),
    .data_out      ( data_out_sha      ),
    .ack           ( ack_sha           ),
    .stb           ( stb_sha           ),
    .in_addr_range ( sha_addr_range    ),
    .xram_addr     ( sha_xram_addr     ),
    .xram_data_out ( sha_xram_data_out ),
    .xram_data_in  ( sha_xram_data_in  ),
    .xram_ack      ( sha_xram_ack      ),
    .xram_stb      ( sha_xram_stb      ),
    .xram_wr       ( sha_xram_wr       )
);

wire stb_out, ack_in, wr_out;
wire [15:0] addr_out;
wire [7:0] memarbiter_data_in;
wire [7:0] memarbiter_data_out;

oc8051_memarbiter oc8051_memarbiter_i (
    .clk        ( clk                 ),
    .rst        ( rst                 ),
   
    .stb_A      ( stb_xram            ),
    .ack_A      ( ack_xram            ),
    .wr_A       ( write_xram          ),
    .addr_A     ( proc_addr           ),
    .data_in_A  ( proc_data_in        ),
    .data_out_A ( data_out_xram       ),

    .stb_B      ( aes_xram_stb        ),
    .ack_B      ( aes_xram_ack        ),
    .wr_B       ( aes_xram_wr         ),
    .addr_B     ( aes_xram_addr       ),
    .data_in_B  ( aes_xram_data_out   ),
    .data_out_B ( aes_xram_data_in    ),

    .stb        ( stb_out             ),
    .ack        ( ack_in              ),
    .wr         ( wr_out              ),
    .addr       ( addr_out            ),
    .data_in    ( memarbiter_data_in  ),
    .data_out   ( memarbiter_data_out ) 
);

oc8051_xram oc8051_xram_i (
    .clk      ( clk                 ),
    .rst      ( rst                 ),
    .wr       ( wr_out              ),
    .addr     ( addr_out            ),
    .data_in  ( memarbiter_data_in  ),
    .data_out ( memarbiter_data_out ),
    .ack      ( ack_in        ),
    .stb      ( stb_out       ) 
);

endmodule
