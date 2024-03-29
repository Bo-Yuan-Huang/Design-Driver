//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 alu source 1 select module                             ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   Multiplexer wiht whitch we select data on alu source 1     ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// ver: 1
//

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_alu_src1_sel (sel, immediate, acc, ram, ext, des);
//
// sel          (in)  select signals (from decoder, delayd one clock) [oc8051_decoder.src_sel1 -r]
// immediate    (in)  immediate operand [oc8051_immediate_sel.out1]
// acc          (in)  accomulator [oc8051_acc.data_out]
// ram          (in)  ram input [oc8051_ram_sel.out_data]
// ext          (in)  external ram input [pin]
// des          (out) output (alu sorce 1) [oc8051_alu.src1]
//


input [1:0] sel; input [7:0] immediate, acc, ram, ext;
output [7:0] des;
reg [7:0] des;

always @(sel or immediate or acc or ram or ext)
begin
  case (sel)
    `OC8051_ASS_RAM: des= ram;
    `OC8051_ASS_ACC: des= acc;
    `OC8051_ASS_XRAM: des= ext;
    `OC8051_ASS_IMM: des= immediate;
    default: des= 2'bxx;
  endcase
end

endmodule
