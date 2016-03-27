/*
 * Page Table Module
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"

module oc8051_page_table (clk, rst, 
	wr_en, 
	rd_en, 
	pt_addr_range, 
	stb,
	ack,
	xram_addr, 
	xram_data_in, 
	priv_lvl
);

input wire clk, rst, priv_lvl, stb;
input wire [15:0] xram_addr;
input wire [7:0] xram_data_in;

output wire wr_en, rd_en, pt_addr_range, ack;

// page table registers
reg [255:0] wr_enabled = 256'h0;
reg [255:0] rd_enabled = 256'h0;

// internal wires to keep track of address range
wire pt_in_wr_range, pt_in_rd_range;

// possible ranges for addresses
localparam PT_WR_ADDR_START  = 16'hff80;
localparam PT_WR_ADDR_END    = 16'hff9f;
localparam PT_RD_ADDR_START  = 16'hffa0;
localparam PT_RD_ADDR_END    = 16'hffbf;

// find the range of the addresses (or that it isn't in the page table ranges)
assign pt_in_wr_range = ((xram_addr >= PT_WR_ADDR_START) && (xram_addr <= PT_WR_ADDR_END));
assign pt_in_rd_range = ((xram_addr >= PT_RD_ADDR_START) && (xram_addr <= PT_RD_ADDR_END));
assign pt_addr_range  = (pt_in_wr_range || pt_in_rd_range);

// allow reads and writes only to enabled pages
assign wr_en = wr_enabled[xram_addr[15:8]];
assign rd_en = rd_enabled[xram_addr[15:8]];
assign ack = stb && pt_addr_range;

always @(posedge clk) begin
	if (rst) begin
		wr_enabled <= 256'h0;
		rd_enabled <= 256'h0;
	end
	else if (priv_lvl && stb && pt_in_wr_range) begin
		case (xram_addr)
			16'hff80: begin
				wr_enabled[7:0] <= xram_data_in;
			end
			16'hff81: begin
				wr_enabled[15:8] <= xram_data_in;
			end
			16'hff82: begin
				wr_enabled[23:16] <= xram_data_in;
			end
			16'hff83: begin
				wr_enabled[31:24] <= xram_data_in;
			end
			16'hff84: begin
				wr_enabled[39:32] <= xram_data_in;
			end
			16'hff85: begin
				wr_enabled[47:40] <= xram_data_in;
			end
			16'hff86: begin
				wr_enabled[55:48] <= xram_data_in;
			end
			16'hff87: begin
				wr_enabled[63:56] <= xram_data_in;
			end
			16'hff88: begin
				wr_enabled[71:64] <= xram_data_in;
			end
			16'hff89: begin
				wr_enabled[79:72] <= xram_data_in;
			end
			16'hff8a: begin
				wr_enabled[87:80] <= xram_data_in;
			end
			16'hff8b: begin
				wr_enabled[95:88] <= xram_data_in;
			end
			16'hff8c: begin
				wr_enabled[103:96] <= xram_data_in;
			end
			16'hff8d: begin
				wr_enabled[111:104] <= xram_data_in;
			end
			16'hff8e: begin
				wr_enabled[119:112] <= xram_data_in;
			end
			16'hff8f: begin
				wr_enabled[127:120] <= xram_data_in;
			end
			16'hff90: begin
				wr_enabled[135:128] <= xram_data_in;
			end
			16'hff91: begin
				wr_enabled[143:136] <= xram_data_in;
			end
			16'hff92: begin
				wr_enabled[151:144] <= xram_data_in;
			end
			16'hff93: begin
				wr_enabled[159:152] <= xram_data_in;
			end
			16'hff94: begin
				wr_enabled[167:160] <= xram_data_in;
			end
			16'hff95: begin
				wr_enabled[175:168] <= xram_data_in;
			end
			16'hff96: begin
				wr_enabled[183:176] <= xram_data_in;
			end
			16'hff97: begin
				wr_enabled[191:184] <= xram_data_in;
			end
			16'hff98: begin
				wr_enabled[199:192] <= xram_data_in;
			end
			16'hff99: begin
				wr_enabled[207:200] <= xram_data_in;
			end
			16'hff9a: begin
				wr_enabled[215:208] <= xram_data_in;
			end
			16'hff9b: begin
				wr_enabled[223:216] <= xram_data_in;
			end
			16'hff9c: begin
				wr_enabled[231:224] <= xram_data_in;
			end
			16'hff9d: begin
				wr_enabled[239:232] <= xram_data_in;
			end
			16'hff9e: begin
				wr_enabled[247:240] <= xram_data_in;
			end
			16'hff9f: begin
				wr_enabled[255:248] <= xram_data_in;
			end
		endcase
	end
	else if (priv_lvl && stb && pt_in_rd_range) begin
		case (xram_addr)
			16'hffa0: begin
				rd_enabled[7:0] <= xram_data_in;
			end
			16'hffa1: begin
				rd_enabled[15:8] <= xram_data_in;
			end
			16'hffa2: begin
				rd_enabled[23:16] <= xram_data_in;
			end
			16'hffa3: begin
				rd_enabled[31:24] <= xram_data_in;
			end
			16'hffa4: begin
				rd_enabled[39:32] <= xram_data_in;
			end
			16'hffa5: begin
				rd_enabled[47:40] <= xram_data_in;
			end
			16'hffa6: begin
				rd_enabled[55:48] <= xram_data_in;
			end
			16'hffa7: begin
				rd_enabled[63:56] <= xram_data_in;
			end
			16'hffa8: begin
				rd_enabled[71:64] <= xram_data_in;
			end
			16'hffa9: begin
				rd_enabled[79:72] <= xram_data_in;
			end
			16'hffaa: begin
				rd_enabled[87:80] <= xram_data_in;
			end
			16'hffab: begin
				rd_enabled[95:88] <= xram_data_in;
			end
			16'hffac: begin
				rd_enabled[103:96] <= xram_data_in;
			end
			16'hffad: begin
				rd_enabled[111:104] <= xram_data_in;
			end
			16'hffae: begin
				rd_enabled[119:112] <= xram_data_in;
			end
			16'hffaf: begin
				rd_enabled[127:120] <= xram_data_in;
			end
			16'hffb0: begin
				rd_enabled[135:128] <= xram_data_in;
			end
			16'hffb1: begin
				rd_enabled[143:136] <= xram_data_in;
			end
			16'hffb2: begin
				rd_enabled[151:144] <= xram_data_in;
			end
			16'hffb3: begin
				rd_enabled[159:152] <= xram_data_in;
			end
			16'hffb4: begin
				rd_enabled[167:160] <= xram_data_in;
			end
			16'hffb5: begin
				rd_enabled[175:168] <= xram_data_in;
			end
			16'hffb6: begin
				rd_enabled[183:176] <= xram_data_in;
			end
			16'hffb7: begin
				rd_enabled[191:184] <= xram_data_in;
			end
			16'hffb8: begin
				rd_enabled[199:192] <= xram_data_in;
			end
			16'hffb9: begin
				rd_enabled[207:200] <= xram_data_in;
			end
			16'hffba: begin
			rd_enabled[215:208] <= xram_data_in;
			end
			16'hffbb: begin
				rd_enabled[223:216] <= xram_data_in;
			end
			16'hffbc: begin
			rd_enabled[231:224] <= xram_data_in;
			end
			16'hffbd: begin
				rd_enabled[239:232] <= xram_data_in;
			end
			16'hffbe: begin
				rd_enabled[247:240] <= xram_data_in;
			end
			16'hffbf: begin
				rd_enabled[255:248] <= xram_data_in;
			end
		endcase
	end
end

endmodule