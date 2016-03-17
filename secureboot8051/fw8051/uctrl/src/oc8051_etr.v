/*
 * Ecall Target Register Module
 * Stores location to jump during Ecall
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"

module oc8051_etr (rst, clk, wr, wr_bit, wr_addr, data_in, etr);

input wire clk, rst, wr, wr_bit;

input wire [7:0] wr_addr, data_in;

output reg [15:0] etr;

always @(posedge clk)
begin
	if (rst)
	begin
		etr <= 16'h0000;
	end
	else if (wr & !wr_bit)
	begin
		if (wr_addr == `OC8051_SFR_ETR_LO)
		begin
			etr <= {etr[15:8], data_in};
		end else if (wr_addr == `OC8051_SFR_ETR_HI)
		begin
			etr <= {data_in, etr[7:0]};
		end
	end
end

endmodule
