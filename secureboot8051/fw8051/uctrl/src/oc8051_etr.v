/*
 * Ecall Target Register Module
 * Stores location to jump during Ecall
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"

module oc8051_etr (rst, clk, wr, wr_bit, wr_addr, data_in, etr);

input wire clk, rst, wr, wr_bit;

input wire [7:0] wr_addr, data_in;

output wire [15:0] etr;

reg [15:0] etr_reg;

wire [15:0] etr_next = 
    (wr && !wr_bit && (wr_addr == `OC8051_SFR_ETR_LO)) ? {etr_reg[15:8], data_in} :
    (wr && !wr_bit && (wr_addr == `OC8051_SFR_ETR_HI)) ? {data_in, etr_reg[7:0]}  :
    etr_reg;

wire etr_c = (wr && !wr_bit && ((wr_addr == `OC8051_SFR_ETR_LO) || (wr_addr == `OC8051_SFR_ETR_HI)));

assign etr = etr_c ? etr_next : etr_reg;

always @(posedge clk)
begin
	if (rst)
	begin
		etr_reg <= 16'h0000;
	end
	else if (etr_c)
	begin
        etr_reg <= etr_next;
	end
end

endmodule
