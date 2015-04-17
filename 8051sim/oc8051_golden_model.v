module oc8051_golden_model(
  clk,
  rst,
  step,
  ACC,
  ACC_next,
  PCON,
  PCON_next,
  B,
  B_next,
  TMOD,
  TMOD_next,
  DPL,
  DPL_next,
  DPH,
  DPH_next,
  TL1,
  TL1_next,
  TL0,
  TL0_next,
  TCON,
  TCON_next,
  TH1,
  TH1_next,
  TH0,
  TH0_next,
  PC,
  PC_next,
  P2,
  P2_next,
  P3,
  P3_next,
  P0,
  P0_next,
  P1,
  P1_next,
  IP,
  IP_next,
  IE,
  IE_next,
  SCON,
  SCON_next,
  SP,
  SP_next,
  SBUF,
  SBUF_next,
  PSW,
  PSW_next
);
output [7:0] ACC;
output [7:0] ACC_next;
output [7:0] PCON;
output [7:0] PCON_next;
output [7:0] B;
output [7:0] B_next;
output [7:0] TMOD;
output [7:0] TMOD_next;
output [7:0] DPL;
output [7:0] DPL_next;
output [7:0] DPH;
output [7:0] DPH_next;
output [7:0] TL1;
output [7:0] TL1_next;
output [7:0] TL0;
output [7:0] TL0_next;
output [7:0] TCON;
output [7:0] TCON_next;
output [7:0] TH1;
output [7:0] TH1_next;
output [7:0] TH0;
output [7:0] TH0_next;
output [15:0] PC;
output [15:0] PC_next;
output [7:0] P2;
output [7:0] P2_next;
output [7:0] P3;
output [7:0] P3_next;
output [7:0] P0;
output [7:0] P0_next;
output [7:0] P1;
output [7:0] P1_next;
output [7:0] IP;
output [7:0] IP_next;
output [7:0] IE;
output [7:0] IE_next;
output [7:0] SCON;
output [7:0] SCON_next;
output [7:0] SP;
output [7:0] SP_next;
output [7:0] SBUF;
output [7:0] SBUF_next;
output [7:0] PSW;
output [7:0] PSW_next;

input clk, rst, step;
reg [7:0] ACC;
reg [7:0] B;
reg [7:0] DPH;
reg [7:0] DPL;
reg [7:0] IE;
reg [7:0] IP;
reg [7:0] P0;
reg [7:0] P1;
reg [7:0] P2;
reg [7:0] P3;
reg [15:0] PC;
reg [7:0] PCON;
reg [7:0] PSW;
reg [7:0] SBUF;
reg [7:0] SCON;
reg [7:0] SP;
reg [7:0] TCON;
reg [7:0] TH0;
reg [7:0] TH1;
reg [7:0] TL0;
reg [7:0] TL1;
reg [7:0] TMOD;
reg [7:0] _IRAM_RD0_;
reg [7:0] _IRAM_RD1_;
reg [7:0] _ROM_RD0_;

wire [7:0] ACC_03;
wire [7:0] ACC_04;
wire [7:0] ACC_05;
wire [7:0] ACC_10;
wire [7:0] ACC_13;
wire [7:0] ACC_14;
wire [7:0] ACC_15;
wire [7:0] ACC_23;
wire [7:0] ACC_24;
wire [7:0] ACC_25;
wire [7:0] ACC_26;
wire [7:0] ACC_27;
wire [7:0] ACC_28;
wire [7:0] ACC_29;
wire [7:0] ACC_2a;
wire [7:0] ACC_2b;
wire [7:0] ACC_2c;
wire [7:0] ACC_2d;
wire [7:0] ACC_2e;
wire [7:0] ACC_2f;
wire [7:0] ACC_33;
wire [7:0] ACC_34;
wire [7:0] ACC_35;
wire [7:0] ACC_36;
wire [7:0] ACC_37;
wire [7:0] ACC_38;
wire [7:0] ACC_39;
wire [7:0] ACC_3a;
wire [7:0] ACC_3b;
wire [7:0] ACC_3c;
wire [7:0] ACC_3d;
wire [7:0] ACC_3e;
wire [7:0] ACC_3f;
wire [7:0] ACC_43;
wire [7:0] ACC_44;
wire [7:0] ACC_45;
wire [7:0] ACC_46;
wire [7:0] ACC_47;
wire [7:0] ACC_48;
wire [7:0] ACC_49;
wire [7:0] ACC_4a;
wire [7:0] ACC_4b;
wire [7:0] ACC_4c;
wire [7:0] ACC_4d;
wire [7:0] ACC_4e;
wire [7:0] ACC_4f;
wire [7:0] ACC_53;
wire [7:0] ACC_54;
wire [7:0] ACC_55;
wire [7:0] ACC_56;
wire [7:0] ACC_57;
wire [7:0] ACC_58;
wire [7:0] ACC_59;
wire [7:0] ACC_5a;
wire [7:0] ACC_5b;
wire [7:0] ACC_5c;
wire [7:0] ACC_5d;
wire [7:0] ACC_5e;
wire [7:0] ACC_5f;
wire [7:0] ACC_62;
wire [7:0] ACC_63;
wire [7:0] ACC_64;
wire [7:0] ACC_65;
wire [7:0] ACC_66;
wire [7:0] ACC_67;
wire [7:0] ACC_68;
wire [7:0] ACC_69;
wire [7:0] ACC_6a;
wire [7:0] ACC_6b;
wire [7:0] ACC_6c;
wire [7:0] ACC_6d;
wire [7:0] ACC_6e;
wire [7:0] ACC_6f;
wire [7:0] ACC_74;
wire [7:0] ACC_75;
wire [7:0] ACC_83;
wire [7:0] ACC_84;
wire [7:0] ACC_85;
wire [7:0] ACC_86;
wire [7:0] ACC_87;
wire [7:0] ACC_88;
wire [7:0] ACC_89;
wire [7:0] ACC_8a;
wire [7:0] ACC_8b;
wire [7:0] ACC_8c;
wire [7:0] ACC_8d;
wire [7:0] ACC_8e;
wire [7:0] ACC_8f;
wire [7:0] ACC_92;
wire [7:0] ACC_93;
wire [7:0] ACC_94;
wire [7:0] ACC_95;
wire [7:0] ACC_96;
wire [7:0] ACC_97;
wire [7:0] ACC_98;
wire [7:0] ACC_99;
wire [7:0] ACC_9a;
wire [7:0] ACC_9b;
wire [7:0] ACC_9c;
wire [7:0] ACC_9d;
wire [7:0] ACC_9e;
wire [7:0] ACC_9f;
wire [7:0] ACC_a4;
wire [7:0] ACC_b2;
wire [7:0] ACC_c2;
wire [7:0] ACC_c4;
wire [7:0] ACC_c5;
wire [7:0] ACC_c6;
wire [7:0] ACC_c7;
wire [7:0] ACC_c8;
wire [7:0] ACC_c9;
wire [7:0] ACC_ca;
wire [7:0] ACC_cb;
wire [7:0] ACC_cc;
wire [7:0] ACC_cd;
wire [7:0] ACC_ce;
wire [7:0] ACC_cf;
wire [7:0] ACC_d0;
wire [7:0] ACC_d2;
wire [7:0] ACC_d4;
wire [7:0] ACC_d5;
wire [7:0] ACC_d6;
wire [7:0] ACC_d7;
wire [7:0] ACC_e4;
wire [7:0] ACC_e5;
wire [7:0] ACC_e6;
wire [7:0] ACC_e7;
wire [7:0] ACC_e8;
wire [7:0] ACC_e9;
wire [7:0] ACC_ea;
wire [7:0] ACC_eb;
wire [7:0] ACC_ec;
wire [7:0] ACC_ed;
wire [7:0] ACC_ee;
wire [7:0] ACC_ef;
wire [7:0] ACC_f4;
wire [7:0] ACC_next;
wire [7:0] B_05;
wire [7:0] B_10;
wire [7:0] B_15;
wire [7:0] B_42;
wire [7:0] B_43;
wire [7:0] B_52;
wire [7:0] B_53;
wire [7:0] B_62;
wire [7:0] B_63;
wire [7:0] B_75;
wire [7:0] B_84;
wire [7:0] B_85;
wire [7:0] B_86;
wire [7:0] B_87;
wire [7:0] B_88;
wire [7:0] B_89;
wire [7:0] B_8a;
wire [7:0] B_8b;
wire [7:0] B_8c;
wire [7:0] B_8d;
wire [7:0] B_8e;
wire [7:0] B_8f;
wire [7:0] B_92;
wire [7:0] B_a4;
wire [7:0] B_b2;
wire [7:0] B_c2;
wire [7:0] B_c5;
wire [7:0] B_d0;
wire [7:0] B_d2;
wire [7:0] B_d5;
wire [7:0] B_f5;
wire [7:0] B_next;
wire [7:0] DPH_05;
wire [7:0] DPH_15;
wire [7:0] DPH_42;
wire [7:0] DPH_43;
wire [7:0] DPH_52;
wire [7:0] DPH_53;
wire [7:0] DPH_62;
wire [7:0] DPH_63;
wire [7:0] DPH_75;
wire [7:0] DPH_85;
wire [7:0] DPH_86;
wire [7:0] DPH_87;
wire [7:0] DPH_88;
wire [7:0] DPH_89;
wire [7:0] DPH_8a;
wire [7:0] DPH_8b;
wire [7:0] DPH_8c;
wire [7:0] DPH_8d;
wire [7:0] DPH_8e;
wire [7:0] DPH_8f;
wire [7:0] DPH_90;
wire [7:0] DPH_a3;
wire [7:0] DPH_c5;
wire [7:0] DPH_d0;
wire [7:0] DPH_d5;
wire [7:0] DPH_f5;
wire [7:0] DPH_next;
wire [7:0] DPL_05;
wire [7:0] DPL_15;
wire [7:0] DPL_42;
wire [7:0] DPL_43;
wire [7:0] DPL_52;
wire [7:0] DPL_53;
wire [7:0] DPL_62;
wire [7:0] DPL_63;
wire [7:0] DPL_75;
wire [7:0] DPL_85;
wire [7:0] DPL_86;
wire [7:0] DPL_87;
wire [7:0] DPL_88;
wire [7:0] DPL_89;
wire [7:0] DPL_8a;
wire [7:0] DPL_8b;
wire [7:0] DPL_8c;
wire [7:0] DPL_8d;
wire [7:0] DPL_8e;
wire [7:0] DPL_8f;
wire [7:0] DPL_90;
wire [7:0] DPL_a3;
wire [7:0] DPL_c5;
wire [7:0] DPL_d0;
wire [7:0] DPL_d5;
wire [7:0] DPL_f5;
wire [7:0] DPL_next;
wire [7:0] IE_05;
wire [7:0] IE_10;
wire [7:0] IE_15;
wire [7:0] IE_42;
wire [7:0] IE_43;
wire [7:0] IE_52;
wire [7:0] IE_53;
wire [7:0] IE_62;
wire [7:0] IE_63;
wire [7:0] IE_75;
wire [7:0] IE_85;
wire [7:0] IE_86;
wire [7:0] IE_87;
wire [7:0] IE_88;
wire [7:0] IE_89;
wire [7:0] IE_8a;
wire [7:0] IE_8b;
wire [7:0] IE_8c;
wire [7:0] IE_8d;
wire [7:0] IE_8e;
wire [7:0] IE_8f;
wire [7:0] IE_92;
wire [7:0] IE_b2;
wire [7:0] IE_c2;
wire [7:0] IE_c5;
wire [7:0] IE_d0;
wire [7:0] IE_d2;
wire [7:0] IE_d5;
wire [7:0] IE_f5;
wire [7:0] IE_next;
wire [7:0] IP_05;
wire [7:0] IP_10;
wire [7:0] IP_15;
wire [7:0] IP_42;
wire [7:0] IP_43;
wire [7:0] IP_52;
wire [7:0] IP_53;
wire [7:0] IP_62;
wire [7:0] IP_63;
wire [7:0] IP_75;
wire [7:0] IP_85;
wire [7:0] IP_86;
wire [7:0] IP_87;
wire [7:0] IP_88;
wire [7:0] IP_89;
wire [7:0] IP_8a;
wire [7:0] IP_8b;
wire [7:0] IP_8c;
wire [7:0] IP_8d;
wire [7:0] IP_8e;
wire [7:0] IP_8f;
wire [7:0] IP_92;
wire [7:0] IP_b2;
wire [7:0] IP_c2;
wire [7:0] IP_c5;
wire [7:0] IP_d0;
wire [7:0] IP_d2;
wire [7:0] IP_d5;
wire [7:0] IP_f5;
wire [7:0] IP_next;
wire [7:0] P0_05;
wire [7:0] P0_10;
wire [7:0] P0_15;
wire [7:0] P0_42;
wire [7:0] P0_43;
wire [7:0] P0_52;
wire [7:0] P0_53;
wire [7:0] P0_62;
wire [7:0] P0_63;
wire [7:0] P0_75;
wire [7:0] P0_85;
wire [7:0] P0_86;
wire [7:0] P0_87;
wire [7:0] P0_88;
wire [7:0] P0_89;
wire [7:0] P0_8a;
wire [7:0] P0_8b;
wire [7:0] P0_8c;
wire [7:0] P0_8d;
wire [7:0] P0_8e;
wire [7:0] P0_8f;
wire [7:0] P0_92;
wire [7:0] P0_b2;
wire [7:0] P0_c2;
wire [7:0] P0_c5;
wire [7:0] P0_d0;
wire [7:0] P0_d2;
wire [7:0] P0_d5;
wire [7:0] P0_f5;
wire [7:0] P0_next;
wire [7:0] P1_05;
wire [7:0] P1_10;
wire [7:0] P1_15;
wire [7:0] P1_42;
wire [7:0] P1_43;
wire [7:0] P1_52;
wire [7:0] P1_53;
wire [7:0] P1_62;
wire [7:0] P1_63;
wire [7:0] P1_75;
wire [7:0] P1_85;
wire [7:0] P1_86;
wire [7:0] P1_87;
wire [7:0] P1_88;
wire [7:0] P1_89;
wire [7:0] P1_8a;
wire [7:0] P1_8b;
wire [7:0] P1_8c;
wire [7:0] P1_8d;
wire [7:0] P1_8e;
wire [7:0] P1_8f;
wire [7:0] P1_92;
wire [7:0] P1_b2;
wire [7:0] P1_c2;
wire [7:0] P1_c5;
wire [7:0] P1_d0;
wire [7:0] P1_d2;
wire [7:0] P1_d5;
wire [7:0] P1_f5;
wire [7:0] P1_next;
wire [7:0] P2_05;
wire [7:0] P2_10;
wire [7:0] P2_15;
wire [7:0] P2_42;
wire [7:0] P2_43;
wire [7:0] P2_52;
wire [7:0] P2_53;
wire [7:0] P2_62;
wire [7:0] P2_63;
wire [7:0] P2_75;
wire [7:0] P2_85;
wire [7:0] P2_86;
wire [7:0] P2_87;
wire [7:0] P2_88;
wire [7:0] P2_89;
wire [7:0] P2_8a;
wire [7:0] P2_8b;
wire [7:0] P2_8c;
wire [7:0] P2_8d;
wire [7:0] P2_8e;
wire [7:0] P2_8f;
wire [7:0] P2_92;
wire [7:0] P2_b2;
wire [7:0] P2_c2;
wire [7:0] P2_c5;
wire [7:0] P2_d0;
wire [7:0] P2_d2;
wire [7:0] P2_d5;
wire [7:0] P2_f5;
wire [7:0] P2_next;
wire [7:0] P3_05;
wire [7:0] P3_10;
wire [7:0] P3_15;
wire [7:0] P3_42;
wire [7:0] P3_43;
wire [7:0] P3_52;
wire [7:0] P3_53;
wire [7:0] P3_62;
wire [7:0] P3_63;
wire [7:0] P3_75;
wire [7:0] P3_85;
wire [7:0] P3_86;
wire [7:0] P3_87;
wire [7:0] P3_88;
wire [7:0] P3_89;
wire [7:0] P3_8a;
wire [7:0] P3_8b;
wire [7:0] P3_8c;
wire [7:0] P3_8d;
wire [7:0] P3_8e;
wire [7:0] P3_8f;
wire [7:0] P3_92;
wire [7:0] P3_ad;
wire [7:0] P3_b2;
wire [7:0] P3_c2;
wire [7:0] P3_c5;
wire [7:0] P3_d0;
wire [7:0] P3_d2;
wire [7:0] P3_d5;
wire [7:0] P3_f5;
wire [7:0] P3_next;
wire [7:0] PCON_05;
wire [7:0] PCON_15;
wire [7:0] PCON_42;
wire [7:0] PCON_43;
wire [7:0] PCON_52;
wire [7:0] PCON_53;
wire [7:0] PCON_62;
wire [7:0] PCON_63;
wire [7:0] PCON_75;
wire [7:0] PCON_85;
wire [7:0] PCON_86;
wire [7:0] PCON_87;
wire [7:0] PCON_88;
wire [7:0] PCON_89;
wire [7:0] PCON_8a;
wire [7:0] PCON_8b;
wire [7:0] PCON_8c;
wire [7:0] PCON_8d;
wire [7:0] PCON_8e;
wire [7:0] PCON_8f;
wire [7:0] PCON_c5;
wire [7:0] PCON_d0;
wire [7:0] PCON_d5;
wire [7:0] PCON_f5;
wire [7:0] PCON_next;
wire [15:0] PC_00;
wire [15:0] PC_01;
wire [15:0] PC_02;
wire [15:0] PC_03;
wire [15:0] PC_04;
wire [15:0] PC_05;
wire [15:0] PC_06;
wire [15:0] PC_07;
wire [15:0] PC_08;
wire [15:0] PC_09;
wire [15:0] PC_0a;
wire [15:0] PC_0b;
wire [15:0] PC_0c;
wire [15:0] PC_0d;
wire [15:0] PC_0e;
wire [15:0] PC_0f;
wire [15:0] PC_10;
wire [15:0] PC_11;
wire [15:0] PC_12;
wire [15:0] PC_13;
wire [15:0] PC_14;
wire [15:0] PC_15;
wire [15:0] PC_16;
wire [15:0] PC_17;
wire [15:0] PC_18;
wire [15:0] PC_19;
wire [15:0] PC_1a;
wire [15:0] PC_1b;
wire [15:0] PC_1c;
wire [15:0] PC_1d;
wire [15:0] PC_1e;
wire [15:0] PC_1f;
wire [15:0] PC_20;
wire [15:0] PC_21;
wire [15:0] PC_22;
wire [15:0] PC_23;
wire [15:0] PC_24;
wire [15:0] PC_25;
wire [15:0] PC_26;
wire [15:0] PC_27;
wire [15:0] PC_28;
wire [15:0] PC_29;
wire [15:0] PC_2a;
wire [15:0] PC_2b;
wire [15:0] PC_2c;
wire [15:0] PC_2d;
wire [15:0] PC_2e;
wire [15:0] PC_2f;
wire [15:0] PC_30;
wire [15:0] PC_31;
wire [15:0] PC_32;
wire [15:0] PC_33;
wire [15:0] PC_34;
wire [15:0] PC_35;
wire [15:0] PC_36;
wire [15:0] PC_37;
wire [15:0] PC_38;
wire [15:0] PC_39;
wire [15:0] PC_3a;
wire [15:0] PC_3b;
wire [15:0] PC_3c;
wire [15:0] PC_3d;
wire [15:0] PC_3e;
wire [15:0] PC_3f;
wire [15:0] PC_40;
wire [15:0] PC_41;
wire [15:0] PC_42;
wire [15:0] PC_43;
wire [15:0] PC_44;
wire [15:0] PC_45;
wire [15:0] PC_46;
wire [15:0] PC_47;
wire [15:0] PC_48;
wire [15:0] PC_49;
wire [15:0] PC_4a;
wire [15:0] PC_4b;
wire [15:0] PC_4c;
wire [15:0] PC_4d;
wire [15:0] PC_4e;
wire [15:0] PC_4f;
wire [15:0] PC_50;
wire [15:0] PC_51;
wire [15:0] PC_52;
wire [15:0] PC_53;
wire [15:0] PC_54;
wire [15:0] PC_55;
wire [15:0] PC_56;
wire [15:0] PC_57;
wire [15:0] PC_58;
wire [15:0] PC_59;
wire [15:0] PC_5a;
wire [15:0] PC_5b;
wire [15:0] PC_5c;
wire [15:0] PC_5d;
wire [15:0] PC_5e;
wire [15:0] PC_5f;
wire [15:0] PC_60;
wire [15:0] PC_61;
wire [15:0] PC_62;
wire [15:0] PC_63;
wire [15:0] PC_64;
wire [15:0] PC_65;
wire [15:0] PC_66;
wire [15:0] PC_67;
wire [15:0] PC_68;
wire [15:0] PC_69;
wire [15:0] PC_6a;
wire [15:0] PC_6b;
wire [15:0] PC_6c;
wire [15:0] PC_6d;
wire [15:0] PC_6e;
wire [15:0] PC_6f;
wire [15:0] PC_70;
wire [15:0] PC_71;
wire [15:0] PC_72;
wire [15:0] PC_73;
wire [15:0] PC_74;
wire [15:0] PC_75;
wire [15:0] PC_76;
wire [15:0] PC_77;
wire [15:0] PC_78;
wire [15:0] PC_79;
wire [15:0] PC_7a;
wire [15:0] PC_7b;
wire [15:0] PC_7c;
wire [15:0] PC_7d;
wire [15:0] PC_7e;
wire [15:0] PC_7f;
wire [15:0] PC_80;
wire [15:0] PC_81;
wire [15:0] PC_82;
wire [15:0] PC_83;
wire [15:0] PC_84;
wire [15:0] PC_85;
wire [15:0] PC_86;
wire [15:0] PC_87;
wire [15:0] PC_88;
wire [15:0] PC_89;
wire [15:0] PC_8a;
wire [15:0] PC_8b;
wire [15:0] PC_8c;
wire [15:0] PC_8d;
wire [15:0] PC_8e;
wire [15:0] PC_8f;
wire [15:0] PC_90;
wire [15:0] PC_91;
wire [15:0] PC_92;
wire [15:0] PC_93;
wire [15:0] PC_94;
wire [15:0] PC_95;
wire [15:0] PC_96;
wire [15:0] PC_97;
wire [15:0] PC_98;
wire [15:0] PC_99;
wire [15:0] PC_9a;
wire [15:0] PC_9b;
wire [15:0] PC_9c;
wire [15:0] PC_9d;
wire [15:0] PC_9e;
wire [15:0] PC_9f;
wire [15:0] PC_a0;
wire [15:0] PC_a1;
wire [15:0] PC_a2;
wire [15:0] PC_a3;
wire [15:0] PC_a4;
wire [15:0] PC_a5;
wire [15:0] PC_a6;
wire [15:0] PC_a7;
wire [15:0] PC_a8;
wire [15:0] PC_a9;
wire [15:0] PC_aa;
wire [15:0] PC_ab;
wire [15:0] PC_ac;
wire [15:0] PC_ad;
wire [15:0] PC_ae;
wire [15:0] PC_af;
wire [15:0] PC_b0;
wire [15:0] PC_b1;
wire [15:0] PC_b2;
wire [15:0] PC_b3;
wire [15:0] PC_b4;
wire [15:0] PC_b5;
wire [15:0] PC_b6;
wire [15:0] PC_b7;
wire [15:0] PC_b8;
wire [15:0] PC_b9;
wire [15:0] PC_ba;
wire [15:0] PC_bb;
wire [15:0] PC_bc;
wire [15:0] PC_bd;
wire [15:0] PC_be;
wire [15:0] PC_bf;
wire [15:0] PC_c0;
wire [15:0] PC_c1;
wire [15:0] PC_c2;
wire [15:0] PC_c3;
wire [15:0] PC_c4;
wire [15:0] PC_c5;
wire [15:0] PC_c6;
wire [15:0] PC_c7;
wire [15:0] PC_c8;
wire [15:0] PC_c9;
wire [15:0] PC_ca;
wire [15:0] PC_cb;
wire [15:0] PC_cc;
wire [15:0] PC_cd;
wire [15:0] PC_ce;
wire [15:0] PC_cf;
wire [15:0] PC_d0;
wire [15:0] PC_d1;
wire [15:0] PC_d2;
wire [15:0] PC_d3;
wire [15:0] PC_d4;
wire [15:0] PC_d5;
wire [15:0] PC_d6;
wire [15:0] PC_d7;
wire [15:0] PC_d8;
wire [15:0] PC_d9;
wire [15:0] PC_da;
wire [15:0] PC_db;
wire [15:0] PC_dc;
wire [15:0] PC_dd;
wire [15:0] PC_de;
wire [15:0] PC_df;
wire [15:0] PC_e1;
wire [15:0] PC_e4;
wire [15:0] PC_e5;
wire [15:0] PC_e6;
wire [15:0] PC_e7;
wire [15:0] PC_e8;
wire [15:0] PC_e9;
wire [15:0] PC_ea;
wire [15:0] PC_eb;
wire [15:0] PC_ec;
wire [15:0] PC_ed;
wire [15:0] PC_ee;
wire [15:0] PC_ef;
wire [15:0] PC_f1;
wire [15:0] PC_f4;
wire [15:0] PC_f5;
wire [15:0] PC_f6;
wire [15:0] PC_f7;
wire [15:0] PC_f8;
wire [15:0] PC_f9;
wire [15:0] PC_fa;
wire [15:0] PC_fb;
wire [15:0] PC_fc;
wire [15:0] PC_fd;
wire [15:0] PC_fe;
wire [15:0] PC_ff;
wire [15:0] PC_next;
wire [7:0] PSW_05;
wire [7:0] PSW_10;
wire [7:0] PSW_13;
wire [7:0] PSW_15;
wire [7:0] PSW_24;
wire [7:0] PSW_25;
wire [7:0] PSW_26;
wire [7:0] PSW_27;
wire [7:0] PSW_28;
wire [7:0] PSW_29;
wire [7:0] PSW_2a;
wire [7:0] PSW_2b;
wire [7:0] PSW_2c;
wire [7:0] PSW_2d;
wire [7:0] PSW_2e;
wire [7:0] PSW_2f;
wire [7:0] PSW_33;
wire [7:0] PSW_34;
wire [7:0] PSW_35;
wire [7:0] PSW_36;
wire [7:0] PSW_37;
wire [7:0] PSW_38;
wire [7:0] PSW_39;
wire [7:0] PSW_3a;
wire [7:0] PSW_3b;
wire [7:0] PSW_3c;
wire [7:0] PSW_3d;
wire [7:0] PSW_3e;
wire [7:0] PSW_3f;
wire [7:0] PSW_42;
wire [7:0] PSW_43;
wire [7:0] PSW_52;
wire [7:0] PSW_53;
wire [7:0] PSW_62;
wire [7:0] PSW_63;
wire [7:0] PSW_72;
wire [7:0] PSW_75;
wire [7:0] PSW_82;
wire [7:0] PSW_84;
wire [7:0] PSW_85;
wire [7:0] PSW_86;
wire [7:0] PSW_87;
wire [7:0] PSW_88;
wire [7:0] PSW_89;
wire [7:0] PSW_8a;
wire [7:0] PSW_8b;
wire [7:0] PSW_8c;
wire [7:0] PSW_8d;
wire [7:0] PSW_8e;
wire [7:0] PSW_8f;
wire [7:0] PSW_92;
wire [7:0] PSW_94;
wire [7:0] PSW_95;
wire [7:0] PSW_96;
wire [7:0] PSW_97;
wire [7:0] PSW_98;
wire [7:0] PSW_99;
wire [7:0] PSW_9a;
wire [7:0] PSW_9b;
wire [7:0] PSW_9c;
wire [7:0] PSW_9d;
wire [7:0] PSW_9e;
wire [7:0] PSW_9f;
wire [7:0] PSW_a0;
wire [7:0] PSW_a2;
wire [7:0] PSW_a4;
wire [7:0] PSW_b0;
wire [7:0] PSW_b2;
wire [7:0] PSW_b3;
wire [7:0] PSW_b4;
wire [7:0] PSW_b5;
wire [7:0] PSW_b6;
wire [7:0] PSW_b7;
wire [7:0] PSW_b8;
wire [7:0] PSW_b9;
wire [7:0] PSW_ba;
wire [7:0] PSW_bb;
wire [7:0] PSW_bc;
wire [7:0] PSW_bd;
wire [7:0] PSW_be;
wire [7:0] PSW_bf;
wire [7:0] PSW_c2;
wire [7:0] PSW_c3;
wire [7:0] PSW_c5;
wire [7:0] PSW_d0;
wire [7:0] PSW_d2;
wire [7:0] PSW_d3;
wire [7:0] PSW_d4;
wire [7:0] PSW_d5;
wire [7:0] PSW_f5;
wire [7:0] PSW_next;
wire [7:0] SBUF_05;
wire [7:0] SBUF_15;
wire [7:0] SBUF_42;
wire [7:0] SBUF_43;
wire [7:0] SBUF_52;
wire [7:0] SBUF_53;
wire [7:0] SBUF_62;
wire [7:0] SBUF_63;
wire [7:0] SBUF_75;
wire [7:0] SBUF_85;
wire [7:0] SBUF_86;
wire [7:0] SBUF_87;
wire [7:0] SBUF_88;
wire [7:0] SBUF_89;
wire [7:0] SBUF_8a;
wire [7:0] SBUF_8b;
wire [7:0] SBUF_8c;
wire [7:0] SBUF_8d;
wire [7:0] SBUF_8e;
wire [7:0] SBUF_8f;
wire [7:0] SBUF_c5;
wire [7:0] SBUF_d0;
wire [7:0] SBUF_d5;
wire [7:0] SBUF_f5;
wire [7:0] SBUF_next;
wire [7:0] SCON_05;
wire [7:0] SCON_10;
wire [7:0] SCON_15;
wire [7:0] SCON_42;
wire [7:0] SCON_43;
wire [7:0] SCON_52;
wire [7:0] SCON_53;
wire [7:0] SCON_62;
wire [7:0] SCON_63;
wire [7:0] SCON_75;
wire [7:0] SCON_85;
wire [7:0] SCON_86;
wire [7:0] SCON_87;
wire [7:0] SCON_88;
wire [7:0] SCON_89;
wire [7:0] SCON_8a;
wire [7:0] SCON_8b;
wire [7:0] SCON_8c;
wire [7:0] SCON_8d;
wire [7:0] SCON_8e;
wire [7:0] SCON_8f;
wire [7:0] SCON_92;
wire [7:0] SCON_b2;
wire [7:0] SCON_c2;
wire [7:0] SCON_c5;
wire [7:0] SCON_d0;
wire [7:0] SCON_d2;
wire [7:0] SCON_d5;
wire [7:0] SCON_f5;
wire [7:0] SCON_next;
wire [7:0] SP_05;
wire [7:0] SP_11;
wire [7:0] SP_12;
wire [7:0] SP_15;
wire [7:0] SP_22;
wire [7:0] SP_31;
wire [7:0] SP_32;
wire [7:0] SP_42;
wire [7:0] SP_43;
wire [7:0] SP_51;
wire [7:0] SP_52;
wire [7:0] SP_53;
wire [7:0] SP_62;
wire [7:0] SP_63;
wire [7:0] SP_71;
wire [7:0] SP_75;
wire [7:0] SP_85;
wire [7:0] SP_86;
wire [7:0] SP_87;
wire [7:0] SP_88;
wire [7:0] SP_89;
wire [7:0] SP_8a;
wire [7:0] SP_8b;
wire [7:0] SP_8c;
wire [7:0] SP_8d;
wire [7:0] SP_8e;
wire [7:0] SP_8f;
wire [7:0] SP_91;
wire [7:0] SP_b1;
wire [7:0] SP_c0;
wire [7:0] SP_c5;
wire [7:0] SP_d0;
wire [7:0] SP_d1;
wire [7:0] SP_d5;
wire [7:0] SP_f1;
wire [7:0] SP_f5;
wire [7:0] SP_next;
wire [7:0] TCON_05;
wire [7:0] TCON_10;
wire [7:0] TCON_15;
wire [7:0] TCON_42;
wire [7:0] TCON_43;
wire [7:0] TCON_52;
wire [7:0] TCON_53;
wire [7:0] TCON_62;
wire [7:0] TCON_63;
wire [7:0] TCON_75;
wire [7:0] TCON_85;
wire [7:0] TCON_86;
wire [7:0] TCON_87;
wire [7:0] TCON_88;
wire [7:0] TCON_89;
wire [7:0] TCON_8a;
wire [7:0] TCON_8b;
wire [7:0] TCON_8c;
wire [7:0] TCON_8d;
wire [7:0] TCON_8e;
wire [7:0] TCON_8f;
wire [7:0] TCON_92;
wire [7:0] TCON_b2;
wire [7:0] TCON_c2;
wire [7:0] TCON_c5;
wire [7:0] TCON_d0;
wire [7:0] TCON_d2;
wire [7:0] TCON_d5;
wire [7:0] TCON_f5;
wire [7:0] TCON_next;
wire [7:0] TH0_05;
wire [7:0] TH0_15;
wire [7:0] TH0_42;
wire [7:0] TH0_43;
wire [7:0] TH0_52;
wire [7:0] TH0_53;
wire [7:0] TH0_62;
wire [7:0] TH0_63;
wire [7:0] TH0_75;
wire [7:0] TH0_85;
wire [7:0] TH0_86;
wire [7:0] TH0_87;
wire [7:0] TH0_88;
wire [7:0] TH0_89;
wire [7:0] TH0_8a;
wire [7:0] TH0_8b;
wire [7:0] TH0_8c;
wire [7:0] TH0_8d;
wire [7:0] TH0_8e;
wire [7:0] TH0_8f;
wire [7:0] TH0_c5;
wire [7:0] TH0_d0;
wire [7:0] TH0_d5;
wire [7:0] TH0_f5;
wire [7:0] TH0_next;
wire [7:0] TH1_05;
wire [7:0] TH1_15;
wire [7:0] TH1_42;
wire [7:0] TH1_43;
wire [7:0] TH1_52;
wire [7:0] TH1_53;
wire [7:0] TH1_62;
wire [7:0] TH1_63;
wire [7:0] TH1_75;
wire [7:0] TH1_85;
wire [7:0] TH1_86;
wire [7:0] TH1_87;
wire [7:0] TH1_88;
wire [7:0] TH1_89;
wire [7:0] TH1_8a;
wire [7:0] TH1_8b;
wire [7:0] TH1_8c;
wire [7:0] TH1_8d;
wire [7:0] TH1_8e;
wire [7:0] TH1_8f;
wire [7:0] TH1_c5;
wire [7:0] TH1_d0;
wire [7:0] TH1_d5;
wire [7:0] TH1_f5;
wire [7:0] TH1_next;
wire [7:0] TL0_05;
wire [7:0] TL0_15;
wire [7:0] TL0_42;
wire [7:0] TL0_43;
wire [7:0] TL0_52;
wire [7:0] TL0_53;
wire [7:0] TL0_62;
wire [7:0] TL0_63;
wire [7:0] TL0_75;
wire [7:0] TL0_85;
wire [7:0] TL0_86;
wire [7:0] TL0_87;
wire [7:0] TL0_88;
wire [7:0] TL0_89;
wire [7:0] TL0_8a;
wire [7:0] TL0_8b;
wire [7:0] TL0_8c;
wire [7:0] TL0_8d;
wire [7:0] TL0_8e;
wire [7:0] TL0_8f;
wire [7:0] TL0_c5;
wire [7:0] TL0_d0;
wire [7:0] TL0_d5;
wire [7:0] TL0_f5;
wire [7:0] TL0_next;
wire [7:0] TL1_05;
wire [7:0] TL1_15;
wire [7:0] TL1_42;
wire [7:0] TL1_43;
wire [7:0] TL1_52;
wire [7:0] TL1_53;
wire [7:0] TL1_62;
wire [7:0] TL1_63;
wire [7:0] TL1_75;
wire [7:0] TL1_85;
wire [7:0] TL1_86;
wire [7:0] TL1_87;
wire [7:0] TL1_88;
wire [7:0] TL1_89;
wire [7:0] TL1_8a;
wire [7:0] TL1_8b;
wire [7:0] TL1_8c;
wire [7:0] TL1_8d;
wire [7:0] TL1_8e;
wire [7:0] TL1_8f;
wire [7:0] TL1_c5;
wire [7:0] TL1_d0;
wire [7:0] TL1_d5;
wire [7:0] TL1_f5;
wire [7:0] TL1_next;
wire [7:0] TMOD_05;
wire [7:0] TMOD_15;
wire [7:0] TMOD_42;
wire [7:0] TMOD_43;
wire [7:0] TMOD_52;
wire [7:0] TMOD_53;
wire [7:0] TMOD_62;
wire [7:0] TMOD_63;
wire [7:0] TMOD_75;
wire [7:0] TMOD_85;
wire [7:0] TMOD_86;
wire [7:0] TMOD_87;
wire [7:0] TMOD_88;
wire [7:0] TMOD_89;
wire [7:0] TMOD_8a;
wire [7:0] TMOD_8b;
wire [7:0] TMOD_8c;
wire [7:0] TMOD_8d;
wire [7:0] TMOD_8e;
wire [7:0] TMOD_8f;
wire [7:0] TMOD_c5;
wire [7:0] TMOD_d0;
wire [7:0] TMOD_d5;
wire [7:0] TMOD_f5;
wire [7:0] TMOD_next;
wire [7:0] _IRAM_RD0_;
wire [7:0] _IRAM_RD1_;
wire [7:0] _ROM_RD0_;
wire [7:0] _ROM_RD1_;
wire [7:0] _ROM_RD2_;
wire [7:0] n0001;
wire [7:0] n0002;
wire n0003;
wire [7:0] n0004;
wire n0005;
wire [7:0] n0006;
wire n0007;
wire [7:0] n0008;
wire n0009;
wire [7:0] n0010;
wire n0011;
wire [7:0] n0012;
wire n0013;
wire [7:0] n0014;
wire n0015;
wire [7:0] n0016;
wire n0017;
wire [7:0] n0018;
wire n0019;
wire [7:0] n0020;
wire n0021;
wire [7:0] n0022;
wire n0023;
wire [7:0] n0024;
wire n0025;
wire [7:0] n0026;
wire n0027;
wire [7:0] n0028;
wire n0029;
wire [7:0] n0030;
wire n0031;
wire [7:0] n0032;
wire n0033;
wire [7:0] n0034;
wire n0035;
wire [7:0] n0036;
wire n0037;
wire [7:0] n0038;
wire n0039;
wire [7:0] n0040;
wire n0041;
wire [7:0] n0042;
wire n0043;
wire [7:0] n0044;
wire n0045;
wire [7:0] n0046;
wire n0047;
wire [7:0] n0048;
wire n0049;
wire [7:0] n0050;
wire n0051;
wire [7:0] n0052;
wire n0053;
wire [7:0] n0054;
wire n0055;
wire [7:0] n0056;
wire n0057;
wire [7:0] n0058;
wire n0059;
wire n0060;
wire [2:0] n0061;
wire [1:0] n0062;
wire [7:0] n0063;
wire [7:0] n0064;
wire n0065;
wire [7:0] n0066;
wire n0067;
wire [7:0] n0068;
wire n0069;
wire [7:0] n0070;
wire n0071;
wire [7:0] n0072;
wire n0073;
wire [7:0] n0074;
wire n0075;
wire [7:0] n0076;
wire n0077;
wire [7:0] n0078;
wire n0079;
wire [7:0] n0080;
wire n0081;
wire [7:0] n0082;
wire n0083;
wire [7:0] n0084;
wire n0085;
wire [7:0] n0086;
wire n0087;
wire [7:0] n0088;
wire n0089;
wire n0090;
wire [2:0] n0091;
wire [7:0] n0092;
wire [7:0] n0093;
wire n0094;
wire [7:0] n0095;
wire n0096;
wire [7:0] n0097;
wire n0098;
wire [7:0] n0099;
wire n0100;
wire [7:0] n0101;
wire n0102;
wire [7:0] n0103;
wire n0104;
wire [7:0] n0105;
wire n0106;
wire [7:0] n0107;
wire n0108;
wire [7:0] n0109;
wire n0110;
wire [7:0] n0111;
wire n0112;
wire [7:0] n0113;
wire n0114;
wire [7:0] n0115;
wire n0116;
wire n0117;
wire [15:0] n0118;
wire [15:0] n0119;
wire [7:0] n0120;
wire [0:0] n0121;
wire [0:0] n0122;
wire n0123;
wire [4:0] n0124;
wire [7:0] n0125;
wire [7:0] n0126;
wire [7:0] n0127;
wire [7:0] n0128;
wire [7:0] n0129;
wire n0130;
wire [7:0] n0131;
wire n0132;
wire [7:0] n0133;
wire n0134;
wire [7:0] n0135;
wire n0136;
wire [7:0] n0137;
wire n0138;
wire [7:0] n0139;
wire n0140;
wire [7:0] n0141;
wire n0142;
wire [7:0] n0143;
wire n0144;
wire [7:0] n0145;
wire n0146;
wire [7:0] n0147;
wire n0148;
wire [7:0] n0149;
wire n0150;
wire [7:0] n0151;
wire n0152;
wire [7:0] n0153;
wire n0154;
wire n0155;
wire [2:0] n0156;
wire [7:0] n0157;
wire [7:0] n0158;
wire n0159;
wire [7:0] n0160;
wire n0161;
wire [7:0] n0162;
wire n0163;
wire [7:0] n0164;
wire n0165;
wire [7:0] n0166;
wire n0167;
wire [7:0] n0168;
wire n0169;
wire [7:0] n0170;
wire n0171;
wire [7:0] n0172;
wire n0173;
wire [7:0] n0174;
wire n0175;
wire [7:0] n0176;
wire n0177;
wire [7:0] n0178;
wire n0179;
wire [7:0] n0180;
wire n0181;
wire [7:0] n0182;
wire n0183;
wire [7:0] n0184;
wire n0185;
wire [7:0] n0186;
wire n0187;
wire [7:0] n0188;
wire n0189;
wire [7:0] n0190;
wire n0191;
wire [7:0] n0192;
wire n0193;
wire [7:0] n0194;
wire n0195;
wire [7:0] n0196;
wire n0197;
wire [7:0] n0198;
wire n0199;
wire [7:0] n0200;
wire n0201;
wire [7:0] n0202;
wire n0203;
wire [7:0] n0204;
wire n0205;
wire [7:0] n0206;
wire n0207;
wire [7:0] n0208;
wire n0209;
wire [7:0] n0210;
wire n0211;
wire [7:0] n0212;
wire n0213;
wire n0214;
wire [7:0] n0215;
wire n0216;
wire [7:0] n0217;
wire n0218;
wire [7:0] n0219;
wire n0220;
wire [7:0] n0221;
wire n0222;
wire [7:0] n0223;
wire n0224;
wire [7:0] n0225;
wire n0226;
wire [7:0] n0227;
wire n0228;
wire [7:0] n0229;
wire n0230;
wire [7:0] n0231;
wire n0232;
wire [7:0] n0233;
wire n0234;
wire [7:0] n0235;
wire n0236;
wire [7:0] n0237;
wire n0238;
wire [7:0] n0239;
wire n0240;
wire n0241;
wire [2:0] n0242;
wire [7:0] n0243;
wire [7:0] n0244;
wire n0245;
wire [7:0] n0246;
wire n0247;
wire [7:0] n0248;
wire n0249;
wire [7:0] n0250;
wire n0251;
wire [7:0] n0252;
wire n0253;
wire [7:0] n0254;
wire n0255;
wire [7:0] n0256;
wire n0257;
wire [7:0] n0258;
wire n0259;
wire [7:0] n0260;
wire n0261;
wire [7:0] n0262;
wire n0263;
wire [7:0] n0264;
wire n0265;
wire [7:0] n0266;
wire n0267;
wire [7:0] n0268;
wire n0269;
wire n0270;
wire [2:0] n0271;
wire [7:0] n0272;
wire [7:0] n0273;
wire n0274;
wire [7:0] n0275;
wire n0276;
wire [7:0] n0277;
wire n0278;
wire [7:0] n0279;
wire n0280;
wire [7:0] n0281;
wire n0282;
wire [7:0] n0283;
wire n0284;
wire [7:0] n0285;
wire n0286;
wire [7:0] n0287;
wire n0288;
wire [7:0] n0289;
wire n0290;
wire [7:0] n0291;
wire n0292;
wire [7:0] n0293;
wire n0294;
wire [7:0] n0295;
wire n0296;
wire [7:0] n0297;
wire n0298;
wire n0299;
wire [2:0] n0300;
wire [7:0] n0301;
wire [7:0] n0302;
wire n0303;
wire [7:0] n0304;
wire n0305;
wire [7:0] n0306;
wire n0307;
wire [7:0] n0308;
wire n0309;
wire [7:0] n0310;
wire n0311;
wire [7:0] n0312;
wire n0313;
wire [7:0] n0314;
wire n0315;
wire [7:0] n0316;
wire n0317;
wire [7:0] n0318;
wire n0319;
wire [7:0] n0320;
wire n0321;
wire [7:0] n0322;
wire n0323;
wire [7:0] n0324;
wire n0325;
wire [7:0] n0326;
wire n0327;
wire [7:0] n0328;
wire n0329;
wire [7:0] n0330;
wire n0331;
wire [7:0] n0332;
wire n0333;
wire [7:0] n0334;
wire n0335;
wire [7:0] n0336;
wire n0337;
wire [7:0] n0338;
wire n0339;
wire [7:0] n0340;
wire n0341;
wire [7:0] n0342;
wire n0343;
wire [7:0] n0344;
wire n0345;
wire [7:0] n0346;
wire n0347;
wire [7:0] n0348;
wire n0349;
wire [7:0] n0350;
wire n0351;
wire [7:0] n0352;
wire n0353;
wire [7:0] n0354;
wire n0355;
wire [7:0] n0356;
wire n0357;
wire [7:0] n0358;
wire n0359;
wire n0360;
wire [2:0] n0361;
wire [7:0] n0362;
wire [7:0] n0363;
wire n0364;
wire [7:0] n0365;
wire n0366;
wire [7:0] n0367;
wire n0368;
wire n0369;
wire [2:0] n0370;
wire [7:0] n0371;
wire [7:0] n0372;
wire [7:0] n0373;
wire [7:0] n0374;
wire [7:0] n0375;
wire [7:0] n0376;
wire [7:0] n0377;
wire [7:0] n0378;
wire [7:0] n0379;
wire [7:0] n0380;
wire [7:0] n0381;
wire [7:0] n0382;
wire n0383;
wire [7:0] n0384;
wire n0385;
wire [7:0] n0386;
wire n0387;
wire [7:0] n0388;
wire [7:0] n0389;
wire [7:0] n0390;
wire [7:0] n0391;
wire [7:0] n0392;
wire [7:0] n0393;
wire [7:0] n0394;
wire n0395;
wire [15:0] n0396;
wire [15:0] n0397;
wire n0398;
wire [7:0] n0399;
wire n0400;
wire [7:0] n0401;
wire n0402;
wire [7:0] n0403;
wire n0404;
wire [7:0] n0405;
wire n0406;
wire [7:0] n0407;
wire n0408;
wire [7:0] n0409;
wire n0410;
wire [7:0] n0411;
wire n0412;
wire [7:0] n0413;
wire n0414;
wire [7:0] n0415;
wire n0416;
wire [7:0] n0417;
wire n0418;
wire [7:0] n0419;
wire n0420;
wire [7:0] n0421;
wire n0422;
wire [7:0] n0423;
wire n0424;
wire [7:0] n0425;
wire n0426;
wire [7:0] n0427;
wire n0428;
wire n0429;
wire [15:0] n0430;
wire [15:0] n0431;
wire [7:0] n0432;
wire n0433;
wire [15:0] n0434;
wire [15:0] n0435;
wire [15:0] n0436;
wire [15:0] n0437;
wire [15:0] n0438;
wire [7:0] n0439;
wire [7:0] n0440;
wire n0441;
wire [7:0] n0442;
wire n0443;
wire [7:0] n0444;
wire n0445;
wire [7:0] n0446;
wire n0447;
wire [7:0] n0448;
wire n0449;
wire [7:0] n0450;
wire n0451;
wire n0452;
wire [15:0] n0453;
wire [7:0] n0454;
wire [4:0] n0455;
wire [7:0] n0456;
wire [23:0] n0457;
wire [2:0] n0458;
wire [7:0] n0459;
wire [15:0] n0460;
wire [15:0] n0461;
wire [7:0] n0462;
wire [7:0] n0463;
wire [7:0] n0464;
wire n0465;
wire [0:0] n0466;
wire [0:0] n0467;
wire n0468;
wire [7:0] n0469;
wire [7:0] n0470;
wire n0471;
wire n0472;
wire n0473;
wire n0474;
wire n0475;
wire n0476;
wire n0477;
wire n0478;
wire [7:0] n0479;
wire n0480;
wire n0481;
wire n0482;
wire n0483;
wire n0484;
wire n0485;
wire n0486;
wire n0487;
wire n0488;
wire n0489;
wire n0490;
wire [7:0] n0491;
wire n0492;
wire [7:0] n0493;
wire [7:0] n0494;
wire [7:0] n0495;
wire [7:0] n0496;
wire [7:0] n0497;
wire [7:0] n0498;
wire [7:0] n0499;
wire [7:0] n0500;
wire [7:0] n0501;
wire [7:0] n0502;
wire [7:0] n0503;
wire [7:0] n0504;
wire [7:0] n0505;
wire [7:0] n0506;
wire [7:0] n0507;
wire [7:0] n0508;
wire [7:0] n0509;
wire [7:0] n0510;
wire [7:0] n0511;
wire [7:0] n0512;
wire [7:0] n0513;
wire [7:0] n0514;
wire [7:0] n0515;
wire [7:0] n0516;
wire [7:0] n0517;
wire [7:0] n0518;
wire [7:0] n0519;
wire [7:0] n0520;
wire [7:0] n0521;
wire [7:0] n0522;
wire [7:0] n0523;
wire [7:0] n0524;
wire [7:0] n0525;
wire [7:0] n0526;
wire [7:0] n0527;
wire [7:0] n0528;
wire [7:0] n0529;
wire [7:0] n0530;
wire [7:0] n0531;
wire [7:0] n0532;
wire [7:0] n0533;
wire [7:0] n0534;
wire [7:0] n0535;
wire [7:0] n0536;
wire [7:0] n0537;
wire [7:0] n0538;
wire [7:0] n0539;
wire [7:0] n0540;
wire [2:0] n0541;
wire [7:0] n0542;
wire [7:0] n0543;
wire [7:0] n0544;
wire [7:0] n0545;
wire [7:0] n0546;
wire [7:0] n0547;
wire [7:0] n0548;
wire [7:0] n0549;
wire [7:0] n0550;
wire [7:0] n0551;
wire [7:0] n0552;
wire [7:0] n0553;
wire [7:0] n0554;
wire [7:0] n0555;
wire [7:0] n0556;
wire [0:0] n0557;
wire n0558;
wire [15:0] n0559;
wire [15:0] n0560;
wire [15:0] n0561;
wire [15:0] n0562;
wire [15:0] n0563;
wire [7:0] n0564;
wire [7:0] n0565;
wire [7:0] n0566;
wire [7:0] n0567;
wire [7:0] n0568;
wire [7:0] n0569;
wire [7:0] n0570;
wire [7:0] n0571;
wire [2:0] n0572;
wire [15:0] n0573;
wire [7:0] n0574;
wire [7:0] n0575;
wire [7:0] n0576;
wire [7:0] n0577;
wire [7:0] n0578;
wire [7:0] n0579;
wire [7:0] n0580;
wire [0:0] n0581;
wire [8:0] n0582;
wire [8:0] n0583;
wire [7:0] n0584;
wire [0:0] n0585;
wire [0:0] n0586;
wire [2:0] n0587;
wire [0:0] n0588;
wire [1:0] n0589;
wire [7:0] n0590;
wire [7:0] n0591;
wire [7:0] n0592;
wire [7:0] n0593;
wire [7:0] n0594;
wire [7:0] n0595;
wire [7:0] n0596;
wire [7:0] n0597;
wire [7:0] n0598;
wire [7:0] n0599;
wire [7:0] n0600;
wire [7:0] n0601;
wire [7:0] n0602;
wire [7:0] n0603;
wire [7:0] n0604;
wire [7:0] n0605;
wire [7:0] n0606;
wire [7:0] n0607;
wire [7:0] n0608;
wire [7:0] n0609;
wire [7:0] n0610;
wire [7:0] n0611;
wire [7:0] n0612;
wire [7:0] n0613;
wire [7:0] n0614;
wire [7:0] n0615;
wire [7:0] n0616;
wire [7:0] n0617;
wire [15:0] n0618;
wire [7:0] n0619;
wire [7:0] n0620;
wire [7:0] n0621;
wire [8:0] n0622;
wire [8:0] n0623;
wire [8:0] n0624;
wire [8:0] n0625;
wire [8:0] n0626;
wire [0:0] n0627;
wire [3:0] n0628;
wire [4:0] n0629;
wire [3:0] n0630;
wire [4:0] n0631;
wire [4:0] n0632;
wire [4:0] n0633;
wire [4:0] n0634;
wire [0:0] n0635;
wire [8:0] n0636;
wire [8:0] n0637;
wire [8:0] n0638;
wire [8:0] n0639;
wire [0:0] n0640;
wire [0:0] n0641;
wire n0642;
wire n0643;
wire [0:0] n0644;
wire [7:0] n0645;
wire [7:0] n0646;
wire [8:0] n0647;
wire [8:0] n0648;
wire [8:0] n0649;
wire [0:0] n0650;
wire [3:0] n0651;
wire [4:0] n0652;
wire [4:0] n0653;
wire [4:0] n0654;
wire [4:0] n0655;
wire [0:0] n0656;
wire [8:0] n0657;
wire [8:0] n0658;
wire [8:0] n0659;
wire [0:0] n0660;
wire [0:0] n0661;
wire n0662;
wire n0663;
wire [0:0] n0664;
wire [7:0] n0665;
wire [7:0] n0666;
wire [8:0] n0667;
wire [8:0] n0668;
wire [8:0] n0669;
wire [0:0] n0670;
wire [3:0] n0671;
wire [4:0] n0672;
wire [4:0] n0673;
wire [4:0] n0674;
wire [0:0] n0675;
wire [8:0] n0676;
wire [8:0] n0677;
wire [8:0] n0678;
wire [0:0] n0679;
wire [0:0] n0680;
wire n0681;
wire n0682;
wire [0:0] n0683;
wire [7:0] n0684;
wire [8:0] n0685;
wire [8:0] n0686;
wire [8:0] n0687;
wire [0:0] n0688;
wire [8:0] n0689;
wire [8:0] n0690;
wire [0:0] n0691;
wire [0:0] n0692;
wire n0693;
wire n0694;
wire [0:0] n0695;
wire [7:0] n0696;
wire [7:0] n0697;
wire [8:0] n0698;
wire [8:0] n0699;
wire [8:0] n0700;
wire [0:0] n0701;
wire [3:0] n0702;
wire [4:0] n0703;
wire [4:0] n0704;
wire [4:0] n0705;
wire [0:0] n0706;
wire [8:0] n0707;
wire [8:0] n0708;
wire [8:0] n0709;
wire [0:0] n0710;
wire [0:0] n0711;
wire n0712;
wire n0713;
wire [0:0] n0714;
wire [7:0] n0715;
wire [4:0] n0716;
wire [4:0] n0717;
wire [0:0] n0718;
wire [7:0] n0719;
wire [8:0] n0720;
wire [8:0] n0721;
wire [0:0] n0722;
wire [8:0] n0723;
wire [8:0] n0724;
wire [0:0] n0725;
wire [0:0] n0726;
wire n0727;
wire n0728;
wire [0:0] n0729;
wire [7:0] n0730;
wire [7:0] n0731;
wire n0732;
wire [15:0] n0733;
wire [8:0] n0734;
wire [8:0] n0735;
wire [7:0] n0736;
wire [0:0] n0737;
wire [7:0] n0738;
wire [7:0] n0739;
wire [7:0] n0740;
wire [7:0] n0741;
wire [8:0] n0742;
wire [8:0] n0743;
wire [8:0] n0744;
wire [0:0] n0745;
wire [4:0] n0746;
wire [4:0] n0747;
wire [4:0] n0748;
wire [0:0] n0749;
wire [8:0] n0750;
wire [8:0] n0751;
wire [0:0] n0752;
wire [0:0] n0753;
wire n0754;
wire n0755;
wire [0:0] n0756;
wire [7:0] n0757;
wire [7:0] n0758;
wire [7:0] n0759;
wire [8:0] n0760;
wire [8:0] n0761;
wire [0:0] n0762;
wire [4:0] n0763;
wire [4:0] n0764;
wire [0:0] n0765;
wire [8:0] n0766;
wire [8:0] n0767;
wire [0:0] n0768;
wire [0:0] n0769;
wire n0770;
wire n0771;
wire [0:0] n0772;
wire [7:0] n0773;
wire [7:0] n0774;
wire [7:0] n0775;
wire [8:0] n0776;
wire [8:0] n0777;
wire [0:0] n0778;
wire [4:0] n0779;
wire [4:0] n0780;
wire [0:0] n0781;
wire [8:0] n0782;
wire [8:0] n0783;
wire [0:0] n0784;
wire [0:0] n0785;
wire n0786;
wire n0787;
wire [0:0] n0788;
wire [7:0] n0789;
wire [7:0] n0790;
wire [7:0] n0791;
wire [8:0] n0792;
wire [8:0] n0793;
wire [0:0] n0794;
wire [4:0] n0795;
wire [4:0] n0796;
wire [0:0] n0797;
wire [8:0] n0798;
wire [8:0] n0799;
wire [0:0] n0800;
wire [0:0] n0801;
wire n0802;
wire n0803;
wire [0:0] n0804;
wire [7:0] n0805;
wire n0806;
wire [15:0] n0807;
wire [15:0] n0808;
wire [15:0] n0809;
wire [7:0] n0810;
wire [7:0] n0811;
wire [7:0] n0812;
wire [7:0] n0813;
wire [7:0] n0814;
wire [7:0] n0815;
wire [7:0] n0816;
wire [7:0] n0817;
wire [7:0] n0818;
wire [7:0] n0819;
wire [7:0] n0820;
wire [7:0] n0821;
wire [7:0] n0822;
wire [7:0] n0823;
wire [7:0] n0824;
wire [7:0] n0825;
wire [7:0] n0826;
wire [7:0] n0827;
wire [7:0] n0828;
wire [7:0] n0829;
wire [7:0] n0830;
wire [7:0] n0831;
wire [7:0] n0832;
wire [7:0] n0833;
wire [7:0] n0834;
wire [7:0] n0835;
wire [7:0] n0836;
wire [7:0] n0837;
wire [7:0] n0838;
wire [7:0] n0839;
wire [7:0] n0840;
wire [7:0] n0841;
wire [7:0] n0842;
wire [7:0] n0843;
wire [7:0] n0844;
wire [7:0] n0845;
wire [7:0] n0846;
wire [7:0] n0847;
wire [7:0] n0848;
wire [7:0] n0849;
wire [7:0] n0850;
wire [7:0] n0851;
wire [7:0] n0852;
wire [7:0] n0853;
wire [7:0] n0854;
wire [7:0] n0855;
wire [7:0] n0856;
wire n0857;
wire [15:0] n0858;
wire [7:0] n0859;
wire [7:0] n0860;
wire [7:0] n0861;
wire [7:0] n0862;
wire [7:0] n0863;
wire [7:0] n0864;
wire [7:0] n0865;
wire [7:0] n0866;
wire [7:0] n0867;
wire [7:0] n0868;
wire [7:0] n0869;
wire [7:0] n0870;
wire [7:0] n0871;
wire [7:0] n0872;
wire [7:0] n0873;
wire [7:0] n0874;
wire [7:0] n0875;
wire [7:0] n0876;
wire [7:0] n0877;
wire [7:0] n0878;
wire [7:0] n0879;
wire [7:0] n0880;
wire [7:0] n0881;
wire [7:0] n0882;
wire [7:0] n0883;
wire [7:0] n0884;
wire [7:0] n0885;
wire [7:0] n0886;
wire [7:0] n0887;
wire [7:0] n0888;
wire [7:0] n0889;
wire [7:0] n0890;
wire [7:0] n0891;
wire [7:0] n0892;
wire [7:0] n0893;
wire [7:0] n0894;
wire [7:0] n0895;
wire [7:0] n0896;
wire [7:0] n0897;
wire [7:0] n0898;
wire [7:0] n0899;
wire [7:0] n0900;
wire [7:0] n0901;
wire [7:0] n0902;
wire [7:0] n0903;
wire [7:0] n0904;
wire [7:0] n0905;
wire n0906;
wire [15:0] n0907;
wire [7:0] n0908;
wire [7:0] n0909;
wire [7:0] n0910;
wire [7:0] n0911;
wire [7:0] n0912;
wire [7:0] n0913;
wire [7:0] n0914;
wire [7:0] n0915;
wire [7:0] n0916;
wire [7:0] n0917;
wire [7:0] n0918;
wire [7:0] n0919;
wire [7:0] n0920;
wire [7:0] n0921;
wire [7:0] n0922;
wire [7:0] n0923;
wire [7:0] n0924;
wire [7:0] n0925;
wire [7:0] n0926;
wire [7:0] n0927;
wire [7:0] n0928;
wire [7:0] n0929;
wire [7:0] n0930;
wire [7:0] n0931;
wire [7:0] n0932;
wire [7:0] n0933;
wire [7:0] n0934;
wire [7:0] n0935;
wire [7:0] n0936;
wire [7:0] n0937;
wire [7:0] n0938;
wire [7:0] n0939;
wire [7:0] n0940;
wire [7:0] n0941;
wire [7:0] n0942;
wire [7:0] n0943;
wire [7:0] n0944;
wire [7:0] n0945;
wire [7:0] n0946;
wire [7:0] n0947;
wire [7:0] n0948;
wire [7:0] n0949;
wire [7:0] n0950;
wire [7:0] n0951;
wire [7:0] n0952;
wire [7:0] n0953;
wire [7:0] n0954;
wire [7:0] n0955;
wire [7:0] n0956;
wire n0957;
wire [15:0] n0958;
wire [0:0] n0959;
wire [6:0] n0960;
wire [7:0] n0961;
wire [15:0] n0962;
wire n0963;
wire [7:0] n0964;
wire n0965;
wire [7:0] n0966;
wire n0967;
wire [7:0] n0968;
wire n0969;
wire [7:0] n0970;
wire n0971;
wire [7:0] n0972;
wire n0973;
wire [7:0] n0974;
wire n0975;
wire [7:0] n0976;
wire n0977;
wire [7:0] n0978;
wire n0979;
wire [7:0] n0980;
wire n0981;
wire [7:0] n0982;
wire n0983;
wire [7:0] n0984;
wire n0985;
wire [7:0] n0986;
wire n0987;
wire [7:0] n0988;
wire n0989;
wire [7:0] n0990;
wire n0991;
wire [7:0] n0992;
wire n0993;
wire n0994;
wire [7:0] n0995;
wire n0996;
wire [7:0] n0997;
wire n0998;
wire [7:0] n0999;
wire n1000;
wire [7:0] n1001;
wire n1002;
wire [7:0] n1003;
wire n1004;
wire [7:0] n1005;
wire [0:0] n1006;
wire [7:0] n1007;
wire [7:0] n1008;
wire n1009;
wire [7:0] n1010;
wire [7:0] n1011;
wire [7:0] n1012;
wire [7:0] n1013;
wire [7:0] n1014;
wire [3:0] n1015;
wire [0:0] n1016;
wire [7:0] n1017;
wire n1018;
wire [7:0] n1019;
wire n1020;
wire [7:0] n1021;
wire n1022;
wire [7:0] n1023;
wire n1024;
wire [7:0] n1025;
wire n1026;
wire [7:0] n1027;
wire n1028;
wire [7:0] n1029;
wire n1030;
wire [7:0] n1031;
wire n1032;
wire [7:0] n1033;
wire n1034;
wire [7:0] n1035;
wire n1036;
wire [7:0] n1037;
wire n1038;
wire [7:0] n1039;
wire n1040;
wire [7:0] n1041;
wire n1042;
wire [7:0] n1043;
wire n1044;
wire [7:0] n1045;
wire n1046;
wire [7:0] n1047;
wire [0:0] n1048;
wire n1049;
wire n1050;
wire [7:0] n1051;
wire n1052;
wire [7:0] n1053;
wire n1054;
wire [7:0] n1055;
wire n1056;
wire [7:0] n1057;
wire n1058;
wire [7:0] n1059;
wire n1060;
wire [7:0] n1061;
wire [7:0] n1062;
wire [7:0] n1063;
wire [7:0] n1064;
wire [7:0] n1065;
wire [7:0] n1066;
wire [7:0] n1067;
wire [7:0] n1068;
wire [7:0] n1069;
wire [7:0] n1070;
wire [7:0] n1071;
wire [7:0] n1072;
wire [7:0] n1073;
wire [7:0] n1074;
wire [7:0] n1075;
wire [7:0] n1076;
wire [7:0] n1077;
wire [7:0] n1078;
wire [7:0] n1079;
wire [7:0] n1080;
wire [7:0] n1081;
wire [7:0] n1082;
wire [7:0] n1083;
wire [7:0] n1084;
wire [7:0] n1085;
wire [7:0] n1086;
wire [7:0] n1087;
wire [7:0] n1088;
wire [7:0] n1089;
wire [7:0] n1090;
wire [7:0] n1091;
wire [7:0] n1092;
wire [7:0] n1093;
wire [7:0] n1094;
wire [7:0] n1095;
wire [7:0] n1096;
wire [7:0] n1097;
wire [7:0] n1098;
wire [7:0] n1099;
wire [7:0] n1100;
wire [7:0] n1101;
wire [7:0] n1102;
wire [7:0] n1103;
wire [7:0] n1104;
wire [7:0] n1105;
wire [7:0] n1106;
wire [7:0] n1107;
wire [7:0] n1108;
wire [7:0] n1109;
wire [7:0] n1110;
wire [7:0] n1111;
wire [7:0] n1112;
wire [7:0] n1113;
wire [7:0] n1114;
wire [7:0] n1115;
wire [7:0] n1116;
wire [7:0] n1117;
wire [7:0] n1118;
wire [7:0] n1119;
wire [7:0] n1120;
wire [7:0] n1121;
wire [7:0] n1122;
wire n1123;
wire [0:0] n1124;
wire n1125;
wire [0:0] n1126;
wire [8:0] n1127;
wire [0:0] n1128;
wire [0:0] n1129;
wire n1130;
wire n1131;
wire [0:0] n1132;
wire [7:0] n1133;
wire [7:0] n1134;
wire [7:0] n1135;
wire n1136;
wire [0:0] n1137;
wire n1138;
wire [0:0] n1139;
wire [8:0] n1140;
wire [0:0] n1141;
wire [0:0] n1142;
wire n1143;
wire n1144;
wire [0:0] n1145;
wire [7:0] n1146;
wire [7:0] n1147;
wire [7:0] n1148;
wire n1149;
wire [0:0] n1150;
wire n1151;
wire [0:0] n1152;
wire [8:0] n1153;
wire [0:0] n1154;
wire [0:0] n1155;
wire n1156;
wire n1157;
wire [0:0] n1158;
wire [7:0] n1159;
wire [7:0] n1160;
wire [7:0] n1161;
wire n1162;
wire [0:0] n1163;
wire n1164;
wire [0:0] n1165;
wire [8:0] n1166;
wire [0:0] n1167;
wire [0:0] n1168;
wire n1169;
wire n1170;
wire [0:0] n1171;
wire [7:0] n1172;
wire [0:0] n1173;
wire [0:0] n1174;
wire [7:0] n1175;
wire [7:0] n1176;
wire [15:0] n1177;
wire [7:0] n1178;
wire [7:0] n1179;
wire [15:0] n1180;
wire [15:0] n1181;
wire [7:0] n1182;
wire [7:0] n1183;
wire n1184;
wire n1185;
wire [0:0] n1186;
wire [7:0] n1187;
wire [0:0] n1188;
wire n1189;
wire n1190;
wire n1191;
wire n1192;
wire n1193;
wire n1194;
wire n1195;
wire n1196;
wire n1197;
wire n1198;
wire n1199;
wire n1200;
wire n1201;
wire n1202;
wire n1203;
wire n1204;
wire n1205;
wire n1206;
wire n1207;
wire n1208;
wire n1209;
wire n1210;
wire [7:0] n1211;
wire [7:0] n1212;
wire [7:0] n1213;
wire [7:0] n1214;
wire [7:0] n1215;
wire [7:0] n1216;
wire [7:0] n1217;
wire [7:0] n1218;
wire [7:0] n1219;
wire [7:0] n1220;
wire [7:0] n1221;
wire [7:0] n1222;
wire [7:0] n1223;
wire [7:0] n1224;
wire [7:0] n1225;
wire [7:0] n1226;
wire [7:0] n1227;
wire [7:0] n1228;
wire [7:0] n1229;
wire [7:0] n1230;
wire [7:0] n1231;
wire [7:0] n1232;
wire [7:0] n1233;
wire [0:0] n1234;
wire [7:0] n1235;
wire [7:0] n1236;
wire [7:0] n1237;
wire [7:0] n1238;
wire [7:0] n1239;
wire [7:0] n1240;
wire [7:0] n1241;
wire [7:0] n1242;
wire [7:0] n1243;
wire [7:0] n1244;
wire [7:0] n1245;
wire [7:0] n1246;
wire [7:0] n1247;
wire [7:0] n1248;
wire [7:0] n1249;
wire [0:0] n1250;
wire [7:0] n1251;
wire n1252;
wire n1253;
wire [15:0] n1254;
wire n1255;
wire [0:0] n1256;
wire [7:0] n1257;
wire n1258;
wire n1259;
wire [15:0] n1260;
wire n1261;
wire [0:0] n1262;
wire [7:0] n1263;
wire n1264;
wire n1265;
wire [15:0] n1266;
wire n1267;
wire [0:0] n1268;
wire [7:0] n1269;
wire n1270;
wire n1271;
wire [15:0] n1272;
wire n1273;
wire [0:0] n1274;
wire [7:0] n1275;
wire [7:0] n1276;
wire [3:0] n1277;
wire [7:0] n1278;
wire [7:0] n1279;
wire [7:0] n1280;
wire [7:0] n1281;
wire [7:0] n1282;
wire [7:0] n1283;
wire [7:0] n1284;
wire [7:0] n1285;
wire [7:0] n1286;
wire [7:0] n1287;
wire [7:0] n1288;
wire [7:0] n1289;
wire [7:0] n1290;
wire [7:0] n1291;
wire [7:0] n1292;
wire [7:0] n1293;
wire [7:0] n1294;
wire [7:0] n1295;
wire [7:0] n1296;
wire [7:0] n1297;
wire [7:0] n1298;
wire [7:0] n1299;
wire [7:0] n1300;
wire [7:0] n1301;
wire [7:0] n1302;
wire [7:0] n1303;
wire [7:0] n1304;
wire [7:0] n1305;
wire [7:0] n1306;
wire [7:0] n1307;
wire [7:0] n1308;
wire [7:0] n1309;
wire [7:0] n1310;
wire [7:0] n1311;
wire [7:0] n1312;
wire [7:0] n1313;
wire n1314;
wire [3:0] n1315;
wire n1316;
wire n1317;
wire [8:0] n1318;
wire [8:0] n1319;
wire [8:0] n1320;
wire [0:0] n1321;
wire [0:0] n1322;
wire n1323;
wire [3:0] n1324;
wire n1325;
wire n1326;
wire [8:0] n1327;
wire [8:0] n1328;
wire [8:0] n1329;
wire [7:0] n1330;
wire [0:0] n1331;
wire [0:0] n1332;
wire [7:0] n1333;
wire n1334;
wire n1335;
wire [15:0] n1336;
wire [7:0] n1337;
wire [3:0] n1338;
wire [7:0] n1339;
wire n1340;
wire n1341;
wire [15:0] n1342;
wire [7:0] n1343;
wire [7:0] n1344;
wire [7:0] n1345;
wire [7:0] n1346;
wire [7:0] n1347;
wire [7:0] n1348;
wire [7:0] n1349;
wire [7:0] n1350;
wire [7:0] n1351;
wire [7:0] n1352;
wire [7:0] n1353;
wire [7:0] n1354;
wire [7:0] n1355;
wire [7:0] n1356;
wire [7:0] n1357;
wire [7:0] n1358;
wire [7:0] n1359;
wire [7:0] n1360;
wire [7:0] n1361;
wire [7:0] n1362;
wire [7:0] n1363;
wire [7:0] n1364;
wire n1365;
wire [7:0] n1366;
wire n1367;
wire [7:0] n1368;
wire n1369;
wire [7:0] n1370;
wire n1371;
wire [7:0] n1372;
wire n1373;
wire [7:0] n1374;
wire n1375;
wire [7:0] n1376;
wire n1377;
wire [7:0] n1378;
wire n1379;
wire [7:0] n1380;
wire n1381;
wire [7:0] n1382;
wire n1383;
wire [7:0] n1384;
wire n1385;
wire [7:0] n1386;
wire n1387;
wire [7:0] n1388;
wire n1389;
wire [7:0] n1390;
wire n1391;
wire [7:0] n1392;
wire n1393;
wire [7:0] n1394;
wire n1395;
wire [7:0] n1396;
wire n1397;
wire [7:0] n1398;
wire n1399;
wire n1400;
wire [7:0] n1401;
wire n1402;
wire [7:0] n1403;
wire n1404;
wire [7:0] n1405;
wire n1406;
wire [7:0] n1407;
wire n1408;
wire [7:0] n1409;
wire n1410;
wire [7:0] n1411;
wire n1412;
wire [7:0] n1413;
wire n1414;
wire [7:0] n1415;
wire n1416;
wire [7:0] n1417;
wire n1418;
wire [7:0] n1419;
wire n1420;
wire [7:0] n1421;
wire n1422;
wire n1423;
wire [7:0] n1424;
wire n1425;
wire [7:0] n1426;
wire n1427;
wire [7:0] n1428;
wire n1429;
wire [7:0] n1430;
wire n1431;
wire [7:0] n1432;
wire n1433;
wire [7:0] n1434;
wire n1435;
wire [7:0] n1436;
wire n1437;
wire [7:0] n1438;
wire n1439;
wire [7:0] n1440;
wire n1441;
wire [7:0] n1442;
wire n1443;
wire [7:0] n1444;
wire n1445;
wire [7:0] n1446;
wire n1447;
wire [7:0] n1448;
wire n1449;
wire [7:0] n1450;
wire n1451;
wire [7:0] n1452;
wire n1453;
wire n1454;
wire [7:0] n1455;
wire n1456;
wire [7:0] n1457;
wire n1458;
wire [7:0] n1459;
wire n1460;
wire [7:0] n1461;
wire n1462;
wire [7:0] n1463;
wire n1464;
wire [7:0] n1465;
wire n1466;
wire [7:0] n1467;
wire n1468;
wire [7:0] n1469;
wire n1470;
wire [7:0] n1471;
wire n1472;
wire [7:0] n1473;
wire n1474;
wire [7:0] n1475;
wire n1476;
wire [7:0] n1477;
wire n1478;
wire n1479;

reg [7:0] IRAM[255:0];
reg [7:0] ROM[65535:0];

// MEMRD: _IRAM_RD0_ = (read-mem IRAM (if (or (eq (read-mem ROM PC) (bv 6 8)) (eq (read-mem ROM PC) (bv 8 8)) (eq (read-mem ROM PC) (bv 22 8)) (eq (read-mem ROM PC) (bv 24 8)) (eq (read-mem ROM PC) (bv 38 8)) (eq (read-mem ROM PC) (bv 40 8)) (eq (read-mem ROM PC) (bv 54 8)) (eq (read-mem ROM PC) (bv 56 8)) (eq (read-mem ROM PC) (bv 70 8)) (eq (read-mem ROM PC) (bv 72 8)) (eq (read-mem ROM PC) (bv 86 8)) (eq (read-mem ROM PC) (bv 88 8)) (eq (read-mem ROM PC) (bv 102 8)) (eq (read-mem ROM PC) (bv 104 8)) (eq (read-mem ROM PC) (bv 118 8)) (eq (read-mem ROM PC) (bv 134 8)) (eq (read-mem ROM PC) (bv 136 8)) (eq (read-mem ROM PC) (bv 150 8)) (eq (read-mem ROM PC) (bv 152 8)) (eq (read-mem ROM PC) (bv 166 8)) (eq (read-mem ROM PC) (bv 182 8)) (eq (read-mem ROM PC) (bv 184 8)) (eq (read-mem ROM PC) (bv 198 8)) (eq (read-mem ROM PC) (bv 200 8)) (eq (read-mem ROM PC) (bv 214 8)) (eq (read-mem ROM PC) (bv 216 8)) (eq (read-mem ROM PC) (bv 230 8)) (eq (read-mem ROM PC) (bv 232 8)) (eq (read-mem ROM PC) (bv 246 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (or (eq (read-mem ROM PC) (bv 14 8)) (eq (read-mem ROM PC) (bv 30 8)) (eq (read-mem ROM PC) (bv 46 8)) (eq (read-mem ROM PC) (bv 62 8)) (eq (read-mem ROM PC) (bv 78 8)) (eq (read-mem ROM PC) (bv 94 8)) (eq (read-mem ROM PC) (bv 110 8)) (eq (read-mem ROM PC) (bv 142 8)) (eq (read-mem ROM PC) (bv 158 8)) (eq (read-mem ROM PC) (bv 190 8)) (eq (read-mem ROM PC) (bv 206 8)) (eq (read-mem ROM PC) (bv 222 8)) (eq (read-mem ROM PC) (bv 238 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (or (eq (read-mem ROM PC) (bv 16 8)) (eq (read-mem ROM PC) (bv 32 8)) (eq (read-mem ROM PC) (bv 48 8)) (eq (read-mem ROM PC) (bv 114 8)) (eq (read-mem ROM PC) (bv 130 8)) (eq (read-mem ROM PC) (bv 146 8)) (eq (read-mem ROM PC) (bv 160 8)) (eq (read-mem ROM PC) (bv 162 8)) (eq (read-mem ROM PC) (bv 176 8)) (eq (read-mem ROM PC) (bv 178 8)) (eq (read-mem ROM PC) (bv 194 8)) (eq (read-mem ROM PC) (bv 210 8))) (if (eq (extract 7 7 (read-mem ROM (add PC (bv 1 16)))) (bv 1 1)) (concat (extract 7 3 (read-mem ROM (add PC (bv 1 16)))) (bv 0 3)) (add (zero-ext 3 (extract 7 3 (read-mem ROM (add PC (bv 1 16))))) (bv 32 8))) (if (or (eq (read-mem ROM PC) (bv 10 8)) (eq (read-mem ROM PC) (bv 26 8)) (eq (read-mem ROM PC) (bv 42 8)) (eq (read-mem ROM PC) (bv 58 8)) (eq (read-mem ROM PC) (bv 74 8)) (eq (read-mem ROM PC) (bv 90 8)) (eq (read-mem ROM PC) (bv 106 8)) (eq (read-mem ROM PC) (bv 138 8)) (eq (read-mem ROM PC) (bv 154 8)) (eq (read-mem ROM PC) (bv 186 8)) (eq (read-mem ROM PC) (bv 202 8)) (eq (read-mem ROM PC) (bv 218 8)) (eq (read-mem ROM PC) (bv 234 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (or (eq (read-mem ROM PC) (bv 5 8)) (eq (read-mem ROM PC) (bv 21 8)) (eq (read-mem ROM PC) (bv 37 8)) (eq (read-mem ROM PC) (bv 53 8)) (eq (read-mem ROM PC) (bv 66 8)) (eq (read-mem ROM PC) (bv 67 8)) (eq (read-mem ROM PC) (bv 69 8)) (eq (read-mem ROM PC) (bv 82 8)) (eq (read-mem ROM PC) (bv 83 8)) (eq (read-mem ROM PC) (bv 85 8)) (eq (read-mem ROM PC) (bv 98 8)) (eq (read-mem ROM PC) (bv 99 8)) (eq (read-mem ROM PC) (bv 101 8)) (eq (read-mem ROM PC) (bv 133 8)) (eq (read-mem ROM PC) (bv 149 8)) (eq (read-mem ROM PC) (bv 168 8)) (eq (read-mem ROM PC) (bv 169 8)) (eq (read-mem ROM PC) (bv 170 8)) (eq (read-mem ROM PC) (bv 171 8)) (eq (read-mem ROM PC) (bv 172 8)) (eq (read-mem ROM PC) (bv 173 8)) (eq (read-mem ROM PC) (bv 174 8)) (eq (read-mem ROM PC) (bv 175 8)) (eq (read-mem ROM PC) (bv 181 8)) (eq (read-mem ROM PC) (bv 192 8)) (eq (read-mem ROM PC) (bv 197 8)) (eq (read-mem ROM PC) (bv 213 8)) (eq (read-mem ROM PC) (bv 229 8))) (read-mem ROM (add PC (bv 1 16))) (if (or (eq (read-mem ROM PC) (bv 15 8)) (eq (read-mem ROM PC) (bv 31 8)) (eq (read-mem ROM PC) (bv 47 8)) (eq (read-mem ROM PC) (bv 63 8)) (eq (read-mem ROM PC) (bv 79 8)) (eq (read-mem ROM PC) (bv 95 8)) (eq (read-mem ROM PC) (bv 111 8)) (eq (read-mem ROM PC) (bv 143 8)) (eq (read-mem ROM PC) (bv 159 8)) (eq (read-mem ROM PC) (bv 191 8)) (eq (read-mem ROM PC) (bv 207 8)) (eq (read-mem ROM PC) (bv 223 8)) (eq (read-mem ROM PC) (bv 239 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (or (eq (read-mem ROM PC) (bv 13 8)) (eq (read-mem ROM PC) (bv 29 8)) (eq (read-mem ROM PC) (bv 45 8)) (eq (read-mem ROM PC) (bv 61 8)) (eq (read-mem ROM PC) (bv 77 8)) (eq (read-mem ROM PC) (bv 93 8)) (eq (read-mem ROM PC) (bv 109 8)) (eq (read-mem ROM PC) (bv 141 8)) (eq (read-mem ROM PC) (bv 157 8)) (eq (read-mem ROM PC) (bv 189 8)) (eq (read-mem ROM PC) (bv 205 8)) (eq (read-mem ROM PC) (bv 221 8)) (eq (read-mem ROM PC) (bv 237 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (or (eq (read-mem ROM PC) (bv 11 8)) (eq (read-mem ROM PC) (bv 27 8)) (eq (read-mem ROM PC) (bv 43 8)) (eq (read-mem ROM PC) (bv 59 8)) (eq (read-mem ROM PC) (bv 75 8)) (eq (read-mem ROM PC) (bv 91 8)) (eq (read-mem ROM PC) (bv 107 8)) (eq (read-mem ROM PC) (bv 139 8)) (eq (read-mem ROM PC) (bv 155 8)) (eq (read-mem ROM PC) (bv 187 8)) (eq (read-mem ROM PC) (bv 203 8)) (eq (read-mem ROM PC) (bv 219 8)) (eq (read-mem ROM PC) (bv 235 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (or (eq (read-mem ROM PC) (bv 7 8)) (eq (read-mem ROM PC) (bv 9 8)) (eq (read-mem ROM PC) (bv 23 8)) (eq (read-mem ROM PC) (bv 25 8)) (eq (read-mem ROM PC) (bv 39 8)) (eq (read-mem ROM PC) (bv 41 8)) (eq (read-mem ROM PC) (bv 55 8)) (eq (read-mem ROM PC) (bv 57 8)) (eq (read-mem ROM PC) (bv 71 8)) (eq (read-mem ROM PC) (bv 73 8)) (eq (read-mem ROM PC) (bv 87 8)) (eq (read-mem ROM PC) (bv 89 8)) (eq (read-mem ROM PC) (bv 103 8)) (eq (read-mem ROM PC) (bv 105 8)) (eq (read-mem ROM PC) (bv 119 8)) (eq (read-mem ROM PC) (bv 135 8)) (eq (read-mem ROM PC) (bv 137 8)) (eq (read-mem ROM PC) (bv 151 8)) (eq (read-mem ROM PC) (bv 153 8)) (eq (read-mem ROM PC) (bv 167 8)) (eq (read-mem ROM PC) (bv 183 8)) (eq (read-mem ROM PC) (bv 185 8)) (eq (read-mem ROM PC) (bv 199 8)) (eq (read-mem ROM PC) (bv 201 8)) (eq (read-mem ROM PC) (bv 215 8)) (eq (read-mem ROM PC) (bv 217 8)) (eq (read-mem ROM PC) (bv 231 8)) (eq (read-mem ROM PC) (bv 233 8)) (eq (read-mem ROM PC) (bv 247 8))) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (or (eq (read-mem ROM PC) (bv 34 8)) (eq (read-mem ROM PC) (bv 50 8)) (eq (read-mem ROM PC) (bv 208 8))) SP (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)))))))))))))
assign n0001 = ROM[PC];
assign n0002 = 8'h6;
assign n0003 = ( n0001 == n0002 );
assign n0004 = 8'h8;
assign n0005 = ( n0001 == n0004 );
assign n0006 = 8'h16;
assign n0007 = ( n0001 == n0006 );
assign n0008 = 8'h18;
assign n0009 = ( n0001 == n0008 );
assign n0010 = 8'h26;
assign n0011 = ( n0001 == n0010 );
assign n0012 = 8'h28;
assign n0013 = ( n0001 == n0012 );
assign n0014 = 8'h36;
assign n0015 = ( n0001 == n0014 );
assign n0016 = 8'h38;
assign n0017 = ( n0001 == n0016 );
assign n0018 = 8'h46;
assign n0019 = ( n0001 == n0018 );
assign n0020 = 8'h48;
assign n0021 = ( n0001 == n0020 );
assign n0022 = 8'h56;
assign n0023 = ( n0001 == n0022 );
assign n0024 = 8'h58;
assign n0025 = ( n0001 == n0024 );
assign n0026 = 8'h66;
assign n0027 = ( n0001 == n0026 );
assign n0028 = 8'h68;
assign n0029 = ( n0001 == n0028 );
assign n0030 = 8'h76;
assign n0031 = ( n0001 == n0030 );
assign n0032 = 8'h86;
assign n0033 = ( n0001 == n0032 );
assign n0034 = 8'h88;
assign n0035 = ( n0001 == n0034 );
assign n0036 = 8'h96;
assign n0037 = ( n0001 == n0036 );
assign n0038 = 8'h98;
assign n0039 = ( n0001 == n0038 );
assign n0040 = 8'ha6;
assign n0041 = ( n0001 == n0040 );
assign n0042 = 8'hb6;
assign n0043 = ( n0001 == n0042 );
assign n0044 = 8'hb8;
assign n0045 = ( n0001 == n0044 );
assign n0046 = 8'hc6;
assign n0047 = ( n0001 == n0046 );
assign n0048 = 8'hc8;
assign n0049 = ( n0001 == n0048 );
assign n0050 = 8'hd6;
assign n0051 = ( n0001 == n0050 );
assign n0052 = 8'hd8;
assign n0053 = ( n0001 == n0052 );
assign n0054 = 8'he6;
assign n0055 = ( n0001 == n0054 );
assign n0056 = 8'he8;
assign n0057 = ( n0001 == n0056 );
assign n0058 = 8'hf6;
assign n0059 = ( n0001 == n0058 );
assign n0060 = ( n0003 || n0005 || n0007 || n0009 || n0011 || n0013 || n0015 || n0017 || n0019 || n0021 || n0023 || n0025 || n0027 || n0029 || n0031 || n0033 || n0035 || n0037 || n0039 || n0041 || n0043 || n0045 || n0047 || n0049 || n0051 || n0053 || n0055 || n0057 || n0059 );
assign n0061 = 3'h0;
assign n0062 = PSW[4:3];
assign n0063 = { ( n0061 ), ( n0062 ), ( n0061 ) };
assign n0064 = 8'he;
assign n0065 = ( n0001 == n0064 );
assign n0066 = 8'h1e;
assign n0067 = ( n0001 == n0066 );
assign n0068 = 8'h2e;
assign n0069 = ( n0001 == n0068 );
assign n0070 = 8'h3e;
assign n0071 = ( n0001 == n0070 );
assign n0072 = 8'h4e;
assign n0073 = ( n0001 == n0072 );
assign n0074 = 8'h5e;
assign n0075 = ( n0001 == n0074 );
assign n0076 = 8'h6e;
assign n0077 = ( n0001 == n0076 );
assign n0078 = 8'h8e;
assign n0079 = ( n0001 == n0078 );
assign n0080 = 8'h9e;
assign n0081 = ( n0001 == n0080 );
assign n0082 = 8'hbe;
assign n0083 = ( n0001 == n0082 );
assign n0084 = 8'hce;
assign n0085 = ( n0001 == n0084 );
assign n0086 = 8'hde;
assign n0087 = ( n0001 == n0086 );
assign n0088 = 8'hee;
assign n0089 = ( n0001 == n0088 );
assign n0090 = ( n0065 || n0067 || n0069 || n0071 || n0073 || n0075 || n0077 || n0079 || n0081 || n0083 || n0085 || n0087 || n0089 );
assign n0091 = 3'h6;
assign n0092 = { ( n0061 ), ( n0062 ), ( n0091 ) };
assign n0093 = 8'h10;
assign n0094 = ( n0001 == n0093 );
assign n0095 = 8'h20;
assign n0096 = ( n0001 == n0095 );
assign n0097 = 8'h30;
assign n0098 = ( n0001 == n0097 );
assign n0099 = 8'h72;
assign n0100 = ( n0001 == n0099 );
assign n0101 = 8'h82;
assign n0102 = ( n0001 == n0101 );
assign n0103 = 8'h92;
assign n0104 = ( n0001 == n0103 );
assign n0105 = 8'ha0;
assign n0106 = ( n0001 == n0105 );
assign n0107 = 8'ha2;
assign n0108 = ( n0001 == n0107 );
assign n0109 = 8'hb0;
assign n0110 = ( n0001 == n0109 );
assign n0111 = 8'hb2;
assign n0112 = ( n0001 == n0111 );
assign n0113 = 8'hc2;
assign n0114 = ( n0001 == n0113 );
assign n0115 = 8'hd2;
assign n0116 = ( n0001 == n0115 );
assign n0117 = ( n0094 || n0096 || n0098 || n0100 || n0102 || n0104 || n0106 || n0108 || n0110 || n0112 || n0114 || n0116 );
assign n0118 = 16'h1;
assign n0119 = ( PC + n0118 );
assign n0120 = ROM[n0119];
assign n0121 = n0120[7:7];
assign n0122 = 1'h1;
assign n0123 = ( n0121 == n0122 );
assign n0124 = n0120[7:3];
assign n0125 = { ( n0124 ), ( n0061 ) };
assign n0126 = { 3'b0, n0124 };
assign n0127 = ( n0126 + n0095 );
assign n0128 = ( n0123 ) ? ( n0125 ) : ( n0127 );
assign n0129 = 8'ha;
assign n0130 = ( n0001 == n0129 );
assign n0131 = 8'h1a;
assign n0132 = ( n0001 == n0131 );
assign n0133 = 8'h2a;
assign n0134 = ( n0001 == n0133 );
assign n0135 = 8'h3a;
assign n0136 = ( n0001 == n0135 );
assign n0137 = 8'h4a;
assign n0138 = ( n0001 == n0137 );
assign n0139 = 8'h5a;
assign n0140 = ( n0001 == n0139 );
assign n0141 = 8'h6a;
assign n0142 = ( n0001 == n0141 );
assign n0143 = 8'h8a;
assign n0144 = ( n0001 == n0143 );
assign n0145 = 8'h9a;
assign n0146 = ( n0001 == n0145 );
assign n0147 = 8'hba;
assign n0148 = ( n0001 == n0147 );
assign n0149 = 8'hca;
assign n0150 = ( n0001 == n0149 );
assign n0151 = 8'hda;
assign n0152 = ( n0001 == n0151 );
assign n0153 = 8'hea;
assign n0154 = ( n0001 == n0153 );
assign n0155 = ( n0130 || n0132 || n0134 || n0136 || n0138 || n0140 || n0142 || n0144 || n0146 || n0148 || n0150 || n0152 || n0154 );
assign n0156 = 3'h2;
assign n0157 = { ( n0061 ), ( n0062 ), ( n0156 ) };
assign n0158 = 8'h5;
assign n0159 = ( n0001 == n0158 );
assign n0160 = 8'h15;
assign n0161 = ( n0001 == n0160 );
assign n0162 = 8'h25;
assign n0163 = ( n0001 == n0162 );
assign n0164 = 8'h35;
assign n0165 = ( n0001 == n0164 );
assign n0166 = 8'h42;
assign n0167 = ( n0001 == n0166 );
assign n0168 = 8'h43;
assign n0169 = ( n0001 == n0168 );
assign n0170 = 8'h45;
assign n0171 = ( n0001 == n0170 );
assign n0172 = 8'h52;
assign n0173 = ( n0001 == n0172 );
assign n0174 = 8'h53;
assign n0175 = ( n0001 == n0174 );
assign n0176 = 8'h55;
assign n0177 = ( n0001 == n0176 );
assign n0178 = 8'h62;
assign n0179 = ( n0001 == n0178 );
assign n0180 = 8'h63;
assign n0181 = ( n0001 == n0180 );
assign n0182 = 8'h65;
assign n0183 = ( n0001 == n0182 );
assign n0184 = 8'h85;
assign n0185 = ( n0001 == n0184 );
assign n0186 = 8'h95;
assign n0187 = ( n0001 == n0186 );
assign n0188 = 8'ha8;
assign n0189 = ( n0001 == n0188 );
assign n0190 = 8'ha9;
assign n0191 = ( n0001 == n0190 );
assign n0192 = 8'haa;
assign n0193 = ( n0001 == n0192 );
assign n0194 = 8'hab;
assign n0195 = ( n0001 == n0194 );
assign n0196 = 8'hac;
assign n0197 = ( n0001 == n0196 );
assign n0198 = 8'had;
assign n0199 = ( n0001 == n0198 );
assign n0200 = 8'hae;
assign n0201 = ( n0001 == n0200 );
assign n0202 = 8'haf;
assign n0203 = ( n0001 == n0202 );
assign n0204 = 8'hb5;
assign n0205 = ( n0001 == n0204 );
assign n0206 = 8'hc0;
assign n0207 = ( n0001 == n0206 );
assign n0208 = 8'hc5;
assign n0209 = ( n0001 == n0208 );
assign n0210 = 8'hd5;
assign n0211 = ( n0001 == n0210 );
assign n0212 = 8'he5;
assign n0213 = ( n0001 == n0212 );
assign n0214 = ( n0159 || n0161 || n0163 || n0165 || n0167 || n0169 || n0171 || n0173 || n0175 || n0177 || n0179 || n0181 || n0183 || n0185 || n0187 || n0189 || n0191 || n0193 || n0195 || n0197 || n0199 || n0201 || n0203 || n0205 || n0207 || n0209 || n0211 || n0213 );
assign n0215 = 8'hf;
assign n0216 = ( n0001 == n0215 );
assign n0217 = 8'h1f;
assign n0218 = ( n0001 == n0217 );
assign n0219 = 8'h2f;
assign n0220 = ( n0001 == n0219 );
assign n0221 = 8'h3f;
assign n0222 = ( n0001 == n0221 );
assign n0223 = 8'h4f;
assign n0224 = ( n0001 == n0223 );
assign n0225 = 8'h5f;
assign n0226 = ( n0001 == n0225 );
assign n0227 = 8'h6f;
assign n0228 = ( n0001 == n0227 );
assign n0229 = 8'h8f;
assign n0230 = ( n0001 == n0229 );
assign n0231 = 8'h9f;
assign n0232 = ( n0001 == n0231 );
assign n0233 = 8'hbf;
assign n0234 = ( n0001 == n0233 );
assign n0235 = 8'hcf;
assign n0236 = ( n0001 == n0235 );
assign n0237 = 8'hdf;
assign n0238 = ( n0001 == n0237 );
assign n0239 = 8'hef;
assign n0240 = ( n0001 == n0239 );
assign n0241 = ( n0216 || n0218 || n0220 || n0222 || n0224 || n0226 || n0228 || n0230 || n0232 || n0234 || n0236 || n0238 || n0240 );
assign n0242 = 3'h7;
assign n0243 = { ( n0061 ), ( n0062 ), ( n0242 ) };
assign n0244 = 8'hd;
assign n0245 = ( n0001 == n0244 );
assign n0246 = 8'h1d;
assign n0247 = ( n0001 == n0246 );
assign n0248 = 8'h2d;
assign n0249 = ( n0001 == n0248 );
assign n0250 = 8'h3d;
assign n0251 = ( n0001 == n0250 );
assign n0252 = 8'h4d;
assign n0253 = ( n0001 == n0252 );
assign n0254 = 8'h5d;
assign n0255 = ( n0001 == n0254 );
assign n0256 = 8'h6d;
assign n0257 = ( n0001 == n0256 );
assign n0258 = 8'h8d;
assign n0259 = ( n0001 == n0258 );
assign n0260 = 8'h9d;
assign n0261 = ( n0001 == n0260 );
assign n0262 = 8'hbd;
assign n0263 = ( n0001 == n0262 );
assign n0264 = 8'hcd;
assign n0265 = ( n0001 == n0264 );
assign n0266 = 8'hdd;
assign n0267 = ( n0001 == n0266 );
assign n0268 = 8'hed;
assign n0269 = ( n0001 == n0268 );
assign n0270 = ( n0245 || n0247 || n0249 || n0251 || n0253 || n0255 || n0257 || n0259 || n0261 || n0263 || n0265 || n0267 || n0269 );
assign n0271 = 3'h5;
assign n0272 = { ( n0061 ), ( n0062 ), ( n0271 ) };
assign n0273 = 8'hb;
assign n0274 = ( n0001 == n0273 );
assign n0275 = 8'h1b;
assign n0276 = ( n0001 == n0275 );
assign n0277 = 8'h2b;
assign n0278 = ( n0001 == n0277 );
assign n0279 = 8'h3b;
assign n0280 = ( n0001 == n0279 );
assign n0281 = 8'h4b;
assign n0282 = ( n0001 == n0281 );
assign n0283 = 8'h5b;
assign n0284 = ( n0001 == n0283 );
assign n0285 = 8'h6b;
assign n0286 = ( n0001 == n0285 );
assign n0287 = 8'h8b;
assign n0288 = ( n0001 == n0287 );
assign n0289 = 8'h9b;
assign n0290 = ( n0001 == n0289 );
assign n0291 = 8'hbb;
assign n0292 = ( n0001 == n0291 );
assign n0293 = 8'hcb;
assign n0294 = ( n0001 == n0293 );
assign n0295 = 8'hdb;
assign n0296 = ( n0001 == n0295 );
assign n0297 = 8'heb;
assign n0298 = ( n0001 == n0297 );
assign n0299 = ( n0274 || n0276 || n0278 || n0280 || n0282 || n0284 || n0286 || n0288 || n0290 || n0292 || n0294 || n0296 || n0298 );
assign n0300 = 3'h3;
assign n0301 = { ( n0061 ), ( n0062 ), ( n0300 ) };
assign n0302 = 8'h7;
assign n0303 = ( n0001 == n0302 );
assign n0304 = 8'h9;
assign n0305 = ( n0001 == n0304 );
assign n0306 = 8'h17;
assign n0307 = ( n0001 == n0306 );
assign n0308 = 8'h19;
assign n0309 = ( n0001 == n0308 );
assign n0310 = 8'h27;
assign n0311 = ( n0001 == n0310 );
assign n0312 = 8'h29;
assign n0313 = ( n0001 == n0312 );
assign n0314 = 8'h37;
assign n0315 = ( n0001 == n0314 );
assign n0316 = 8'h39;
assign n0317 = ( n0001 == n0316 );
assign n0318 = 8'h47;
assign n0319 = ( n0001 == n0318 );
assign n0320 = 8'h49;
assign n0321 = ( n0001 == n0320 );
assign n0322 = 8'h57;
assign n0323 = ( n0001 == n0322 );
assign n0324 = 8'h59;
assign n0325 = ( n0001 == n0324 );
assign n0326 = 8'h67;
assign n0327 = ( n0001 == n0326 );
assign n0328 = 8'h69;
assign n0329 = ( n0001 == n0328 );
assign n0330 = 8'h77;
assign n0331 = ( n0001 == n0330 );
assign n0332 = 8'h87;
assign n0333 = ( n0001 == n0332 );
assign n0334 = 8'h89;
assign n0335 = ( n0001 == n0334 );
assign n0336 = 8'h97;
assign n0337 = ( n0001 == n0336 );
assign n0338 = 8'h99;
assign n0339 = ( n0001 == n0338 );
assign n0340 = 8'ha7;
assign n0341 = ( n0001 == n0340 );
assign n0342 = 8'hb7;
assign n0343 = ( n0001 == n0342 );
assign n0344 = 8'hb9;
assign n0345 = ( n0001 == n0344 );
assign n0346 = 8'hc7;
assign n0347 = ( n0001 == n0346 );
assign n0348 = 8'hc9;
assign n0349 = ( n0001 == n0348 );
assign n0350 = 8'hd7;
assign n0351 = ( n0001 == n0350 );
assign n0352 = 8'hd9;
assign n0353 = ( n0001 == n0352 );
assign n0354 = 8'he7;
assign n0355 = ( n0001 == n0354 );
assign n0356 = 8'he9;
assign n0357 = ( n0001 == n0356 );
assign n0358 = 8'hf7;
assign n0359 = ( n0001 == n0358 );
assign n0360 = ( n0303 || n0305 || n0307 || n0309 || n0311 || n0313 || n0315 || n0317 || n0319 || n0321 || n0323 || n0325 || n0327 || n0329 || n0331 || n0333 || n0335 || n0337 || n0339 || n0341 || n0343 || n0345 || n0347 || n0349 || n0351 || n0353 || n0355 || n0357 || n0359 );
assign n0361 = 3'h1;
assign n0362 = { ( n0061 ), ( n0062 ), ( n0361 ) };
assign n0363 = 8'h22;
assign n0364 = ( n0001 == n0363 );
assign n0365 = 8'h32;
assign n0366 = ( n0001 == n0365 );
assign n0367 = 8'hd0;
assign n0368 = ( n0001 == n0367 );
assign n0369 = ( n0364 || n0366 || n0368 );
assign n0370 = 3'h4;
assign n0371 = { ( n0061 ), ( n0062 ), ( n0370 ) };
assign n0372 = ( n0369 ) ? ( SP ) : ( n0371 );
assign n0373 = ( n0360 ) ? ( n0362 ) : ( n0372 );
assign n0374 = ( n0299 ) ? ( n0301 ) : ( n0373 );
assign n0375 = ( n0270 ) ? ( n0272 ) : ( n0374 );
assign n0376 = ( n0241 ) ? ( n0243 ) : ( n0375 );
assign n0377 = ( n0214 ) ? ( n0120 ) : ( n0376 );
assign n0378 = ( n0155 ) ? ( n0157 ) : ( n0377 );
assign n0379 = ( n0117 ) ? ( n0128 ) : ( n0378 );
assign n0380 = ( n0090 ) ? ( n0092 ) : ( n0379 );
assign n0381 = ( n0060 ) ? ( n0063 ) : ( n0380 );
assign n0382 = IRAM[n0381];
assign _IRAM_RD0_ = n0382;
// MEMRD: _IRAM_RD1_ = (read-mem IRAM (if (or (eq (read-mem ROM PC) (bv 7 8)) (eq (read-mem ROM PC) (bv 23 8)) (eq (read-mem ROM PC) (bv 39 8)) (eq (read-mem ROM PC) (bv 55 8)) (eq (read-mem ROM PC) (bv 71 8)) (eq (read-mem ROM PC) (bv 87 8)) (eq (read-mem ROM PC) (bv 103 8)) (eq (read-mem ROM PC) (bv 135 8)) (eq (read-mem ROM PC) (bv 151 8)) (eq (read-mem ROM PC) (bv 183 8)) (eq (read-mem ROM PC) (bv 199 8)) (eq (read-mem ROM PC) (bv 215 8)) (eq (read-mem ROM PC) (bv 231 8))) (read-mem IRAM (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3))) (if (or (eq (read-mem ROM PC) (bv 6 8)) (eq (read-mem ROM PC) (bv 22 8)) (eq (read-mem ROM PC) (bv 38 8)) (eq (read-mem ROM PC) (bv 54 8)) (eq (read-mem ROM PC) (bv 70 8)) (eq (read-mem ROM PC) (bv 86 8)) (eq (read-mem ROM PC) (bv 102 8)) (eq (read-mem ROM PC) (bv 134 8)) (eq (read-mem ROM PC) (bv 150 8)) (eq (read-mem ROM PC) (bv 182 8)) (eq (read-mem ROM PC) (bv 198 8)) (eq (read-mem ROM PC) (bv 214 8)) (eq (read-mem ROM PC) (bv 230 8))) (read-mem IRAM (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3))) (if (or (eq (read-mem ROM PC) (bv 166 8)) (eq (read-mem ROM PC) (bv 167 8))) (read-mem ROM (add PC (bv 1 16))) (sub SP (bv 1 8))))))
assign n0383 = ( n0303 || n0307 || n0311 || n0315 || n0319 || n0323 || n0327 || n0333 || n0337 || n0343 || n0347 || n0351 || n0355 );
assign n0384 = IRAM[n0362];
assign n0385 = ( n0003 || n0007 || n0011 || n0015 || n0019 || n0023 || n0027 || n0033 || n0037 || n0043 || n0047 || n0051 || n0055 );
assign n0386 = IRAM[n0063];
assign n0387 = ( n0041 || n0341 );
assign n0388 = 8'h1;
assign n0389 = ( SP - n0388 );
assign n0390 = ( n0387 ) ? ( n0120 ) : ( n0389 );
assign n0391 = ( n0385 ) ? ( n0386 ) : ( n0390 );
assign n0392 = ( n0383 ) ? ( n0384 ) : ( n0391 );
assign n0393 = IRAM[n0392];
assign _IRAM_RD1_ = n0393;
// MEMRD: _ROM_RD0_ = (read-mem ROM PC)
assign _ROM_RD0_ = n0001;
// MEMRD: _ROM_RD1_ = (read-mem ROM (if (eq (read-mem ROM PC) (bv 131 8)) (add (zero-ext 8 ACC) (add PC (bv 1 16))) (if (or (eq (read-mem ROM PC) (bv 1 8)) (eq (read-mem ROM PC) (bv 17 8)) (eq (read-mem ROM PC) (bv 33 8)) (eq (read-mem ROM PC) (bv 49 8)) (eq (read-mem ROM PC) (bv 65 8)) (eq (read-mem ROM PC) (bv 81 8)) (eq (read-mem ROM PC) (bv 97 8)) (eq (read-mem ROM PC) (bv 113 8)) (eq (read-mem ROM PC) (bv 129 8)) (eq (read-mem ROM PC) (bv 133 8)) (eq (read-mem ROM PC) (bv 145 8)) (eq (read-mem ROM PC) (bv 161 8)) (eq (read-mem ROM PC) (bv 177 8)) (eq (read-mem ROM PC) (bv 193 8)) (eq (read-mem ROM PC) (bv 209 8)) (eq (read-mem ROM PC) (bv 225 8)) (eq (read-mem ROM PC) (bv 241 8))) (add PC (bv 2 16)) (if (eq (read-mem ROM PC) (bv 147 8)) (add (zero-ext 8 ACC) (concat DPH DPL)) (add PC (bv 1 16))))))
assign n0394 = 8'h83;
assign n0395 = ( n0001 == n0394 );
assign n0396 = { 8'b0, ACC };
assign n0397 = ( n0396 + n0119 );
assign n0398 = ( n0001 == n0388 );
assign n0399 = 8'h11;
assign n0400 = ( n0001 == n0399 );
assign n0401 = 8'h21;
assign n0402 = ( n0001 == n0401 );
assign n0403 = 8'h31;
assign n0404 = ( n0001 == n0403 );
assign n0405 = 8'h41;
assign n0406 = ( n0001 == n0405 );
assign n0407 = 8'h51;
assign n0408 = ( n0001 == n0407 );
assign n0409 = 8'h61;
assign n0410 = ( n0001 == n0409 );
assign n0411 = 8'h71;
assign n0412 = ( n0001 == n0411 );
assign n0413 = 8'h81;
assign n0414 = ( n0001 == n0413 );
assign n0415 = 8'h91;
assign n0416 = ( n0001 == n0415 );
assign n0417 = 8'ha1;
assign n0418 = ( n0001 == n0417 );
assign n0419 = 8'hb1;
assign n0420 = ( n0001 == n0419 );
assign n0421 = 8'hc1;
assign n0422 = ( n0001 == n0421 );
assign n0423 = 8'hd1;
assign n0424 = ( n0001 == n0423 );
assign n0425 = 8'he1;
assign n0426 = ( n0001 == n0425 );
assign n0427 = 8'hf1;
assign n0428 = ( n0001 == n0427 );
assign n0429 = ( n0398 || n0400 || n0402 || n0404 || n0406 || n0408 || n0410 || n0412 || n0414 || n0185 || n0416 || n0418 || n0420 || n0422 || n0424 || n0426 || n0428 );
assign n0430 = 16'h2;
assign n0431 = ( PC + n0430 );
assign n0432 = 8'h93;
assign n0433 = ( n0001 == n0432 );
assign n0434 = { ( DPH ), ( DPL ) };
assign n0435 = ( n0396 + n0434 );
assign n0436 = ( n0433 ) ? ( n0435 ) : ( n0119 );
assign n0437 = ( n0429 ) ? ( n0431 ) : ( n0436 );
assign n0438 = ( n0395 ) ? ( n0397 ) : ( n0437 );
assign n0439 = ROM[n0438];
assign _ROM_RD1_ = n0439;
// MEMRD: _ROM_RD2_ = (read-mem ROM (if (or (eq (read-mem ROM PC) (bv 2 8)) (eq (read-mem ROM PC) (bv 16 8)) (eq (read-mem ROM PC) (bv 18 8)) (eq (read-mem ROM PC) (bv 32 8)) (eq (read-mem ROM PC) (bv 48 8)) (eq (read-mem ROM PC) (bv 67 8)) (eq (read-mem ROM PC) (bv 83 8)) (eq (read-mem ROM PC) (bv 99 8)) (eq (read-mem ROM PC) (bv 117 8)) (eq (read-mem ROM PC) (bv 144 8)) (eq (read-mem ROM PC) (bv 180 8)) (eq (read-mem ROM PC) (bv 181 8)) (eq (read-mem ROM PC) (bv 182 8)) (eq (read-mem ROM PC) (bv 183 8)) (eq (read-mem ROM PC) (bv 184 8)) (eq (read-mem ROM PC) (bv 185 8)) (eq (read-mem ROM PC) (bv 186 8)) (eq (read-mem ROM PC) (bv 187 8)) (eq (read-mem ROM PC) (bv 188 8)) (eq (read-mem ROM PC) (bv 189 8)) (eq (read-mem ROM PC) (bv 190 8)) (eq (read-mem ROM PC) (bv 191 8)) (eq (read-mem ROM PC) (bv 213 8))) (add PC (bv 2 16)) (add PC (bv 1 16))))
assign n0440 = 8'h2;
assign n0441 = ( n0001 == n0440 );
assign n0442 = 8'h12;
assign n0443 = ( n0001 == n0442 );
assign n0444 = 8'h75;
assign n0445 = ( n0001 == n0444 );
assign n0446 = 8'h90;
assign n0447 = ( n0001 == n0446 );
assign n0448 = 8'hb4;
assign n0449 = ( n0001 == n0448 );
assign n0450 = 8'hbc;
assign n0451 = ( n0001 == n0450 );
assign n0452 = ( n0441 || n0094 || n0443 || n0096 || n0098 || n0169 || n0175 || n0181 || n0445 || n0447 || n0449 || n0205 || n0043 || n0343 || n0045 || n0345 || n0148 || n0292 || n0451 || n0263 || n0083 || n0234 || n0211 );
assign n0453 = ( n0452 ) ? ( n0431 ) : ( n0119 );
assign n0454 = ROM[n0453];
assign _ROM_RD2_ = n0454;
// 
// PC_00
// 
assign PC_00 = n0119;
// 
// PC_01
// 
assign n0455 = n0431[15:11];
assign n0456 = ROM[n0431];
assign n0457 = { ( n0456 ), ( n0120 ), ( _ROM_RD0_ ) };
assign n0458 = n0457[7:5];
assign n0459 = n0457[15:8];
assign n0460 = { ( n0455 ), ( n0458 ), ( n0459 ) };
assign PC_01 = n0460;
// 
// PC_02
// 
assign n0461 = { ( n0120 ), ( n0456 ) };
assign PC_02 = n0461;
// 
// ACC_03
// 
assign n0462 = { ACC[0], ACC[7:1] };
assign ACC_03 = n0462;
// 
// PC_03
// 
assign PC_03 = n0119;
// 
// ACC_04
// 
assign n0463 = ( ACC + n0388 );
assign ACC_04 = n0463;
// 
// PC_04
// 
assign PC_04 = n0119;
// 
// ACC_05
// 
assign n0464 = 8'he0;
assign n0465 = ( _IRAM_RD0_ == n0464 );
assign n0466 = _IRAM_RD0_[7:7];
assign n0467 = 1'h0;
assign n0468 = ( n0466 == n0467 );
assign n0469 = IRAM[_IRAM_RD0_];
assign n0470 = 8'h80;
assign n0471 = ( _IRAM_RD0_ == n0470 );
assign n0472 = ( _IRAM_RD0_ == n0413 );
assign n0473 = ( _IRAM_RD0_ == n0101 );
assign n0474 = ( _IRAM_RD0_ == n0394 );
assign n0475 = ( _IRAM_RD0_ == n0332 );
assign n0476 = ( _IRAM_RD0_ == n0034 );
assign n0477 = ( _IRAM_RD0_ == n0334 );
assign n0478 = ( _IRAM_RD0_ == n0143 );
assign n0479 = 8'h8c;
assign n0480 = ( _IRAM_RD0_ == n0479 );
assign n0481 = ( _IRAM_RD0_ == n0287 );
assign n0482 = ( _IRAM_RD0_ == n0258 );
assign n0483 = ( _IRAM_RD0_ == n0446 );
assign n0484 = ( _IRAM_RD0_ == n0038 );
assign n0485 = ( _IRAM_RD0_ == n0338 );
assign n0486 = ( _IRAM_RD0_ == n0105 );
assign n0487 = ( _IRAM_RD0_ == n0188 );
assign n0488 = ( _IRAM_RD0_ == n0109 );
assign n0489 = ( _IRAM_RD0_ == n0044 );
assign n0490 = ( _IRAM_RD0_ == n0367 );
assign n0491 = 8'hf0;
assign n0492 = ( _IRAM_RD0_ == n0491 );
assign n0493 = 8'h0;
assign n0494 = ( n0492 ) ? ( B ) : ( n0493 );
assign n0495 = ( n0465 ) ? ( ACC ) : ( n0494 );
assign n0496 = ( n0490 ) ? ( PSW ) : ( n0495 );
assign n0497 = ( n0489 ) ? ( IP ) : ( n0496 );
assign n0498 = ( n0488 ) ? ( P3 ) : ( n0497 );
assign n0499 = ( n0487 ) ? ( IE ) : ( n0498 );
assign n0500 = ( n0486 ) ? ( P2 ) : ( n0499 );
assign n0501 = ( n0485 ) ? ( SBUF ) : ( n0500 );
assign n0502 = ( n0484 ) ? ( SCON ) : ( n0501 );
assign n0503 = ( n0483 ) ? ( P1 ) : ( n0502 );
assign n0504 = ( n0482 ) ? ( TH1 ) : ( n0503 );
assign n0505 = ( n0481 ) ? ( TL1 ) : ( n0504 );
assign n0506 = ( n0480 ) ? ( TH0 ) : ( n0505 );
assign n0507 = ( n0478 ) ? ( TL0 ) : ( n0506 );
assign n0508 = ( n0477 ) ? ( TMOD ) : ( n0507 );
assign n0509 = ( n0476 ) ? ( TCON ) : ( n0508 );
assign n0510 = ( n0475 ) ? ( PCON ) : ( n0509 );
assign n0511 = ( n0474 ) ? ( DPH ) : ( n0510 );
assign n0512 = ( n0473 ) ? ( DPL ) : ( n0511 );
assign n0513 = ( n0472 ) ? ( SP ) : ( n0512 );
assign n0514 = ( n0471 ) ? ( P0 ) : ( n0513 );
assign n0515 = ( n0468 ) ? ( n0469 ) : ( n0514 );
assign n0516 = ( n0515 + n0388 );
assign n0517 = ( n0465 ) ? ( n0516 ) : ( ACC );
assign ACC_05 = n0517;
// 
// PCON_05
// 
assign n0518 = ( n0475 ) ? ( n0516 ) : ( PCON );
assign PCON_05 = n0518;
// 
// P1_05
// 
assign n0519 = ( n0483 ) ? ( n0516 ) : ( P1 );
assign P1_05 = n0519;
// 
// TMOD_05
// 
assign n0520 = ( n0477 ) ? ( n0516 ) : ( TMOD );
assign TMOD_05 = n0520;
// 
// DPL_05
// 
assign n0521 = ( n0473 ) ? ( n0516 ) : ( DPL );
assign DPL_05 = n0521;
// 
// DPH_05
// 
assign n0522 = ( n0474 ) ? ( n0516 ) : ( DPH );
assign DPH_05 = n0522;
// 
// TL1_05
// 
assign n0523 = ( n0481 ) ? ( n0516 ) : ( TL1 );
assign TL1_05 = n0523;
// 
// TL0_05
// 
assign n0524 = ( n0478 ) ? ( n0516 ) : ( TL0 );
assign TL0_05 = n0524;
// 
// TCON_05
// 
assign n0525 = ( n0476 ) ? ( n0516 ) : ( TCON );
assign TCON_05 = n0525;
// 
// TH1_05
// 
assign n0526 = ( n0482 ) ? ( n0516 ) : ( TH1 );
assign TH1_05 = n0526;
// 
// TH0_05
// 
assign n0527 = ( n0480 ) ? ( n0516 ) : ( TH0 );
assign TH0_05 = n0527;
// 
// PC_05
// 
assign PC_05 = n0431;
// 
// P2_05
// 
assign n0528 = ( n0486 ) ? ( n0516 ) : ( P2 );
assign P2_05 = n0528;
// 
// P3_05
// 
assign n0529 = ( n0488 ) ? ( n0516 ) : ( P3 );
assign P3_05 = n0529;
// 
// P0_05
// 
assign n0530 = ( n0471 ) ? ( n0516 ) : ( P0 );
assign P0_05 = n0530;
// 
// B_05
// 
assign n0531 = ( n0492 ) ? ( n0516 ) : ( B );
assign B_05 = n0531;
// 
// IRAM_05
// 
// 
// IP_05
// 
assign n0532 = ( n0489 ) ? ( n0516 ) : ( IP );
assign IP_05 = n0532;
// 
// IE_05
// 
assign n0533 = ( n0487 ) ? ( n0516 ) : ( IE );
assign IE_05 = n0533;
// 
// SCON_05
// 
assign n0534 = ( n0484 ) ? ( n0516 ) : ( SCON );
assign SCON_05 = n0534;
// 
// SP_05
// 
assign n0535 = ( n0472 ) ? ( n0516 ) : ( SP );
assign SP_05 = n0535;
// 
// SBUF_05
// 
assign n0536 = ( n0485 ) ? ( n0516 ) : ( SBUF );
assign SBUF_05 = n0536;
// 
// PSW_05
// 
assign n0537 = ( n0490 ) ? ( n0516 ) : ( PSW );
assign PSW_05 = n0537;
// 
// PC_06
// 
assign PC_06 = n0119;
// 
// IRAM_06
// 
assign n0538 = IRAM[_IRAM_RD1_];
assign n0539 = ( n0538 + n0388 );
// 
// PC_07
// 
assign PC_07 = n0119;
// 
// IRAM_07
// 
// 
// PC_08
// 
assign PC_08 = n0119;
// 
// IRAM_08
// 
assign n0540 = ( n0469 + n0388 );
// 
// PC_09
// 
assign PC_09 = n0119;
// 
// IRAM_09
// 
// 
// PC_0a
// 
assign PC_0a = n0119;
// 
// IRAM_0a
// 
// 
// PC_0b
// 
assign PC_0b = n0119;
// 
// IRAM_0b
// 
// 
// PC_0c
// 
assign PC_0c = n0119;
// 
// IRAM_0c
// 
// 
// PC_0d
// 
assign PC_0d = n0119;
// 
// IRAM_0d
// 
// 
// PC_0e
// 
assign PC_0e = n0119;
// 
// IRAM_0e
// 
// 
// PC_0f
// 
assign PC_0f = n0119;
// 
// IRAM_0f
// 
// 
// ACC_10
// 
assign n0541 = n0120[2:0];
assign n0542 = { 5'b0, n0541 };
assign n0543 = ( n0388 << n0542 );
assign n0544 = ~( n0543 );
assign n0545 = ( n0484 ) ? ( SCON ) : ( n0500 );
assign n0546 = ( n0483 ) ? ( P1 ) : ( n0545 );
assign n0547 = ( n0476 ) ? ( TCON ) : ( n0546 );
assign n0548 = ( n0471 ) ? ( P0 ) : ( n0547 );
assign n0549 = ( n0468 ) ? ( n0469 ) : ( n0548 );
assign n0550 = ( n0544 & n0549 );
assign n0551 = { 7'b0, n0467 };
assign n0552 = ( n0551 << n0542 );
assign n0553 = ( n0550 | n0552 );
assign n0554 = ( n0465 ) ? ( n0553 ) : ( ACC );
assign ACC_10 = n0554;
// 
// P1_10
// 
assign n0555 = ( n0483 ) ? ( n0553 ) : ( P1 );
assign P1_10 = n0555;
// 
// IE_10
// 
assign n0556 = ( n0487 ) ? ( n0553 ) : ( IE );
assign IE_10 = n0556;
// 
// PC_10
// 
assign n0557 = n0549[n0541];
assign n0558 = ( n0557 == n0122 );
assign n0559 = 16'h3;
assign n0560 = ( PC + n0559 );
assign n0561 = { n0456[7], n0456[7], n0456[7], n0456[7], n0456[7], n0456[7], n0456[7], n0456[7], n0456 };
assign n0562 = ( n0560 + n0561 );
assign n0563 = ( n0558 ) ? ( n0562 ) : ( n0560 );
assign PC_10 = n0563;
// 
// P2_10
// 
assign n0564 = ( n0486 ) ? ( n0553 ) : ( P2 );
assign P2_10 = n0564;
// 
// P3_10
// 
assign n0565 = ( n0488 ) ? ( n0553 ) : ( P3 );
assign P3_10 = n0565;
// 
// P0_10
// 
assign n0566 = ( n0471 ) ? ( n0553 ) : ( P0 );
assign P0_10 = n0566;
// 
// B_10
// 
assign n0567 = ( n0492 ) ? ( n0553 ) : ( B );
assign B_10 = n0567;
// 
// IRAM_10
// 
// 
// IP_10
// 
assign n0568 = ( n0489 ) ? ( n0553 ) : ( IP );
assign IP_10 = n0568;
// 
// TCON_10
// 
assign n0569 = ( n0476 ) ? ( n0553 ) : ( TCON );
assign TCON_10 = n0569;
// 
// SCON_10
// 
assign n0570 = ( n0484 ) ? ( n0553 ) : ( SCON );
assign SCON_10 = n0570;
// 
// PSW_10
// 
assign n0571 = ( n0490 ) ? ( n0553 ) : ( PSW );
assign PSW_10 = n0571;
// 
// PC_11
// 
assign n0572 = n0457[3:1];
assign n0573 = { ( n0455 ), ( n0572 ), ( n0459 ) };
assign PC_11 = n0573;
// 
// IRAM_11
// 
assign n0574 = ( SP + n0388 );
assign n0575 = n0431[7:0];
assign n0576 = ( n0574 + n0388 );
assign n0577 = n0431[15:8];
// 
// SP_11
// 
assign n0578 = ( SP + n0440 );
assign SP_11 = n0578;
// 
// PC_12
// 
assign PC_12 = n0461;
// 
// IRAM_12
// 
assign n0579 = n0560[7:0];
assign n0580 = n0560[15:8];
// 
// SP_12
// 
assign SP_12 = n0578;
// 
// ACC_13
// 
assign n0581 = PSW[7:7];
assign n0582 = { ( ACC ), ( n0581 ) };
assign n0583 = { n0582[0], n0582[8:1] };
assign n0584 = n0583[8:1];
assign ACC_13 = n0584;
// 
// PC_13
// 
assign PC_13 = n0119;
// 
// PSW_13
// 
assign n0585 = ACC[0:0];
assign n0586 = PSW[6:6];
assign n0587 = PSW[5:3];
assign n0588 = PSW[2:2];
assign n0589 = PSW[1:0];
assign n0590 = { ( n0585 ), ( n0586 ), ( n0587 ), ( n0588 ), ( n0589 ) };
assign PSW_13 = n0590;
// 
// ACC_14
// 
assign n0591 = ( ACC - n0388 );
assign ACC_14 = n0591;
// 
// PC_14
// 
assign PC_14 = n0119;
// 
// ACC_15
// 
assign n0592 = ( n0515 - n0388 );
assign n0593 = ( n0465 ) ? ( n0592 ) : ( ACC );
assign ACC_15 = n0593;
// 
// PCON_15
// 
assign n0594 = ( n0475 ) ? ( n0592 ) : ( PCON );
assign PCON_15 = n0594;
// 
// P1_15
// 
assign n0595 = ( n0483 ) ? ( n0592 ) : ( P1 );
assign P1_15 = n0595;
// 
// TMOD_15
// 
assign n0596 = ( n0477 ) ? ( n0592 ) : ( TMOD );
assign TMOD_15 = n0596;
// 
// DPL_15
// 
assign n0597 = ( n0473 ) ? ( n0592 ) : ( DPL );
assign DPL_15 = n0597;
// 
// DPH_15
// 
assign n0598 = ( n0474 ) ? ( n0592 ) : ( DPH );
assign DPH_15 = n0598;
// 
// TL1_15
// 
assign n0599 = ( n0481 ) ? ( n0592 ) : ( TL1 );
assign TL1_15 = n0599;
// 
// TL0_15
// 
assign n0600 = ( n0478 ) ? ( n0592 ) : ( TL0 );
assign TL0_15 = n0600;
// 
// IE_15
// 
assign n0601 = ( n0487 ) ? ( n0592 ) : ( IE );
assign IE_15 = n0601;
// 
// TH1_15
// 
assign n0602 = ( n0482 ) ? ( n0592 ) : ( TH1 );
assign TH1_15 = n0602;
// 
// TH0_15
// 
assign n0603 = ( n0480 ) ? ( n0592 ) : ( TH0 );
assign TH0_15 = n0603;
// 
// PC_15
// 
assign PC_15 = n0431;
// 
// P2_15
// 
assign n0604 = ( n0486 ) ? ( n0592 ) : ( P2 );
assign P2_15 = n0604;
// 
// P3_15
// 
assign n0605 = ( n0488 ) ? ( n0592 ) : ( P3 );
assign P3_15 = n0605;
// 
// P0_15
// 
assign n0606 = ( n0471 ) ? ( n0592 ) : ( P0 );
assign P0_15 = n0606;
// 
// B_15
// 
assign n0607 = ( n0492 ) ? ( n0592 ) : ( B );
assign B_15 = n0607;
// 
// IRAM_15
// 
// 
// IP_15
// 
assign n0608 = ( n0489 ) ? ( n0592 ) : ( IP );
assign IP_15 = n0608;
// 
// TCON_15
// 
assign n0609 = ( n0476 ) ? ( n0592 ) : ( TCON );
assign TCON_15 = n0609;
// 
// SCON_15
// 
assign n0610 = ( n0484 ) ? ( n0592 ) : ( SCON );
assign SCON_15 = n0610;
// 
// SP_15
// 
assign n0611 = ( n0472 ) ? ( n0592 ) : ( SP );
assign SP_15 = n0611;
// 
// SBUF_15
// 
assign n0612 = ( n0485 ) ? ( n0592 ) : ( SBUF );
assign SBUF_15 = n0612;
// 
// PSW_15
// 
assign n0613 = ( n0490 ) ? ( n0592 ) : ( PSW );
assign PSW_15 = n0613;
// 
// PC_16
// 
assign PC_16 = n0119;
// 
// IRAM_16
// 
assign n0614 = ( n0538 - n0388 );
// 
// PC_17
// 
assign PC_17 = n0119;
// 
// IRAM_17
// 
// 
// PC_18
// 
assign PC_18 = n0119;
// 
// IRAM_18
// 
assign n0615 = ( n0469 - n0388 );
// 
// PC_19
// 
assign PC_19 = n0119;
// 
// IRAM_19
// 
// 
// PC_1a
// 
assign PC_1a = n0119;
// 
// IRAM_1a
// 
// 
// PC_1b
// 
assign PC_1b = n0119;
// 
// IRAM_1b
// 
// 
// PC_1c
// 
assign PC_1c = n0119;
// 
// IRAM_1c
// 
// 
// PC_1d
// 
assign PC_1d = n0119;
// 
// IRAM_1d
// 
// 
// PC_1e
// 
assign PC_1e = n0119;
// 
// IRAM_1e
// 
// 
// PC_1f
// 
assign PC_1f = n0119;
// 
// IRAM_1f
// 
// 
// PC_20
// 
assign PC_20 = n0563;
// 
// PC_21
// 
assign PC_21 = n0460;
// 
// PC_22
// 
assign n0616 = ( _IRAM_RD0_ - n0388 );
assign n0617 = IRAM[n0616];
assign n0618 = { ( n0469 ), ( n0617 ) };
assign PC_22 = n0618;
// 
// SP_22
// 
assign n0619 = ( _IRAM_RD0_ - n0440 );
assign SP_22 = n0619;
// 
// ACC_23
// 
assign n0620 = { ACC[6:0], ACC[7] };
assign ACC_23 = n0620;
// 
// PC_23
// 
assign PC_23 = n0119;
// 
// ACC_24
// 
assign n0621 = ( ACC + n0120 );
assign ACC_24 = n0621;
// 
// PC_24
// 
assign PC_24 = n0431;
// 
// PSW_24
// 
assign n0622 = { 1'b0, ACC };
assign n0623 = { 1'b0, n0120 };
assign n0624 = { n0467[0], n0467[0], n0467[0], n0467[0], n0467[0], n0467[0], n0467[0], n0467[0], n0467 };
assign n0625 = ( n0623 + n0624 );
assign n0626 = ( n0622 + n0625 );
assign n0627 = n0626[8:8];
assign n0628 = ACC[3:0];
assign n0629 = { 1'b0, n0628 };
assign n0630 = n0120[3:0];
assign n0631 = { 1'b0, n0630 };
assign n0632 = { 4'b0, n0467 };
assign n0633 = ( n0631 + n0632 );
assign n0634 = ( n0629 + n0633 );
assign n0635 = n0634[4:4];
assign n0636 = { ACC[7], ACC };
assign n0637 = { n0120[7], n0120 };
assign n0638 = ( n0637 + n0624 );
assign n0639 = ( n0636 + n0638 );
assign n0640 = n0639[8:8];
assign n0641 = n0639[7:7];
assign n0642 = ( n0640 == n0641 );
assign n0643 = !( n0642 );
assign n0644 = ( n0643 ) ? ( n0122 ) : ( n0467 );
assign n0645 = { ( n0627 ), ( n0635 ), ( n0587 ), ( n0644 ), ( n0589 ) };
assign PSW_24 = n0645;
// 
// ACC_25
// 
assign n0646 = ( ACC + n0515 );
assign ACC_25 = n0646;
// 
// PC_25
// 
assign PC_25 = n0431;
// 
// PSW_25
// 
assign n0647 = { 1'b0, n0515 };
assign n0648 = ( n0647 + n0624 );
assign n0649 = ( n0622 + n0648 );
assign n0650 = n0649[8:8];
assign n0651 = n0515[3:0];
assign n0652 = { 1'b0, n0651 };
assign n0653 = { n0467[0], n0467[0], n0467[0], n0467[0], n0467 };
assign n0654 = ( n0652 + n0653 );
assign n0655 = ( n0629 + n0654 );
assign n0656 = n0655[4:4];
assign n0657 = { n0515[7], n0515 };
assign n0658 = ( n0657 + n0624 );
assign n0659 = ( n0636 + n0658 );
assign n0660 = n0659[8:8];
assign n0661 = n0659[7:7];
assign n0662 = ( n0660 == n0661 );
assign n0663 = !( n0662 );
assign n0664 = ( n0663 ) ? ( n0122 ) : ( n0467 );
assign n0665 = { ( n0650 ), ( n0656 ), ( n0587 ), ( n0664 ), ( n0589 ) };
assign PSW_25 = n0665;
// 
// ACC_26
// 
assign n0666 = ( ACC + n0538 );
assign ACC_26 = n0666;
// 
// PC_26
// 
assign PC_26 = n0119;
// 
// PSW_26
// 
assign n0667 = { 1'b0, n0538 };
assign n0668 = ( n0667 + n0624 );
assign n0669 = ( n0622 + n0668 );
assign n0670 = n0669[8:8];
assign n0671 = n0538[3:0];
assign n0672 = { 1'b0, n0671 };
assign n0673 = ( n0672 + n0653 );
assign n0674 = ( n0629 + n0673 );
assign n0675 = n0674[4:4];
assign n0676 = { n0538[7], n0538 };
assign n0677 = ( n0676 + n0624 );
assign n0678 = ( n0636 + n0677 );
assign n0679 = n0678[8:8];
assign n0680 = n0678[7:7];
assign n0681 = ( n0679 == n0680 );
assign n0682 = !( n0681 );
assign n0683 = ( n0682 ) ? ( n0122 ) : ( n0467 );
assign n0684 = { ( n0670 ), ( n0675 ), ( n0587 ), ( n0683 ), ( n0589 ) };
assign PSW_26 = n0684;
// 
// ACC_27
// 
assign ACC_27 = n0666;
// 
// PC_27
// 
assign PC_27 = n0119;
// 
// PSW_27
// 
assign n0685 = { 8'b0, n0467 };
assign n0686 = ( n0667 + n0685 );
assign n0687 = ( n0622 + n0686 );
assign n0688 = n0687[8:8];
assign n0689 = ( n0676 + n0685 );
assign n0690 = ( n0636 + n0689 );
assign n0691 = n0690[8:8];
assign n0692 = n0690[7:7];
assign n0693 = ( n0691 == n0692 );
assign n0694 = !( n0693 );
assign n0695 = ( n0694 ) ? ( n0122 ) : ( n0467 );
assign n0696 = { ( n0688 ), ( n0675 ), ( n0587 ), ( n0695 ), ( n0589 ) };
assign PSW_27 = n0696;
// 
// ACC_28
// 
assign n0697 = ( ACC + n0469 );
assign ACC_28 = n0697;
// 
// PC_28
// 
assign PC_28 = n0119;
// 
// PSW_28
// 
assign n0698 = { 1'b0, n0469 };
assign n0699 = ( n0698 + n0685 );
assign n0700 = ( n0622 + n0699 );
assign n0701 = n0700[8:8];
assign n0702 = n0469[3:0];
assign n0703 = { 1'b0, n0702 };
assign n0704 = ( n0703 + n0632 );
assign n0705 = ( n0629 + n0704 );
assign n0706 = n0705[4:4];
assign n0707 = { n0469[7], n0469 };
assign n0708 = ( n0707 + n0685 );
assign n0709 = ( n0636 + n0708 );
assign n0710 = n0709[8:8];
assign n0711 = n0709[7:7];
assign n0712 = ( n0710 == n0711 );
assign n0713 = !( n0712 );
assign n0714 = ( n0713 ) ? ( n0122 ) : ( n0467 );
assign n0715 = { ( n0701 ), ( n0706 ), ( n0587 ), ( n0714 ), ( n0589 ) };
assign PSW_28 = n0715;
// 
// ACC_29
// 
assign ACC_29 = n0697;
// 
// PC_29
// 
assign PC_29 = n0119;
// 
// PSW_29
// 
assign PSW_29 = n0715;
// 
// ACC_2a
// 
assign ACC_2a = n0697;
// 
// PC_2a
// 
assign PC_2a = n0119;
// 
// PSW_2a
// 
assign n0716 = ( n0703 + n0653 );
assign n0717 = ( n0629 + n0716 );
assign n0718 = n0717[4:4];
assign n0719 = { ( n0701 ), ( n0718 ), ( n0587 ), ( n0714 ), ( n0589 ) };
assign PSW_2a = n0719;
// 
// ACC_2b
// 
assign ACC_2b = n0697;
// 
// PC_2b
// 
assign PC_2b = n0119;
// 
// PSW_2b
// 
assign n0720 = ( n0698 + n0624 );
assign n0721 = ( n0622 + n0720 );
assign n0722 = n0721[8:8];
assign n0723 = ( n0707 + n0624 );
assign n0724 = ( n0636 + n0723 );
assign n0725 = n0724[8:8];
assign n0726 = n0724[7:7];
assign n0727 = ( n0725 == n0726 );
assign n0728 = !( n0727 );
assign n0729 = ( n0728 ) ? ( n0122 ) : ( n0467 );
assign n0730 = { ( n0722 ), ( n0718 ), ( n0587 ), ( n0729 ), ( n0589 ) };
assign PSW_2b = n0730;
// 
// ACC_2c
// 
assign ACC_2c = n0697;
// 
// PC_2c
// 
assign PC_2c = n0119;
// 
// PSW_2c
// 
assign PSW_2c = n0730;
// 
// ACC_2d
// 
assign ACC_2d = n0697;
// 
// PC_2d
// 
assign PC_2d = n0119;
// 
// PSW_2d
// 
assign PSW_2d = n0715;
// 
// ACC_2e
// 
assign ACC_2e = n0697;
// 
// PC_2e
// 
assign PC_2e = n0119;
// 
// PSW_2e
// 
assign n0731 = { ( n0722 ), ( n0706 ), ( n0587 ), ( n0729 ), ( n0589 ) };
assign PSW_2e = n0731;
// 
// ACC_2f
// 
assign ACC_2f = n0697;
// 
// PC_2f
// 
assign PC_2f = n0119;
// 
// PSW_2f
// 
assign PSW_2f = n0731;
// 
// PC_30
// 
assign n0732 = ( n0557 == n0467 );
assign n0733 = ( n0732 ) ? ( n0562 ) : ( n0560 );
assign PC_30 = n0733;
// 
// PC_31
// 
assign PC_31 = n0460;
// 
// IRAM_31
// 
// 
// SP_31
// 
assign SP_31 = n0578;
// 
// PC_32
// 
assign PC_32 = n0618;
// 
// SP_32
// 
assign SP_32 = n0619;
// 
// ACC_33
// 
assign n0734 = { ( n0581 ), ( ACC ) };
assign n0735 = { n0734[7:0], n0734[8] };
assign n0736 = n0735[7:0];
assign ACC_33 = n0736;
// 
// PC_33
// 
assign PC_33 = n0119;
// 
// PSW_33
// 
assign n0737 = ACC[7:7];
assign n0738 = { ( n0737 ), ( n0586 ), ( n0587 ), ( n0588 ), ( n0589 ) };
assign PSW_33 = n0738;
// 
// ACC_34
// 
assign n0739 = { 7'b0, n0581 };
assign n0740 = ( n0120 + n0739 );
assign n0741 = ( ACC + n0740 );
assign ACC_34 = n0741;
// 
// PC_34
// 
assign PC_34 = n0431;
// 
// PSW_34
// 
assign n0742 = { 8'b0, n0581 };
assign n0743 = ( n0623 + n0742 );
assign n0744 = ( n0622 + n0743 );
assign n0745 = n0744[8:8];
assign n0746 = { 4'b0, n0581 };
assign n0747 = ( n0631 + n0746 );
assign n0748 = ( n0629 + n0747 );
assign n0749 = n0748[4:4];
assign n0750 = ( n0637 + n0742 );
assign n0751 = ( n0636 + n0750 );
assign n0752 = n0751[8:8];
assign n0753 = n0751[7:7];
assign n0754 = ( n0752 == n0753 );
assign n0755 = !( n0754 );
assign n0756 = ( n0755 ) ? ( n0122 ) : ( n0467 );
assign n0757 = { ( n0745 ), ( n0749 ), ( n0587 ), ( n0756 ), ( n0589 ) };
assign PSW_34 = n0757;
// 
// ACC_35
// 
assign n0758 = ( n0515 + n0739 );
assign n0759 = ( ACC + n0758 );
assign ACC_35 = n0759;
// 
// PC_35
// 
assign PC_35 = n0431;
// 
// PSW_35
// 
assign n0760 = ( n0647 + n0742 );
assign n0761 = ( n0622 + n0760 );
assign n0762 = n0761[8:8];
assign n0763 = ( n0652 + n0746 );
assign n0764 = ( n0629 + n0763 );
assign n0765 = n0764[4:4];
assign n0766 = ( n0657 + n0742 );
assign n0767 = ( n0636 + n0766 );
assign n0768 = n0767[8:8];
assign n0769 = n0767[7:7];
assign n0770 = ( n0768 == n0769 );
assign n0771 = !( n0770 );
assign n0772 = ( n0771 ) ? ( n0122 ) : ( n0467 );
assign n0773 = { ( n0762 ), ( n0765 ), ( n0587 ), ( n0772 ), ( n0589 ) };
assign PSW_35 = n0773;
// 
// ACC_36
// 
assign n0774 = ( n0538 + n0739 );
assign n0775 = ( ACC + n0774 );
assign ACC_36 = n0775;
// 
// PC_36
// 
assign PC_36 = n0119;
// 
// PSW_36
// 
assign n0776 = ( n0667 + n0742 );
assign n0777 = ( n0622 + n0776 );
assign n0778 = n0777[8:8];
assign n0779 = ( n0672 + n0746 );
assign n0780 = ( n0629 + n0779 );
assign n0781 = n0780[4:4];
assign n0782 = ( n0676 + n0742 );
assign n0783 = ( n0636 + n0782 );
assign n0784 = n0783[8:8];
assign n0785 = n0783[7:7];
assign n0786 = ( n0784 == n0785 );
assign n0787 = !( n0786 );
assign n0788 = ( n0787 ) ? ( n0122 ) : ( n0467 );
assign n0789 = { ( n0778 ), ( n0781 ), ( n0587 ), ( n0788 ), ( n0589 ) };
assign PSW_36 = n0789;
// 
// ACC_37
// 
assign ACC_37 = n0775;
// 
// PC_37
// 
assign PC_37 = n0119;
// 
// PSW_37
// 
assign PSW_37 = n0789;
// 
// ACC_38
// 
assign n0790 = ( n0469 + n0739 );
assign n0791 = ( ACC + n0790 );
assign ACC_38 = n0791;
// 
// PC_38
// 
assign PC_38 = n0119;
// 
// PSW_38
// 
assign n0792 = ( n0698 + n0742 );
assign n0793 = ( n0622 + n0792 );
assign n0794 = n0793[8:8];
assign n0795 = ( n0703 + n0746 );
assign n0796 = ( n0629 + n0795 );
assign n0797 = n0796[4:4];
assign n0798 = ( n0707 + n0742 );
assign n0799 = ( n0636 + n0798 );
assign n0800 = n0799[8:8];
assign n0801 = n0799[7:7];
assign n0802 = ( n0800 == n0801 );
assign n0803 = !( n0802 );
assign n0804 = ( n0803 ) ? ( n0122 ) : ( n0467 );
assign n0805 = { ( n0794 ), ( n0797 ), ( n0587 ), ( n0804 ), ( n0589 ) };
assign PSW_38 = n0805;
// 
// ACC_39
// 
assign ACC_39 = n0791;
// 
// PC_39
// 
assign PC_39 = n0119;
// 
// PSW_39
// 
assign PSW_39 = n0805;
// 
// ACC_3a
// 
assign ACC_3a = n0791;
// 
// PC_3a
// 
assign PC_3a = n0119;
// 
// PSW_3a
// 
assign PSW_3a = n0805;
// 
// ACC_3b
// 
assign ACC_3b = n0791;
// 
// PC_3b
// 
assign PC_3b = n0119;
// 
// PSW_3b
// 
assign PSW_3b = n0805;
// 
// ACC_3c
// 
assign ACC_3c = n0791;
// 
// PC_3c
// 
assign PC_3c = n0119;
// 
// PSW_3c
// 
assign PSW_3c = n0805;
// 
// ACC_3d
// 
assign ACC_3d = n0791;
// 
// PC_3d
// 
assign PC_3d = n0119;
// 
// PSW_3d
// 
assign PSW_3d = n0805;
// 
// ACC_3e
// 
assign ACC_3e = n0791;
// 
// PC_3e
// 
assign PC_3e = n0119;
// 
// PSW_3e
// 
assign PSW_3e = n0805;
// 
// ACC_3f
// 
assign ACC_3f = n0791;
// 
// PC_3f
// 
assign PC_3f = n0119;
// 
// PSW_3f
// 
assign PSW_3f = n0805;
// 
// PC_40
// 
assign n0806 = ( n0581 == n0122 );
assign n0807 = { n0120[7], n0120[7], n0120[7], n0120[7], n0120[7], n0120[7], n0120[7], n0120[7], n0120 };
assign n0808 = ( n0431 + n0807 );
assign n0809 = ( n0806 ) ? ( n0808 ) : ( n0431 );
assign PC_40 = n0809;
// 
// PC_41
// 
assign PC_41 = n0460;
// 
// PCON_42
// 
assign n0810 = ( n0515 | ACC );
assign n0811 = ( n0475 ) ? ( n0810 ) : ( PCON );
assign PCON_42 = n0811;
// 
// B_42
// 
assign n0812 = ( n0492 ) ? ( n0810 ) : ( B );
assign B_42 = n0812;
// 
// TMOD_42
// 
assign n0813 = ( n0477 ) ? ( n0810 ) : ( TMOD );
assign TMOD_42 = n0813;
// 
// DPL_42
// 
assign n0814 = ( n0473 ) ? ( n0810 ) : ( DPL );
assign DPL_42 = n0814;
// 
// DPH_42
// 
assign n0815 = ( n0474 ) ? ( n0810 ) : ( DPH );
assign DPH_42 = n0815;
// 
// TL1_42
// 
assign n0816 = ( n0481 ) ? ( n0810 ) : ( TL1 );
assign TL1_42 = n0816;
// 
// TL0_42
// 
assign n0817 = ( n0478 ) ? ( n0810 ) : ( TL0 );
assign TL0_42 = n0817;
// 
// IE_42
// 
assign n0818 = ( n0487 ) ? ( n0810 ) : ( IE );
assign IE_42 = n0818;
// 
// TH1_42
// 
assign n0819 = ( n0482 ) ? ( n0810 ) : ( TH1 );
assign TH1_42 = n0819;
// 
// TH0_42
// 
assign n0820 = ( n0480 ) ? ( n0810 ) : ( TH0 );
assign TH0_42 = n0820;
// 
// PC_42
// 
assign PC_42 = n0431;
// 
// P2_42
// 
assign n0821 = ( n0486 ) ? ( n0810 ) : ( P2 );
assign P2_42 = n0821;
// 
// P3_42
// 
assign n0822 = ( n0488 ) ? ( n0810 ) : ( P3 );
assign P3_42 = n0822;
// 
// P0_42
// 
assign n0823 = ( n0471 ) ? ( n0810 ) : ( P0 );
assign P0_42 = n0823;
// 
// P1_42
// 
assign n0824 = ( n0483 ) ? ( n0810 ) : ( P1 );
assign P1_42 = n0824;
// 
// IRAM_42
// 
// 
// IP_42
// 
assign n0825 = ( n0489 ) ? ( n0810 ) : ( IP );
assign IP_42 = n0825;
// 
// TCON_42
// 
assign n0826 = ( n0476 ) ? ( n0810 ) : ( TCON );
assign TCON_42 = n0826;
// 
// SCON_42
// 
assign n0827 = ( n0484 ) ? ( n0810 ) : ( SCON );
assign SCON_42 = n0827;
// 
// SP_42
// 
assign n0828 = ( n0472 ) ? ( n0810 ) : ( SP );
assign SP_42 = n0828;
// 
// SBUF_42
// 
assign n0829 = ( n0485 ) ? ( n0810 ) : ( SBUF );
assign SBUF_42 = n0829;
// 
// PSW_42
// 
assign n0830 = ( n0490 ) ? ( n0810 ) : ( PSW );
assign PSW_42 = n0830;
// 
// ACC_43
// 
assign n0831 = ( n0515 | n0456 );
assign n0832 = ( n0465 ) ? ( n0831 ) : ( ACC );
assign ACC_43 = n0832;
// 
// PCON_43
// 
assign n0833 = ( n0475 ) ? ( n0831 ) : ( PCON );
assign PCON_43 = n0833;
// 
// B_43
// 
assign n0834 = ( n0492 ) ? ( n0831 ) : ( B );
assign B_43 = n0834;
// 
// TMOD_43
// 
assign n0835 = ( n0477 ) ? ( n0831 ) : ( TMOD );
assign TMOD_43 = n0835;
// 
// DPL_43
// 
assign n0836 = ( n0473 ) ? ( n0831 ) : ( DPL );
assign DPL_43 = n0836;
// 
// DPH_43
// 
assign n0837 = ( n0474 ) ? ( n0831 ) : ( DPH );
assign DPH_43 = n0837;
// 
// TL1_43
// 
assign n0838 = ( n0481 ) ? ( n0831 ) : ( TL1 );
assign TL1_43 = n0838;
// 
// TL0_43
// 
assign n0839 = ( n0478 ) ? ( n0831 ) : ( TL0 );
assign TL0_43 = n0839;
// 
// IE_43
// 
assign n0840 = ( n0487 ) ? ( n0831 ) : ( IE );
assign IE_43 = n0840;
// 
// TH1_43
// 
assign n0841 = ( n0482 ) ? ( n0831 ) : ( TH1 );
assign TH1_43 = n0841;
// 
// TH0_43
// 
assign n0842 = ( n0480 ) ? ( n0831 ) : ( TH0 );
assign TH0_43 = n0842;
// 
// PC_43
// 
assign PC_43 = n0560;
// 
// P2_43
// 
assign n0843 = ( n0486 ) ? ( n0831 ) : ( P2 );
assign P2_43 = n0843;
// 
// P3_43
// 
assign n0844 = ( n0488 ) ? ( n0831 ) : ( P3 );
assign P3_43 = n0844;
// 
// P0_43
// 
assign n0845 = ( n0471 ) ? ( n0831 ) : ( P0 );
assign P0_43 = n0845;
// 
// P1_43
// 
assign n0846 = ( n0483 ) ? ( n0831 ) : ( P1 );
assign P1_43 = n0846;
// 
// IRAM_43
// 
// 
// IP_43
// 
assign n0847 = ( n0489 ) ? ( n0831 ) : ( IP );
assign IP_43 = n0847;
// 
// TCON_43
// 
assign n0848 = ( n0476 ) ? ( n0831 ) : ( TCON );
assign TCON_43 = n0848;
// 
// SCON_43
// 
assign n0849 = ( n0484 ) ? ( n0831 ) : ( SCON );
assign SCON_43 = n0849;
// 
// SP_43
// 
assign n0850 = ( n0472 ) ? ( n0831 ) : ( SP );
assign SP_43 = n0850;
// 
// SBUF_43
// 
assign n0851 = ( n0485 ) ? ( n0831 ) : ( SBUF );
assign SBUF_43 = n0851;
// 
// PSW_43
// 
assign n0852 = ( n0490 ) ? ( n0831 ) : ( PSW );
assign PSW_43 = n0852;
// 
// ACC_44
// 
assign n0853 = ( ACC | n0120 );
assign ACC_44 = n0853;
// 
// PC_44
// 
assign PC_44 = n0431;
// 
// ACC_45
// 
assign n0854 = ( ACC | n0515 );
assign ACC_45 = n0854;
// 
// PC_45
// 
assign PC_45 = n0431;
// 
// ACC_46
// 
assign n0855 = ( ACC | n0538 );
assign ACC_46 = n0855;
// 
// PC_46
// 
assign PC_46 = n0119;
// 
// ACC_47
// 
assign ACC_47 = n0855;
// 
// PC_47
// 
assign PC_47 = n0119;
// 
// ACC_48
// 
assign n0856 = ( ACC | n0469 );
assign ACC_48 = n0856;
// 
// PC_48
// 
assign PC_48 = n0119;
// 
// ACC_49
// 
assign ACC_49 = n0856;
// 
// PC_49
// 
assign PC_49 = n0119;
// 
// ACC_4a
// 
assign ACC_4a = n0856;
// 
// PC_4a
// 
assign PC_4a = n0119;
// 
// ACC_4b
// 
assign ACC_4b = n0856;
// 
// PC_4b
// 
assign PC_4b = n0119;
// 
// ACC_4c
// 
assign ACC_4c = n0856;
// 
// PC_4c
// 
assign PC_4c = n0119;
// 
// ACC_4d
// 
assign ACC_4d = n0856;
// 
// PC_4d
// 
assign PC_4d = n0119;
// 
// ACC_4e
// 
assign ACC_4e = n0856;
// 
// PC_4e
// 
assign PC_4e = n0119;
// 
// ACC_4f
// 
assign ACC_4f = n0856;
// 
// PC_4f
// 
assign PC_4f = n0119;
// 
// PC_50
// 
assign n0857 = ( n0581 == n0467 );
assign n0858 = ( n0857 ) ? ( n0808 ) : ( n0431 );
assign PC_50 = n0858;
// 
// PC_51
// 
assign PC_51 = n0460;
// 
// IRAM_51
// 
// 
// SP_51
// 
assign SP_51 = n0578;
// 
// PCON_52
// 
assign n0859 = ( n0515 & ACC );
assign n0860 = ( n0475 ) ? ( n0859 ) : ( PCON );
assign PCON_52 = n0860;
// 
// B_52
// 
assign n0861 = ( n0492 ) ? ( n0859 ) : ( B );
assign B_52 = n0861;
// 
// TMOD_52
// 
assign n0862 = ( n0477 ) ? ( n0859 ) : ( TMOD );
assign TMOD_52 = n0862;
// 
// DPL_52
// 
assign n0863 = ( n0473 ) ? ( n0859 ) : ( DPL );
assign DPL_52 = n0863;
// 
// DPH_52
// 
assign n0864 = ( n0474 ) ? ( n0859 ) : ( DPH );
assign DPH_52 = n0864;
// 
// TL1_52
// 
assign n0865 = ( n0481 ) ? ( n0859 ) : ( TL1 );
assign TL1_52 = n0865;
// 
// TL0_52
// 
assign n0866 = ( n0478 ) ? ( n0859 ) : ( TL0 );
assign TL0_52 = n0866;
// 
// TCON_52
// 
assign n0867 = ( n0476 ) ? ( n0859 ) : ( TCON );
assign TCON_52 = n0867;
// 
// TH1_52
// 
assign n0868 = ( n0482 ) ? ( n0859 ) : ( TH1 );
assign TH1_52 = n0868;
// 
// TH0_52
// 
assign n0869 = ( n0480 ) ? ( n0859 ) : ( TH0 );
assign TH0_52 = n0869;
// 
// PC_52
// 
assign PC_52 = n0431;
// 
// P2_52
// 
assign n0870 = ( n0486 ) ? ( n0859 ) : ( P2 );
assign P2_52 = n0870;
// 
// P3_52
// 
assign n0871 = ( n0488 ) ? ( n0859 ) : ( P3 );
assign P3_52 = n0871;
// 
// P0_52
// 
assign n0872 = ( n0471 ) ? ( n0859 ) : ( P0 );
assign P0_52 = n0872;
// 
// P1_52
// 
assign n0873 = ( n0483 ) ? ( n0859 ) : ( P1 );
assign P1_52 = n0873;
// 
// IRAM_52
// 
// 
// IP_52
// 
assign n0874 = ( n0489 ) ? ( n0859 ) : ( IP );
assign IP_52 = n0874;
// 
// IE_52
// 
assign n0875 = ( n0487 ) ? ( n0859 ) : ( IE );
assign IE_52 = n0875;
// 
// SCON_52
// 
assign n0876 = ( n0484 ) ? ( n0859 ) : ( SCON );
assign SCON_52 = n0876;
// 
// SP_52
// 
assign n0877 = ( n0472 ) ? ( n0859 ) : ( SP );
assign SP_52 = n0877;
// 
// SBUF_52
// 
assign n0878 = ( n0485 ) ? ( n0859 ) : ( SBUF );
assign SBUF_52 = n0878;
// 
// PSW_52
// 
assign n0879 = ( n0490 ) ? ( n0859 ) : ( PSW );
assign PSW_52 = n0879;
// 
// ACC_53
// 
assign n0880 = ( n0515 & n0456 );
assign n0881 = ( n0465 ) ? ( n0880 ) : ( ACC );
assign ACC_53 = n0881;
// 
// PCON_53
// 
assign n0882 = ( n0475 ) ? ( n0880 ) : ( PCON );
assign PCON_53 = n0882;
// 
// B_53
// 
assign n0883 = ( n0492 ) ? ( n0880 ) : ( B );
assign B_53 = n0883;
// 
// TMOD_53
// 
assign n0884 = ( n0477 ) ? ( n0880 ) : ( TMOD );
assign TMOD_53 = n0884;
// 
// DPL_53
// 
assign n0885 = ( n0473 ) ? ( n0880 ) : ( DPL );
assign DPL_53 = n0885;
// 
// DPH_53
// 
assign n0886 = ( n0474 ) ? ( n0880 ) : ( DPH );
assign DPH_53 = n0886;
// 
// TL1_53
// 
assign n0887 = ( n0481 ) ? ( n0880 ) : ( TL1 );
assign TL1_53 = n0887;
// 
// TL0_53
// 
assign n0888 = ( n0478 ) ? ( n0880 ) : ( TL0 );
assign TL0_53 = n0888;
// 
// IE_53
// 
assign n0889 = ( n0487 ) ? ( n0880 ) : ( IE );
assign IE_53 = n0889;
// 
// TH1_53
// 
assign n0890 = ( n0482 ) ? ( n0880 ) : ( TH1 );
assign TH1_53 = n0890;
// 
// TH0_53
// 
assign n0891 = ( n0480 ) ? ( n0880 ) : ( TH0 );
assign TH0_53 = n0891;
// 
// PC_53
// 
assign PC_53 = n0560;
// 
// P2_53
// 
assign n0892 = ( n0486 ) ? ( n0880 ) : ( P2 );
assign P2_53 = n0892;
// 
// P3_53
// 
assign n0893 = ( n0488 ) ? ( n0880 ) : ( P3 );
assign P3_53 = n0893;
// 
// P0_53
// 
assign n0894 = ( n0471 ) ? ( n0880 ) : ( P0 );
assign P0_53 = n0894;
// 
// P1_53
// 
assign n0895 = ( n0483 ) ? ( n0880 ) : ( P1 );
assign P1_53 = n0895;
// 
// IRAM_53
// 
// 
// IP_53
// 
assign n0896 = ( n0489 ) ? ( n0880 ) : ( IP );
assign IP_53 = n0896;
// 
// TCON_53
// 
assign n0897 = ( n0476 ) ? ( n0880 ) : ( TCON );
assign TCON_53 = n0897;
// 
// SCON_53
// 
assign n0898 = ( n0484 ) ? ( n0880 ) : ( SCON );
assign SCON_53 = n0898;
// 
// SP_53
// 
assign n0899 = ( n0472 ) ? ( n0880 ) : ( SP );
assign SP_53 = n0899;
// 
// SBUF_53
// 
assign n0900 = ( n0485 ) ? ( n0880 ) : ( SBUF );
assign SBUF_53 = n0900;
// 
// PSW_53
// 
assign n0901 = ( n0490 ) ? ( n0880 ) : ( PSW );
assign PSW_53 = n0901;
// 
// ACC_54
// 
assign n0902 = ( ACC & n0120 );
assign ACC_54 = n0902;
// 
// PC_54
// 
assign PC_54 = n0431;
// 
// ACC_55
// 
assign n0903 = ( ACC & n0515 );
assign ACC_55 = n0903;
// 
// PC_55
// 
assign PC_55 = n0431;
// 
// ACC_56
// 
assign n0904 = ( ACC & n0538 );
assign ACC_56 = n0904;
// 
// PC_56
// 
assign PC_56 = n0119;
// 
// ACC_57
// 
assign ACC_57 = n0904;
// 
// PC_57
// 
assign PC_57 = n0119;
// 
// ACC_58
// 
assign n0905 = ( ACC & n0469 );
assign ACC_58 = n0905;
// 
// PC_58
// 
assign PC_58 = n0119;
// 
// ACC_59
// 
assign ACC_59 = n0905;
// 
// PC_59
// 
assign PC_59 = n0119;
// 
// ACC_5a
// 
assign ACC_5a = n0905;
// 
// PC_5a
// 
assign PC_5a = n0119;
// 
// ACC_5b
// 
assign ACC_5b = n0905;
// 
// PC_5b
// 
assign PC_5b = n0119;
// 
// ACC_5c
// 
assign ACC_5c = n0905;
// 
// PC_5c
// 
assign PC_5c = n0119;
// 
// ACC_5d
// 
assign ACC_5d = n0905;
// 
// PC_5d
// 
assign PC_5d = n0119;
// 
// ACC_5e
// 
assign ACC_5e = n0905;
// 
// PC_5e
// 
assign PC_5e = n0119;
// 
// ACC_5f
// 
assign ACC_5f = n0905;
// 
// PC_5f
// 
assign PC_5f = n0119;
// 
// PC_60
// 
assign n0906 = ( ACC == n0493 );
assign n0907 = ( n0906 ) ? ( n0808 ) : ( n0431 );
assign PC_60 = n0907;
// 
// PC_61
// 
assign PC_61 = n0460;
// 
// ACC_62
// 
assign n0908 = ( n0515 ^ n0515 );
assign n0909 = ( n0465 ) ? ( n0908 ) : ( ACC );
assign ACC_62 = n0909;
// 
// PCON_62
// 
assign n0910 = ( n0515 ^ ACC );
assign n0911 = ( n0475 ) ? ( n0910 ) : ( PCON );
assign PCON_62 = n0911;
// 
// P1_62
// 
assign n0912 = ( n0483 ) ? ( n0910 ) : ( P1 );
assign P1_62 = n0912;
// 
// TMOD_62
// 
assign n0913 = ( n0477 ) ? ( n0910 ) : ( TMOD );
assign TMOD_62 = n0913;
// 
// DPL_62
// 
assign n0914 = ( n0473 ) ? ( n0910 ) : ( DPL );
assign DPL_62 = n0914;
// 
// DPH_62
// 
assign n0915 = ( n0474 ) ? ( n0910 ) : ( DPH );
assign DPH_62 = n0915;
// 
// TL1_62
// 
assign n0916 = ( n0481 ) ? ( n0910 ) : ( TL1 );
assign TL1_62 = n0916;
// 
// TL0_62
// 
assign n0917 = ( n0478 ) ? ( n0910 ) : ( TL0 );
assign TL0_62 = n0917;
// 
// TCON_62
// 
assign n0918 = ( n0476 ) ? ( n0910 ) : ( TCON );
assign TCON_62 = n0918;
// 
// TH1_62
// 
assign n0919 = ( n0482 ) ? ( n0910 ) : ( TH1 );
assign TH1_62 = n0919;
// 
// TH0_62
// 
assign n0920 = ( n0480 ) ? ( n0910 ) : ( TH0 );
assign TH0_62 = n0920;
// 
// PC_62
// 
assign PC_62 = n0431;
// 
// P2_62
// 
assign n0921 = ( n0486 ) ? ( n0910 ) : ( P2 );
assign P2_62 = n0921;
// 
// P3_62
// 
assign n0922 = ( n0488 ) ? ( n0910 ) : ( P3 );
assign P3_62 = n0922;
// 
// P0_62
// 
assign n0923 = ( n0471 ) ? ( n0910 ) : ( P0 );
assign P0_62 = n0923;
// 
// B_62
// 
assign n0924 = ( n0492 ) ? ( n0910 ) : ( B );
assign B_62 = n0924;
// 
// IRAM_62
// 
// 
// IP_62
// 
assign n0925 = ( n0489 ) ? ( n0910 ) : ( IP );
assign IP_62 = n0925;
// 
// IE_62
// 
assign n0926 = ( n0487 ) ? ( n0910 ) : ( IE );
assign IE_62 = n0926;
// 
// SCON_62
// 
assign n0927 = ( n0484 ) ? ( n0910 ) : ( SCON );
assign SCON_62 = n0927;
// 
// SP_62
// 
assign n0928 = ( n0472 ) ? ( n0910 ) : ( SP );
assign SP_62 = n0928;
// 
// SBUF_62
// 
assign n0929 = ( n0485 ) ? ( n0910 ) : ( SBUF );
assign SBUF_62 = n0929;
// 
// PSW_62
// 
assign n0930 = ( n0490 ) ? ( n0910 ) : ( PSW );
assign PSW_62 = n0930;
// 
// ACC_63
// 
assign n0931 = ( n0515 ^ n0456 );
assign n0932 = ( n0465 ) ? ( n0931 ) : ( ACC );
assign ACC_63 = n0932;
// 
// PCON_63
// 
assign n0933 = ( n0475 ) ? ( n0931 ) : ( PCON );
assign PCON_63 = n0933;
// 
// P1_63
// 
assign n0934 = ( n0483 ) ? ( n0931 ) : ( P1 );
assign P1_63 = n0934;
// 
// TMOD_63
// 
assign n0935 = ( n0477 ) ? ( n0931 ) : ( TMOD );
assign TMOD_63 = n0935;
// 
// DPL_63
// 
assign n0936 = ( n0473 ) ? ( n0931 ) : ( DPL );
assign DPL_63 = n0936;
// 
// DPH_63
// 
assign n0937 = ( n0474 ) ? ( n0931 ) : ( DPH );
assign DPH_63 = n0937;
// 
// TL1_63
// 
assign n0938 = ( n0481 ) ? ( n0931 ) : ( TL1 );
assign TL1_63 = n0938;
// 
// TL0_63
// 
assign n0939 = ( n0478 ) ? ( n0931 ) : ( TL0 );
assign TL0_63 = n0939;
// 
// IE_63
// 
assign n0940 = ( n0487 ) ? ( n0931 ) : ( IE );
assign IE_63 = n0940;
// 
// TH1_63
// 
assign n0941 = ( n0482 ) ? ( n0931 ) : ( TH1 );
assign TH1_63 = n0941;
// 
// TH0_63
// 
assign n0942 = ( n0480 ) ? ( n0931 ) : ( TH0 );
assign TH0_63 = n0942;
// 
// PC_63
// 
assign PC_63 = n0560;
// 
// P2_63
// 
assign n0943 = ( n0486 ) ? ( n0931 ) : ( P2 );
assign P2_63 = n0943;
// 
// P3_63
// 
assign n0944 = ( n0488 ) ? ( n0931 ) : ( P3 );
assign P3_63 = n0944;
// 
// P0_63
// 
assign n0945 = ( n0471 ) ? ( n0931 ) : ( P0 );
assign P0_63 = n0945;
// 
// B_63
// 
assign n0946 = ( n0492 ) ? ( n0931 ) : ( B );
assign B_63 = n0946;
// 
// IRAM_63
// 
// 
// IP_63
// 
assign n0947 = ( n0489 ) ? ( n0931 ) : ( IP );
assign IP_63 = n0947;
// 
// TCON_63
// 
assign n0948 = ( n0476 ) ? ( n0931 ) : ( TCON );
assign TCON_63 = n0948;
// 
// SCON_63
// 
assign n0949 = ( n0484 ) ? ( n0931 ) : ( SCON );
assign SCON_63 = n0949;
// 
// SP_63
// 
assign n0950 = ( n0472 ) ? ( n0931 ) : ( SP );
assign SP_63 = n0950;
// 
// SBUF_63
// 
assign n0951 = ( n0485 ) ? ( n0931 ) : ( SBUF );
assign SBUF_63 = n0951;
// 
// PSW_63
// 
assign n0952 = ( n0490 ) ? ( n0931 ) : ( PSW );
assign PSW_63 = n0952;
// 
// ACC_64
// 
assign n0953 = ( ACC ^ n0120 );
assign ACC_64 = n0953;
// 
// PC_64
// 
assign PC_64 = n0431;
// 
// ACC_65
// 
assign n0954 = ( ACC ^ n0515 );
assign ACC_65 = n0954;
// 
// PC_65
// 
assign PC_65 = n0431;
// 
// ACC_66
// 
assign n0955 = ( ACC ^ n0538 );
assign ACC_66 = n0955;
// 
// PC_66
// 
assign PC_66 = n0119;
// 
// ACC_67
// 
assign ACC_67 = n0955;
// 
// PC_67
// 
assign PC_67 = n0119;
// 
// ACC_68
// 
assign n0956 = ( ACC ^ n0469 );
assign ACC_68 = n0956;
// 
// PC_68
// 
assign PC_68 = n0119;
// 
// ACC_69
// 
assign ACC_69 = n0956;
// 
// PC_69
// 
assign PC_69 = n0119;
// 
// ACC_6a
// 
assign ACC_6a = n0956;
// 
// PC_6a
// 
assign PC_6a = n0119;
// 
// ACC_6b
// 
assign ACC_6b = n0956;
// 
// PC_6b
// 
assign PC_6b = n0119;
// 
// ACC_6c
// 
assign ACC_6c = n0956;
// 
// PC_6c
// 
assign PC_6c = n0119;
// 
// ACC_6d
// 
assign ACC_6d = n0956;
// 
// PC_6d
// 
assign PC_6d = n0119;
// 
// ACC_6e
// 
assign ACC_6e = n0956;
// 
// PC_6e
// 
assign PC_6e = n0119;
// 
// ACC_6f
// 
assign ACC_6f = n0956;
// 
// PC_6f
// 
assign PC_6f = n0119;
// 
// PC_70
// 
assign n0957 = !( n0906 );
assign n0958 = ( n0957 ) ? ( n0808 ) : ( n0431 );
assign PC_70 = n0958;
// 
// PC_71
// 
assign PC_71 = n0460;
// 
// IRAM_71
// 
// 
// SP_71
// 
assign SP_71 = n0578;
// 
// PC_72
// 
assign PC_72 = n0431;
// 
// PSW_72
// 
assign n0959 = ( n0581 | n0557 );
assign n0960 = PSW[6:0];
assign n0961 = { ( n0959 ), ( n0960 ) };
assign PSW_72 = n0961;
// 
// PC_73
// 
assign n0962 = ( n0434 + n0396 );
assign PC_73 = n0962;
// 
// ACC_74
// 
assign ACC_74 = n0120;
// 
// PC_74
// 
assign PC_74 = n0431;
// 
// ACC_75
// 
assign n0963 = ( n0120 == n0464 );
assign n0964 = ( n0963 ) ? ( n0456 ) : ( ACC );
assign ACC_75 = n0964;
// 
// PCON_75
// 
assign n0965 = ( n0120 == n0332 );
assign n0966 = ( n0965 ) ? ( n0456 ) : ( PCON );
assign PCON_75 = n0966;
// 
// B_75
// 
assign n0967 = ( n0120 == n0491 );
assign n0968 = ( n0967 ) ? ( n0456 ) : ( B );
assign B_75 = n0968;
// 
// TMOD_75
// 
assign n0969 = ( n0120 == n0334 );
assign n0970 = ( n0969 ) ? ( n0456 ) : ( TMOD );
assign TMOD_75 = n0970;
// 
// DPL_75
// 
assign n0971 = ( n0120 == n0101 );
assign n0972 = ( n0971 ) ? ( n0456 ) : ( DPL );
assign DPL_75 = n0972;
// 
// DPH_75
// 
assign n0973 = ( n0120 == n0394 );
assign n0974 = ( n0973 ) ? ( n0456 ) : ( DPH );
assign DPH_75 = n0974;
// 
// TL1_75
// 
assign n0975 = ( n0120 == n0287 );
assign n0976 = ( n0975 ) ? ( n0456 ) : ( TL1 );
assign TL1_75 = n0976;
// 
// TL0_75
// 
assign n0977 = ( n0120 == n0143 );
assign n0978 = ( n0977 ) ? ( n0456 ) : ( TL0 );
assign TL0_75 = n0978;
// 
// TCON_75
// 
assign n0979 = ( n0120 == n0034 );
assign n0980 = ( n0979 ) ? ( n0456 ) : ( TCON );
assign TCON_75 = n0980;
// 
// TH1_75
// 
assign n0981 = ( n0120 == n0258 );
assign n0982 = ( n0981 ) ? ( n0456 ) : ( TH1 );
assign TH1_75 = n0982;
// 
// TH0_75
// 
assign n0983 = ( n0120 == n0479 );
assign n0984 = ( n0983 ) ? ( n0456 ) : ( TH0 );
assign TH0_75 = n0984;
// 
// PC_75
// 
assign PC_75 = n0560;
// 
// P2_75
// 
assign n0985 = ( n0120 == n0105 );
assign n0986 = ( n0985 ) ? ( n0456 ) : ( P2 );
assign P2_75 = n0986;
// 
// P3_75
// 
assign n0987 = ( n0120 == n0109 );
assign n0988 = ( n0987 ) ? ( n0456 ) : ( P3 );
assign P3_75 = n0988;
// 
// P0_75
// 
assign n0989 = ( n0120 == n0470 );
assign n0990 = ( n0989 ) ? ( n0456 ) : ( P0 );
assign P0_75 = n0990;
// 
// P1_75
// 
assign n0991 = ( n0120 == n0446 );
assign n0992 = ( n0991 ) ? ( n0456 ) : ( P1 );
assign P1_75 = n0992;
// 
// IRAM_75
// 
assign n0993 = ( n0121 == n0467 );
// 
// IP_75
// 
assign n0994 = ( n0120 == n0044 );
assign n0995 = ( n0994 ) ? ( n0456 ) : ( IP );
assign IP_75 = n0995;
// 
// IE_75
// 
assign n0996 = ( n0120 == n0188 );
assign n0997 = ( n0996 ) ? ( n0456 ) : ( IE );
assign IE_75 = n0997;
// 
// SCON_75
// 
assign n0998 = ( n0120 == n0038 );
assign n0999 = ( n0998 ) ? ( n0456 ) : ( SCON );
assign SCON_75 = n0999;
// 
// SP_75
// 
assign n1000 = ( n0120 == n0413 );
assign n1001 = ( n1000 ) ? ( n0456 ) : ( SP );
assign SP_75 = n1001;
// 
// SBUF_75
// 
assign n1002 = ( n0120 == n0338 );
assign n1003 = ( n1002 ) ? ( n0456 ) : ( SBUF );
assign SBUF_75 = n1003;
// 
// PSW_75
// 
assign n1004 = ( n0120 == n0367 );
assign n1005 = ( n1004 ) ? ( n0456 ) : ( PSW );
assign PSW_75 = n1005;
// 
// PC_76
// 
assign PC_76 = n0431;
// 
// IRAM_76
// 
// 
// PC_77
// 
assign PC_77 = n0431;
// 
// IRAM_77
// 
// 
// PC_78
// 
assign PC_78 = n0431;
// 
// IRAM_78
// 
// 
// PC_79
// 
assign PC_79 = n0431;
// 
// IRAM_79
// 
// 
// PC_7a
// 
assign PC_7a = n0431;
// 
// IRAM_7a
// 
// 
// PC_7b
// 
assign PC_7b = n0431;
// 
// IRAM_7b
// 
// 
// PC_7c
// 
assign PC_7c = n0431;
// 
// IRAM_7c
// 
// 
// PC_7d
// 
assign PC_7d = n0431;
// 
// IRAM_7d
// 
// 
// PC_7e
// 
assign PC_7e = n0431;
// 
// IRAM_7e
// 
// 
// PC_7f
// 
assign PC_7f = n0431;
// 
// IRAM_7f
// 
// 
// PC_80
// 
assign PC_80 = n0808;
// 
// PC_81
// 
assign PC_81 = n0460;
// 
// PC_82
// 
assign PC_82 = n0431;
// 
// PSW_82
// 
assign n1006 = ( n0581 & n0557 );
assign n1007 = { ( n1006 ), ( n0960 ) };
assign PSW_82 = n1007;
// 
// ACC_83
// 
assign n1008 = ROM[n0397];
assign ACC_83 = n1008;
// 
// PC_83
// 
assign PC_83 = n0119;
// 
// ACC_84
// 
assign n1009 = ( B == n0493 );
assign n1010 = 8'hff;
assign n1011 = ( ACC / B );
assign n1012 = ( n1009 ) ? ( n1010 ) : ( n1011 );
assign ACC_84 = n1012;
// 
// B_84
// 
assign n1013 = ( ACC % B );
assign n1014 = ( n1009 ) ? ( ACC ) : ( n1013 );
assign B_84 = n1014;
// 
// PC_84
// 
assign PC_84 = n0119;
// 
// PSW_84
// 
assign n1015 = PSW[6:3];
assign n1016 = ( n1009 ) ? ( n0122 ) : ( n0467 );
assign n1017 = { ( n0467 ), ( n1015 ), ( n1016 ), ( n0589 ) };
assign PSW_84 = n1017;
// 
// ACC_85
// 
assign n1018 = ( n0456 == n0464 );
assign n1019 = ( n1018 ) ? ( n0515 ) : ( ACC );
assign ACC_85 = n1019;
// 
// PCON_85
// 
assign n1020 = ( n0456 == n0332 );
assign n1021 = ( n1020 ) ? ( n0515 ) : ( PCON );
assign PCON_85 = n1021;
// 
// B_85
// 
assign n1022 = ( n0456 == n0491 );
assign n1023 = ( n1022 ) ? ( n0515 ) : ( B );
assign B_85 = n1023;
// 
// TMOD_85
// 
assign n1024 = ( n0456 == n0334 );
assign n1025 = ( n1024 ) ? ( n0515 ) : ( TMOD );
assign TMOD_85 = n1025;
// 
// DPL_85
// 
assign n1026 = ( n0456 == n0101 );
assign n1027 = ( n1026 ) ? ( n0515 ) : ( DPL );
assign DPL_85 = n1027;
// 
// DPH_85
// 
assign n1028 = ( n0456 == n0394 );
assign n1029 = ( n1028 ) ? ( n0515 ) : ( DPH );
assign DPH_85 = n1029;
// 
// TL1_85
// 
assign n1030 = ( n0456 == n0287 );
assign n1031 = ( n1030 ) ? ( n0515 ) : ( TL1 );
assign TL1_85 = n1031;
// 
// TL0_85
// 
assign n1032 = ( n0456 == n0143 );
assign n1033 = ( n1032 ) ? ( n0515 ) : ( TL0 );
assign TL0_85 = n1033;
// 
// TCON_85
// 
assign n1034 = ( n0456 == n0034 );
assign n1035 = ( n1034 ) ? ( n0515 ) : ( TCON );
assign TCON_85 = n1035;
// 
// TH1_85
// 
assign n1036 = ( n0456 == n0258 );
assign n1037 = ( n1036 ) ? ( n0515 ) : ( TH1 );
assign TH1_85 = n1037;
// 
// TH0_85
// 
assign n1038 = ( n0456 == n0479 );
assign n1039 = ( n1038 ) ? ( n0515 ) : ( TH0 );
assign TH0_85 = n1039;
// 
// PC_85
// 
assign PC_85 = n0560;
// 
// P2_85
// 
assign n1040 = ( n0456 == n0105 );
assign n1041 = ( n1040 ) ? ( n0515 ) : ( P2 );
assign P2_85 = n1041;
// 
// P3_85
// 
assign n1042 = ( n0456 == n0109 );
assign n1043 = ( n1042 ) ? ( n0515 ) : ( P3 );
assign P3_85 = n1043;
// 
// P0_85
// 
assign n1044 = ( n0456 == n0470 );
assign n1045 = ( n1044 ) ? ( n0515 ) : ( P0 );
assign P0_85 = n1045;
// 
// P1_85
// 
assign n1046 = ( n0456 == n0446 );
assign n1047 = ( n1046 ) ? ( n0515 ) : ( P1 );
assign P1_85 = n1047;
// 
// IRAM_85
// 
assign n1048 = n0456[7:7];
assign n1049 = ( n1048 == n0467 );
// 
// IP_85
// 
assign n1050 = ( n0456 == n0044 );
assign n1051 = ( n1050 ) ? ( n0515 ) : ( IP );
assign IP_85 = n1051;
// 
// IE_85
// 
assign n1052 = ( n0456 == n0188 );
assign n1053 = ( n1052 ) ? ( n0515 ) : ( IE );
assign IE_85 = n1053;
// 
// SCON_85
// 
assign n1054 = ( n0456 == n0038 );
assign n1055 = ( n1054 ) ? ( n0515 ) : ( SCON );
assign SCON_85 = n1055;
// 
// SP_85
// 
assign n1056 = ( n0456 == n0413 );
assign n1057 = ( n1056 ) ? ( n0515 ) : ( SP );
assign SP_85 = n1057;
// 
// SBUF_85
// 
assign n1058 = ( n0456 == n0338 );
assign n1059 = ( n1058 ) ? ( n0515 ) : ( SBUF );
assign SBUF_85 = n1059;
// 
// PSW_85
// 
assign n1060 = ( n0456 == n0367 );
assign n1061 = ( n1060 ) ? ( n0515 ) : ( PSW );
assign PSW_85 = n1061;
// 
// ACC_86
// 
assign n1062 = ( n0963 ) ? ( n0538 ) : ( ACC );
assign ACC_86 = n1062;
// 
// PCON_86
// 
assign n1063 = ( n0965 ) ? ( n0538 ) : ( PCON );
assign PCON_86 = n1063;
// 
// P1_86
// 
assign n1064 = ( n0991 ) ? ( n0538 ) : ( P1 );
assign P1_86 = n1064;
// 
// TMOD_86
// 
assign n1065 = ( n0969 ) ? ( n0538 ) : ( TMOD );
assign TMOD_86 = n1065;
// 
// DPL_86
// 
assign n1066 = ( n0971 ) ? ( n0538 ) : ( DPL );
assign DPL_86 = n1066;
// 
// DPH_86
// 
assign n1067 = ( n0973 ) ? ( n0538 ) : ( DPH );
assign DPH_86 = n1067;
// 
// TL1_86
// 
assign n1068 = ( n0975 ) ? ( n0538 ) : ( TL1 );
assign TL1_86 = n1068;
// 
// TL0_86
// 
assign n1069 = ( n0977 ) ? ( n0538 ) : ( TL0 );
assign TL0_86 = n1069;
// 
// IE_86
// 
assign n1070 = ( n0996 ) ? ( n0538 ) : ( IE );
assign IE_86 = n1070;
// 
// TH1_86
// 
assign n1071 = ( n0981 ) ? ( n0538 ) : ( TH1 );
assign TH1_86 = n1071;
// 
// TH0_86
// 
assign n1072 = ( n0983 ) ? ( n0538 ) : ( TH0 );
assign TH0_86 = n1072;
// 
// PC_86
// 
assign PC_86 = n0431;
// 
// P2_86
// 
assign n1073 = ( n0985 ) ? ( n0538 ) : ( P2 );
assign P2_86 = n1073;
// 
// P3_86
// 
assign n1074 = ( n0987 ) ? ( n0538 ) : ( P3 );
assign P3_86 = n1074;
// 
// P0_86
// 
assign n1075 = ( n0989 ) ? ( n0538 ) : ( P0 );
assign P0_86 = n1075;
// 
// B_86
// 
assign n1076 = ( n0967 ) ? ( n0538 ) : ( B );
assign B_86 = n1076;
// 
// IRAM_86
// 
// 
// IP_86
// 
assign n1077 = ( n0994 ) ? ( n0538 ) : ( IP );
assign IP_86 = n1077;
// 
// TCON_86
// 
assign n1078 = ( n0979 ) ? ( n0538 ) : ( TCON );
assign TCON_86 = n1078;
// 
// SCON_86
// 
assign n1079 = ( n0998 ) ? ( n0538 ) : ( SCON );
assign SCON_86 = n1079;
// 
// SP_86
// 
assign n1080 = ( n1000 ) ? ( n0538 ) : ( SP );
assign SP_86 = n1080;
// 
// SBUF_86
// 
assign n1081 = ( n1002 ) ? ( n0538 ) : ( SBUF );
assign SBUF_86 = n1081;
// 
// PSW_86
// 
assign n1082 = ( n1004 ) ? ( n0538 ) : ( PSW );
assign PSW_86 = n1082;
// 
// ACC_87
// 
assign ACC_87 = n1062;
// 
// PCON_87
// 
assign PCON_87 = n1063;
// 
// B_87
// 
assign B_87 = n1076;
// 
// TMOD_87
// 
assign TMOD_87 = n1065;
// 
// DPL_87
// 
assign DPL_87 = n1066;
// 
// DPH_87
// 
assign DPH_87 = n1067;
// 
// TL1_87
// 
assign TL1_87 = n1068;
// 
// TL0_87
// 
assign TL0_87 = n1069;
// 
// IE_87
// 
assign IE_87 = n1070;
// 
// TH1_87
// 
assign TH1_87 = n1071;
// 
// TH0_87
// 
assign TH0_87 = n1072;
// 
// PC_87
// 
assign PC_87 = n0431;
// 
// P2_87
// 
assign P2_87 = n1073;
// 
// P3_87
// 
assign P3_87 = n1074;
// 
// P0_87
// 
assign P0_87 = n1075;
// 
// P1_87
// 
assign P1_87 = n1064;
// 
// IRAM_87
// 
// 
// IP_87
// 
assign IP_87 = n1077;
// 
// TCON_87
// 
assign TCON_87 = n1078;
// 
// SCON_87
// 
assign SCON_87 = n1079;
// 
// SP_87
// 
assign SP_87 = n1080;
// 
// SBUF_87
// 
assign SBUF_87 = n1081;
// 
// PSW_87
// 
assign PSW_87 = n1082;
// 
// ACC_88
// 
assign n1083 = ( n0963 ) ? ( n0469 ) : ( ACC );
assign ACC_88 = n1083;
// 
// PCON_88
// 
assign n1084 = ( n0965 ) ? ( n0469 ) : ( PCON );
assign PCON_88 = n1084;
// 
// B_88
// 
assign n1085 = ( n0967 ) ? ( n0469 ) : ( B );
assign B_88 = n1085;
// 
// TMOD_88
// 
assign n1086 = ( n0969 ) ? ( n0469 ) : ( TMOD );
assign TMOD_88 = n1086;
// 
// DPL_88
// 
assign n1087 = ( n0971 ) ? ( n0469 ) : ( DPL );
assign DPL_88 = n1087;
// 
// DPH_88
// 
assign n1088 = ( n0973 ) ? ( n0469 ) : ( DPH );
assign DPH_88 = n1088;
// 
// TL1_88
// 
assign n1089 = ( n0975 ) ? ( n0469 ) : ( TL1 );
assign TL1_88 = n1089;
// 
// TL0_88
// 
assign n1090 = ( n0977 ) ? ( n0469 ) : ( TL0 );
assign TL0_88 = n1090;
// 
// IE_88
// 
assign n1091 = ( n0996 ) ? ( n0469 ) : ( IE );
assign IE_88 = n1091;
// 
// TH1_88
// 
assign n1092 = ( n0981 ) ? ( n0469 ) : ( TH1 );
assign TH1_88 = n1092;
// 
// TH0_88
// 
assign n1093 = ( n0983 ) ? ( n0469 ) : ( TH0 );
assign TH0_88 = n1093;
// 
// PC_88
// 
assign PC_88 = n0431;
// 
// P2_88
// 
assign n1094 = ( n0985 ) ? ( n0469 ) : ( P2 );
assign P2_88 = n1094;
// 
// P3_88
// 
assign n1095 = ( n0987 ) ? ( n0469 ) : ( P3 );
assign P3_88 = n1095;
// 
// P0_88
// 
assign n1096 = ( n0989 ) ? ( n0469 ) : ( P0 );
assign P0_88 = n1096;
// 
// P1_88
// 
assign n1097 = ( n0991 ) ? ( n0469 ) : ( P1 );
assign P1_88 = n1097;
// 
// IRAM_88
// 
// 
// IP_88
// 
assign n1098 = ( n0994 ) ? ( n0469 ) : ( IP );
assign IP_88 = n1098;
// 
// TCON_88
// 
assign n1099 = ( n0979 ) ? ( n0469 ) : ( TCON );
assign TCON_88 = n1099;
// 
// SCON_88
// 
assign n1100 = ( n0998 ) ? ( n0469 ) : ( SCON );
assign SCON_88 = n1100;
// 
// SP_88
// 
assign n1101 = ( n1000 ) ? ( n0469 ) : ( SP );
assign SP_88 = n1101;
// 
// SBUF_88
// 
assign n1102 = ( n1002 ) ? ( n0469 ) : ( SBUF );
assign SBUF_88 = n1102;
// 
// PSW_88
// 
assign n1103 = ( n1004 ) ? ( n0469 ) : ( PSW );
assign PSW_88 = n1103;
// 
// ACC_89
// 
assign ACC_89 = n1083;
// 
// PCON_89
// 
assign PCON_89 = n1084;
// 
// B_89
// 
assign B_89 = n1085;
// 
// TMOD_89
// 
assign TMOD_89 = n1086;
// 
// DPL_89
// 
assign DPL_89 = n1087;
// 
// DPH_89
// 
assign DPH_89 = n1088;
// 
// TL1_89
// 
assign TL1_89 = n1089;
// 
// TL0_89
// 
assign TL0_89 = n1090;
// 
// IE_89
// 
assign IE_89 = n1091;
// 
// TH1_89
// 
assign TH1_89 = n1092;
// 
// TH0_89
// 
assign TH0_89 = n1093;
// 
// PC_89
// 
assign PC_89 = n0431;
// 
// P2_89
// 
assign P2_89 = n1094;
// 
// P3_89
// 
assign P3_89 = n1095;
// 
// P0_89
// 
assign P0_89 = n1096;
// 
// P1_89
// 
assign P1_89 = n1097;
// 
// IRAM_89
// 
// 
// IP_89
// 
assign IP_89 = n1098;
// 
// TCON_89
// 
assign TCON_89 = n1099;
// 
// SCON_89
// 
assign SCON_89 = n1100;
// 
// SP_89
// 
assign SP_89 = n1101;
// 
// SBUF_89
// 
assign SBUF_89 = n1102;
// 
// PSW_89
// 
assign PSW_89 = n1103;
// 
// ACC_8a
// 
assign ACC_8a = n1083;
// 
// PCON_8a
// 
assign PCON_8a = n1084;
// 
// P1_8a
// 
assign P1_8a = n1097;
// 
// TMOD_8a
// 
assign TMOD_8a = n1086;
// 
// DPL_8a
// 
assign DPL_8a = n1087;
// 
// DPH_8a
// 
assign DPH_8a = n1088;
// 
// TL1_8a
// 
assign TL1_8a = n1089;
// 
// TL0_8a
// 
assign TL0_8a = n1090;
// 
// TCON_8a
// 
assign TCON_8a = n1099;
// 
// TH1_8a
// 
assign TH1_8a = n1092;
// 
// TH0_8a
// 
assign TH0_8a = n1093;
// 
// PC_8a
// 
assign PC_8a = n0431;
// 
// P2_8a
// 
assign P2_8a = n1094;
// 
// P3_8a
// 
assign P3_8a = n1095;
// 
// P0_8a
// 
assign P0_8a = n1096;
// 
// B_8a
// 
assign B_8a = n1085;
// 
// IRAM_8a
// 
// 
// IP_8a
// 
assign IP_8a = n1098;
// 
// IE_8a
// 
assign IE_8a = n1091;
// 
// SCON_8a
// 
assign SCON_8a = n1100;
// 
// SP_8a
// 
assign SP_8a = n1101;
// 
// SBUF_8a
// 
assign SBUF_8a = n1102;
// 
// PSW_8a
// 
assign PSW_8a = n1103;
// 
// ACC_8b
// 
assign ACC_8b = n1083;
// 
// PCON_8b
// 
assign PCON_8b = n1084;
// 
// B_8b
// 
assign B_8b = n1085;
// 
// TMOD_8b
// 
assign TMOD_8b = n1086;
// 
// DPL_8b
// 
assign DPL_8b = n1087;
// 
// DPH_8b
// 
assign DPH_8b = n1088;
// 
// TL1_8b
// 
assign TL1_8b = n1089;
// 
// TL0_8b
// 
assign TL0_8b = n1090;
// 
// IE_8b
// 
assign IE_8b = n1091;
// 
// TH1_8b
// 
assign TH1_8b = n1092;
// 
// TH0_8b
// 
assign TH0_8b = n1093;
// 
// PC_8b
// 
assign PC_8b = n0431;
// 
// P2_8b
// 
assign P2_8b = n1094;
// 
// P3_8b
// 
assign P3_8b = n1095;
// 
// P0_8b
// 
assign P0_8b = n1096;
// 
// P1_8b
// 
assign P1_8b = n1097;
// 
// IRAM_8b
// 
// 
// IP_8b
// 
assign IP_8b = n1098;
// 
// TCON_8b
// 
assign TCON_8b = n1099;
// 
// SCON_8b
// 
assign SCON_8b = n1100;
// 
// SP_8b
// 
assign SP_8b = n1101;
// 
// SBUF_8b
// 
assign SBUF_8b = n1102;
// 
// PSW_8b
// 
assign PSW_8b = n1103;
// 
// ACC_8c
// 
assign ACC_8c = n1083;
// 
// PCON_8c
// 
assign PCON_8c = n1084;
// 
// P1_8c
// 
assign P1_8c = n1097;
// 
// TMOD_8c
// 
assign TMOD_8c = n1086;
// 
// DPL_8c
// 
assign DPL_8c = n1087;
// 
// DPH_8c
// 
assign DPH_8c = n1088;
// 
// TL1_8c
// 
assign TL1_8c = n1089;
// 
// TL0_8c
// 
assign TL0_8c = n1090;
// 
// IE_8c
// 
assign IE_8c = n1091;
// 
// TH1_8c
// 
assign TH1_8c = n1092;
// 
// TH0_8c
// 
assign TH0_8c = n1093;
// 
// PC_8c
// 
assign PC_8c = n0431;
// 
// P2_8c
// 
assign P2_8c = n1094;
// 
// P3_8c
// 
assign P3_8c = n1095;
// 
// P0_8c
// 
assign P0_8c = n1096;
// 
// B_8c
// 
assign B_8c = n1085;
// 
// IRAM_8c
// 
// 
// IP_8c
// 
assign IP_8c = n1098;
// 
// TCON_8c
// 
assign TCON_8c = n1099;
// 
// SCON_8c
// 
assign SCON_8c = n1100;
// 
// SP_8c
// 
assign SP_8c = n1101;
// 
// SBUF_8c
// 
assign SBUF_8c = n1102;
// 
// PSW_8c
// 
assign PSW_8c = n1103;
// 
// ACC_8d
// 
assign ACC_8d = n1083;
// 
// PCON_8d
// 
assign PCON_8d = n1084;
// 
// B_8d
// 
assign B_8d = n1085;
// 
// TMOD_8d
// 
assign TMOD_8d = n1086;
// 
// DPL_8d
// 
assign DPL_8d = n1087;
// 
// DPH_8d
// 
assign DPH_8d = n1088;
// 
// TL1_8d
// 
assign TL1_8d = n1089;
// 
// TL0_8d
// 
assign TL0_8d = n1090;
// 
// IE_8d
// 
assign IE_8d = n1091;
// 
// TH1_8d
// 
assign TH1_8d = n1092;
// 
// TH0_8d
// 
assign TH0_8d = n1093;
// 
// PC_8d
// 
assign PC_8d = n0431;
// 
// P2_8d
// 
assign P2_8d = n1094;
// 
// P3_8d
// 
assign P3_8d = n1095;
// 
// P0_8d
// 
assign P0_8d = n1096;
// 
// P1_8d
// 
assign P1_8d = n1097;
// 
// IRAM_8d
// 
// 
// IP_8d
// 
assign IP_8d = n1098;
// 
// TCON_8d
// 
assign TCON_8d = n1099;
// 
// SCON_8d
// 
assign SCON_8d = n1100;
// 
// SP_8d
// 
assign SP_8d = n1101;
// 
// SBUF_8d
// 
assign SBUF_8d = n1102;
// 
// PSW_8d
// 
assign PSW_8d = n1103;
// 
// ACC_8e
// 
assign ACC_8e = n1083;
// 
// PCON_8e
// 
assign PCON_8e = n1084;
// 
// B_8e
// 
assign B_8e = n1085;
// 
// TMOD_8e
// 
assign TMOD_8e = n1086;
// 
// DPL_8e
// 
assign DPL_8e = n1087;
// 
// DPH_8e
// 
assign DPH_8e = n1088;
// 
// TL1_8e
// 
assign TL1_8e = n1089;
// 
// TL0_8e
// 
assign TL0_8e = n1090;
// 
// IE_8e
// 
assign IE_8e = n1091;
// 
// TH1_8e
// 
assign TH1_8e = n1092;
// 
// TH0_8e
// 
assign TH0_8e = n1093;
// 
// PC_8e
// 
assign PC_8e = n0431;
// 
// P2_8e
// 
assign P2_8e = n1094;
// 
// P3_8e
// 
assign P3_8e = n1095;
// 
// P0_8e
// 
assign P0_8e = n1096;
// 
// P1_8e
// 
assign P1_8e = n1097;
// 
// IRAM_8e
// 
// 
// IP_8e
// 
assign IP_8e = n1098;
// 
// TCON_8e
// 
assign TCON_8e = n1099;
// 
// SCON_8e
// 
assign SCON_8e = n1100;
// 
// SP_8e
// 
assign SP_8e = n1101;
// 
// SBUF_8e
// 
assign SBUF_8e = n1102;
// 
// PSW_8e
// 
assign PSW_8e = n1103;
// 
// ACC_8f
// 
assign ACC_8f = n1083;
// 
// PCON_8f
// 
assign PCON_8f = n1084;
// 
// P1_8f
// 
assign P1_8f = n1097;
// 
// TMOD_8f
// 
assign TMOD_8f = n1086;
// 
// DPL_8f
// 
assign DPL_8f = n1087;
// 
// DPH_8f
// 
assign DPH_8f = n1088;
// 
// TL1_8f
// 
assign TL1_8f = n1089;
// 
// TL0_8f
// 
assign TL0_8f = n1090;
// 
// IE_8f
// 
assign IE_8f = n1091;
// 
// TH1_8f
// 
assign TH1_8f = n1092;
// 
// TH0_8f
// 
assign TH0_8f = n1093;
// 
// PC_8f
// 
assign PC_8f = n0431;
// 
// P2_8f
// 
assign P2_8f = n1094;
// 
// P3_8f
// 
assign P3_8f = n1095;
// 
// P0_8f
// 
assign P0_8f = n1096;
// 
// B_8f
// 
assign B_8f = n1085;
// 
// IRAM_8f
// 
// 
// IP_8f
// 
assign IP_8f = n1098;
// 
// TCON_8f
// 
assign TCON_8f = n1099;
// 
// SCON_8f
// 
assign SCON_8f = n1100;
// 
// SP_8f
// 
assign SP_8f = n1101;
// 
// SBUF_8f
// 
assign SBUF_8f = n1102;
// 
// PSW_8f
// 
assign PSW_8f = n1103;
// 
// DPL_90
// 
assign n1104 = n0461[7:0];
assign DPL_90 = n1104;
// 
// DPH_90
// 
assign n1105 = n0461[15:8];
assign DPH_90 = n1105;
// 
// PC_90
// 
assign PC_90 = n0560;
// 
// PC_91
// 
assign PC_91 = n0460;
// 
// IRAM_91
// 
// 
// SP_91
// 
assign SP_91 = n0578;
// 
// ACC_92
// 
assign n1106 = ( n0739 << n0542 );
assign n1107 = ( n0550 | n1106 );
assign n1108 = ( n0465 ) ? ( n1107 ) : ( ACC );
assign ACC_92 = n1108;
// 
// B_92
// 
assign n1109 = ( n0492 ) ? ( n1107 ) : ( B );
assign B_92 = n1109;
// 
// IE_92
// 
assign n1110 = ( n0487 ) ? ( n1107 ) : ( IE );
assign IE_92 = n1110;
// 
// PC_92
// 
assign PC_92 = n0431;
// 
// P2_92
// 
assign n1111 = ( n0486 ) ? ( n1107 ) : ( P2 );
assign P2_92 = n1111;
// 
// P3_92
// 
assign n1112 = ( n0488 ) ? ( n1107 ) : ( P3 );
assign P3_92 = n1112;
// 
// P0_92
// 
assign n1113 = ( n0471 ) ? ( n1107 ) : ( P0 );
assign P0_92 = n1113;
// 
// P1_92
// 
assign n1114 = ( n0483 ) ? ( n1107 ) : ( P1 );
assign P1_92 = n1114;
// 
// IRAM_92
// 
// 
// IP_92
// 
assign n1115 = ( n0489 ) ? ( n1107 ) : ( IP );
assign IP_92 = n1115;
// 
// TCON_92
// 
assign n1116 = ( n0476 ) ? ( n1107 ) : ( TCON );
assign TCON_92 = n1116;
// 
// SCON_92
// 
assign n1117 = ( n0484 ) ? ( n1107 ) : ( SCON );
assign SCON_92 = n1117;
// 
// PSW_92
// 
assign n1118 = ( n0490 ) ? ( n1107 ) : ( PSW );
assign PSW_92 = n1118;
// 
// ACC_93
// 
assign n1119 = ROM[n0435];
assign ACC_93 = n1119;
// 
// PC_93
// 
assign PC_93 = n0119;
// 
// ACC_94
// 
assign n1120 = ( ACC - n0120 );
assign n1121 = { n0581[0], n0581[0], n0581[0], n0581[0], n0581[0], n0581[0], n0581[0], n0581 };
assign n1122 = ( n1120 + n1121 );
assign ACC_94 = n1122;
// 
// PC_94
// 
assign PC_94 = n0431;
// 
// PSW_94
// 
assign n1123 = ( n0622 < n0743 );
assign n1124 = ( n1123 ) ? ( n0122 ) : ( n0467 );
assign n1125 = ( n0629 < n0747 );
assign n1126 = ( n1125 ) ? ( n0122 ) : ( n0467 );
assign n1127 = ( n0636 - n0750 );
assign n1128 = n1127[8:8];
assign n1129 = n1127[7:7];
assign n1130 = ( n1128 == n1129 );
assign n1131 = !( n1130 );
assign n1132 = ( n1131 ) ? ( n0122 ) : ( n0467 );
assign n1133 = { ( n1124 ), ( n1126 ), ( n0587 ), ( n1132 ), ( n0589 ) };
assign PSW_94 = n1133;
// 
// ACC_95
// 
assign n1134 = ( ACC - n0515 );
assign n1135 = ( n1134 + n1121 );
assign ACC_95 = n1135;
// 
// PC_95
// 
assign PC_95 = n0431;
// 
// PSW_95
// 
assign n1136 = ( n0622 < n0760 );
assign n1137 = ( n1136 ) ? ( n0122 ) : ( n0467 );
assign n1138 = ( n0629 < n0763 );
assign n1139 = ( n1138 ) ? ( n0122 ) : ( n0467 );
assign n1140 = ( n0636 - n0766 );
assign n1141 = n1140[8:8];
assign n1142 = n1140[7:7];
assign n1143 = ( n1141 == n1142 );
assign n1144 = !( n1143 );
assign n1145 = ( n1144 ) ? ( n0122 ) : ( n0467 );
assign n1146 = { ( n1137 ), ( n1139 ), ( n0587 ), ( n1145 ), ( n0589 ) };
assign PSW_95 = n1146;
// 
// ACC_96
// 
assign n1147 = ( ACC - n0538 );
assign n1148 = ( n1147 + n1121 );
assign ACC_96 = n1148;
// 
// PC_96
// 
assign PC_96 = n0119;
// 
// PSW_96
// 
assign n1149 = ( n0622 < n0776 );
assign n1150 = ( n1149 ) ? ( n0122 ) : ( n0467 );
assign n1151 = ( n0629 < n0779 );
assign n1152 = ( n1151 ) ? ( n0122 ) : ( n0467 );
assign n1153 = ( n0636 - n0782 );
assign n1154 = n1153[8:8];
assign n1155 = n1153[7:7];
assign n1156 = ( n1154 == n1155 );
assign n1157 = !( n1156 );
assign n1158 = ( n1157 ) ? ( n0122 ) : ( n0467 );
assign n1159 = { ( n1150 ), ( n1152 ), ( n0587 ), ( n1158 ), ( n0589 ) };
assign PSW_96 = n1159;
// 
// ACC_97
// 
assign ACC_97 = n1148;
// 
// PC_97
// 
assign PC_97 = n0119;
// 
// PSW_97
// 
assign PSW_97 = n1159;
// 
// ACC_98
// 
assign n1160 = ( ACC - n0469 );
assign n1161 = ( n1160 + n1121 );
assign ACC_98 = n1161;
// 
// PC_98
// 
assign PC_98 = n0119;
// 
// PSW_98
// 
assign n1162 = ( n0622 < n0792 );
assign n1163 = ( n1162 ) ? ( n0122 ) : ( n0467 );
assign n1164 = ( n0629 < n0795 );
assign n1165 = ( n1164 ) ? ( n0122 ) : ( n0467 );
assign n1166 = ( n0636 - n0798 );
assign n1167 = n1166[8:8];
assign n1168 = n1166[7:7];
assign n1169 = ( n1167 == n1168 );
assign n1170 = !( n1169 );
assign n1171 = ( n1170 ) ? ( n0122 ) : ( n0467 );
assign n1172 = { ( n1163 ), ( n1165 ), ( n0587 ), ( n1171 ), ( n0589 ) };
assign PSW_98 = n1172;
// 
// ACC_99
// 
assign ACC_99 = n1161;
// 
// PC_99
// 
assign PC_99 = n0119;
// 
// PSW_99
// 
assign PSW_99 = n1172;
// 
// ACC_9a
// 
assign ACC_9a = n1161;
// 
// PC_9a
// 
assign PC_9a = n0119;
// 
// PSW_9a
// 
assign PSW_9a = n1172;
// 
// ACC_9b
// 
assign ACC_9b = n1161;
// 
// PC_9b
// 
assign PC_9b = n0119;
// 
// PSW_9b
// 
assign PSW_9b = n1172;
// 
// ACC_9c
// 
assign ACC_9c = n1161;
// 
// PC_9c
// 
assign PC_9c = n0119;
// 
// PSW_9c
// 
assign PSW_9c = n1172;
// 
// ACC_9d
// 
assign ACC_9d = n1161;
// 
// PC_9d
// 
assign PC_9d = n0119;
// 
// PSW_9d
// 
assign PSW_9d = n1172;
// 
// ACC_9e
// 
assign ACC_9e = n1161;
// 
// PC_9e
// 
assign PC_9e = n0119;
// 
// PSW_9e
// 
assign PSW_9e = n1172;
// 
// ACC_9f
// 
assign ACC_9f = n1161;
// 
// PC_9f
// 
assign PC_9f = n0119;
// 
// PSW_9f
// 
assign PSW_9f = n1172;
// 
// PC_a0
// 
assign PC_a0 = n0431;
// 
// PSW_a0
// 
assign n1173 = ~( n0557 );
assign n1174 = ( n0581 | n1173 );
assign n1175 = { ( n1174 ), ( n0960 ) };
assign PSW_a0 = n1175;
// 
// PC_a1
// 
assign PC_a1 = n0460;
// 
// PC_a2
// 
assign PC_a2 = n0431;
// 
// PSW_a2
// 
assign n1176 = { ( n0557 ), ( n0960 ) };
assign PSW_a2 = n1176;
// 
// DPL_a3
// 
assign n1177 = ( n0434 + n0118 );
assign n1178 = n1177[7:0];
assign DPL_a3 = n1178;
// 
// DPH_a3
// 
assign n1179 = n1177[15:8];
assign DPH_a3 = n1179;
// 
// PC_a3
// 
assign PC_a3 = n0119;
// 
// ACC_a4
// 
assign n1180 = { 8'b0, B };
assign n1181 = ( n0396 * n1180 );
assign n1182 = n1181[7:0];
assign ACC_a4 = n1182;
// 
// B_a4
// 
assign n1183 = n1181[15:8];
assign B_a4 = n1183;
// 
// PC_a4
// 
assign PC_a4 = n0119;
// 
// PSW_a4
// 
assign n1184 = ( n1183 == n0493 );
assign n1185 = !( n1184 );
assign n1186 = ( n1185 ) ? ( n0122 ) : ( n0467 );
assign n1187 = { ( n0467 ), ( n1015 ), ( n1186 ), ( n0589 ) };
assign PSW_a4 = n1187;
// 
// PC_a5
// 
assign PC_a5 = n0119;
// 
// PC_a6
// 
assign PC_a6 = n0431;
// 
// IRAM_a6
// 
assign n1188 = _IRAM_RD1_[7:7];
assign n1189 = ( n1188 == n0467 );
assign n1190 = ( _IRAM_RD1_ == n0470 );
assign n1191 = ( _IRAM_RD1_ == n0413 );
assign n1192 = ( _IRAM_RD1_ == n0101 );
assign n1193 = ( _IRAM_RD1_ == n0394 );
assign n1194 = ( _IRAM_RD1_ == n0332 );
assign n1195 = ( _IRAM_RD1_ == n0034 );
assign n1196 = ( _IRAM_RD1_ == n0334 );
assign n1197 = ( _IRAM_RD1_ == n0143 );
assign n1198 = ( _IRAM_RD1_ == n0479 );
assign n1199 = ( _IRAM_RD1_ == n0287 );
assign n1200 = ( _IRAM_RD1_ == n0258 );
assign n1201 = ( _IRAM_RD1_ == n0446 );
assign n1202 = ( _IRAM_RD1_ == n0038 );
assign n1203 = ( _IRAM_RD1_ == n0338 );
assign n1204 = ( _IRAM_RD1_ == n0105 );
assign n1205 = ( _IRAM_RD1_ == n0188 );
assign n1206 = ( _IRAM_RD1_ == n0109 );
assign n1207 = ( _IRAM_RD1_ == n0044 );
assign n1208 = ( _IRAM_RD1_ == n0367 );
assign n1209 = ( _IRAM_RD1_ == n0464 );
assign n1210 = ( _IRAM_RD1_ == n0491 );
assign n1211 = ( n1210 ) ? ( B ) : ( n0493 );
assign n1212 = ( n1209 ) ? ( ACC ) : ( n1211 );
assign n1213 = ( n1208 ) ? ( PSW ) : ( n1212 );
assign n1214 = ( n1207 ) ? ( IP ) : ( n1213 );
assign n1215 = ( n1206 ) ? ( P3 ) : ( n1214 );
assign n1216 = ( n1205 ) ? ( IE ) : ( n1215 );
assign n1217 = ( n1204 ) ? ( P2 ) : ( n1216 );
assign n1218 = ( n1203 ) ? ( SBUF ) : ( n1217 );
assign n1219 = ( n1202 ) ? ( SCON ) : ( n1218 );
assign n1220 = ( n1201 ) ? ( P1 ) : ( n1219 );
assign n1221 = ( n1200 ) ? ( TH1 ) : ( n1220 );
assign n1222 = ( n1199 ) ? ( TL1 ) : ( n1221 );
assign n1223 = ( n1198 ) ? ( TH0 ) : ( n1222 );
assign n1224 = ( n1197 ) ? ( TL0 ) : ( n1223 );
assign n1225 = ( n1196 ) ? ( TMOD ) : ( n1224 );
assign n1226 = ( n1195 ) ? ( TCON ) : ( n1225 );
assign n1227 = ( n1194 ) ? ( PCON ) : ( n1226 );
assign n1228 = ( n1193 ) ? ( DPH ) : ( n1227 );
assign n1229 = ( n1192 ) ? ( DPL ) : ( n1228 );
assign n1230 = ( n1191 ) ? ( SP ) : ( n1229 );
assign n1231 = ( n1190 ) ? ( P0 ) : ( n1230 );
assign n1232 = ( n1189 ) ? ( n0538 ) : ( n1231 );
// 
// PC_a7
// 
assign PC_a7 = n0431;
// 
// IRAM_a7
// 
// 
// PC_a8
// 
assign PC_a8 = n0431;
// 
// IRAM_a8
// 
// 
// PC_a9
// 
assign PC_a9 = n0431;
// 
// IRAM_a9
// 
// 
// PC_aa
// 
assign PC_aa = n0431;
// 
// IRAM_aa
// 
// 
// PC_ab
// 
assign PC_ab = n0431;
// 
// IRAM_ab
// 
// 
// PC_ac
// 
assign PC_ac = n0431;
// 
// IRAM_ac
// 
// 
// PC_ad
// 
assign PC_ad = n0431;
// 
// P3_ad
// 
assign n1233 = ( n0488 ) ? ( n0515 ) : ( P3 );
assign P3_ad = n1233;
// 
// IRAM_ad
// 
// 
// PC_ae
// 
assign PC_ae = n0431;
// 
// IRAM_ae
// 
// 
// PC_af
// 
assign PC_af = n0431;
// 
// IRAM_af
// 
// 
// PC_b0
// 
assign PC_b0 = n0431;
// 
// PSW_b0
// 
assign n1234 = ( n0581 & n1173 );
assign n1235 = { ( n1234 ), ( n0960 ) };
assign PSW_b0 = n1235;
// 
// PC_b1
// 
assign PC_b1 = n0460;
// 
// IRAM_b1
// 
// 
// SP_b1
// 
assign SP_b1 = n0578;
// 
// ACC_b2
// 
assign n1236 = { 7'b0, n1173 };
assign n1237 = ( n1236 << n0542 );
assign n1238 = ( n0550 | n1237 );
assign n1239 = ( n0465 ) ? ( n1238 ) : ( ACC );
assign ACC_b2 = n1239;
// 
// P1_b2
// 
assign n1240 = ( n0483 ) ? ( n1238 ) : ( P1 );
assign P1_b2 = n1240;
// 
// TCON_b2
// 
assign n1241 = ( n0476 ) ? ( n1238 ) : ( TCON );
assign TCON_b2 = n1241;
// 
// PC_b2
// 
assign PC_b2 = n0431;
// 
// P2_b2
// 
assign n1242 = ( n0486 ) ? ( n1238 ) : ( P2 );
assign P2_b2 = n1242;
// 
// P3_b2
// 
assign n1243 = ( n0488 ) ? ( n1238 ) : ( P3 );
assign P3_b2 = n1243;
// 
// P0_b2
// 
assign n1244 = ( n0471 ) ? ( n1238 ) : ( P0 );
assign P0_b2 = n1244;
// 
// B_b2
// 
assign n1245 = ( n0492 ) ? ( n1238 ) : ( B );
assign B_b2 = n1245;
// 
// IRAM_b2
// 
// 
// IP_b2
// 
assign n1246 = ( n0489 ) ? ( n1238 ) : ( IP );
assign IP_b2 = n1246;
// 
// IE_b2
// 
assign n1247 = ( n0487 ) ? ( n1238 ) : ( IE );
assign IE_b2 = n1247;
// 
// SCON_b2
// 
assign n1248 = ( n0484 ) ? ( n1238 ) : ( SCON );
assign SCON_b2 = n1248;
// 
// PSW_b2
// 
assign n1249 = ( n0490 ) ? ( n1238 ) : ( PSW );
assign PSW_b2 = n1249;
// 
// PC_b3
// 
assign PC_b3 = n0119;
// 
// PSW_b3
// 
assign n1250 = ~( n0581 );
assign n1251 = { ( n1250 ), ( n0960 ) };
assign PSW_b3 = n1251;
// 
// PC_b4
// 
assign n1252 = ( ACC == n0120 );
assign n1253 = !( n1252 );
assign n1254 = ( n1253 ) ? ( n0562 ) : ( n0560 );
assign PC_b4 = n1254;
// 
// PSW_b4
// 
assign n1255 = ( ACC < n0120 );
assign n1256 = ( n1255 ) ? ( n0122 ) : ( n0467 );
assign n1257 = { ( n1256 ), ( n0960 ) };
assign PSW_b4 = n1257;
// 
// PC_b5
// 
assign n1258 = ( ACC == n0515 );
assign n1259 = !( n1258 );
assign n1260 = ( n1259 ) ? ( n0562 ) : ( n0560 );
assign PC_b5 = n1260;
// 
// PSW_b5
// 
assign n1261 = ( ACC < n0515 );
assign n1262 = ( n1261 ) ? ( n0122 ) : ( n0467 );
assign n1263 = { ( n1262 ), ( n0960 ) };
assign PSW_b5 = n1263;
// 
// PC_b6
// 
assign n1264 = ( n0538 == n0120 );
assign n1265 = !( n1264 );
assign n1266 = ( n1265 ) ? ( n0562 ) : ( n0560 );
assign PC_b6 = n1266;
// 
// PSW_b6
// 
assign n1267 = ( n0538 < n0120 );
assign n1268 = ( n1267 ) ? ( n0122 ) : ( n0467 );
assign n1269 = { ( n1268 ), ( n0960 ) };
assign PSW_b6 = n1269;
// 
// PC_b7
// 
assign PC_b7 = n1266;
// 
// PSW_b7
// 
assign PSW_b7 = n1269;
// 
// PC_b8
// 
assign n1270 = ( n0469 == n0120 );
assign n1271 = !( n1270 );
assign n1272 = ( n1271 ) ? ( n0562 ) : ( n0560 );
assign PC_b8 = n1272;
// 
// PSW_b8
// 
assign n1273 = ( n0469 < n0120 );
assign n1274 = ( n1273 ) ? ( n0122 ) : ( n0467 );
assign n1275 = { ( n1274 ), ( n0960 ) };
assign PSW_b8 = n1275;
// 
// PC_b9
// 
assign PC_b9 = n1272;
// 
// PSW_b9
// 
assign PSW_b9 = n1275;
// 
// PC_ba
// 
assign PC_ba = n1272;
// 
// PSW_ba
// 
assign PSW_ba = n1275;
// 
// PC_bb
// 
assign PC_bb = n1272;
// 
// PSW_bb
// 
assign PSW_bb = n1275;
// 
// PC_bc
// 
assign PC_bc = n1272;
// 
// PSW_bc
// 
assign PSW_bc = n1275;
// 
// PC_bd
// 
assign PC_bd = n1272;
// 
// PSW_bd
// 
assign PSW_bd = n1275;
// 
// PC_be
// 
assign PC_be = n1272;
// 
// PSW_be
// 
assign PSW_be = n1275;
// 
// PC_bf
// 
assign PC_bf = n1272;
// 
// PSW_bf
// 
assign PSW_bf = n1275;
// 
// PC_c0
// 
assign PC_c0 = n0431;
// 
// IRAM_c0
// 
// 
// SP_c0
// 
assign SP_c0 = n0574;
// 
// PC_c1
// 
assign PC_c1 = n0460;
// 
// ACC_c2
// 
assign ACC_c2 = n0554;
// 
// P1_c2
// 
assign P1_c2 = n0555;
// 
// IE_c2
// 
assign IE_c2 = n0556;
// 
// PC_c2
// 
assign PC_c2 = n0431;
// 
// P2_c2
// 
assign P2_c2 = n0564;
// 
// P3_c2
// 
assign P3_c2 = n0565;
// 
// P0_c2
// 
assign P0_c2 = n0566;
// 
// B_c2
// 
assign B_c2 = n0567;
// 
// IRAM_c2
// 
// 
// IP_c2
// 
assign IP_c2 = n0568;
// 
// TCON_c2
// 
assign TCON_c2 = n0569;
// 
// SCON_c2
// 
assign SCON_c2 = n0570;
// 
// PSW_c2
// 
assign PSW_c2 = n0571;
// 
// PC_c3
// 
assign PC_c3 = n0119;
// 
// PSW_c3
// 
assign n1276 = { ( n0467 ), ( n0960 ) };
assign PSW_c3 = n1276;
// 
// ACC_c4
// 
assign n1277 = ACC[7:4];
assign n1278 = { ( n0628 ), ( n1277 ) };
assign ACC_c4 = n1278;
// 
// PC_c4
// 
assign PC_c4 = n0119;
// 
// ACC_c5
// 
assign ACC_c5 = n0515;
// 
// PCON_c5
// 
assign n1279 = ( n0475 ) ? ( ACC ) : ( PCON );
assign PCON_c5 = n1279;
// 
// P1_c5
// 
assign n1280 = ( n0483 ) ? ( ACC ) : ( P1 );
assign P1_c5 = n1280;
// 
// TMOD_c5
// 
assign n1281 = ( n0477 ) ? ( ACC ) : ( TMOD );
assign TMOD_c5 = n1281;
// 
// DPL_c5
// 
assign n1282 = ( n0473 ) ? ( ACC ) : ( DPL );
assign DPL_c5 = n1282;
// 
// DPH_c5
// 
assign n1283 = ( n0474 ) ? ( ACC ) : ( DPH );
assign DPH_c5 = n1283;
// 
// TL1_c5
// 
assign n1284 = ( n0481 ) ? ( ACC ) : ( TL1 );
assign TL1_c5 = n1284;
// 
// TL0_c5
// 
assign n1285 = ( n0478 ) ? ( ACC ) : ( TL0 );
assign TL0_c5 = n1285;
// 
// TCON_c5
// 
assign n1286 = ( n0476 ) ? ( ACC ) : ( TCON );
assign TCON_c5 = n1286;
// 
// TH1_c5
// 
assign n1287 = ( n0482 ) ? ( ACC ) : ( TH1 );
assign TH1_c5 = n1287;
// 
// TH0_c5
// 
assign n1288 = ( n0480 ) ? ( ACC ) : ( TH0 );
assign TH0_c5 = n1288;
// 
// PC_c5
// 
assign PC_c5 = n0431;
// 
// P2_c5
// 
assign n1289 = ( n0486 ) ? ( ACC ) : ( P2 );
assign P2_c5 = n1289;
// 
// P3_c5
// 
assign n1290 = ( n0488 ) ? ( ACC ) : ( P3 );
assign P3_c5 = n1290;
// 
// P0_c5
// 
assign n1291 = ( n0471 ) ? ( ACC ) : ( P0 );
assign P0_c5 = n1291;
// 
// B_c5
// 
assign n1292 = ( n0492 ) ? ( ACC ) : ( B );
assign B_c5 = n1292;
// 
// IRAM_c5
// 
// 
// IP_c5
// 
assign n1293 = ( n0489 ) ? ( ACC ) : ( IP );
assign IP_c5 = n1293;
// 
// IE_c5
// 
assign n1294 = ( n0487 ) ? ( ACC ) : ( IE );
assign IE_c5 = n1294;
// 
// SCON_c5
// 
assign n1295 = ( n0484 ) ? ( ACC ) : ( SCON );
assign SCON_c5 = n1295;
// 
// SP_c5
// 
assign n1296 = ( n0472 ) ? ( ACC ) : ( SP );
assign SP_c5 = n1296;
// 
// SBUF_c5
// 
assign n1297 = ( n0485 ) ? ( ACC ) : ( SBUF );
assign SBUF_c5 = n1297;
// 
// PSW_c5
// 
assign n1298 = ( n0490 ) ? ( ACC ) : ( PSW );
assign PSW_c5 = n1298;
// 
// ACC_c6
// 
assign ACC_c6 = n0538;
// 
// PC_c6
// 
assign PC_c6 = n0119;
// 
// IRAM_c6
// 
// 
// ACC_c7
// 
assign ACC_c7 = n0538;
// 
// PC_c7
// 
assign PC_c7 = n0119;
// 
// IRAM_c7
// 
// 
// ACC_c8
// 
assign ACC_c8 = n0469;
// 
// PC_c8
// 
assign PC_c8 = n0119;
// 
// IRAM_c8
// 
// 
// ACC_c9
// 
assign ACC_c9 = n0469;
// 
// PC_c9
// 
assign PC_c9 = n0119;
// 
// IRAM_c9
// 
// 
// ACC_ca
// 
assign ACC_ca = n0469;
// 
// PC_ca
// 
assign PC_ca = n0119;
// 
// IRAM_ca
// 
// 
// ACC_cb
// 
assign ACC_cb = n0469;
// 
// PC_cb
// 
assign PC_cb = n0119;
// 
// IRAM_cb
// 
// 
// ACC_cc
// 
assign ACC_cc = n0469;
// 
// PC_cc
// 
assign PC_cc = n0119;
// 
// IRAM_cc
// 
// 
// ACC_cd
// 
assign ACC_cd = n0469;
// 
// PC_cd
// 
assign PC_cd = n0119;
// 
// IRAM_cd
// 
// 
// ACC_ce
// 
assign ACC_ce = n0469;
// 
// PC_ce
// 
assign PC_ce = n0119;
// 
// IRAM_ce
// 
// 
// ACC_cf
// 
assign ACC_cf = n0469;
// 
// PC_cf
// 
assign PC_cf = n0119;
// 
// IRAM_cf
// 
// 
// ACC_d0
// 
assign ACC_d0 = n1083;
// 
// PCON_d0
// 
assign PCON_d0 = n1084;
// 
// B_d0
// 
assign B_d0 = n1085;
// 
// TMOD_d0
// 
assign TMOD_d0 = n1086;
// 
// DPL_d0
// 
assign DPL_d0 = n1087;
// 
// DPH_d0
// 
assign DPH_d0 = n1088;
// 
// TL1_d0
// 
assign TL1_d0 = n1089;
// 
// TL0_d0
// 
assign TL0_d0 = n1090;
// 
// IE_d0
// 
assign IE_d0 = n1091;
// 
// TH1_d0
// 
assign TH1_d0 = n1092;
// 
// TH0_d0
// 
assign TH0_d0 = n1093;
// 
// PC_d0
// 
assign PC_d0 = n0431;
// 
// P2_d0
// 
assign P2_d0 = n1094;
// 
// P3_d0
// 
assign P3_d0 = n1095;
// 
// P0_d0
// 
assign P0_d0 = n1096;
// 
// P1_d0
// 
assign P1_d0 = n1097;
// 
// IRAM_d0
// 
// 
// IP_d0
// 
assign IP_d0 = n1098;
// 
// TCON_d0
// 
assign TCON_d0 = n1099;
// 
// SCON_d0
// 
assign SCON_d0 = n1100;
// 
// SP_d0
// 
assign SP_d0 = n0616;
// 
// SBUF_d0
// 
assign SBUF_d0 = n1102;
// 
// PSW_d0
// 
assign PSW_d0 = n1103;
// 
// PC_d1
// 
assign PC_d1 = n0460;
// 
// IRAM_d1
// 
// 
// SP_d1
// 
assign SP_d1 = n0578;
// 
// ACC_d2
// 
assign n1299 = { 7'b0, n0122 };
assign n1300 = ( n1299 << n0542 );
assign n1301 = ( n0550 | n1300 );
assign n1302 = ( n0465 ) ? ( n1301 ) : ( ACC );
assign ACC_d2 = n1302;
// 
// B_d2
// 
assign n1303 = ( n0492 ) ? ( n1301 ) : ( B );
assign B_d2 = n1303;
// 
// TCON_d2
// 
assign n1304 = ( n0476 ) ? ( n1301 ) : ( TCON );
assign TCON_d2 = n1304;
// 
// PC_d2
// 
assign PC_d2 = n0431;
// 
// P2_d2
// 
assign n1305 = ( n0486 ) ? ( n1301 ) : ( P2 );
assign P2_d2 = n1305;
// 
// P3_d2
// 
assign n1306 = ( n0488 ) ? ( n1301 ) : ( P3 );
assign P3_d2 = n1306;
// 
// P0_d2
// 
assign n1307 = ( n0471 ) ? ( n1301 ) : ( P0 );
assign P0_d2 = n1307;
// 
// P1_d2
// 
assign n1308 = ( n0483 ) ? ( n1301 ) : ( P1 );
assign P1_d2 = n1308;
// 
// IRAM_d2
// 
// 
// IP_d2
// 
assign n1309 = ( n0489 ) ? ( n1301 ) : ( IP );
assign IP_d2 = n1309;
// 
// IE_d2
// 
assign n1310 = ( n0487 ) ? ( n1301 ) : ( IE );
assign IE_d2 = n1310;
// 
// SCON_d2
// 
assign n1311 = ( n0484 ) ? ( n1301 ) : ( SCON );
assign SCON_d2 = n1311;
// 
// PSW_d2
// 
assign n1312 = ( n0490 ) ? ( n1301 ) : ( PSW );
assign PSW_d2 = n1312;
// 
// PC_d3
// 
assign PC_d3 = n0119;
// 
// PSW_d3
// 
assign n1313 = { ( n0122 ), ( n0960 ) };
assign PSW_d3 = n1313;
// 
// ACC_d4
// 
assign n1314 = ( n0586 == n0122 );
assign n1315 = 4'h9;
assign n1316 = ( n0628 > n1315 );
assign n1317 = ( n1314 || n1316 );
assign n1318 = 9'h6;
assign n1319 = ( n0622 + n1318 );
assign n1320 = ( n1317 ) ? ( n1319 ) : ( n0622 );
assign n1321 = n1320[8:8];
assign n1322 = ( n1321 | n0581 );
assign n1323 = ( n1322 == n0122 );
assign n1324 = n1320[7:4];
assign n1325 = ( n1324 > n1315 );
assign n1326 = ( n1323 || n1325 );
assign n1327 = 9'h60;
assign n1328 = ( n1320 + n1327 );
assign n1329 = ( n1326 ) ? ( n1328 ) : ( n1320 );
assign n1330 = n1329[7:0];
assign ACC_d4 = n1330;
// 
// PC_d4
// 
assign PC_d4 = n0119;
// 
// PSW_d4
// 
assign n1331 = n1329[8:8];
assign n1332 = ( n1331 | n1322 );
assign n1333 = { ( n1332 ), ( n0960 ) };
assign PSW_d4 = n1333;
// 
// ACC_d5
// 
assign ACC_d5 = n0593;
// 
// PCON_d5
// 
assign PCON_d5 = n0594;
// 
// B_d5
// 
assign B_d5 = n0607;
// 
// TMOD_d5
// 
assign TMOD_d5 = n0596;
// 
// DPL_d5
// 
assign DPL_d5 = n0597;
// 
// DPH_d5
// 
assign DPH_d5 = n0598;
// 
// TL1_d5
// 
assign TL1_d5 = n0599;
// 
// TL0_d5
// 
assign TL0_d5 = n0600;
// 
// TCON_d5
// 
assign TCON_d5 = n0609;
// 
// TH1_d5
// 
assign TH1_d5 = n0602;
// 
// TH0_d5
// 
assign TH0_d5 = n0603;
// 
// PC_d5
// 
assign n1334 = ( n0515 == n0388 );
assign n1335 = !( n1334 );
assign n1336 = ( n1335 ) ? ( n0562 ) : ( n0560 );
assign PC_d5 = n1336;
// 
// P2_d5
// 
assign P2_d5 = n0604;
// 
// P3_d5
// 
assign P3_d5 = n0605;
// 
// P0_d5
// 
assign P0_d5 = n0606;
// 
// P1_d5
// 
assign P1_d5 = n0595;
// 
// IRAM_d5
// 
// 
// IP_d5
// 
assign IP_d5 = n0608;
// 
// IE_d5
// 
assign IE_d5 = n0601;
// 
// SCON_d5
// 
assign SCON_d5 = n0610;
// 
// SP_d5
// 
assign SP_d5 = n0611;
// 
// SBUF_d5
// 
assign SBUF_d5 = n0612;
// 
// PSW_d5
// 
assign PSW_d5 = n0613;
// 
// ACC_d6
// 
assign n1337 = { ( n1277 ), ( n0671 ) };
assign ACC_d6 = n1337;
// 
// PC_d6
// 
assign PC_d6 = n0119;
// 
// IRAM_d6
// 
assign n1338 = n0538[7:4];
assign n1339 = { ( n1338 ), ( n0628 ) };
// 
// ACC_d7
// 
assign ACC_d7 = n1337;
// 
// PC_d7
// 
assign PC_d7 = n0119;
// 
// IRAM_d7
// 
// 
// PC_d8
// 
assign n1340 = ( n0469 == n0388 );
assign n1341 = !( n1340 );
assign n1342 = ( n1341 ) ? ( n0808 ) : ( n0431 );
assign PC_d8 = n1342;
// 
// IRAM_d8
// 
// 
// PC_d9
// 
assign PC_d9 = n1342;
// 
// IRAM_d9
// 
// 
// PC_da
// 
assign PC_da = n1342;
// 
// IRAM_da
// 
// 
// PC_db
// 
assign PC_db = n1342;
// 
// IRAM_db
// 
// 
// PC_dc
// 
assign PC_dc = n1342;
// 
// IRAM_dc
// 
// 
// PC_dd
// 
assign PC_dd = n1342;
// 
// IRAM_dd
// 
// 
// PC_de
// 
assign PC_de = n1342;
// 
// IRAM_de
// 
// 
// PC_df
// 
assign PC_df = n1342;
// 
// IRAM_df
// 
// 
// PC_e1
// 
assign PC_e1 = n0460;
// 
// ACC_e4
// 
assign ACC_e4 = n0493;
// 
// PC_e4
// 
assign PC_e4 = n0119;
// 
// ACC_e5
// 
assign ACC_e5 = n0515;
// 
// PC_e5
// 
assign PC_e5 = n0431;
// 
// ACC_e6
// 
assign ACC_e6 = n0538;
// 
// PC_e6
// 
assign PC_e6 = n0119;
// 
// ACC_e7
// 
assign ACC_e7 = n0538;
// 
// PC_e7
// 
assign PC_e7 = n0119;
// 
// ACC_e8
// 
assign ACC_e8 = n0469;
// 
// PC_e8
// 
assign PC_e8 = n0119;
// 
// ACC_e9
// 
assign ACC_e9 = n0469;
// 
// PC_e9
// 
assign PC_e9 = n0119;
// 
// ACC_ea
// 
assign ACC_ea = n0469;
// 
// PC_ea
// 
assign PC_ea = n0119;
// 
// ACC_eb
// 
assign ACC_eb = n0469;
// 
// PC_eb
// 
assign PC_eb = n0119;
// 
// ACC_ec
// 
assign ACC_ec = n0469;
// 
// PC_ec
// 
assign PC_ec = n0119;
// 
// ACC_ed
// 
assign ACC_ed = n0469;
// 
// PC_ed
// 
assign PC_ed = n0119;
// 
// ACC_ee
// 
assign ACC_ee = n0469;
// 
// PC_ee
// 
assign PC_ee = n0119;
// 
// ACC_ef
// 
assign ACC_ef = n0469;
// 
// PC_ef
// 
assign PC_ef = n0119;
// 
// PC_f1
// 
assign PC_f1 = n0460;
// 
// IRAM_f1
// 
// 
// SP_f1
// 
assign SP_f1 = n0578;
// 
// ACC_f4
// 
assign n1343 = ~( ACC );
assign ACC_f4 = n1343;
// 
// PC_f4
// 
assign PC_f4 = n0119;
// 
// PCON_f5
// 
assign n1344 = ( n0965 ) ? ( ACC ) : ( PCON );
assign PCON_f5 = n1344;
// 
// P1_f5
// 
assign n1345 = ( n0991 ) ? ( ACC ) : ( P1 );
assign P1_f5 = n1345;
// 
// TMOD_f5
// 
assign n1346 = ( n0969 ) ? ( ACC ) : ( TMOD );
assign TMOD_f5 = n1346;
// 
// DPL_f5
// 
assign n1347 = ( n0971 ) ? ( ACC ) : ( DPL );
assign DPL_f5 = n1347;
// 
// DPH_f5
// 
assign n1348 = ( n0973 ) ? ( ACC ) : ( DPH );
assign DPH_f5 = n1348;
// 
// TL1_f5
// 
assign n1349 = ( n0975 ) ? ( ACC ) : ( TL1 );
assign TL1_f5 = n1349;
// 
// TL0_f5
// 
assign n1350 = ( n0977 ) ? ( ACC ) : ( TL0 );
assign TL0_f5 = n1350;
// 
// TCON_f5
// 
assign n1351 = ( n0979 ) ? ( ACC ) : ( TCON );
assign TCON_f5 = n1351;
// 
// TH1_f5
// 
assign n1352 = ( n0981 ) ? ( ACC ) : ( TH1 );
assign TH1_f5 = n1352;
// 
// TH0_f5
// 
assign n1353 = ( n0983 ) ? ( ACC ) : ( TH0 );
assign TH0_f5 = n1353;
// 
// PC_f5
// 
assign PC_f5 = n0431;
// 
// P2_f5
// 
assign n1354 = ( n0985 ) ? ( ACC ) : ( P2 );
assign P2_f5 = n1354;
// 
// P3_f5
// 
assign n1355 = ( n0987 ) ? ( ACC ) : ( P3 );
assign P3_f5 = n1355;
// 
// P0_f5
// 
assign n1356 = ( n0989 ) ? ( ACC ) : ( P0 );
assign P0_f5 = n1356;
// 
// B_f5
// 
assign n1357 = ( n0967 ) ? ( ACC ) : ( B );
assign B_f5 = n1357;
// 
// IRAM_f5
// 
// 
// IP_f5
// 
assign n1358 = ( n0994 ) ? ( ACC ) : ( IP );
assign IP_f5 = n1358;
// 
// IE_f5
// 
assign n1359 = ( n0996 ) ? ( ACC ) : ( IE );
assign IE_f5 = n1359;
// 
// SCON_f5
// 
assign n1360 = ( n0998 ) ? ( ACC ) : ( SCON );
assign SCON_f5 = n1360;
// 
// SP_f5
// 
assign n1361 = ( n1000 ) ? ( ACC ) : ( SP );
assign SP_f5 = n1361;
// 
// SBUF_f5
// 
assign n1362 = ( n1002 ) ? ( ACC ) : ( SBUF );
assign SBUF_f5 = n1362;
// 
// PSW_f5
// 
assign n1363 = ( n1004 ) ? ( ACC ) : ( PSW );
assign PSW_f5 = n1363;
// 
// PC_f6
// 
assign PC_f6 = n0119;
// 
// IRAM_f6
// 
// 
// PC_f7
// 
assign PC_f7 = n0119;
// 
// IRAM_f7
// 
// 
// PC_f8
// 
assign PC_f8 = n0119;
// 
// IRAM_f8
// 
// 
// PC_f9
// 
assign PC_f9 = n0119;
// 
// IRAM_f9
// 
// 
// PC_fa
// 
assign PC_fa = n0119;
// 
// IRAM_fa
// 
// 
// PC_fb
// 
assign PC_fb = n0119;
// 
// IRAM_fb
// 
// 
// PC_fc
// 
assign PC_fc = n0119;
// 
// IRAM_fc
// 
// 
// PC_fd
// 
assign PC_fd = n0119;
// 
// IRAM_fd
// 
// 
// PC_fe
// 
assign PC_fe = n0119;
// 
// IRAM_fe
// 
// 
// PC_ff
// 
assign PC_ff = n0119;
// 
// IRAM_ff
// 
assign n1364 = 8'h3;
assign n1365 = ( n0001 == n1364 );
assign n1366 = 8'h4;
assign n1367 = ( n0001 == n1366 );
assign n1368 = 8'h13;
assign n1369 = ( n0001 == n1368 );
assign n1370 = 8'h14;
assign n1371 = ( n0001 == n1370 );
assign n1372 = 8'h23;
assign n1373 = ( n0001 == n1372 );
assign n1374 = 8'h24;
assign n1375 = ( n0001 == n1374 );
assign n1376 = 8'h2c;
assign n1377 = ( n0001 == n1376 );
assign n1378 = 8'h33;
assign n1379 = ( n0001 == n1378 );
assign n1380 = 8'h34;
assign n1381 = ( n0001 == n1380 );
assign n1382 = 8'h3c;
assign n1383 = ( n0001 == n1382 );
assign n1384 = 8'h44;
assign n1385 = ( n0001 == n1384 );
assign n1386 = 8'h4c;
assign n1387 = ( n0001 == n1386 );
assign n1388 = 8'h54;
assign n1389 = ( n0001 == n1388 );
assign n1390 = 8'h5c;
assign n1391 = ( n0001 == n1390 );
assign n1392 = 8'h64;
assign n1393 = ( n0001 == n1392 );
assign n1394 = 8'h6c;
assign n1395 = ( n0001 == n1394 );
assign n1396 = 8'h74;
assign n1397 = ( n0001 == n1396 );
assign n1398 = 8'h84;
assign n1399 = ( n0001 == n1398 );
assign n1400 = ( n0001 == n0479 );
assign n1401 = 8'h94;
assign n1402 = ( n0001 == n1401 );
assign n1403 = 8'h9c;
assign n1404 = ( n0001 == n1403 );
assign n1405 = 8'ha4;
assign n1406 = ( n0001 == n1405 );
assign n1407 = 8'hc4;
assign n1408 = ( n0001 == n1407 );
assign n1409 = 8'hcc;
assign n1410 = ( n0001 == n1409 );
assign n1411 = 8'hd4;
assign n1412 = ( n0001 == n1411 );
assign n1413 = 8'he4;
assign n1414 = ( n0001 == n1413 );
assign n1415 = 8'hec;
assign n1416 = ( n0001 == n1415 );
assign n1417 = 8'hf4;
assign n1418 = ( n0001 == n1417 );
assign ACC_next = 
  ( n1365 ) ? ACC_03 : 
  ( n1367 ) ? ACC_04 : 
  ( n0159 ) ? ACC_05 : 
  ( n0094 ) ? ACC_10 : 
  ( n1369 ) ? ACC_13 : 
  ( n1371 ) ? ACC_14 : 
  ( n0161 ) ? ACC_15 : 
  ( n1373 ) ? ACC_23 : 
  ( n1375 ) ? ACC_24 : 
  ( n0163 ) ? ACC_25 : 
  ( n0011 ) ? ACC_26 : 
  ( n0311 ) ? ACC_27 : 
  ( n0013 ) ? ACC_28 : 
  ( n0313 ) ? ACC_29 : 
  ( n0134 ) ? ACC_2a : 
  ( n0278 ) ? ACC_2b : 
  ( n1377 ) ? ACC_2c : 
  ( n0249 ) ? ACC_2d : 
  ( n0069 ) ? ACC_2e : 
  ( n0220 ) ? ACC_2f : 
  ( n1379 ) ? ACC_33 : 
  ( n1381 ) ? ACC_34 : 
  ( n0165 ) ? ACC_35 : 
  ( n0015 ) ? ACC_36 : 
  ( n0315 ) ? ACC_37 : 
  ( n0017 ) ? ACC_38 : 
  ( n0317 ) ? ACC_39 : 
  ( n0136 ) ? ACC_3a : 
  ( n0280 ) ? ACC_3b : 
  ( n1383 ) ? ACC_3c : 
  ( n0251 ) ? ACC_3d : 
  ( n0071 ) ? ACC_3e : 
  ( n0222 ) ? ACC_3f : 
  ( n0169 ) ? ACC_43 : 
  ( n1385 ) ? ACC_44 : 
  ( n0171 ) ? ACC_45 : 
  ( n0019 ) ? ACC_46 : 
  ( n0319 ) ? ACC_47 : 
  ( n0021 ) ? ACC_48 : 
  ( n0321 ) ? ACC_49 : 
  ( n0138 ) ? ACC_4a : 
  ( n0282 ) ? ACC_4b : 
  ( n1387 ) ? ACC_4c : 
  ( n0253 ) ? ACC_4d : 
  ( n0073 ) ? ACC_4e : 
  ( n0224 ) ? ACC_4f : 
  ( n0175 ) ? ACC_53 : 
  ( n1389 ) ? ACC_54 : 
  ( n0177 ) ? ACC_55 : 
  ( n0023 ) ? ACC_56 : 
  ( n0323 ) ? ACC_57 : 
  ( n0025 ) ? ACC_58 : 
  ( n0325 ) ? ACC_59 : 
  ( n0140 ) ? ACC_5a : 
  ( n0284 ) ? ACC_5b : 
  ( n1391 ) ? ACC_5c : 
  ( n0255 ) ? ACC_5d : 
  ( n0075 ) ? ACC_5e : 
  ( n0226 ) ? ACC_5f : 
  ( n0179 ) ? ACC_62 : 
  ( n0181 ) ? ACC_63 : 
  ( n1393 ) ? ACC_64 : 
  ( n0183 ) ? ACC_65 : 
  ( n0027 ) ? ACC_66 : 
  ( n0327 ) ? ACC_67 : 
  ( n0029 ) ? ACC_68 : 
  ( n0329 ) ? ACC_69 : 
  ( n0142 ) ? ACC_6a : 
  ( n0286 ) ? ACC_6b : 
  ( n1395 ) ? ACC_6c : 
  ( n0257 ) ? ACC_6d : 
  ( n0077 ) ? ACC_6e : 
  ( n0228 ) ? ACC_6f : 
  ( n1397 ) ? ACC_74 : 
  ( n0445 ) ? ACC_75 : 
  ( n0395 ) ? ACC_83 : 
  ( n1399 ) ? ACC_84 : 
  ( n0185 ) ? ACC_85 : 
  ( n0033 ) ? ACC_86 : 
  ( n0333 ) ? ACC_87 : 
  ( n0035 ) ? ACC_88 : 
  ( n0335 ) ? ACC_89 : 
  ( n0144 ) ? ACC_8a : 
  ( n0288 ) ? ACC_8b : 
  ( n1400 ) ? ACC_8c : 
  ( n0259 ) ? ACC_8d : 
  ( n0079 ) ? ACC_8e : 
  ( n0230 ) ? ACC_8f : 
  ( n0104 ) ? ACC_92 : 
  ( n0433 ) ? ACC_93 : 
  ( n1402 ) ? ACC_94 : 
  ( n0187 ) ? ACC_95 : 
  ( n0037 ) ? ACC_96 : 
  ( n0337 ) ? ACC_97 : 
  ( n0039 ) ? ACC_98 : 
  ( n0339 ) ? ACC_99 : 
  ( n0146 ) ? ACC_9a : 
  ( n0290 ) ? ACC_9b : 
  ( n1404 ) ? ACC_9c : 
  ( n0261 ) ? ACC_9d : 
  ( n0081 ) ? ACC_9e : 
  ( n0232 ) ? ACC_9f : 
  ( n1406 ) ? ACC_a4 : 
  ( n0112 ) ? ACC_b2 : 
  ( n0114 ) ? ACC_c2 : 
  ( n1408 ) ? ACC_c4 : 
  ( n0209 ) ? ACC_c5 : 
  ( n0047 ) ? ACC_c6 : 
  ( n0347 ) ? ACC_c7 : 
  ( n0049 ) ? ACC_c8 : 
  ( n0349 ) ? ACC_c9 : 
  ( n0150 ) ? ACC_ca : 
  ( n0294 ) ? ACC_cb : 
  ( n1410 ) ? ACC_cc : 
  ( n0265 ) ? ACC_cd : 
  ( n0085 ) ? ACC_ce : 
  ( n0236 ) ? ACC_cf : 
  ( n0368 ) ? ACC_d0 : 
  ( n0116 ) ? ACC_d2 : 
  ( n1412 ) ? ACC_d4 : 
  ( n0211 ) ? ACC_d5 : 
  ( n0051 ) ? ACC_d6 : 
  ( n0351 ) ? ACC_d7 : 
  ( n1414 ) ? ACC_e4 : 
  ( n0213 ) ? ACC_e5 : 
  ( n0055 ) ? ACC_e6 : 
  ( n0355 ) ? ACC_e7 : 
  ( n0057 ) ? ACC_e8 : 
  ( n0357 ) ? ACC_e9 : 
  ( n0154 ) ? ACC_ea : 
  ( n0298 ) ? ACC_eb : 
  ( n1416 ) ? ACC_ec : 
  ( n0269 ) ? ACC_ed : 
  ( n0089 ) ? ACC_ee : 
  ( n0240 ) ? ACC_ef : 
  ( n1418 ) ? ACC_f4 : 
  ( ACC );
assign n1419 = 8'hf5;
assign n1420 = ( n0001 == n1419 );
assign PCON_next = 
  ( n0159 ) ? PCON_05 : 
  ( n0161 ) ? PCON_15 : 
  ( n0167 ) ? PCON_42 : 
  ( n0169 ) ? PCON_43 : 
  ( n0173 ) ? PCON_52 : 
  ( n0175 ) ? PCON_53 : 
  ( n0179 ) ? PCON_62 : 
  ( n0181 ) ? PCON_63 : 
  ( n0445 ) ? PCON_75 : 
  ( n0185 ) ? PCON_85 : 
  ( n0033 ) ? PCON_86 : 
  ( n0333 ) ? PCON_87 : 
  ( n0035 ) ? PCON_88 : 
  ( n0335 ) ? PCON_89 : 
  ( n0144 ) ? PCON_8a : 
  ( n0288 ) ? PCON_8b : 
  ( n1400 ) ? PCON_8c : 
  ( n0259 ) ? PCON_8d : 
  ( n0079 ) ? PCON_8e : 
  ( n0230 ) ? PCON_8f : 
  ( n0209 ) ? PCON_c5 : 
  ( n0368 ) ? PCON_d0 : 
  ( n0211 ) ? PCON_d5 : 
  ( n1420 ) ? PCON_f5 : 
  ( PCON );
assign B_next = 
  ( n0159 ) ? B_05 : 
  ( n0094 ) ? B_10 : 
  ( n0161 ) ? B_15 : 
  ( n0167 ) ? B_42 : 
  ( n0169 ) ? B_43 : 
  ( n0173 ) ? B_52 : 
  ( n0175 ) ? B_53 : 
  ( n0179 ) ? B_62 : 
  ( n0181 ) ? B_63 : 
  ( n0445 ) ? B_75 : 
  ( n1399 ) ? B_84 : 
  ( n0185 ) ? B_85 : 
  ( n0033 ) ? B_86 : 
  ( n0333 ) ? B_87 : 
  ( n0035 ) ? B_88 : 
  ( n0335 ) ? B_89 : 
  ( n0144 ) ? B_8a : 
  ( n0288 ) ? B_8b : 
  ( n1400 ) ? B_8c : 
  ( n0259 ) ? B_8d : 
  ( n0079 ) ? B_8e : 
  ( n0230 ) ? B_8f : 
  ( n0104 ) ? B_92 : 
  ( n1406 ) ? B_a4 : 
  ( n0112 ) ? B_b2 : 
  ( n0114 ) ? B_c2 : 
  ( n0209 ) ? B_c5 : 
  ( n0368 ) ? B_d0 : 
  ( n0116 ) ? B_d2 : 
  ( n0211 ) ? B_d5 : 
  ( n1420 ) ? B_f5 : 
  ( B );
assign TMOD_next = 
  ( n0159 ) ? TMOD_05 : 
  ( n0161 ) ? TMOD_15 : 
  ( n0167 ) ? TMOD_42 : 
  ( n0169 ) ? TMOD_43 : 
  ( n0173 ) ? TMOD_52 : 
  ( n0175 ) ? TMOD_53 : 
  ( n0179 ) ? TMOD_62 : 
  ( n0181 ) ? TMOD_63 : 
  ( n0445 ) ? TMOD_75 : 
  ( n0185 ) ? TMOD_85 : 
  ( n0033 ) ? TMOD_86 : 
  ( n0333 ) ? TMOD_87 : 
  ( n0035 ) ? TMOD_88 : 
  ( n0335 ) ? TMOD_89 : 
  ( n0144 ) ? TMOD_8a : 
  ( n0288 ) ? TMOD_8b : 
  ( n1400 ) ? TMOD_8c : 
  ( n0259 ) ? TMOD_8d : 
  ( n0079 ) ? TMOD_8e : 
  ( n0230 ) ? TMOD_8f : 
  ( n0209 ) ? TMOD_c5 : 
  ( n0368 ) ? TMOD_d0 : 
  ( n0211 ) ? TMOD_d5 : 
  ( n1420 ) ? TMOD_f5 : 
  ( TMOD );
assign n1421 = 8'ha3;
assign n1422 = ( n0001 == n1421 );
assign DPL_next = 
  ( n0159 ) ? DPL_05 : 
  ( n0161 ) ? DPL_15 : 
  ( n0167 ) ? DPL_42 : 
  ( n0169 ) ? DPL_43 : 
  ( n0173 ) ? DPL_52 : 
  ( n0175 ) ? DPL_53 : 
  ( n0179 ) ? DPL_62 : 
  ( n0181 ) ? DPL_63 : 
  ( n0445 ) ? DPL_75 : 
  ( n0185 ) ? DPL_85 : 
  ( n0033 ) ? DPL_86 : 
  ( n0333 ) ? DPL_87 : 
  ( n0035 ) ? DPL_88 : 
  ( n0335 ) ? DPL_89 : 
  ( n0144 ) ? DPL_8a : 
  ( n0288 ) ? DPL_8b : 
  ( n1400 ) ? DPL_8c : 
  ( n0259 ) ? DPL_8d : 
  ( n0079 ) ? DPL_8e : 
  ( n0230 ) ? DPL_8f : 
  ( n0447 ) ? DPL_90 : 
  ( n1422 ) ? DPL_a3 : 
  ( n0209 ) ? DPL_c5 : 
  ( n0368 ) ? DPL_d0 : 
  ( n0211 ) ? DPL_d5 : 
  ( n1420 ) ? DPL_f5 : 
  ( DPL );
assign DPH_next = 
  ( n0159 ) ? DPH_05 : 
  ( n0161 ) ? DPH_15 : 
  ( n0167 ) ? DPH_42 : 
  ( n0169 ) ? DPH_43 : 
  ( n0173 ) ? DPH_52 : 
  ( n0175 ) ? DPH_53 : 
  ( n0179 ) ? DPH_62 : 
  ( n0181 ) ? DPH_63 : 
  ( n0445 ) ? DPH_75 : 
  ( n0185 ) ? DPH_85 : 
  ( n0033 ) ? DPH_86 : 
  ( n0333 ) ? DPH_87 : 
  ( n0035 ) ? DPH_88 : 
  ( n0335 ) ? DPH_89 : 
  ( n0144 ) ? DPH_8a : 
  ( n0288 ) ? DPH_8b : 
  ( n1400 ) ? DPH_8c : 
  ( n0259 ) ? DPH_8d : 
  ( n0079 ) ? DPH_8e : 
  ( n0230 ) ? DPH_8f : 
  ( n0447 ) ? DPH_90 : 
  ( n1422 ) ? DPH_a3 : 
  ( n0209 ) ? DPH_c5 : 
  ( n0368 ) ? DPH_d0 : 
  ( n0211 ) ? DPH_d5 : 
  ( n1420 ) ? DPH_f5 : 
  ( DPH );
assign TL1_next = 
  ( n0159 ) ? TL1_05 : 
  ( n0161 ) ? TL1_15 : 
  ( n0167 ) ? TL1_42 : 
  ( n0169 ) ? TL1_43 : 
  ( n0173 ) ? TL1_52 : 
  ( n0175 ) ? TL1_53 : 
  ( n0179 ) ? TL1_62 : 
  ( n0181 ) ? TL1_63 : 
  ( n0445 ) ? TL1_75 : 
  ( n0185 ) ? TL1_85 : 
  ( n0033 ) ? TL1_86 : 
  ( n0333 ) ? TL1_87 : 
  ( n0035 ) ? TL1_88 : 
  ( n0335 ) ? TL1_89 : 
  ( n0144 ) ? TL1_8a : 
  ( n0288 ) ? TL1_8b : 
  ( n1400 ) ? TL1_8c : 
  ( n0259 ) ? TL1_8d : 
  ( n0079 ) ? TL1_8e : 
  ( n0230 ) ? TL1_8f : 
  ( n0209 ) ? TL1_c5 : 
  ( n0368 ) ? TL1_d0 : 
  ( n0211 ) ? TL1_d5 : 
  ( n1420 ) ? TL1_f5 : 
  ( TL1 );
assign TL0_next = 
  ( n0159 ) ? TL0_05 : 
  ( n0161 ) ? TL0_15 : 
  ( n0167 ) ? TL0_42 : 
  ( n0169 ) ? TL0_43 : 
  ( n0173 ) ? TL0_52 : 
  ( n0175 ) ? TL0_53 : 
  ( n0179 ) ? TL0_62 : 
  ( n0181 ) ? TL0_63 : 
  ( n0445 ) ? TL0_75 : 
  ( n0185 ) ? TL0_85 : 
  ( n0033 ) ? TL0_86 : 
  ( n0333 ) ? TL0_87 : 
  ( n0035 ) ? TL0_88 : 
  ( n0335 ) ? TL0_89 : 
  ( n0144 ) ? TL0_8a : 
  ( n0288 ) ? TL0_8b : 
  ( n1400 ) ? TL0_8c : 
  ( n0259 ) ? TL0_8d : 
  ( n0079 ) ? TL0_8e : 
  ( n0230 ) ? TL0_8f : 
  ( n0209 ) ? TL0_c5 : 
  ( n0368 ) ? TL0_d0 : 
  ( n0211 ) ? TL0_d5 : 
  ( n1420 ) ? TL0_f5 : 
  ( TL0 );
assign TCON_next = 
  ( n0159 ) ? TCON_05 : 
  ( n0094 ) ? TCON_10 : 
  ( n0161 ) ? TCON_15 : 
  ( n0167 ) ? TCON_42 : 
  ( n0169 ) ? TCON_43 : 
  ( n0173 ) ? TCON_52 : 
  ( n0175 ) ? TCON_53 : 
  ( n0179 ) ? TCON_62 : 
  ( n0181 ) ? TCON_63 : 
  ( n0445 ) ? TCON_75 : 
  ( n0185 ) ? TCON_85 : 
  ( n0033 ) ? TCON_86 : 
  ( n0333 ) ? TCON_87 : 
  ( n0035 ) ? TCON_88 : 
  ( n0335 ) ? TCON_89 : 
  ( n0144 ) ? TCON_8a : 
  ( n0288 ) ? TCON_8b : 
  ( n1400 ) ? TCON_8c : 
  ( n0259 ) ? TCON_8d : 
  ( n0079 ) ? TCON_8e : 
  ( n0230 ) ? TCON_8f : 
  ( n0104 ) ? TCON_92 : 
  ( n0112 ) ? TCON_b2 : 
  ( n0114 ) ? TCON_c2 : 
  ( n0209 ) ? TCON_c5 : 
  ( n0368 ) ? TCON_d0 : 
  ( n0116 ) ? TCON_d2 : 
  ( n0211 ) ? TCON_d5 : 
  ( n1420 ) ? TCON_f5 : 
  ( TCON );
assign TH1_next = 
  ( n0159 ) ? TH1_05 : 
  ( n0161 ) ? TH1_15 : 
  ( n0167 ) ? TH1_42 : 
  ( n0169 ) ? TH1_43 : 
  ( n0173 ) ? TH1_52 : 
  ( n0175 ) ? TH1_53 : 
  ( n0179 ) ? TH1_62 : 
  ( n0181 ) ? TH1_63 : 
  ( n0445 ) ? TH1_75 : 
  ( n0185 ) ? TH1_85 : 
  ( n0033 ) ? TH1_86 : 
  ( n0333 ) ? TH1_87 : 
  ( n0035 ) ? TH1_88 : 
  ( n0335 ) ? TH1_89 : 
  ( n0144 ) ? TH1_8a : 
  ( n0288 ) ? TH1_8b : 
  ( n1400 ) ? TH1_8c : 
  ( n0259 ) ? TH1_8d : 
  ( n0079 ) ? TH1_8e : 
  ( n0230 ) ? TH1_8f : 
  ( n0209 ) ? TH1_c5 : 
  ( n0368 ) ? TH1_d0 : 
  ( n0211 ) ? TH1_d5 : 
  ( n1420 ) ? TH1_f5 : 
  ( TH1 );
assign TH0_next = 
  ( n0159 ) ? TH0_05 : 
  ( n0161 ) ? TH0_15 : 
  ( n0167 ) ? TH0_42 : 
  ( n0169 ) ? TH0_43 : 
  ( n0173 ) ? TH0_52 : 
  ( n0175 ) ? TH0_53 : 
  ( n0179 ) ? TH0_62 : 
  ( n0181 ) ? TH0_63 : 
  ( n0445 ) ? TH0_75 : 
  ( n0185 ) ? TH0_85 : 
  ( n0033 ) ? TH0_86 : 
  ( n0333 ) ? TH0_87 : 
  ( n0035 ) ? TH0_88 : 
  ( n0335 ) ? TH0_89 : 
  ( n0144 ) ? TH0_8a : 
  ( n0288 ) ? TH0_8b : 
  ( n1400 ) ? TH0_8c : 
  ( n0259 ) ? TH0_8d : 
  ( n0079 ) ? TH0_8e : 
  ( n0230 ) ? TH0_8f : 
  ( n0209 ) ? TH0_c5 : 
  ( n0368 ) ? TH0_d0 : 
  ( n0211 ) ? TH0_d5 : 
  ( n1420 ) ? TH0_f5 : 
  ( TH0 );
assign n1423 = ( n0001 == n0493 );
assign n1424 = 8'hc;
assign n1425 = ( n0001 == n1424 );
assign n1426 = 8'h1c;
assign n1427 = ( n0001 == n1426 );
assign n1428 = 8'h40;
assign n1429 = ( n0001 == n1428 );
assign n1430 = 8'h50;
assign n1431 = ( n0001 == n1430 );
assign n1432 = 8'h60;
assign n1433 = ( n0001 == n1432 );
assign n1434 = 8'h70;
assign n1435 = ( n0001 == n1434 );
assign n1436 = 8'h73;
assign n1437 = ( n0001 == n1436 );
assign n1438 = 8'h78;
assign n1439 = ( n0001 == n1438 );
assign n1440 = 8'h79;
assign n1441 = ( n0001 == n1440 );
assign n1442 = 8'h7a;
assign n1443 = ( n0001 == n1442 );
assign n1444 = 8'h7b;
assign n1445 = ( n0001 == n1444 );
assign n1446 = 8'h7c;
assign n1447 = ( n0001 == n1446 );
assign n1448 = 8'h7d;
assign n1449 = ( n0001 == n1448 );
assign n1450 = 8'h7e;
assign n1451 = ( n0001 == n1450 );
assign n1452 = 8'h7f;
assign n1453 = ( n0001 == n1452 );
assign n1454 = ( n0001 == n0470 );
assign n1455 = 8'ha5;
assign n1456 = ( n0001 == n1455 );
assign n1457 = 8'hb3;
assign n1458 = ( n0001 == n1457 );
assign n1459 = 8'hc3;
assign n1460 = ( n0001 == n1459 );
assign n1461 = 8'hd3;
assign n1462 = ( n0001 == n1461 );
assign n1463 = 8'hdc;
assign n1464 = ( n0001 == n1463 );
assign n1465 = 8'hf8;
assign n1466 = ( n0001 == n1465 );
assign n1467 = 8'hf9;
assign n1468 = ( n0001 == n1467 );
assign n1469 = 8'hfa;
assign n1470 = ( n0001 == n1469 );
assign n1471 = 8'hfb;
assign n1472 = ( n0001 == n1471 );
assign n1473 = 8'hfc;
assign n1474 = ( n0001 == n1473 );
assign n1475 = 8'hfd;
assign n1476 = ( n0001 == n1475 );
assign n1477 = 8'hfe;
assign n1478 = ( n0001 == n1477 );
assign n1479 = ( n0001 == n1010 );
assign PC_next = 
  ( n1423 ) ? PC_00 : 
  ( n0398 ) ? PC_01 : 
  ( n0441 ) ? PC_02 : 
  ( n1365 ) ? PC_03 : 
  ( n1367 ) ? PC_04 : 
  ( n0159 ) ? PC_05 : 
  ( n0003 ) ? PC_06 : 
  ( n0303 ) ? PC_07 : 
  ( n0005 ) ? PC_08 : 
  ( n0305 ) ? PC_09 : 
  ( n0130 ) ? PC_0a : 
  ( n0274 ) ? PC_0b : 
  ( n1425 ) ? PC_0c : 
  ( n0245 ) ? PC_0d : 
  ( n0065 ) ? PC_0e : 
  ( n0216 ) ? PC_0f : 
  ( n0094 ) ? PC_10 : 
  ( n0400 ) ? PC_11 : 
  ( n0443 ) ? PC_12 : 
  ( n1369 ) ? PC_13 : 
  ( n1371 ) ? PC_14 : 
  ( n0161 ) ? PC_15 : 
  ( n0007 ) ? PC_16 : 
  ( n0307 ) ? PC_17 : 
  ( n0009 ) ? PC_18 : 
  ( n0309 ) ? PC_19 : 
  ( n0132 ) ? PC_1a : 
  ( n0276 ) ? PC_1b : 
  ( n1427 ) ? PC_1c : 
  ( n0247 ) ? PC_1d : 
  ( n0067 ) ? PC_1e : 
  ( n0218 ) ? PC_1f : 
  ( n0096 ) ? PC_20 : 
  ( n0402 ) ? PC_21 : 
  ( n0364 ) ? PC_22 : 
  ( n1373 ) ? PC_23 : 
  ( n1375 ) ? PC_24 : 
  ( n0163 ) ? PC_25 : 
  ( n0011 ) ? PC_26 : 
  ( n0311 ) ? PC_27 : 
  ( n0013 ) ? PC_28 : 
  ( n0313 ) ? PC_29 : 
  ( n0134 ) ? PC_2a : 
  ( n0278 ) ? PC_2b : 
  ( n1377 ) ? PC_2c : 
  ( n0249 ) ? PC_2d : 
  ( n0069 ) ? PC_2e : 
  ( n0220 ) ? PC_2f : 
  ( n0098 ) ? PC_30 : 
  ( n0404 ) ? PC_31 : 
  ( n0366 ) ? PC_32 : 
  ( n1379 ) ? PC_33 : 
  ( n1381 ) ? PC_34 : 
  ( n0165 ) ? PC_35 : 
  ( n0015 ) ? PC_36 : 
  ( n0315 ) ? PC_37 : 
  ( n0017 ) ? PC_38 : 
  ( n0317 ) ? PC_39 : 
  ( n0136 ) ? PC_3a : 
  ( n0280 ) ? PC_3b : 
  ( n1383 ) ? PC_3c : 
  ( n0251 ) ? PC_3d : 
  ( n0071 ) ? PC_3e : 
  ( n0222 ) ? PC_3f : 
  ( n1429 ) ? PC_40 : 
  ( n0406 ) ? PC_41 : 
  ( n0167 ) ? PC_42 : 
  ( n0169 ) ? PC_43 : 
  ( n1385 ) ? PC_44 : 
  ( n0171 ) ? PC_45 : 
  ( n0019 ) ? PC_46 : 
  ( n0319 ) ? PC_47 : 
  ( n0021 ) ? PC_48 : 
  ( n0321 ) ? PC_49 : 
  ( n0138 ) ? PC_4a : 
  ( n0282 ) ? PC_4b : 
  ( n1387 ) ? PC_4c : 
  ( n0253 ) ? PC_4d : 
  ( n0073 ) ? PC_4e : 
  ( n0224 ) ? PC_4f : 
  ( n1431 ) ? PC_50 : 
  ( n0408 ) ? PC_51 : 
  ( n0173 ) ? PC_52 : 
  ( n0175 ) ? PC_53 : 
  ( n1389 ) ? PC_54 : 
  ( n0177 ) ? PC_55 : 
  ( n0023 ) ? PC_56 : 
  ( n0323 ) ? PC_57 : 
  ( n0025 ) ? PC_58 : 
  ( n0325 ) ? PC_59 : 
  ( n0140 ) ? PC_5a : 
  ( n0284 ) ? PC_5b : 
  ( n1391 ) ? PC_5c : 
  ( n0255 ) ? PC_5d : 
  ( n0075 ) ? PC_5e : 
  ( n0226 ) ? PC_5f : 
  ( n1433 ) ? PC_60 : 
  ( n0410 ) ? PC_61 : 
  ( n0179 ) ? PC_62 : 
  ( n0181 ) ? PC_63 : 
  ( n1393 ) ? PC_64 : 
  ( n0183 ) ? PC_65 : 
  ( n0027 ) ? PC_66 : 
  ( n0327 ) ? PC_67 : 
  ( n0029 ) ? PC_68 : 
  ( n0329 ) ? PC_69 : 
  ( n0142 ) ? PC_6a : 
  ( n0286 ) ? PC_6b : 
  ( n1395 ) ? PC_6c : 
  ( n0257 ) ? PC_6d : 
  ( n0077 ) ? PC_6e : 
  ( n0228 ) ? PC_6f : 
  ( n1435 ) ? PC_70 : 
  ( n0412 ) ? PC_71 : 
  ( n0100 ) ? PC_72 : 
  ( n1437 ) ? PC_73 : 
  ( n1397 ) ? PC_74 : 
  ( n0445 ) ? PC_75 : 
  ( n0031 ) ? PC_76 : 
  ( n0331 ) ? PC_77 : 
  ( n1439 ) ? PC_78 : 
  ( n1441 ) ? PC_79 : 
  ( n1443 ) ? PC_7a : 
  ( n1445 ) ? PC_7b : 
  ( n1447 ) ? PC_7c : 
  ( n1449 ) ? PC_7d : 
  ( n1451 ) ? PC_7e : 
  ( n1453 ) ? PC_7f : 
  ( n1454 ) ? PC_80 : 
  ( n0414 ) ? PC_81 : 
  ( n0102 ) ? PC_82 : 
  ( n0395 ) ? PC_83 : 
  ( n1399 ) ? PC_84 : 
  ( n0185 ) ? PC_85 : 
  ( n0033 ) ? PC_86 : 
  ( n0333 ) ? PC_87 : 
  ( n0035 ) ? PC_88 : 
  ( n0335 ) ? PC_89 : 
  ( n0144 ) ? PC_8a : 
  ( n0288 ) ? PC_8b : 
  ( n1400 ) ? PC_8c : 
  ( n0259 ) ? PC_8d : 
  ( n0079 ) ? PC_8e : 
  ( n0230 ) ? PC_8f : 
  ( n0447 ) ? PC_90 : 
  ( n0416 ) ? PC_91 : 
  ( n0104 ) ? PC_92 : 
  ( n0433 ) ? PC_93 : 
  ( n1402 ) ? PC_94 : 
  ( n0187 ) ? PC_95 : 
  ( n0037 ) ? PC_96 : 
  ( n0337 ) ? PC_97 : 
  ( n0039 ) ? PC_98 : 
  ( n0339 ) ? PC_99 : 
  ( n0146 ) ? PC_9a : 
  ( n0290 ) ? PC_9b : 
  ( n1404 ) ? PC_9c : 
  ( n0261 ) ? PC_9d : 
  ( n0081 ) ? PC_9e : 
  ( n0232 ) ? PC_9f : 
  ( n0106 ) ? PC_a0 : 
  ( n0418 ) ? PC_a1 : 
  ( n0108 ) ? PC_a2 : 
  ( n1422 ) ? PC_a3 : 
  ( n1406 ) ? PC_a4 : 
  ( n1456 ) ? PC_a5 : 
  ( n0041 ) ? PC_a6 : 
  ( n0341 ) ? PC_a7 : 
  ( n0189 ) ? PC_a8 : 
  ( n0191 ) ? PC_a9 : 
  ( n0193 ) ? PC_aa : 
  ( n0195 ) ? PC_ab : 
  ( n0197 ) ? PC_ac : 
  ( n0199 ) ? PC_ad : 
  ( n0201 ) ? PC_ae : 
  ( n0203 ) ? PC_af : 
  ( n0110 ) ? PC_b0 : 
  ( n0420 ) ? PC_b1 : 
  ( n0112 ) ? PC_b2 : 
  ( n1458 ) ? PC_b3 : 
  ( n0449 ) ? PC_b4 : 
  ( n0205 ) ? PC_b5 : 
  ( n0043 ) ? PC_b6 : 
  ( n0343 ) ? PC_b7 : 
  ( n0045 ) ? PC_b8 : 
  ( n0345 ) ? PC_b9 : 
  ( n0148 ) ? PC_ba : 
  ( n0292 ) ? PC_bb : 
  ( n0451 ) ? PC_bc : 
  ( n0263 ) ? PC_bd : 
  ( n0083 ) ? PC_be : 
  ( n0234 ) ? PC_bf : 
  ( n0207 ) ? PC_c0 : 
  ( n0422 ) ? PC_c1 : 
  ( n0114 ) ? PC_c2 : 
  ( n1460 ) ? PC_c3 : 
  ( n1408 ) ? PC_c4 : 
  ( n0209 ) ? PC_c5 : 
  ( n0047 ) ? PC_c6 : 
  ( n0347 ) ? PC_c7 : 
  ( n0049 ) ? PC_c8 : 
  ( n0349 ) ? PC_c9 : 
  ( n0150 ) ? PC_ca : 
  ( n0294 ) ? PC_cb : 
  ( n1410 ) ? PC_cc : 
  ( n0265 ) ? PC_cd : 
  ( n0085 ) ? PC_ce : 
  ( n0236 ) ? PC_cf : 
  ( n0368 ) ? PC_d0 : 
  ( n0424 ) ? PC_d1 : 
  ( n0116 ) ? PC_d2 : 
  ( n1462 ) ? PC_d3 : 
  ( n1412 ) ? PC_d4 : 
  ( n0211 ) ? PC_d5 : 
  ( n0051 ) ? PC_d6 : 
  ( n0351 ) ? PC_d7 : 
  ( n0053 ) ? PC_d8 : 
  ( n0353 ) ? PC_d9 : 
  ( n0152 ) ? PC_da : 
  ( n0296 ) ? PC_db : 
  ( n1464 ) ? PC_dc : 
  ( n0267 ) ? PC_dd : 
  ( n0087 ) ? PC_de : 
  ( n0238 ) ? PC_df : 
  ( n0426 ) ? PC_e1 : 
  ( n1414 ) ? PC_e4 : 
  ( n0213 ) ? PC_e5 : 
  ( n0055 ) ? PC_e6 : 
  ( n0355 ) ? PC_e7 : 
  ( n0057 ) ? PC_e8 : 
  ( n0357 ) ? PC_e9 : 
  ( n0154 ) ? PC_ea : 
  ( n0298 ) ? PC_eb : 
  ( n1416 ) ? PC_ec : 
  ( n0269 ) ? PC_ed : 
  ( n0089 ) ? PC_ee : 
  ( n0240 ) ? PC_ef : 
  ( n0428 ) ? PC_f1 : 
  ( n1418 ) ? PC_f4 : 
  ( n1420 ) ? PC_f5 : 
  ( n0059 ) ? PC_f6 : 
  ( n0359 ) ? PC_f7 : 
  ( n1466 ) ? PC_f8 : 
  ( n1468 ) ? PC_f9 : 
  ( n1470 ) ? PC_fa : 
  ( n1472 ) ? PC_fb : 
  ( n1474 ) ? PC_fc : 
  ( n1476 ) ? PC_fd : 
  ( n1478 ) ? PC_fe : 
  ( n1479 ) ? PC_ff : 
  ( PC );
assign P2_next = 
  ( n0159 ) ? P2_05 : 
  ( n0094 ) ? P2_10 : 
  ( n0161 ) ? P2_15 : 
  ( n0167 ) ? P2_42 : 
  ( n0169 ) ? P2_43 : 
  ( n0173 ) ? P2_52 : 
  ( n0175 ) ? P2_53 : 
  ( n0179 ) ? P2_62 : 
  ( n0181 ) ? P2_63 : 
  ( n0445 ) ? P2_75 : 
  ( n0185 ) ? P2_85 : 
  ( n0033 ) ? P2_86 : 
  ( n0333 ) ? P2_87 : 
  ( n0035 ) ? P2_88 : 
  ( n0335 ) ? P2_89 : 
  ( n0144 ) ? P2_8a : 
  ( n0288 ) ? P2_8b : 
  ( n1400 ) ? P2_8c : 
  ( n0259 ) ? P2_8d : 
  ( n0079 ) ? P2_8e : 
  ( n0230 ) ? P2_8f : 
  ( n0104 ) ? P2_92 : 
  ( n0112 ) ? P2_b2 : 
  ( n0114 ) ? P2_c2 : 
  ( n0209 ) ? P2_c5 : 
  ( n0368 ) ? P2_d0 : 
  ( n0116 ) ? P2_d2 : 
  ( n0211 ) ? P2_d5 : 
  ( n1420 ) ? P2_f5 : 
  ( P2 );
assign P3_next = 
  ( n0159 ) ? P3_05 : 
  ( n0094 ) ? P3_10 : 
  ( n0161 ) ? P3_15 : 
  ( n0167 ) ? P3_42 : 
  ( n0169 ) ? P3_43 : 
  ( n0173 ) ? P3_52 : 
  ( n0175 ) ? P3_53 : 
  ( n0179 ) ? P3_62 : 
  ( n0181 ) ? P3_63 : 
  ( n0445 ) ? P3_75 : 
  ( n0185 ) ? P3_85 : 
  ( n0033 ) ? P3_86 : 
  ( n0333 ) ? P3_87 : 
  ( n0035 ) ? P3_88 : 
  ( n0335 ) ? P3_89 : 
  ( n0144 ) ? P3_8a : 
  ( n0288 ) ? P3_8b : 
  ( n1400 ) ? P3_8c : 
  ( n0259 ) ? P3_8d : 
  ( n0079 ) ? P3_8e : 
  ( n0230 ) ? P3_8f : 
  ( n0104 ) ? P3_92 : 
  ( n0199 ) ? P3_ad : 
  ( n0112 ) ? P3_b2 : 
  ( n0114 ) ? P3_c2 : 
  ( n0209 ) ? P3_c5 : 
  ( n0368 ) ? P3_d0 : 
  ( n0116 ) ? P3_d2 : 
  ( n0211 ) ? P3_d5 : 
  ( n1420 ) ? P3_f5 : 
  ( P3 );
assign P0_next = 
  ( n0159 ) ? P0_05 : 
  ( n0094 ) ? P0_10 : 
  ( n0161 ) ? P0_15 : 
  ( n0167 ) ? P0_42 : 
  ( n0169 ) ? P0_43 : 
  ( n0173 ) ? P0_52 : 
  ( n0175 ) ? P0_53 : 
  ( n0179 ) ? P0_62 : 
  ( n0181 ) ? P0_63 : 
  ( n0445 ) ? P0_75 : 
  ( n0185 ) ? P0_85 : 
  ( n0033 ) ? P0_86 : 
  ( n0333 ) ? P0_87 : 
  ( n0035 ) ? P0_88 : 
  ( n0335 ) ? P0_89 : 
  ( n0144 ) ? P0_8a : 
  ( n0288 ) ? P0_8b : 
  ( n1400 ) ? P0_8c : 
  ( n0259 ) ? P0_8d : 
  ( n0079 ) ? P0_8e : 
  ( n0230 ) ? P0_8f : 
  ( n0104 ) ? P0_92 : 
  ( n0112 ) ? P0_b2 : 
  ( n0114 ) ? P0_c2 : 
  ( n0209 ) ? P0_c5 : 
  ( n0368 ) ? P0_d0 : 
  ( n0116 ) ? P0_d2 : 
  ( n0211 ) ? P0_d5 : 
  ( n1420 ) ? P0_f5 : 
  ( P0 );
assign P1_next = 
  ( n0159 ) ? P1_05 : 
  ( n0094 ) ? P1_10 : 
  ( n0161 ) ? P1_15 : 
  ( n0167 ) ? P1_42 : 
  ( n0169 ) ? P1_43 : 
  ( n0173 ) ? P1_52 : 
  ( n0175 ) ? P1_53 : 
  ( n0179 ) ? P1_62 : 
  ( n0181 ) ? P1_63 : 
  ( n0445 ) ? P1_75 : 
  ( n0185 ) ? P1_85 : 
  ( n0033 ) ? P1_86 : 
  ( n0333 ) ? P1_87 : 
  ( n0035 ) ? P1_88 : 
  ( n0335 ) ? P1_89 : 
  ( n0144 ) ? P1_8a : 
  ( n0288 ) ? P1_8b : 
  ( n1400 ) ? P1_8c : 
  ( n0259 ) ? P1_8d : 
  ( n0079 ) ? P1_8e : 
  ( n0230 ) ? P1_8f : 
  ( n0104 ) ? P1_92 : 
  ( n0112 ) ? P1_b2 : 
  ( n0114 ) ? P1_c2 : 
  ( n0209 ) ? P1_c5 : 
  ( n0368 ) ? P1_d0 : 
  ( n0116 ) ? P1_d2 : 
  ( n0211 ) ? P1_d5 : 
  ( n1420 ) ? P1_f5 : 
  ( P1 );
assign IP_next = 
  ( n0159 ) ? IP_05 : 
  ( n0094 ) ? IP_10 : 
  ( n0161 ) ? IP_15 : 
  ( n0167 ) ? IP_42 : 
  ( n0169 ) ? IP_43 : 
  ( n0173 ) ? IP_52 : 
  ( n0175 ) ? IP_53 : 
  ( n0179 ) ? IP_62 : 
  ( n0181 ) ? IP_63 : 
  ( n0445 ) ? IP_75 : 
  ( n0185 ) ? IP_85 : 
  ( n0033 ) ? IP_86 : 
  ( n0333 ) ? IP_87 : 
  ( n0035 ) ? IP_88 : 
  ( n0335 ) ? IP_89 : 
  ( n0144 ) ? IP_8a : 
  ( n0288 ) ? IP_8b : 
  ( n1400 ) ? IP_8c : 
  ( n0259 ) ? IP_8d : 
  ( n0079 ) ? IP_8e : 
  ( n0230 ) ? IP_8f : 
  ( n0104 ) ? IP_92 : 
  ( n0112 ) ? IP_b2 : 
  ( n0114 ) ? IP_c2 : 
  ( n0209 ) ? IP_c5 : 
  ( n0368 ) ? IP_d0 : 
  ( n0116 ) ? IP_d2 : 
  ( n0211 ) ? IP_d5 : 
  ( n1420 ) ? IP_f5 : 
  ( IP );
assign IE_next = 
  ( n0159 ) ? IE_05 : 
  ( n0094 ) ? IE_10 : 
  ( n0161 ) ? IE_15 : 
  ( n0167 ) ? IE_42 : 
  ( n0169 ) ? IE_43 : 
  ( n0173 ) ? IE_52 : 
  ( n0175 ) ? IE_53 : 
  ( n0179 ) ? IE_62 : 
  ( n0181 ) ? IE_63 : 
  ( n0445 ) ? IE_75 : 
  ( n0185 ) ? IE_85 : 
  ( n0033 ) ? IE_86 : 
  ( n0333 ) ? IE_87 : 
  ( n0035 ) ? IE_88 : 
  ( n0335 ) ? IE_89 : 
  ( n0144 ) ? IE_8a : 
  ( n0288 ) ? IE_8b : 
  ( n1400 ) ? IE_8c : 
  ( n0259 ) ? IE_8d : 
  ( n0079 ) ? IE_8e : 
  ( n0230 ) ? IE_8f : 
  ( n0104 ) ? IE_92 : 
  ( n0112 ) ? IE_b2 : 
  ( n0114 ) ? IE_c2 : 
  ( n0209 ) ? IE_c5 : 
  ( n0368 ) ? IE_d0 : 
  ( n0116 ) ? IE_d2 : 
  ( n0211 ) ? IE_d5 : 
  ( n1420 ) ? IE_f5 : 
  ( IE );
assign SCON_next = 
  ( n0159 ) ? SCON_05 : 
  ( n0094 ) ? SCON_10 : 
  ( n0161 ) ? SCON_15 : 
  ( n0167 ) ? SCON_42 : 
  ( n0169 ) ? SCON_43 : 
  ( n0173 ) ? SCON_52 : 
  ( n0175 ) ? SCON_53 : 
  ( n0179 ) ? SCON_62 : 
  ( n0181 ) ? SCON_63 : 
  ( n0445 ) ? SCON_75 : 
  ( n0185 ) ? SCON_85 : 
  ( n0033 ) ? SCON_86 : 
  ( n0333 ) ? SCON_87 : 
  ( n0035 ) ? SCON_88 : 
  ( n0335 ) ? SCON_89 : 
  ( n0144 ) ? SCON_8a : 
  ( n0288 ) ? SCON_8b : 
  ( n1400 ) ? SCON_8c : 
  ( n0259 ) ? SCON_8d : 
  ( n0079 ) ? SCON_8e : 
  ( n0230 ) ? SCON_8f : 
  ( n0104 ) ? SCON_92 : 
  ( n0112 ) ? SCON_b2 : 
  ( n0114 ) ? SCON_c2 : 
  ( n0209 ) ? SCON_c5 : 
  ( n0368 ) ? SCON_d0 : 
  ( n0116 ) ? SCON_d2 : 
  ( n0211 ) ? SCON_d5 : 
  ( n1420 ) ? SCON_f5 : 
  ( SCON );
assign SP_next = 
  ( n0159 ) ? SP_05 : 
  ( n0400 ) ? SP_11 : 
  ( n0443 ) ? SP_12 : 
  ( n0161 ) ? SP_15 : 
  ( n0364 ) ? SP_22 : 
  ( n0404 ) ? SP_31 : 
  ( n0366 ) ? SP_32 : 
  ( n0167 ) ? SP_42 : 
  ( n0169 ) ? SP_43 : 
  ( n0408 ) ? SP_51 : 
  ( n0173 ) ? SP_52 : 
  ( n0175 ) ? SP_53 : 
  ( n0179 ) ? SP_62 : 
  ( n0181 ) ? SP_63 : 
  ( n0412 ) ? SP_71 : 
  ( n0445 ) ? SP_75 : 
  ( n0185 ) ? SP_85 : 
  ( n0033 ) ? SP_86 : 
  ( n0333 ) ? SP_87 : 
  ( n0035 ) ? SP_88 : 
  ( n0335 ) ? SP_89 : 
  ( n0144 ) ? SP_8a : 
  ( n0288 ) ? SP_8b : 
  ( n1400 ) ? SP_8c : 
  ( n0259 ) ? SP_8d : 
  ( n0079 ) ? SP_8e : 
  ( n0230 ) ? SP_8f : 
  ( n0416 ) ? SP_91 : 
  ( n0420 ) ? SP_b1 : 
  ( n0207 ) ? SP_c0 : 
  ( n0209 ) ? SP_c5 : 
  ( n0368 ) ? SP_d0 : 
  ( n0424 ) ? SP_d1 : 
  ( n0211 ) ? SP_d5 : 
  ( n0428 ) ? SP_f1 : 
  ( n1420 ) ? SP_f5 : 
  ( SP );
assign SBUF_next = 
  ( n0159 ) ? SBUF_05 : 
  ( n0161 ) ? SBUF_15 : 
  ( n0167 ) ? SBUF_42 : 
  ( n0169 ) ? SBUF_43 : 
  ( n0173 ) ? SBUF_52 : 
  ( n0175 ) ? SBUF_53 : 
  ( n0179 ) ? SBUF_62 : 
  ( n0181 ) ? SBUF_63 : 
  ( n0445 ) ? SBUF_75 : 
  ( n0185 ) ? SBUF_85 : 
  ( n0033 ) ? SBUF_86 : 
  ( n0333 ) ? SBUF_87 : 
  ( n0035 ) ? SBUF_88 : 
  ( n0335 ) ? SBUF_89 : 
  ( n0144 ) ? SBUF_8a : 
  ( n0288 ) ? SBUF_8b : 
  ( n1400 ) ? SBUF_8c : 
  ( n0259 ) ? SBUF_8d : 
  ( n0079 ) ? SBUF_8e : 
  ( n0230 ) ? SBUF_8f : 
  ( n0209 ) ? SBUF_c5 : 
  ( n0368 ) ? SBUF_d0 : 
  ( n0211 ) ? SBUF_d5 : 
  ( n1420 ) ? SBUF_f5 : 
  ( SBUF );
assign PSW_next = 
  ( n0159 ) ? PSW_05 : 
  ( n0094 ) ? PSW_10 : 
  ( n1369 ) ? PSW_13 : 
  ( n0161 ) ? PSW_15 : 
  ( n1375 ) ? PSW_24 : 
  ( n0163 ) ? PSW_25 : 
  ( n0011 ) ? PSW_26 : 
  ( n0311 ) ? PSW_27 : 
  ( n0013 ) ? PSW_28 : 
  ( n0313 ) ? PSW_29 : 
  ( n0134 ) ? PSW_2a : 
  ( n0278 ) ? PSW_2b : 
  ( n1377 ) ? PSW_2c : 
  ( n0249 ) ? PSW_2d : 
  ( n0069 ) ? PSW_2e : 
  ( n0220 ) ? PSW_2f : 
  ( n1379 ) ? PSW_33 : 
  ( n1381 ) ? PSW_34 : 
  ( n0165 ) ? PSW_35 : 
  ( n0015 ) ? PSW_36 : 
  ( n0315 ) ? PSW_37 : 
  ( n0017 ) ? PSW_38 : 
  ( n0317 ) ? PSW_39 : 
  ( n0136 ) ? PSW_3a : 
  ( n0280 ) ? PSW_3b : 
  ( n1383 ) ? PSW_3c : 
  ( n0251 ) ? PSW_3d : 
  ( n0071 ) ? PSW_3e : 
  ( n0222 ) ? PSW_3f : 
  ( n0167 ) ? PSW_42 : 
  ( n0169 ) ? PSW_43 : 
  ( n0173 ) ? PSW_52 : 
  ( n0175 ) ? PSW_53 : 
  ( n0179 ) ? PSW_62 : 
  ( n0181 ) ? PSW_63 : 
  ( n0100 ) ? PSW_72 : 
  ( n0445 ) ? PSW_75 : 
  ( n0102 ) ? PSW_82 : 
  ( n1399 ) ? PSW_84 : 
  ( n0185 ) ? PSW_85 : 
  ( n0033 ) ? PSW_86 : 
  ( n0333 ) ? PSW_87 : 
  ( n0035 ) ? PSW_88 : 
  ( n0335 ) ? PSW_89 : 
  ( n0144 ) ? PSW_8a : 
  ( n0288 ) ? PSW_8b : 
  ( n1400 ) ? PSW_8c : 
  ( n0259 ) ? PSW_8d : 
  ( n0079 ) ? PSW_8e : 
  ( n0230 ) ? PSW_8f : 
  ( n0104 ) ? PSW_92 : 
  ( n1402 ) ? PSW_94 : 
  ( n0187 ) ? PSW_95 : 
  ( n0037 ) ? PSW_96 : 
  ( n0337 ) ? PSW_97 : 
  ( n0039 ) ? PSW_98 : 
  ( n0339 ) ? PSW_99 : 
  ( n0146 ) ? PSW_9a : 
  ( n0290 ) ? PSW_9b : 
  ( n1404 ) ? PSW_9c : 
  ( n0261 ) ? PSW_9d : 
  ( n0081 ) ? PSW_9e : 
  ( n0232 ) ? PSW_9f : 
  ( n0106 ) ? PSW_a0 : 
  ( n0108 ) ? PSW_a2 : 
  ( n1406 ) ? PSW_a4 : 
  ( n0110 ) ? PSW_b0 : 
  ( n0112 ) ? PSW_b2 : 
  ( n1458 ) ? PSW_b3 : 
  ( n0449 ) ? PSW_b4 : 
  ( n0205 ) ? PSW_b5 : 
  ( n0043 ) ? PSW_b6 : 
  ( n0343 ) ? PSW_b7 : 
  ( n0045 ) ? PSW_b8 : 
  ( n0345 ) ? PSW_b9 : 
  ( n0148 ) ? PSW_ba : 
  ( n0292 ) ? PSW_bb : 
  ( n0451 ) ? PSW_bc : 
  ( n0263 ) ? PSW_bd : 
  ( n0083 ) ? PSW_be : 
  ( n0234 ) ? PSW_bf : 
  ( n0114 ) ? PSW_c2 : 
  ( n1460 ) ? PSW_c3 : 
  ( n0209 ) ? PSW_c5 : 
  ( n0368 ) ? PSW_d0 : 
  ( n0116 ) ? PSW_d2 : 
  ( n1462 ) ? PSW_d3 : 
  ( n1412 ) ? PSW_d4 : 
  ( n0211 ) ? PSW_d5 : 
  ( n1420 ) ? PSW_f5 : 
  ( PSW );

always @(posedge clk) begin
  if (rst) begin
    ACC <= 8'b0;
    B <= 8'b0;
    DPH <= 8'b0;
    DPL <= 8'b0;
    IE <= 8'b0;
    IP <= 8'b0;
    P0 <= 8'b0;
    P1 <= 8'b0;
    P2 <= 8'b0;
    P3 <= 8'b0;
    PC <= 16'b0;
    PCON <= 8'b0;
    PSW <= 8'b0;
    SBUF <= 8'b0;
    SCON <= 8'b0;
    SP <= 8'b0;
    TCON <= 8'b0;
    TH0 <= 8'b0;
    TH1 <= 8'b0;
    TL0 <= 8'b0;
    TL1 <= 8'b0;
    TMOD <= 8'b0;
    _IRAM_RD0_ <= 8'b0;
    _IRAM_RD1_ <= 8'b0;
    _ROM_RD0_ <= 8'b0;
  end
  else begin
    if (step) begin
      ACC <= ACC_next;
      PCON <= PCON_next;
      B <= B_next;
      TMOD <= TMOD_next;
      DPL <= DPL_next;
      DPH <= DPH_next;
      TL1 <= TL1_next;
      TL0 <= TL0_next;
      TCON <= TCON_next;
      TH1 <= TH1_next;
      TH0 <= TH0_next;
      PC <= PC_next;
      P2 <= P2_next;
      P3 <= P3_next;
      P0 <= P0_next;
      P1 <= P1_next;
      IP <= IP_next;
      IE <= IE_next;
      SCON <= SCON_next;
      SP <= SP_next;
      SBUF <= SBUF_next;
      PSW <= PSW_next;
      if ( n0159 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0516;
        end
      end
      else if ( n0003 ) begin
        IRAM[_IRAM_RD1_] <= n0539;
      end
      else if ( n0303 ) begin
        IRAM[_IRAM_RD1_] <= n0539;
      end
      else if ( n0005 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0305 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0130 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0274 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n1425 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0245 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0065 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0216 ) begin
        IRAM[_IRAM_RD0_] <= n0540;
      end
      else if ( n0094 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0553;
        end
      end
      else if ( n0400 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0443 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0579;
        IRAM[n0576] <= n0580;
      end
      else if ( n0161 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0592;
        end
      end
      else if ( n0007 ) begin
        IRAM[_IRAM_RD1_] <= n0614;
      end
      else if ( n0307 ) begin
        IRAM[_IRAM_RD1_] <= n0614;
      end
      else if ( n0009 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0309 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0132 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0276 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n1427 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0247 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0067 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0218 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0404 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0167 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0810;
        end
      end
      else if ( n0169 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0831;
        end
      end
      else if ( n0408 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0173 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0859;
        end
      end
      else if ( n0175 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0880;
        end
      end
      else if ( n0179 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0910;
        end
      end
      else if ( n0181 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0931;
        end
      end
      else if ( n0412 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0445 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0456;
        end
      end
      else if ( n0031 ) begin
        IRAM[n0469] <= n0120;
      end
      else if ( n0331 ) begin
        IRAM[n0469] <= n0120;
      end
      else if ( n1439 ) begin
        IRAM[n0063] <= n0120;
      end
      else if ( n1441 ) begin
        IRAM[n0362] <= n0120;
      end
      else if ( n1443 ) begin
        IRAM[n0157] <= n0120;
      end
      else if ( n1445 ) begin
        IRAM[n0301] <= n0120;
      end
      else if ( n1447 ) begin
        IRAM[n0371] <= n0120;
      end
      else if ( n1449 ) begin
        IRAM[n0272] <= n0120;
      end
      else if ( n1451 ) begin
        IRAM[n0092] <= n0120;
      end
      else if ( n1453 ) begin
        IRAM[n0243] <= n0120;
      end
      else if ( n0185 ) begin
        if(n1049) begin
          IRAM[n0456] <= n0515;
        end
      end
      else if ( n0033 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0538;
        end
      end
      else if ( n0333 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0538;
        end
      end
      else if ( n0035 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0335 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0144 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0288 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n1400 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0259 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0079 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0230 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0416 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0104 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n1107;
        end
      end
      else if ( n0041 ) begin
        IRAM[n0469] <= n1232;
      end
      else if ( n0341 ) begin
        IRAM[n0469] <= n1232;
      end
      else if ( n0189 ) begin
        IRAM[n0063] <= n0515;
      end
      else if ( n0191 ) begin
        IRAM[n0362] <= n0515;
      end
      else if ( n0193 ) begin
        IRAM[n0157] <= n0515;
      end
      else if ( n0195 ) begin
        IRAM[n0301] <= n0515;
      end
      else if ( n0197 ) begin
        IRAM[n0371] <= n0515;
      end
      else if ( n0199 ) begin
        IRAM[n0272] <= n0515;
      end
      else if ( n0201 ) begin
        IRAM[n0092] <= n0515;
      end
      else if ( n0203 ) begin
        IRAM[n0243] <= n0515;
      end
      else if ( n0420 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0112 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n1238;
        end
      end
      else if ( n0207 ) begin
        IRAM[n0574] <= n0515;
      end
      else if ( n0114 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0553;
        end
      end
      else if ( n0209 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= ACC;
        end
      end
      else if ( n0047 ) begin
        IRAM[_IRAM_RD1_] <= ACC;
      end
      else if ( n0347 ) begin
        IRAM[_IRAM_RD1_] <= ACC;
      end
      else if ( n0049 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0349 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0150 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0294 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n1410 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0265 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0085 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0236 ) begin
        IRAM[_IRAM_RD0_] <= ACC;
      end
      else if ( n0368 ) begin
        if(n0993) begin
          IRAM[n0120] <= n0469;
        end
      end
      else if ( n0424 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n0116 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n1301;
        end
      end
      else if ( n0211 ) begin
        if(n0468) begin
          IRAM[_IRAM_RD0_] <= n0592;
        end
      end
      else if ( n0051 ) begin
        IRAM[_IRAM_RD1_] <= n1339;
      end
      else if ( n0351 ) begin
        IRAM[_IRAM_RD1_] <= n1339;
      end
      else if ( n0053 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0353 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0152 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0296 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n1464 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0267 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0087 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0238 ) begin
        IRAM[_IRAM_RD0_] <= n0615;
      end
      else if ( n0428 ) begin
        if (((n0574) != (n0576))) IRAM[n0574] <= n0575;
        IRAM[n0576] <= n0577;
      end
      else if ( n1420 ) begin
        if(n0993) begin
          IRAM[n0120] <= ACC;
        end
      end
      else if ( n0059 ) begin
        IRAM[n0469] <= ACC;
      end
      else if ( n0359 ) begin
        IRAM[n0469] <= ACC;
      end
      else if ( n1466 ) begin
        IRAM[n0063] <= ACC;
      end
      else if ( n1468 ) begin
        IRAM[n0362] <= ACC;
      end
      else if ( n1470 ) begin
        IRAM[n0157] <= ACC;
      end
      else if ( n1472 ) begin
        IRAM[n0301] <= ACC;
      end
      else if ( n1474 ) begin
        IRAM[n0371] <= ACC;
      end
      else if ( n1476 ) begin
        IRAM[n0272] <= ACC;
      end
      else if ( n1478 ) begin
        IRAM[n0092] <= ACC;
      end
      else if ( n1479 ) begin
        IRAM[n0243] <= ACC;
      end
    end
  end
end

endmodule
