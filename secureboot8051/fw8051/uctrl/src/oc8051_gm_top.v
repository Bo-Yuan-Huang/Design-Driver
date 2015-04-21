//////////////////////////////////////////////////////////////////////
//// OC8051 formal verification top module                      //////
//////////////////////////////////////////////////////////////////////

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

`include "oc8051_defines.v"


module oc8051_gm_top(
    clk,
    rst,
    word_in,
`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    p0_in,             // port 0 input
 `endif
 `ifdef OC8051_PORT1
    p1_in,             // port 1 input
 `endif
 `ifdef OC8051_PORT2
    p2_in,             // port 2 input
 `endif
 `ifdef OC8051_PORT3
    p3_in,             // port 3 input
 `endif
`endif
`ifdef OC8051_UART
    rxd_i,            // receive
`endif

`ifdef OC8051_TC01
    t0_i,             // counter 0 input
    t1_i,             // counter 1 input
`endif

`ifdef OC8051_TC2
    t2_i,             // counter 2 input
    t2ex_i,           //
`endif
    property_invalid_pc,
    property_invalid_acc,
    property_invalid_iram
);
    input clk;
    input rst;
    input [127:0] word_in;

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
    input  [7:0]  p0_in;             // port 0 input
    wire [7:0]  p0_out;
 `endif
 `ifdef OC8051_PORT1
    input  [7:0]  p1_in;             // port 1 input
    wire [7:0]  p1_out;
 `endif
 `ifdef OC8051_PORT2
    input  [7:0]  p2_in;             // port 2 input
    wire [7:0]  p2_out;
 `endif
 `ifdef OC8051_PORT3
    input  [7:0]  p3_in;             // port 3 input
    wire [7:0]  p3_out;
 `endif
`endif

`ifdef OC8051_UART
input         rxd_i;            // receive
`endif

`ifdef OC8051_TC01
input         t0_i,             // counter 0 input
              t1_i;             // counter 1 input
`endif

`ifdef OC8051_TC2
input         t2_i,             // counter 2 input
              t2ex_i;           //
`endif


    output property_invalid_pc;
    output property_invalid_acc;
    output property_invalid_iram;

    wire int0 = 0;
    wire int1 = 1;

`ifdef OC8051_UART
    wire        txd_o;            // transnmit
`endif


    wire [7:0] wbd_dat_i = 0;
    wire [31:0] wbi_dat_i = 0;
    wire wbd_ack_i = 0;
    wire wbi_ack_i = 0;
    wire wbd_err_i = 0;
    wire wbi_err_i = 0;

    wire [7:0] data_out_uart, data_out_xram;
    wire wbd_we_o;
    wire wbd_stb_o;
    wire wbd_cyc_o;
    wire wbi_stb_o;
    wire wbi_cyc_o;
    wire [7:0] wbd_dat_o;
    wire [15:0] wbd_adr_o;
    wire [15:0] cxrom_addr;
    wire [31:0] cxrom_data_out;
    wire [15:0] wbi_adr_o;

    reg  first_instr;
    wire inst_finished;
    wire [15:0] pc2, pc1;
    wire [7:0] psw;
    wire [7:0] acc;

    wire [15:0] PC_next;
    wire [7:0] ACC_gm;
    wire [15:0] rd_rom_0_addr, rd_rom_1_addr, rd_rom_2_addr;
    wire [7:0]  rd_rom_0, rd_rom_1, rd_rom_2;
    wire [3:0] rd_iram_addr = word_in[3:0];
    wire [7:0] rd_iram_data;

    oc8051_gm_cxrom oc8051_gm_cxrom_1(
        .clk            (clk),
        .rst            (rst),
        .word_in        (word_in),
        .cxrom_addr     (cxrom_addr),
        .cxrom_data_out (cxrom_data_out),
        .rd_addr_0      (rd_rom_0_addr),
        .rd_addr_1      (rd_rom_1_addr),
        .rd_addr_2      (rd_rom_2_addr),
        .rd_data_0      (rd_rom_0),
        .rd_data_1      (rd_rom_1),
        .rd_data_2      (rd_rom_2)
    );


    oc8051_golden_model oc8051_golden_model_1(
        .clk            (clk),
        .rst            (rst),
        .step           (inst_finished),
        .RD_ROM_0_ADDR  (rd_rom_0_addr),
        .RD_ROM_1_ADDR  (rd_rom_1_addr),
        .RD_ROM_2_ADDR  (rd_rom_2_addr),
        .RD_ROM_0       (rd_rom_0),
        .RD_ROM_1       (rd_rom_1),
        .RD_ROM_2       (rd_rom_2),
        .PC_next        (PC_next),
        .ACC            (ACC_gm),
        .RD_IRAM_ADDR   (rd_iram_addr),
        .RD_IRAM_DATA   (rd_iram_data)
    );

    reg op0_cnst;
    reg inst_finished_r;

    // if we see a non-zero op, property is always valid.
    wire op0_cnst_next = op0_cnst ? (rd_rom_0 < 8'h10) : 0;
    assign property_invalid_pc = op0_cnst && op0_cnst_next && inst_finished && (PC_next != pc2);
    assign property_invalid_acc = op0_cnst && inst_finished_r && (ACC_gm != acc);
    assign property_invalid_iram = op0_cnst && inst_finished_r && (rd_iram_data != iram_rd_data);

    always @(posedge clk) begin
        if (rst) begin
            op0_cnst <= 1;
            inst_finished_r <= 0;
        end
        else begin
            op0_cnst <= op0_cnst_next;
            inst_finished_r <= inst_finished;
        end
    end


    wire [2047:0] iram_full;
    wire [127:0] iram = iram_full[127:0];
    wire [7:0] iram_data [15:0];
    assign iram_data[0] = iram[7:0];
    assign iram_data[1] = iram[15:8];
    assign iram_data[2] = iram[23:16];
    assign iram_data[3] = iram[31:24];
    assign iram_data[4] = iram[39:32];
    assign iram_data[5] = iram[47:40];
    assign iram_data[6] = iram[55:48];
    assign iram_data[7] = iram[63:56];
    assign iram_data[8] = iram[71:64];
    assign iram_data[9] = iram[79:72];
    assign iram_data[10] = iram[87:80];
    assign iram_data[11] = iram[95:88];
    assign iram_data[12] = iram[103:96];
    assign iram_data[13] = iram[111:104];
    assign iram_data[14] = iram[119:112];
    assign iram_data[15] = iram[127:120];
    wire [7:0] iram_rd_data = iram_data[rd_iram_addr];

    oc8051_top oc8051_top_1(
         .wb_rst_i(rst), .wb_clk_i(clk),
         .int0_i(int0), .int1_i(int1),

         .wbd_dat_i(wbd_dat_i), .wbd_we_o(wbd_we_o), .wbd_dat_o(wbd_dat_o),
         .wbd_adr_o(wbd_adr_o), .wbd_err_i(wbd_err_i),
         .wbd_ack_i(wbd_ack_i), .wbd_stb_o(wbd_stb_o), .wbd_cyc_o(wbd_cyc_o),

         .wbi_adr_o(wbi_adr_o), .wbi_stb_o(wbi_stb_o), .wbi_ack_i(wbi_ack_i),
         .wbi_cyc_o(wbi_cyc_o), .wbi_dat_i(wbi_dat_i), .wbi_err_i(wbi_err_i),

         .cxrom_addr            ( cxrom_addr     ),
         .cxrom_data_out        ( cxrom_data_out ),

         .pc_change             (inst_finished),
         .pc                    (pc2),
         .pc_log                (pc1),
         .psw                   (psw),
         .acc                   (acc),
         .iram                  (iram_full),

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
         .p0_i(p0_in),
         .p0_o(p0_out),
 `endif
 `ifdef OC8051_PORT1
         .p1_i(p1_in),
         .p1_o(p1_out),
 `endif
 `ifdef OC8051_PORT2
         .p2_i(p2_in),
         .p2_o(p2_out),
 `endif
 `ifdef OC8051_PORT3
         .p3_i(p3_in),
         .p3_o(p3_out),
 `endif
`endif


   `ifdef OC8051_UART
         .rxd_i(rxd_i), .txd_o(txd_o),
   `endif

   `ifdef OC8051_TC01
         .t0_i(t0_i), .t1_i(t1_i),
   `endif

   `ifdef OC8051_TC2
         .t2_i(t2_i), .t2ex_i(t2ex_i),
   `endif

         .ea_in(1'b1));

endmodule
