//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 internal ram                                           ////
////                                                              ////
//// Modified to make verification easier.                        ////
//////////////////////////////////////////////////////////////////////

module oc8051_ram_256x8_two_bist (
                     clk,
                     rst,
		     rd_addr,
		     rd_data,
		     rd_en,
		     wr_addr,
		     wr_data,
		     wr_en,
		     wr,
                     iram
		     );


input         clk, 
              wr, 
	      rst,
	      rd_en,
	      wr_en;
input  [7:0]  wr_data;
input  [7:0]  rd_addr,
              wr_addr;
output [7:0]  rd_data;
output [2047:0] iram;

      reg    [7:0]  rd_data;
      //
      // buffer
      reg    [7:0]  buff [15:0];
      
      
      wire [3:0] wr_addr0 = wr_addr[3:0];
      wire [3:0] rd_addr0 = rd_addr[3:0];

      //
      // writing to ram
      integer i;
      always @(posedge clk)
      begin
       if (wr)
          buff[wr_addr0] <= #1 wr_data;
      end
      
      wire [127:0] iram_small;
      genvar j;
      generate for (j=0; j < 16; j = j+1) begin:iramout
        assign iram_small[j*8+7 : j*8] = buff[j];
      end endgenerate
      wire [2047:0] iram = {1920'b0, iram_small};

      //
      // reading from ram
      always @(posedge clk or posedge rst)
      begin
        if (rst) begin
          rd_data <= #1 8'h0;
`ifdef OC8051_SIMULATION
          for(i=0;i < 256;i=i+1) begin
              buff[i] = 0;
          end
`endif
        end
        else if ((wr_addr0==rd_addr0) & wr & rd_en)
          rd_data <= #1 wr_data;
        else if (rd_en)
          rd_data <= #1 buff[rd_addr0];
      end

endmodule
