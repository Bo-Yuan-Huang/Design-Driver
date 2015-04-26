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
    property_invalid_b_reg,
    property_invalid_dpl,
    property_invalid_dph,
    property_invalid_iram,
    property_invalid_p0,
    property_invalid_p1,
    property_invalid_p2,
    property_invalid_p3,
    property_invalid_psw,
    property_invalid_sp
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
    output property_invalid_b_reg;
    output property_invalid_dpl;
    output property_invalid_dph;
    output property_invalid_iram;
    output property_invalid_p0;
    output property_invalid_p1;
    output property_invalid_p2;
    output property_invalid_p3;
    output property_invalid_psw;
    output property_invalid_sp;

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
    wire [7:0] psw_impl;
    wire [7:0] sp_impl;
    wire [7:0] acc_impl, b_reg_impl;
    wire [15:0] dptr_impl;

    wire [15:0] PC_gm_next;
    wire [7:0] ACC_gm;
    wire [7:0] B_gm;
    wire [7:0] DPL_gm, DPH_gm;
    wire [7:0] IE_gm, IE_gm_next;
    wire [7:0] IP_gm, IP_gm_next;
    wire [7:0] P0_gm, P1_gm, P2_gm, P3_gm;
    wire [7:0] PCON_gm, PCON_gm_next;
    wire [7:0] PSW_gm, PSW_gm_next;
    wire [7:0] SBUF_gm, SBUF_gm_next;
    wire [7:0] SCON_gm, SCON_gm_next;
    wire [7:0] SP_gm, SP_gm_next;
    wire [7:0] TCON_gm, TCON_gm_next;
    wire [7:0] TH0_gm, TH0_gm_next;
    wire [7:0] TH1_gm, TH1_gm_next;
    wire [7:0] TL0_gm, TL0_gm_next;
    wire [7:0] TL1_gm, TL1_gm_next;
    wire [7:0] TMOD_gm, TMOD_gm_next;

    wire [15:0] rd_rom_0_addr, rd_rom_1_addr, rd_rom_2_addr;
    wire [7:0]  rd_rom_0, rd_rom_1, rd_rom_2;
    wire [3:0] rd_iram_addr = word_in[3:0];
    wire [7:0] rd_iram_data;

    reg [7:0] p0in_reg, p1in_reg, p2in_reg, p3in_reg;

    wire [7:0] p0in_model = inst_finished ? p0_in : p0in_reg;
    wire [7:0] p1in_model = inst_finished ? p1_in : p1in_reg;
    wire [7:0] p2in_model = inst_finished ? p2_in : p2in_reg;
    wire [7:0] p3in_model = inst_finished ? p3_in : p3in_reg;

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
        .ACC            (ACC_gm),
        .B              (B_gm),
        .DPL            (DPL_gm),
        .DPH            (DPH_gm),
        .IE             (IE_gm),
        .IE_next        (IE_gm_next),
        .IP             (IP_gm),
        .IP_next        (IP_gm_next),
        .P0IN           (p0in_model),
        .P1IN           (p1in_model),
        .P2IN           (p2in_model),
        .P3IN           (p3in_model),
        .P0             (P0_gm),
        .P1             (P1_gm),
        .P2             (P2_gm),
        .P3             (P3_gm),
        .PC_next        (PC_gm_next),
        .PCON_next      (PCON_gm_next),
        .PSW            (PSW_gm),
        .PSW_next       (PSW_gm_next),
        .PCON           (PCON_gm),
        .RD_IRAM_ADDR   (rd_iram_addr),
        .RD_IRAM_DATA   (rd_iram_data),
        .SBUF_next      (SBUF_gm_next),
        .SBUF           (SBUF_gm),
        .SCON_next      (SCON_gm_next),
        .SCON           (SCON_gm),
        .SP             (SP_gm),
        .SP_next        (SP_gm_next),
        .TCON_next      (TCON_gm_next),
        .TCON           (TCON_gm),
        .TH0_next       (TH0_gm_next),
        .TH0            (TH0_gm),
        .TH1_next       (TH1_gm_next),
        .TH1            (TH1_gm),
        .TL0_next       (TL0_gm_next),
        .TL0            (TL0_gm),
        .TL1_next       (TL1_gm_next),
        .TL1            (TL1_gm),
        .TMOD_next      (TMOD_gm_next),
        .TMOD           (TMOD_gm)
    );

    reg op0_cnst;
    reg inst_finished_r;

    // if we see a non-zero op, property is always valid.
    wire regs_zero = 
        SBUF_gm == 8'b0 && SBUF_gm_next == 8'b0 && 
        SCON_gm == 8'b0 && SCON_gm_next == 8'b0 && 
        PCON_gm == 8'b0 && PCON_gm_next == 8'b0 && 
        TCON_gm == 8'h2 && TCON_gm_next == 8'h2 && 
        TL0_gm == 8'b0 && TL0_gm_next == 8'b0 && 
        TL1_gm == 8'b0 && TL1_gm_next == 8'b0 && 
        TH0_gm == 8'b0 && TH0_gm_next == 8'b0 && 
        TH1_gm == 8'b0 && TH1_gm_next == 8'b0 && 
        TMOD_gm == 8'b0 && TMOD_gm_next == 8'b0 && 
        IE_gm == 8'b0 && IE_gm_next == 8'b0 && 
        IP_gm == 8'b0 && IP_gm_next == 8'b0;
        
    wire op0_cnst_next = op0_cnst ? ((rd_rom_0 <= 8'h80) && regs_zero) : 0;
    wire cnst_valid = op0_cnst && op0_cnst_next;

    assign property_invalid_pc = cnst_valid && inst_finished && (PC_gm_next != pc2);
    assign property_invalid_acc = cnst_valid && inst_finished_r && (ACC_gm != acc_impl);
    assign property_invalid_b_reg = cnst_valid & inst_finished_r && (B_gm != b_reg_impl);
    assign property_invalid_dpl = cnst_valid & inst_finished_r && (DPL_gm != dptr_impl[7:0]);
    assign property_invalid_dph = cnst_valid & inst_finished_r && (DPH_gm != dptr_impl[15:8]);
    assign property_invalid_iram = cnst_valid && inst_finished_r && (rd_iram_data != iram_rd_data_impl);
    assign property_invalid_p0 = cnst_valid && inst_finished_r && (P0_gm != p0_out);
    assign property_invalid_p1 = cnst_valid && inst_finished_r && (P1_gm != p1_out);
    assign property_invalid_p2 = cnst_valid && inst_finished_r && (P2_gm != p2_out);
    assign property_invalid_p3 = cnst_valid && inst_finished_r && (P3_gm != p3_out);

    wire property_invalid_psw_1 = cnst_valid && inst_finished && (PSW_gm_next[7:1] != psw_impl[7:1]);
    wire property_invalid_psw_2 = cnst_valid && inst_finished_r && (PSW_gm[7:1] != psw_impl[7:1]);
    reg property_invalid_psw_1_r;
    assign property_invalid_psw = property_invalid_psw_1_r && property_invalid_psw_2;

    wire property_invalid_sp_1 = cnst_valid && inst_finished && (SP_gm_next != sp_impl);
    wire property_invalid_sp_2 = cnst_valid && inst_finished_r && (SP_gm_next != sp_impl);
    reg property_invalid_sp_1_r;
    assign property_invalid_sp = property_invalid_sp_1_r && property_invalid_sp_2;

    always @(posedge clk) begin
        if (rst) begin
            op0_cnst <= 1;
            inst_finished_r <= 0;
            p0in_reg <= 8'b0;
            p1in_reg <= 8'b0;
            p2in_reg <= 8'b0;
            p3in_reg <= 8'b0;
            property_invalid_psw_1_r <= 0;
            property_invalid_sp_1_r <= 0;
        end
        else begin
            op0_cnst <= op0_cnst_next;
            inst_finished_r <= inst_finished;
            property_invalid_psw_1_r <= property_invalid_psw_1;
            property_invalid_sp_1_r <= property_invalid_sp_1;
            if (inst_finished) begin
                p0in_reg <= p0_in;
                p1in_reg <= p1_in;
                p2in_reg <= p2_in;
                p3in_reg <= p3_in;
            end
        end
    end


    wire [2047:0] iram_impl_flat;
    wire [127:0] iram_impl = iram_impl_flat[127:0];
    wire [7:0] iram_impl_data [15:0];
    assign iram_impl_data[0] = iram_impl[7:0];
    assign iram_impl_data[1] = iram_impl[15:8];
    assign iram_impl_data[2] = iram_impl[23:16];
    assign iram_impl_data[3] = iram_impl[31:24];
    assign iram_impl_data[4] = iram_impl[39:32];
    assign iram_impl_data[5] = iram_impl[47:40];
    assign iram_impl_data[6] = iram_impl[55:48];
    assign iram_impl_data[7] = iram_impl[63:56];
    assign iram_impl_data[8] = iram_impl[71:64];
    assign iram_impl_data[9] = iram_impl[79:72];
    assign iram_impl_data[10] = iram_impl[87:80];
    assign iram_impl_data[11] = iram_impl[95:88];
    assign iram_impl_data[12] = iram_impl[103:96];
    assign iram_impl_data[13] = iram_impl[111:104];
    assign iram_impl_data[14] = iram_impl[119:112];
    assign iram_impl_data[15] = iram_impl[127:120];
    wire [7:0] iram_rd_data_impl = iram_impl_data[rd_iram_addr];
    wire [7:0] ie_impl;

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
         .psw                   (psw_impl),
         .sp                    (sp_impl),
         .acc                   (acc_impl),
         .b_reg                 (b_reg_impl),
         .dptr                  (dptr_impl),
         .iram                  (iram_impl_flat),
         .ie                    (ie_impl),

`ifdef OC8051_PORTS
 `ifdef OC8051_PORT0
         .p0_i(p0in_model),
         .p0_o(p0_out),
 `endif
 `ifdef OC8051_PORT1
         .p1_i(p1in_model),
         .p1_o(p1_out),
 `endif
 `ifdef OC8051_PORT2
         .p2_i(p2in_model),
         .p2_o(p2_out),
 `endif
 `ifdef OC8051_PORT3
         .p3_i(p3in_model),
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
