/*
 * Module for keeping track of privilege level
 */


// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"

module oc8051_priv_lvl (rst, clk,
	enter_su_mode,
	leave_su_mode);

input wire clk, rst, enter_su_mode, leave_su_mode;

reg priv_lvl;


always @(posedge clk)
begin
	if (rst)
	begin
		priv_lvl <= 1'b0;
	end 
	else if (leave_su_mode)
	begin
		priv_lvl <= 1'b0;
	end 
	else if (enter_su_mode)
	begin
		priv_lvl <= 1'b1;
	end 
end

endmodule