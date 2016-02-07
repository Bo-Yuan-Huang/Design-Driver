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
    proc_stb,
    aes_state,
    aes_step,
    aes_addr,
    aes_len,
    aes_ctr,
    aes_key0,
    aes_key1,
    sha_rdaddr,
    sha_wraddr,
    sha_len,
    sha_state,
    sha_step,
    sha_core_assumps_valid,
    exp_state,
    exp_step,
    exp_addr,
    exp_valid,
    exp_m,
    exp_n,
    exp_exp
);

input clk, rst; 
input proc_wr, proc_stb;
input [7:0] proc_data_in;
input [15:0] proc_addr;
output [7:0] proc_data_out;
output proc_ack;
output [1:0] aes_state; 
output [2:0] sha_state;
output [1:0] exp_state;
output aes_step, sha_step, sha_core_assumps_valid, exp_step, exp_valid;
output [15:0] aes_addr, aes_len, sha_rdaddr, sha_wraddr, sha_len, exp_addr;
output [127:0] aes_ctr, aes_key0, aes_key1;
output [2047:0] exp_m, exp_exp, exp_n;

wire write_xram, write_aes, write_sha, write_exp, write_memwr;
wire ack_xram, ack_aes, ack_sha, ack_exp, ack_memwr;
wire stb_xram, stb_aes, stb_sha, stb_exp, stb_memwr;
wire aes_addr_range, sha_addr_range, exp_addr_range, memwr_addr_range;

wire [1:0] aes_state; 
wire [2:0] sha_state;
wire [1:0] exp_state;
wire [1:0] memwr_state;
wire aes_step, sha_step, exp_step, memwr_step;
wire [15:0] aes_addr, aes_len, sha_rdaddr, sha_wraddr, sha_len, exp_addr, memwr_rdaddr, memwr_wraddr, memwr_len;
wire [127:0] aes_ctr, aes_key0, aes_key1;
wire [2047:0] exp_m, exp_exp, exp_n;

// STROBE.
assign stb_aes = proc_stb && aes_addr_range;
assign stb_sha = proc_stb && sha_addr_range;
assign stb_exp = proc_stb && exp_addr_range;
assign stb_memwr = proc_stb && memwr_addr_range;
assign stb_xram = proc_stb && !(aes_addr_range || sha_addr_range ||
                                exp_addr_range || memwr_addr_range);

// WRITE.
assign write_xram = stb_xram && proc_wr;
assign write_aes = stb_aes && proc_wr;
assign write_sha = stb_sha && proc_wr;
assign write_exp = stb_exp && proc_wr;
assign write_memwr = stb_memwr && proc_wr;

// ACK OUTPUT.
wire proc_ack = ack_xram || ack_aes || ack_sha || ack_exp || ack_memwr;

// DATA OUT.
wire [7:0] proc_data_out;
wire [7:0] data_out_xram;
wire [7:0] data_out_aes;
wire [7:0] data_out_sha;
wire [7:0] data_out_exp;
wire [7:0] data_out_memwr;

assign proc_data_out = stb_aes   ? data_out_aes   : 
                       stb_sha   ? data_out_sha   :
                       stb_exp   ? data_out_exp   : 
                       stb_memwr ? data_out_memwr : data_out_xram;

// AES <=> XRAM signals
wire [15:0] aes_xram_addr;
wire [7:0] aes_xram_data_out;
wire [7:0] aes_xram_data_in;
wire aes_xram_ack;
wire aes_xram_stb;
wire aes_xram_wr;

aes_top aes_top_i (
    .clk           ( clk               ) ,
    .rst           ( rst               ) ,
    .wr            ( write_aes         ) ,
    .addr          ( proc_addr         ) ,
    .data_in       ( proc_data_in      ) ,
    .data_out      ( data_out_aes      ) ,
    .ack           ( ack_aes           ) ,
    .stb           ( stb_aes           ) ,
    .in_addr_range ( aes_addr_range    ) ,
    .xram_addr     ( aes_xram_addr     ) ,
    .xram_data_out ( aes_xram_data_out ) ,
    .xram_data_in  ( aes_xram_data_in  ) ,
    .xram_ack      ( aes_xram_ack      ) ,
    .xram_stb      ( aes_xram_stb      ) ,
    .xram_wr       ( aes_xram_wr       ) ,
    .aes_state     ( aes_state         ) ,
    .aes_step      ( aes_step          ) ,
    .aes_addr      ( aes_addr          ) ,
    .aes_len       ( aes_len           ) ,
    .aes_ctr       ( aes_ctr           ) ,
    .aes_key0      ( aes_key0          ) ,
    .aes_key1      ( aes_key1          ) 
);

// SHA <=> XRAM signals
wire [15:0] sha_xram_addr;
wire [7:0] sha_xram_data_out;
wire [7:0] sha_xram_data_in;
wire sha_xram_ack;
wire sha_xram_stb;
wire sha_xram_wr;

sha_top sha_top_i (
    .clk                    ( clk                    ) ,
    .rst                    ( rst                    ) ,
    .wr                     ( write_sha              ) ,
    .addr                   ( proc_addr              ) ,
    .data_in                ( proc_data_in           ) ,
    .data_out               ( data_out_sha           ) ,
    .ack                    ( ack_sha                ) ,
    .stb                    ( stb_sha                ) ,
    .in_addr_range          ( sha_addr_range         ) ,
    .xram_addr              ( sha_xram_addr          ) ,
    .xram_data_out          ( sha_xram_data_out      ) ,
    .xram_data_in           ( sha_xram_data_in       ) ,
    .xram_ack               ( sha_xram_ack           ) ,
    .xram_stb               ( sha_xram_stb           ) ,
    .xram_wr                ( sha_xram_wr            ) ,
    .sha_state              ( sha_state              ) ,
    .sha_step               ( sha_step               ) ,
    .sha_core_assumps_valid ( sha_core_assumps_valid ) ,
    .sha_rdaddr             ( sha_rdaddr             ) ,
    .sha_wraddr             ( sha_wraddr             ) ,
    .sha_len                ( sha_len                ) 
);

// RSA <=> XRAM signals
wire [15:0] exp_xram_addr;
wire [7:0] exp_xram_data_out;
wire [7:0] exp_xram_data_in;
wire exp_xram_ack;
wire exp_xram_stb;
wire exp_xram_wr;

modexp_top modexp_top_i(
    .clk           (clk              ),
    .rst           (rst              ),
    .wr            (write_exp        ),
    .addr          (proc_addr        ), 
    .data_in       (proc_data_in     ), 
    .data_out      (data_out_exp     ), 
    .ack           (ack_exp          ), 
    .stb           (stb_exp          ), 
    .in_addr_range (exp_addr_range   ),
    .xram_addr     (exp_xram_addr    ),
    .xram_data_out (exp_xram_data_out),
    .xram_data_in  (exp_xram_data_in ),
    .xram_ack      (exp_xram_ack     ),
    .xram_stb      (exp_xram_stb     ),     
    .xram_wr       (exp_xram_wr      ),
    .exp_state     (exp_state        ),
    .exp_addr      (exp_addr         ),
    .exp_step      (exp_step         ),
    .exp_m         (exp_m            ),
    .exp_exp       (exp_exp          ),
    .exp_n         (exp_n            ),
    .exp_valid     (exp_valid        )
);
// memwr <=> XRAM signals
wire[15:0] memwr_xram_addr;
wire [7:0] memwr_xram_data_out;
wire [7:0] memwr_xram_data_in;
wire memwr_xram_ack;
wire memwr_xram_stb;
wire memwr_xram_wr;

mem_wr memwr_i(
    .clk           (clk                ),
    .rst           (rst                ),
    .wr            (write_memwr        ),
    .addr          (proc_addr          ),
    .data_in       (proc_data_in       ),
    .data_out      (data_out_memwr     ),
    .ack           (ack_memwr          ),
    .stb           (stb_memwr          ),
    .in_addr_range (memwr_addr_range   ),
    .xram_addr     (memwr_xram_addr    ),
    .xram_data_out (memwr_xram_data_out),
    .xram_data_in  (memwr_xram_data_in ),
    .xram_ack      (memwr_xram_ack     ),
    .xram_stb      (memwr_xram_stb     ),
    .xram_wr       (memwr_xram_wr      ),
    .state         (memwr_state        ),
    .rdaddr        (memwr_rdaddr       ),
    .wraddr        (memwr_wraddr       ),
    .len           (memwr_len          ),
    .step          (memwr_step         )
);

wire stb_out, ack_in, wr_out;
wire [15:0] addr_out;
wire [7:0] memarbiter_data_in;
wire [7:0] memarbiter_data_out;

oc8051_memarbiter8 oc8051_memarbiter_i (
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

    .stb_C      ( sha_xram_stb        ),
    .ack_C      ( sha_xram_ack        ),
    .wr_C       ( sha_xram_wr         ),
    .addr_C     ( sha_xram_addr       ),
    .data_in_C  ( sha_xram_data_out   ),
    .data_out_C ( sha_xram_data_in    ),

    .stb_D      ( exp_xram_stb        ),
    .ack_D      ( exp_xram_ack        ),
    .wr_D       ( exp_xram_wr         ),
    .addr_D     ( exp_xram_addr       ),
    .data_in_D  ( exp_xram_data_out   ),
    .data_out_D ( exp_xram_data_in    ),

    .stb_E      ( memwr_xram_stb      ),
    .ack_E      ( memwr_xram_ack      ),
    .wr_E       ( memwr_xram_wr       ),
    .addr_E     ( memwr_xram_addr     ),
    .data_in_E  ( memwr_xram_data_out ),
    .data_out_E ( memwr_xram_data_in  ),

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
