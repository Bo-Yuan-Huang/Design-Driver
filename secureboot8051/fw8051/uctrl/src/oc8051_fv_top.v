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
    word_in,
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
    property_invalid
);
    input clk;
    input rst;
    input [31:0] word_in;

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


    output property_invalid;

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


    wire [7:0] wbd_dat_i = 0;
    wire [31:0] wbi_dat_i = 0;
    wire wbd_ack_i = 0;
    wire wbi_ack_i = 0;
    wire wbd_err_i = 0;
    wire wbi_err_i = 0;

    wire [7:0] data_out_uart, data_out_xram;
    wire wbd_we_o;
    wire wbd_stb_o;
    wire wbd_cyc_o;
    wire wbi_stb_o;
    wire wbi_cyc_o;
    wire [7:0] wbd_dat_o;
    wire [15:0] wbd_adr_o;
    wire [15:0] cxrom_addr;
    wire [31:0] cxrom_data_out;
    wire [15:0] wbi_adr_o;

    reg  first_instr;
    wire pc_log_change;
    wire [15:0] pc2, pc1;
    wire op_valid;
    wire [7:0] op0_out;
    wire [7:0] op1_out;
    wire [7:0] op2_out;

    // pc_log_change => (pc_log_prev = pc_log + 1).
    wire pcp1 = 
        (op0_out[1] && op0_out[2] && !op0_out[4] && op0_out[6]) || (op0_out[1] && op0_out[2]
        && !op0_out[3] && op0_out[4] && !op0_out[5]) || (op0_out[0] && op0_out[1] &&
        !op0_out[3] && op0_out[6] && op0_out[7]) || (op0_out[0] && op0_out[1] && !op0_out[2]
        && !op0_out[3] && !op0_out[6]) || (!op0_out[0] && !op0_out[1] && op0_out[2] &&
        !op0_out[3] && !op0_out[4] && !op0_out[5] && !op0_out[6]) || (!op0_out[0] &&
        op0_out[5] && op0_out[6] && op0_out[7]) || (!op0_out[1] && op0_out[2] && !op0_out[3]
        && !op0_out[4] && op0_out[5] && !op0_out[6] && op0_out[7]) || (!op0_out[0] &&
        op0_out[2] && !op0_out[3] && op0_out[6] && op0_out[7]) || (!op0_out[0] && !op0_out[1]
        && !op0_out[4] && !op0_out[5] && !op0_out[6] && !op0_out[7]) || (!op0_out[0] &&
        op0_out[2] && !op0_out[5] && !op0_out[6] && !op0_out[7]) || (op0_out[3] && op0_out[4]
        && !op0_out[5] && !op0_out[6]) || (op0_out[3] && op0_out[5] && op0_out[6] &&
        op0_out[7]) || (op0_out[3] && !op0_out[6] && !op0_out[7]) || (op0_out[1] &&
        op0_out[2] && !op0_out[6] && !op0_out[7]) || (op0_out[3] && !op0_out[4] &&
        op0_out[6]) || (op0_out[3] && !op0_out[5] && !op0_out[7]);

    wire pcp2 = 
        (!op0_out[1] && op0_out[2] && !op0_out[3] && op0_out[5] && !op0_out[6] &&
        !op0_out[7]) || (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] &&
        !op0_out[5] && !op0_out[7]) || (!op0_out[0] && op0_out[1] && !op0_out[2] &&
        !op0_out[3] && !op0_out[5] && op0_out[7]) || (!op0_out[0] && !op0_out[1] &&
        op0_out[2] && !op0_out[3] && op0_out[6] && !op0_out[7]) || (op0_out[3] && op0_out[4]
        && op0_out[5] && op0_out[6] && !op0_out[7]) || (op0_out[3] && !op0_out[4] &&
        !op0_out[6] && op0_out[7]) || (!op0_out[0] && op0_out[1] && !op0_out[2] &&
        !op0_out[3] && op0_out[6] && !op0_out[7]) || (op0_out[1] && op0_out[2] && op0_out[4]
        && op0_out[5] && op0_out[6] && !op0_out[7]) || (!op0_out[0] && !op0_out[2] &&
        !op0_out[3] && !op0_out[5] && op0_out[6] && op0_out[7]) || (!op0_out[1] && op0_out[2]
        && !op0_out[3] && op0_out[4] && !op0_out[5] && !op0_out[6] && op0_out[7]) ||
        (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] && op0_out[5] && op0_out[6]
        && op0_out[7]) || (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] &&
        !op0_out[4] && op0_out[6]) || (op0_out[1] && op0_out[2] && !op0_out[4] && !op0_out[6]
        && op0_out[7]) || (!op0_out[0] && !op0_out[2] && !op0_out[3] && op0_out[5] &&
        !op0_out[6] && op0_out[7]);

    wire pcp3 = 
        (!op0_out[0] && !op0_out[1] && !op0_out[2] && !op0_out[3] && op0_out[4] &&
        !op0_out[5] && !op0_out[6] && op0_out[7]) || (op0_out[0] && !op0_out[1] && op0_out[2]
        && !op0_out[3] && !op0_out[4] && !op0_out[5] && !op0_out[6] && op0_out[7]) ||
        (op0_out[0] && !op0_out[1] && op0_out[2] && !op0_out[3] && op0_out[4] && op0_out[5]
        && op0_out[6] && !op0_out[7]) || (op0_out[0] && op0_out[1] && !op0_out[2] &&
        !op0_out[3] && !op0_out[4] && op0_out[6] && !op0_out[7]) || (op0_out[0] && op0_out[1]
        && !op0_out[2] && !op0_out[3] && !op0_out[5] && op0_out[6] && !op0_out[7]);
    wire pc_is_sjmp = (op0_out == 8'h80);
    wire pc_is_ljmp = (op0_out == 8'h02) || (op0_out == 8'h12);
    wire pc_is_ajmp = (op0_out[3:0] == 4'h1);


    // need these to compute relative addresses.
    wire [15:0] pc1_plus_2 = pc1 + 16'h2;
    wire [15:0] pc1_plus_3 = pc1 + 16'h3;

    // relative addresses for jumps.
    wire [15:0] reladdr1, reladdr2, rpc1, rpc2;

    // sign-extend
    assign reladdr1[15:8] = op1_out[7] ? 8'hFF : 8'h00;
    assign reladdr2[15:8] = op2_out[7] ? 8'hFF : 8'h00;
    assign reladdr1[7:0]  = op1_out;
    assign reladdr2[7:0]  = op2_out;
    assign rpc1 = (pc1_plus_2) + reladdr1;
    assign rpc2 = (pc1_plus_3) + reladdr2;

    // SJMP.
    wire [15:0] sjmp_pc = rpc1;

    // absolute address jumps.
    wire [15:0] ljmp_pc = {op1_out, op2_out};

    // The following is derived from this SMT expression.
    // ajmp_pc = Concat(Extract(15, 11, pc_p2), Extract(7, 5, op0), op1)
    wire [15:0] ajmp_pc = {pc1_plus_2[15:11], op0_out[7:5], op1_out};

    wire property_invalid_pcp1 = 
        (!first_instr && pc_log_change && op_valid && pcp1) && 
        ((pc1+16'd1) != pc2);
    wire property_invalid_pcp2 = 
        (!first_instr && pc_log_change && op_valid && pcp2) && 
        ((pc1+16'd2) != pc2);
    wire property_invalid_pcp3 = 
        (!first_instr && pc_log_change && op_valid && pcp3) && 
        ((pc1+16'd3) != pc2);
    wire property_invalid_sjmp = 
        (!first_instr && pc_log_change && op_valid && pc_is_sjmp) && 
        (sjmp_pc != pc2);
    wire property_invalid_ljmp = 
        (!first_instr && pc_log_change && op_valid && pc_is_ljmp) && 
        (ljmp_pc != pc2);
    wire property_invalid_ajmp = 
        (!first_instr && pc_log_change && op_valid && pc_is_ajmp) && 
        (ajmp_pc != pc2);

    wire property_invalid = 
            property_invalid_pcp1 || 
            property_invalid_pcp2 || 
            property_invalid_pcp3 ||
            property_invalid_sjmp ||
            property_invalid_ljmp;
            // let's ignore ajmp for now.
            // || property_invalid_ajmp;

    always @(posedge clk)
    begin
        if (rst) begin
            first_instr <= 1;
        end
        else begin
            if(pc_log_change && first_instr) begin
                first_instr <= 0;
            end
        end
    end

    oc8051_symbolic_cxrom oc8051_symbolic_cxrom1 ( 
        .clk                  ( clk            ),
        .rst                  ( rst            ),
        .word_in              ( word_in        ),
        .cxrom_addr           ( cxrom_addr     ),
        .pc1                  ( pc1            ),
        .pc2                  ( pc2            ),
        .cxrom_data_out       ( cxrom_data_out ),
        .op_valid             ( op_valid       ),
        .op0_out              ( op0_out        ),
        .op1_out              ( op1_out        ),
        .op2_out              ( op2_out        )
    );


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

         .pc_log_change         (pc_log_change),
         .pc_log                (pc2),
         .pc_log_prev           (pc1),

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
