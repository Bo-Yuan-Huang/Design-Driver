module oc8051_fv_sim_tb();
  reg ld;
  reg clk;
  wire [7:0] wbd_dat_i = 8'b0;
  wire [31:0] wbi_dat_i = 32'b0;
  wire [7:0] p0_in = 8'b0;
  wire [7:0] p1_in = 8'b0;
  wire [7:0] p2_in = 8'b0;
  wire [7:0] p3_in = 8'b0;
  wire rxd_i = 1'b0;
  wire t0_i = 1'b0;
  wire t1_i = 1'b0;
  wire t2_i = 1'b0;
  wire t2ex_i = 1'b0;
  wire assert_valid;

  oc8051_fv_top oc8051_fv_sim1(
    .clk(clk),
    .ld(ld),
    .wbd_dat_i(wbd_dat_i),
    .wbi_dat_i(wbi_dat_i),
    .p0_in(p0_in),
    .p1_in(p1_in),
    .p2_in(p2_in),
    .p3_in(p3_in),
    .rxd_i(rxd_i),
    .t0_i(t0_i),
    .t1_i(t1_i),
    .t2_i(t2_i),
    .t2ex_i(t2ex_i),
    .assert_valid(assert_valid)
  );

  initial begin
    $dumpon;
    $dumpfile("run.vcd");
    $dumpvars(0,oc8051_fv_sim_tb);

    ld = 1; #20;
    ld = 0; #20000;
    $finish;
  end

  initial
  begin
    clk = 0;
    forever #5 clk <= ~clk;
  end

endmodule

module dff(q, d, clk, ld, ldval);
    output q;
    input d, clk, ld, ldval;
    reg q;
    always@(posedge clk or posedge ld) begin
        if(ld) begin
          q = ldval;
        end
        else begin
          q = d;
        end
    end
endmodule
