/*
 * Page Table Module
 * 
 * Written by Samuel Miller
 */

`include "oc8051_timescale.v"

`include "oc8051_defines.v"

module oc8051_page_table (clk, rst, 
	wr,
	wr_en, 
	rd_en, 
	pt_addr_range, 
	stb,
	ack,
	xram_addr, 
	xram_data_in, 
	pt_data_out,
	priv_lvl
);

input wire clk, rst, wr, priv_lvl, stb;
input wire [15:0] xram_addr;
input wire [7:0] xram_data_in;

output wire wr_en, rd_en, pt_addr_range, ack;
output wire [7:0] pt_data_out;

// page table wires (broken up into bytes for easy indexing)
wire [255:0] unsplit_pages_wr;
wire [255:0] unsplit_pages_rd;
wire [7:0] wr_enabled [31:0];
wire [7:0] rd_enabled [31:0];

// internal wires to keep track of address range and what reg is being used (wr_en or rd_en)
wire pt_in_wr_range, pt_in_rd_range, pt_wr_reg_use, pt_rd_reg_use;
wire [7:0] data_out_wr, data_out_rd;

// possible ranges for addresses involving pt registers
localparam PT_WR_ADDR_START  = 16'hff80;
localparam PT_WR_ADDR_END    = 16'hff9f;
localparam PT_RD_ADDR_START  = 16'hffa0;
localparam PT_RD_ADDR_END    = 16'hffbf;

// find the range of the addresses (or that it isn't in the page table ranges)
assign pt_in_wr_range = ((xram_addr >= PT_WR_ADDR_START) && (xram_addr <= PT_WR_ADDR_END));
assign pt_in_rd_range = ((xram_addr >= PT_RD_ADDR_START) && (xram_addr <= PT_RD_ADDR_END));
assign pt_addr_range  = (pt_in_wr_range || pt_in_rd_range);

// figure out if page table reg should be read/written to, and if so, which section (wr_en or rd_en)
assign pt_wr_reg_use = priv_lvl && stb && pt_in_wr_range;
assign pt_rd_reg_use = priv_lvl && stb && pt_in_rd_range;

// figure out which data set (wr_en or rd_en) to read from
assign pt_data_out = pt_in_wr_range ? data_out_wr :
			  		 pt_in_rd_range ? data_out_rd : 8'h00;

// allow reads and writes only to enabled pages
assign wr_en = wr_enabled[xram_addr[15:11]][xram_addr[10:8]];
assign rd_en = rd_enabled[xram_addr[15:11]][xram_addr[10:8]];
assign ack = stb && pt_addr_range;

// split 256-bit wire into 32 8-bit wires for easy indexing
assign wr_enabled[0]  = unsplit_pages_wr[7:0];
assign wr_enabled[1]  = unsplit_pages_wr[15:8];
assign wr_enabled[2]  = unsplit_pages_wr[23:16];
assign wr_enabled[3]  = unsplit_pages_wr[31:24];
assign wr_enabled[4]  = unsplit_pages_wr[39:32];
assign wr_enabled[5]  = unsplit_pages_wr[47:40];
assign wr_enabled[6]  = unsplit_pages_wr[55:48];
assign wr_enabled[7]  = unsplit_pages_wr[63:56];
assign wr_enabled[8]  = unsplit_pages_wr[71:64];
assign wr_enabled[9]  = unsplit_pages_wr[79:72];
assign wr_enabled[10] = unsplit_pages_wr[87:80];
assign wr_enabled[11] = unsplit_pages_wr[95:88];
assign wr_enabled[12] = unsplit_pages_wr[103:96];
assign wr_enabled[13] = unsplit_pages_wr[111:104];
assign wr_enabled[14] = unsplit_pages_wr[119:112];
assign wr_enabled[15] = unsplit_pages_wr[127:120];
assign wr_enabled[16] = unsplit_pages_wr[135:128];
assign wr_enabled[17] = unsplit_pages_wr[143:136];
assign wr_enabled[18] = unsplit_pages_wr[151:144];
assign wr_enabled[19] = unsplit_pages_wr[159:152];
assign wr_enabled[20] = unsplit_pages_wr[167:160];
assign wr_enabled[21] = unsplit_pages_wr[175:168];
assign wr_enabled[22] = unsplit_pages_wr[183:176];
assign wr_enabled[23] = unsplit_pages_wr[191:184];
assign wr_enabled[24] = unsplit_pages_wr[199:192];
assign wr_enabled[25] = unsplit_pages_wr[207:200];
assign wr_enabled[26] = unsplit_pages_wr[215:208];
assign wr_enabled[27] = unsplit_pages_wr[223:216];
assign wr_enabled[28] = unsplit_pages_wr[231:224];
assign wr_enabled[29] = unsplit_pages_wr[239:232];
assign wr_enabled[30] = unsplit_pages_wr[247:240];
assign wr_enabled[31] = unsplit_pages_wr[255:248];

// split 256-bit wire into 32 8-bit wires for easy indexing
assign rd_enabled[0]  = unsplit_pages_rd[7:0];
assign rd_enabled[1]  = unsplit_pages_rd[15:8];
assign rd_enabled[2]  = unsplit_pages_rd[23:16];
assign rd_enabled[3]  = unsplit_pages_rd[31:24];
assign rd_enabled[4]  = unsplit_pages_rd[39:32];
assign rd_enabled[5]  = unsplit_pages_rd[47:40];
assign rd_enabled[6]  = unsplit_pages_rd[55:48];
assign rd_enabled[7]  = unsplit_pages_rd[63:56];
assign rd_enabled[8]  = unsplit_pages_rd[71:64];
assign rd_enabled[9]  = unsplit_pages_rd[79:72];
assign rd_enabled[10] = unsplit_pages_rd[87:80];
assign rd_enabled[11] = unsplit_pages_rd[95:88];
assign rd_enabled[12] = unsplit_pages_rd[103:96];
assign rd_enabled[13] = unsplit_pages_rd[111:104];
assign rd_enabled[14] = unsplit_pages_rd[119:112];
assign rd_enabled[15] = unsplit_pages_rd[127:120];
assign rd_enabled[16] = unsplit_pages_rd[135:128];
assign rd_enabled[17] = unsplit_pages_rd[143:136];
assign rd_enabled[18] = unsplit_pages_rd[151:144];
assign rd_enabled[19] = unsplit_pages_rd[159:152];
assign rd_enabled[20] = unsplit_pages_rd[167:160];
assign rd_enabled[21] = unsplit_pages_rd[175:168];
assign rd_enabled[22] = unsplit_pages_rd[183:176];
assign rd_enabled[23] = unsplit_pages_rd[191:184];
assign rd_enabled[24] = unsplit_pages_rd[199:192];
assign rd_enabled[25] = unsplit_pages_rd[207:200];
assign rd_enabled[26] = unsplit_pages_rd[215:208];
assign rd_enabled[27] = unsplit_pages_rd[223:216];
assign rd_enabled[28] = unsplit_pages_rd[231:224];
assign rd_enabled[29] = unsplit_pages_rd[239:232];
assign rd_enabled[30] = unsplit_pages_rd[247:240];
assign rd_enabled[31] = unsplit_pages_rd[255:248];

// for wr_en pages
reg32byte reg32byte0(
	.clk 		(clk),
	.rst 		(rst),
	.en 		(pt_wr_reg_use),
	.wr 		(wr),
	.addr 		(xram_addr[4:0]),
	.data_in 	(xram_data_in),
	.data_out 	(data_out_wr),
	.reg_out 	(unsplit_pages_wr)
);

// for rd_en pages
reg32byte reg32byte1(
	.clk 		(clk),
	.rst 		(rst),
	.en 		(pt_rd_reg_use),
	.wr 		(wr),
	.addr 		(xram_addr[4:0]),
	.data_in 	(xram_data_in),
	.data_out 	(data_out_rd),
	.reg_out 	(unsplit_pages_rd)
);

endmodule
