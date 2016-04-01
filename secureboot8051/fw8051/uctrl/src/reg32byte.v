// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module reg32byte(clk, rst, en, wr, addr, data_in, data_out, reg_out);
    input           clk;
    input           rst;
    input           en;
    input           wr;
    input   [4:0]   addr;
    input   [7:0]   data_in;
    output  [7:0]   data_out;
    output  [255:0] reg_out;

    reg     [7:0] reg_data [31:0];
    wire    [255:0] reg_out;

    assign data_out = reg_out[addr];
    assign reg_out = { reg_data[31], reg_data[30], ... };

    integer i;
    always @(posedge clk)
    begin
        if (rst) begin
            for (i=0; i < 32; i+=1) begin
                reg_data[i] = 8'b0;
            end
        end
        else begin
            if (wr) begin
                reg_data[addr] <= data_in;
            end
        end
    end
endmodule
