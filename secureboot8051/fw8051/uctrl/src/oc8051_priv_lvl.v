/*
 * Module for keeping track of privilege level
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"

module oc8051_priv_lvl (rst, clk,
	enter_su_mode,
	leave_su_mode,
	priv_lvl);

input wire clk, rst, enter_su_mode, leave_su_mode;

// privilege level and "virtual stack pointer" counter
output wire priv_lvl;
reg [6:0] priv_counter;

// if at any level other that zero "virtual empty stack", 
// processor is in supervisor mode
assign priv_lvl = |priv_counter;

always @(posedge clk)
begin
	if (rst)
	begin
		priv_counter <= 7'b0000001;
	end
	else if (leave_su_mode)
	begin
		if (priv_counter != 7'b0000000)
		begin
			priv_counter <= priv_counter + 7'b1111111;
		end
	end
	else if (enter_su_mode)
	begin
		if (priv_counter != 7'b1111111)
		begin
		 	priv_counter <= priv_counter + 7'b0000001;
		end
	end
end

endmodule