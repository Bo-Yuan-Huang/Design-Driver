/*
 * Module for keeping track of privilege level
 */


// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"

module oc8051_priv_lvl (rst, clk,
	enter_su_mode,
	leave_su_mode
	);

input 		clk,
	  		rst,
	  		enter_su_mode,
	  		leave_su_mode;


reg priv_lvl;

always @(posedge enter_su_mode)
begin
	priv_lvl = 1'b1;
end

always @(posedge leave_su_mode)
begin
	priv_lvl = 1'b0;
end

always @(posedge rst)
begin
	priv_lvl = 1'b0;
end
