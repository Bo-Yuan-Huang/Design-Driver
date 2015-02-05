module oc8051_symbolic_cxrom(
    clk,
    rst,
    word_in,
    cxrom_addr,
    pc1,
    pc2,
    cxrom_data_out,
    op_valid,
    op_out
);
    input clk, rst;
    input [15:0] cxrom_addr;
    input [31:0] word_in;
    input [15:0] pc1;
    input [15:0] pc2;

    output [31:0] cxrom_data_out;
    output op_valid;
    output [7:0] op_out;

    reg [7:0] rombuf[1:0];
    always @(posedge clk) begin
        if(rst) begin
            rombuf[0] = 8'h15;
            rombuf[1] = 8'hA8;
        end
    end

    wire [15:0] addr0 = cxrom_addr;
    wire [15:0] addr1 = cxrom_addr+1;
    wire [15:0] addr2 = cxrom_addr+2;
    wire [15:0] addr3 = cxrom_addr+3;
    wire [7:0] data_o0 = (addr0 < 2) ? rombuf[addr0[1:0]] : 8'h00;
    wire [7:0] data_o1 = (addr1 < 2) ? rombuf[addr1[1:0]] : 8'h00;
    wire [7:0] data_o2 = (addr2 < 2) ? rombuf[addr2[1:0]] : 8'h00;
    wire [7:0] data_o3 = (addr3 < 2) ? rombuf[addr3[1:0]] : 8'h00;

    assign cxrom_data_out = {data_o3, data_o2, data_o1, data_o0};

    assign op_valid = 1'b1;
    assign op_out = pc1 < 2 ? rombuf[pc1[1:0]] : 8'h00;

endmodule
