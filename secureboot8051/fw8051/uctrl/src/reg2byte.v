/*
 * This wrapper was written by Pramod Subramanyan.
 *
 * Email: pramod.subramanyan@gmail.com
 */ 

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module reg2byte(clk, rst, en, wr, addr, data_in, data_out, reg_out);
    input           clk;
    input           rst;
    input           en;
    input           wr;
    input           addr;
    input   [7:0]   data_in;
    output  [7:0]   data_out;
    output  [15:0]  reg_out;

    reg     [15:0]  reg_out;

    wire wr0  = en && wr && addr == 0;
    wire wr1  = en && wr && addr == 1;

    wire [7:0] reg0_next = wr0 ? data_in : reg_out[7:0];
    wire [7:0] reg1_next = wr1 ? data_in : reg_out[15:8];

    wire [7:0] data_out_mux = 
                    addr == 4'd0 ? reg_out[7:0]  :
                    addr == 4'd1 ? reg_out[15:8] :
                    8'dX;
    assign data_out = en ? data_out_mux : 8'dz;

    always @(posedge clk)
    begin
        if (rst) begin
            reg_out <= 128'b0;
        end
        else begin
            reg_out[7:0]     <= reg0_next;
            reg_out[15:8]    <= reg1_next;
        end
    end
endmodule
