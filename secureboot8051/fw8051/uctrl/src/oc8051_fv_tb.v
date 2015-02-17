//////////////////////////////////////////////////////////////////////
//// OC8051 testbench for the FV shim                           //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_fv_tb();

// parameter FREQ  = 20000; // frequency in kHz

    reg clk, rst;
    wire property_invalid;
    reg [31:0] word_in = 32'hffffffff;


`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    reg  [7:0]  p0_in = 8'hff;
 `endif
 `ifdef OC8051_PORT1
    reg  [7:0]  p1_in = 8'hff;
 `endif
 `ifdef OC8051_PORT2
    reg  [7:0]  p2_in = 8'hff;
 `endif
 `ifdef OC8051_PORT3
    reg  [7:0]  p3_in = 8'hff;
 `endif
`endif

`ifdef OC8051_UART
    reg rxd_i = 1;
`endif

`ifdef OC8051_TC01
    reg t0_i = 1;
    reg t1_i = 1;
`endif

`ifdef OC8051_TC2
    reg t2_i = 1;
    reg t2ex_i = 1;
`endif

// reset.
    initial begin
      $dumpon;
      $dumpfile("run2.vcd");
      $dumpvars(0,oc8051_fv_tb);
      rst= 1'b1;
    
      #2001
      rst = 1'b0;

`include "cex_ajmp.v"

      #1000
      $display("time ",$time, "; end of time\n");
      $finish;
    end

    initial
    begin
      clk = 1;
      forever #100 clk <= ~clk;
    end

    oc8051_fv_top oc8051_fv_top1(
        .clk(clk),
        .rst(rst),
        .word_in(word_in),
`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
        .p0_in(p0_in),             // port 0 input
 `endif
 `ifdef OC8051_PORT1
        .p1_in(p1_in),             // port 1 input
 `endif
 `ifdef OC8051_PORT2
        .p2_in(p2_in),             // port 2 input
 `endif
 `ifdef OC8051_PORT3
        .p3_in(p3_in),             // port 3 input
 `endif
`endif
`ifdef OC8051_UART
        .rxd_i(rxd_i),            // receive
`endif

`ifdef OC8051_TC01
        .t0_i(t0_i),             // counter 0 input
        .t1_i(t1_i),             // counter 1 input
`endif

`ifdef OC8051_TC2
        .t2_i(t2_i),             // counter 2 input
        .t2ex_i(t2ex_i),           //
`endif
        .property_invalid(property_invalid)
    );

endmodule
