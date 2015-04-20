module oc8051_golden_model(
  clk,
  rst,
  step,
  RD_ROM_0_ADDR,
  RD_ROM_1_ADDR,
  RD_ROM_2_ADDR,
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
  PSW_next,
  RD_ROM_0,
  RD_ROM_1,
  RD_ROM_2
);
output [15:0] RD_ROM_0_ADDR;
output [15:0] RD_ROM_1_ADDR;
output [15:0] RD_ROM_2_ADDR;
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
input [7:0] RD_ROM_0;
input [7:0] RD_ROM_1;
input [7:0] RD_ROM_2;

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
wire [7:0] ACC_e1;
wire [7:0] ACC_e4;
wire [7:0] ACC_e5;
wire [7:0] ACC_e6;
wire [7:0] ACC_e7;
wire [7:0] ACC_e8;
wire [7:0] ACC_e9;
wire [7:0] ACC_ea;
wire [7:0] ACC_eb;
wire [7:0] ACC_ec;
wire [7:0] ACC_ee;
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
wire [7:0] B_ef;
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
wire [7:0] DPH_ef;
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
wire [7:0] DPL_ef;
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
wire [7:0] IE_ef;
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
wire [7:0] IP_ef;
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
wire [7:0] P0_ef;
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
wire [7:0] P1_ef;
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
wire [7:0] P2_ef;
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
wire [7:0] P3_ef;
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
wire [7:0] PCON_ef;
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
wire [7:0] PSW_ef;
wire [7:0] PSW_next;
wire [7:0] RD_IRAM_0;
wire [7:0] RD_IRAM_0_ADDR;
wire [7:0] RD_IRAM_1;
wire [7:0] RD_IRAM_1_ADDR;
wire [7:0] RD_ROM_0;
wire [15:0] RD_ROM_0_ADDR;
wire [7:0] RD_ROM_1;
wire [15:0] RD_ROM_1_ADDR;
wire [7:0] RD_ROM_2;
wire [15:0] RD_ROM_2_ADDR;
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
wire [7:0] SBUF_ef;
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
wire [7:0] SCON_ef;
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
wire [7:0] SP_ed;
wire [7:0] SP_ef;
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
wire [7:0] TCON_ef;
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
wire [7:0] TH0_ef;
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
wire [7:0] TH1_ef;
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
wire [7:0] TL0_ef;
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
wire [7:0] TL1_ef;
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
wire [7:0] TMOD_ef;
wire [7:0] TMOD_next;
wire [3:0] WR_ADDR_0_IRAM;
wire [3:0] WR_ADDR_1_IRAM;
wire WR_COND_0_IRAM;
wire WR_COND_1_IRAM;
wire [7:0] WR_DATA_0_IRAM;
wire [7:0] WR_DATA_1_IRAM;
wire [7:0] n0001;
wire n0002;
wire [7:0] n0003;
wire n0004;
wire [2:0] n0005;
wire [1:0] n0006;
wire [7:0] n0007;
wire [7:0] n0008;
wire n0009;
wire [2:0] n0010;
wire [7:0] n0011;
wire [7:0] n0012;
wire n0013;
wire [7:0] n0014;
wire n0015;
wire [7:0] n0016;
wire n0017;
wire [2:0] n0018;
wire [7:0] n0019;
wire [7:0] n0020;
wire n0021;
wire [2:0] n0022;
wire [7:0] n0023;
wire [7:0] n0024;
wire n0025;
wire [2:0] n0026;
wire [7:0] n0027;
wire [7:0] n0028;
wire n0029;
wire [2:0] n0030;
wire [7:0] n0031;
wire [7:0] n0032;
wire n0033;
wire [2:0] n0034;
wire [7:0] n0035;
wire [7:0] n0036;
wire n0037;
wire [2:0] n0038;
wire [7:0] n0039;
wire [7:0] n0040;
wire n0041;
wire [0:0] n0042;
wire [0:0] n0043;
wire n0044;
wire [4:0] n0045;
wire [7:0] n0046;
wire [7:0] n0047;
wire [7:0] n0048;
wire [7:0] n0049;
wire [7:0] n0050;
wire [7:0] n0051;
wire n0052;
wire [7:0] n0053;
wire n0054;
wire [7:0] n0055;
wire n0056;
wire [7:0] n0057;
wire n0058;
wire [7:0] n0059;
wire n0060;
wire [7:0] n0061;
wire n0062;
wire [7:0] n0063;
wire n0064;
wire [7:0] n0065;
wire n0066;
wire [7:0] n0067;
wire n0068;
wire [7:0] n0069;
wire n0070;
wire [7:0] n0071;
wire n0072;
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
wire [7:0] n0090;
wire n0091;
wire [7:0] n0092;
wire n0093;
wire [7:0] n0094;
wire n0095;
wire [7:0] n0096;
wire n0097;
wire [7:0] n0098;
wire n0099;
wire [7:0] n0100;
wire n0101;
wire [7:0] n0102;
wire n0103;
wire [7:0] n0104;
wire n0105;
wire [7:0] n0106;
wire n0107;
wire [7:0] n0108;
wire n0109;
wire [7:0] n0110;
wire n0111;
wire [7:0] n0112;
wire n0113;
wire [7:0] n0114;
wire n0115;
wire [7:0] n0116;
wire n0117;
wire [7:0] n0118;
wire n0119;
wire [7:0] n0120;
wire n0121;
wire [7:0] n0122;
wire n0123;
wire [7:0] n0124;
wire n0125;
wire [7:0] n0126;
wire n0127;
wire [7:0] n0128;
wire n0129;
wire [7:0] n0130;
wire n0131;
wire [7:0] n0132;
wire n0133;
wire [7:0] n0134;
wire n0135;
wire [7:0] n0136;
wire n0137;
wire [7:0] n0138;
wire n0139;
wire [7:0] n0140;
wire n0141;
wire [7:0] n0142;
wire n0143;
wire [7:0] n0144;
wire n0145;
wire [7:0] n0146;
wire n0147;
wire [7:0] n0148;
wire n0149;
wire [7:0] n0150;
wire n0151;
wire [7:0] n0152;
wire n0153;
wire [7:0] n0154;
wire n0155;
wire [7:0] n0156;
wire n0157;
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
wire [7:0] n0214;
wire n0215;
wire [7:0] n0216;
wire n0217;
wire [7:0] n0218;
wire n0219;
wire [7:0] n0220;
wire n0221;
wire [7:0] n0222;
wire n0223;
wire [7:0] n0224;
wire n0225;
wire [7:0] n0226;
wire n0227;
wire [7:0] n0228;
wire n0229;
wire [7:0] n0230;
wire n0231;
wire [7:0] n0232;
wire n0233;
wire [7:0] n0234;
wire n0235;
wire [7:0] n0236;
wire n0237;
wire [7:0] n0238;
wire n0239;
wire [7:0] n0240;
wire n0241;
wire [7:0] n0242;
wire n0243;
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
wire [7:0] n0270;
wire n0271;
wire [7:0] n0272;
wire n0273;
wire [7:0] n0274;
wire n0275;
wire [7:0] n0276;
wire n0277;
wire [7:0] n0278;
wire n0279;
wire [7:0] n0280;
wire n0281;
wire [7:0] n0282;
wire n0283;
wire [7:0] n0284;
wire n0285;
wire [7:0] n0286;
wire n0287;
wire [7:0] n0288;
wire n0289;
wire [7:0] n0290;
wire n0291;
wire [7:0] n0292;
wire n0293;
wire [7:0] n0294;
wire n0295;
wire [7:0] n0296;
wire n0297;
wire [7:0] n0298;
wire n0299;
wire [7:0] n0300;
wire n0301;
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
wire [7:0] n0360;
wire n0361;
wire [7:0] n0362;
wire n0363;
wire [7:0] n0364;
wire n0365;
wire [7:0] n0366;
wire n0367;
wire [7:0] n0368;
wire n0369;
wire [7:0] n0370;
wire n0371;
wire [7:0] n0372;
wire n0373;
wire [7:0] n0374;
wire n0375;
wire [7:0] n0376;
wire n0377;
wire [7:0] n0378;
wire n0379;
wire [7:0] n0380;
wire n0381;
wire [7:0] n0382;
wire [7:0] n0383;
wire [7:0] n0384;
wire [7:0] n0385;
wire [7:0] n0386;
wire [7:0] n0387;
wire [7:0] n0388;
wire [7:0] n0389;
wire [7:0] n0390;
wire [7:0] n0391;
wire [7:0] n0392;
wire [7:0] n0393;
wire [7:0] n0394;
wire [7:0] n0395;
wire [7:0] n0396;
wire [7:0] n0397;
wire [7:0] n0398;
wire [7:0] n0399;
wire [7:0] n0400;
wire [7:0] n0401;
wire [7:0] n0402;
wire [7:0] n0403;
wire [7:0] n0404;
wire [7:0] n0405;
wire [7:0] n0406;
wire [7:0] n0407;
wire [7:0] n0408;
wire [7:0] n0409;
wire [7:0] n0410;
wire [7:0] n0411;
wire [7:0] n0412;
wire [7:0] n0413;
wire [7:0] n0414;
wire [7:0] n0415;
wire [7:0] n0416;
wire [7:0] n0417;
wire [7:0] n0418;
wire [7:0] n0419;
wire [7:0] n0420;
wire [7:0] n0421;
wire [7:0] n0422;
wire [7:0] n0423;
wire [7:0] n0424;
wire [7:0] n0425;
wire [7:0] n0426;
wire [7:0] n0427;
wire [7:0] n0428;
wire [7:0] n0429;
wire [7:0] n0430;
wire [7:0] n0431;
wire [7:0] n0432;
wire [7:0] n0433;
wire [7:0] n0434;
wire [7:0] n0435;
wire [7:0] n0436;
wire [7:0] n0437;
wire [7:0] n0438;
wire [7:0] n0439;
wire [7:0] n0440;
wire [7:0] n0441;
wire [7:0] n0442;
wire [7:0] n0443;
wire [7:0] n0444;
wire [7:0] n0445;
wire [7:0] n0446;
wire [7:0] n0447;
wire [7:0] n0448;
wire [7:0] n0449;
wire [7:0] n0450;
wire [7:0] n0451;
wire [7:0] n0452;
wire [7:0] n0453;
wire [7:0] n0454;
wire [7:0] n0455;
wire [7:0] n0456;
wire [7:0] n0457;
wire [7:0] n0458;
wire [7:0] n0459;
wire [7:0] n0460;
wire [7:0] n0461;
wire [7:0] n0462;
wire [7:0] n0463;
wire [7:0] n0464;
wire [7:0] n0465;
wire [7:0] n0466;
wire [7:0] n0467;
wire [7:0] n0468;
wire [7:0] n0469;
wire [7:0] n0470;
wire [7:0] n0471;
wire [7:0] n0472;
wire [7:0] n0473;
wire [7:0] n0474;
wire [7:0] n0475;
wire [7:0] n0476;
wire [7:0] n0477;
wire [7:0] n0478;
wire [7:0] n0479;
wire [7:0] n0480;
wire [7:0] n0481;
wire [7:0] n0482;
wire [7:0] n0483;
wire [7:0] n0484;
wire [7:0] n0485;
wire [7:0] n0486;
wire [7:0] n0487;
wire [7:0] n0488;
wire [7:0] n0489;
wire [7:0] n0490;
wire [7:0] n0491;
wire [7:0] n0492;
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
wire [7:0] n0541;
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
wire [7:0] n0557;
wire [7:0] n0558;
wire [7:0] n0559;
wire [3:0] n0560;
wire [7:0] n0561;
wire [7:0] n0562;
wire [7:0] n0563;
wire [7:0] n0564;
wire [7:0] n0565;
wire [7:0] n0566;
wire [7:0] n0567;
wire [7:0] n0568;
wire [7:0] n0569;
wire [7:0] n0570;
wire [7:0] n0571;
wire [7:0] n0572;
wire [7:0] n0573;
wire [7:0] n0574;
wire [7:0] n0575;
wire [7:0] n0576;
wire [7:0] n0577;
wire [7:0] n0578;
wire [7:0] n0579;
wire [7:0] n0580;
wire [7:0] n0581;
wire [7:0] n0582;
wire [7:0] n0583;
wire [7:0] n0584;
wire [7:0] n0585;
wire [7:0] n0586;
wire [7:0] n0587;
wire [7:0] n0588;
wire [7:0] n0589;
wire [7:0] n0590;
wire [7:0] n0591;
wire [7:0] n0592;
wire [3:0] n0593;
wire [7:0] n0594;
wire [15:0] n0595;
wire n0596;
wire [15:0] n0597;
wire [15:0] n0598;
wire n0599;
wire [15:0] n0600;
wire [15:0] n0601;
wire n0602;
wire [15:0] n0603;
wire n0604;
wire [15:0] n0605;
wire n0606;
wire [15:0] n0607;
wire n0608;
wire [15:0] n0609;
wire n0610;
wire [15:0] n0611;
wire n0612;
wire [15:0] n0613;
wire n0614;
wire [15:0] n0615;
wire n0616;
wire [15:0] n0617;
wire n0618;
wire [15:0] n0619;
wire n0620;
wire [15:0] n0621;
wire n0622;
wire [15:0] n0623;
wire n0624;
wire [15:0] n0625;
wire n0626;
wire [15:0] n0627;
wire n0628;
wire [15:0] n0629;
wire n0630;
wire [15:0] n0631;
wire n0632;
wire [15:0] n0633;
wire n0634;
wire [15:0] n0635;
wire n0636;
wire [15:0] n0637;
wire n0638;
wire [15:0] n0639;
wire n0640;
wire [15:0] n0641;
wire n0642;
wire [15:0] n0643;
wire n0644;
wire [15:0] n0645;
wire n0646;
wire [15:0] n0647;
wire n0648;
wire [15:0] n0649;
wire n0650;
wire [15:0] n0651;
wire n0652;
wire [15:0] n0653;
wire n0654;
wire [15:0] n0655;
wire n0656;
wire [15:0] n0657;
wire n0658;
wire [15:0] n0659;
wire n0660;
wire [15:0] n0661;
wire n0662;
wire [15:0] n0663;
wire n0664;
wire [15:0] n0665;
wire n0666;
wire [15:0] n0667;
wire n0668;
wire [15:0] n0669;
wire n0670;
wire [15:0] n0671;
wire n0672;
wire [15:0] n0673;
wire n0674;
wire [15:0] n0675;
wire n0676;
wire [15:0] n0677;
wire n0678;
wire [15:0] n0679;
wire n0680;
wire [15:0] n0681;
wire n0682;
wire [15:0] n0683;
wire n0684;
wire [15:0] n0685;
wire n0686;
wire [15:0] n0687;
wire n0688;
wire [15:0] n0689;
wire n0690;
wire [15:0] n0691;
wire n0692;
wire [15:0] n0693;
wire n0694;
wire [15:0] n0695;
wire n0696;
wire [15:0] n0697;
wire n0698;
wire [15:0] n0699;
wire n0700;
wire [15:0] n0701;
wire [15:0] n0702;
wire [15:0] n0703;
wire n0704;
wire [15:0] n0705;
wire n0706;
wire [15:0] n0707;
wire n0708;
wire [15:0] n0709;
wire n0710;
wire [15:0] n0711;
wire n0712;
wire [15:0] n0713;
wire n0714;
wire [15:0] n0715;
wire n0716;
wire [15:0] n0717;
wire n0718;
wire [15:0] n0719;
wire n0720;
wire [15:0] n0721;
wire n0722;
wire [15:0] n0723;
wire n0724;
wire [15:0] n0725;
wire n0726;
wire [15:0] n0727;
wire n0728;
wire [15:0] n0729;
wire n0730;
wire [15:0] n0731;
wire n0732;
wire [15:0] n0733;
wire [15:0] n0734;
wire [15:0] n0735;
wire n0736;
wire [15:0] n0737;
wire n0738;
wire [15:0] n0739;
wire n0740;
wire [15:0] n0741;
wire n0742;
wire [15:0] n0743;
wire n0744;
wire [15:0] n0745;
wire n0746;
wire [15:0] n0747;
wire n0748;
wire [15:0] n0749;
wire n0750;
wire [15:0] n0751;
wire n0752;
wire [15:0] n0753;
wire n0754;
wire [15:0] n0755;
wire n0756;
wire [15:0] n0757;
wire n0758;
wire [15:0] n0759;
wire n0760;
wire [15:0] n0761;
wire n0762;
wire [15:0] n0763;
wire n0764;
wire [15:0] n0765;
wire n0766;
wire [15:0] n0767;
wire n0768;
wire [15:0] n0769;
wire n0770;
wire [15:0] n0771;
wire n0772;
wire [15:0] n0773;
wire n0774;
wire [15:0] n0775;
wire n0776;
wire [15:0] n0777;
wire n0778;
wire [15:0] n0779;
wire n0780;
wire [15:0] n0781;
wire n0782;
wire [15:0] n0783;
wire n0784;
wire [15:0] n0785;
wire n0786;
wire [15:0] n0787;
wire n0788;
wire [15:0] n0789;
wire n0790;
wire [15:0] n0791;
wire n0792;
wire [15:0] n0793;
wire n0794;
wire [15:0] n0795;
wire n0796;
wire [15:0] n0797;
wire n0798;
wire [15:0] n0799;
wire n0800;
wire [15:0] n0801;
wire n0802;
wire [15:0] n0803;
wire n0804;
wire [15:0] n0805;
wire n0806;
wire [15:0] n0807;
wire n0808;
wire [15:0] n0809;
wire n0810;
wire [15:0] n0811;
wire n0812;
wire [15:0] n0813;
wire n0814;
wire [15:0] n0815;
wire n0816;
wire [15:0] n0817;
wire n0818;
wire [15:0] n0819;
wire n0820;
wire [15:0] n0821;
wire n0822;
wire [15:0] n0823;
wire n0824;
wire [15:0] n0825;
wire n0826;
wire [15:0] n0827;
wire n0828;
wire [15:0] n0829;
wire n0830;
wire [15:0] n0831;
wire n0832;
wire [15:0] n0833;
wire [15:0] n0834;
wire [15:0] n0835;
wire [15:0] n0836;
wire [15:0] n0837;
wire [15:0] n0838;
wire [15:0] n0839;
wire [15:0] n0840;
wire [15:0] n0841;
wire [15:0] n0842;
wire [15:0] n0843;
wire [15:0] n0844;
wire [15:0] n0845;
wire [15:0] n0846;
wire [15:0] n0847;
wire [15:0] n0848;
wire [15:0] n0849;
wire [15:0] n0850;
wire [15:0] n0851;
wire [15:0] n0852;
wire [15:0] n0853;
wire [15:0] n0854;
wire [15:0] n0855;
wire [15:0] n0856;
wire [15:0] n0857;
wire [15:0] n0858;
wire [15:0] n0859;
wire [15:0] n0860;
wire [15:0] n0861;
wire [15:0] n0862;
wire [15:0] n0863;
wire [15:0] n0864;
wire [15:0] n0865;
wire [15:0] n0866;
wire [15:0] n0867;
wire [15:0] n0868;
wire [15:0] n0869;
wire [15:0] n0870;
wire [15:0] n0871;
wire [15:0] n0872;
wire [15:0] n0873;
wire [15:0] n0874;
wire [15:0] n0875;
wire [15:0] n0876;
wire [15:0] n0877;
wire [15:0] n0878;
wire [15:0] n0879;
wire [15:0] n0880;
wire [15:0] n0881;
wire [15:0] n0882;
wire [15:0] n0883;
wire [15:0] n0884;
wire [15:0] n0885;
wire [15:0] n0886;
wire [15:0] n0887;
wire [15:0] n0888;
wire [15:0] n0889;
wire [15:0] n0890;
wire [15:0] n0891;
wire [15:0] n0892;
wire [15:0] n0893;
wire [15:0] n0894;
wire [15:0] n0895;
wire [15:0] n0896;
wire [15:0] n0897;
wire [15:0] n0898;
wire [15:0] n0899;
wire [15:0] n0900;
wire [15:0] n0901;
wire [15:0] n0902;
wire [15:0] n0903;
wire [15:0] n0904;
wire [15:0] n0905;
wire [15:0] n0906;
wire [15:0] n0907;
wire [15:0] n0908;
wire [15:0] n0909;
wire [15:0] n0910;
wire [15:0] n0911;
wire [15:0] n0912;
wire [15:0] n0913;
wire [15:0] n0914;
wire [15:0] n0915;
wire [15:0] n0916;
wire [15:0] n0917;
wire [15:0] n0918;
wire [15:0] n0919;
wire [15:0] n0920;
wire [15:0] n0921;
wire [15:0] n0922;
wire [15:0] n0923;
wire [15:0] n0924;
wire [15:0] n0925;
wire [15:0] n0926;
wire [15:0] n0927;
wire [15:0] n0928;
wire [15:0] n0929;
wire [15:0] n0930;
wire [15:0] n0931;
wire [15:0] n0932;
wire [15:0] n0933;
wire [15:0] n0934;
wire [15:0] n0935;
wire [15:0] n0936;
wire [15:0] n0937;
wire [15:0] n0938;
wire [15:0] n0939;
wire [15:0] n0940;
wire [15:0] n0941;
wire [15:0] n0942;
wire [15:0] n0943;
wire [15:0] n0944;
wire [15:0] n0945;
wire [15:0] n0946;
wire [15:0] n0947;
wire [15:0] n0948;
wire [15:0] n0949;
wire [15:0] n0950;
wire [15:0] n0951;
wire [15:0] n0952;
wire [15:0] n0953;
wire [15:0] n0954;
wire [15:0] n0955;
wire [15:0] n0956;
wire [15:0] n0957;
wire [15:0] n0958;
wire [15:0] n0959;
wire [15:0] n0960;
wire [15:0] n0961;
wire [15:0] n0962;
wire [15:0] n0963;
wire [15:0] n0964;
wire [15:0] n0965;
wire [15:0] n0966;
wire [15:0] n0967;
wire [15:0] n0968;
wire [15:0] n0969;
wire [15:0] n0970;
wire [15:0] n0971;
wire [15:0] n0972;
wire [15:0] n0973;
wire [15:0] n0974;
wire [15:0] n0975;
wire [15:0] n0976;
wire [15:0] n0977;
wire [15:0] n0978;
wire [15:0] n0979;
wire [15:0] n0980;
wire [15:0] n0981;
wire [15:0] n0982;
wire [15:0] n0983;
wire [15:0] n0984;
wire [15:0] n0985;
wire [15:0] n0986;
wire [15:0] n0987;
wire [4:0] n0988;
wire [23:0] n0989;
wire [2:0] n0990;
wire [7:0] n0991;
wire [15:0] n0992;
wire [15:0] n0993;
wire [7:0] n0994;
wire [7:0] n0995;
wire [7:0] n0996;
wire n0997;
wire [0:0] n0998;
wire n0999;
wire [7:0] n1000;
wire n1001;
wire [7:0] n1002;
wire n1003;
wire n1004;
wire [7:0] n1005;
wire n1006;
wire n1007;
wire n1008;
wire n1009;
wire n1010;
wire n1011;
wire n1012;
wire n1013;
wire [7:0] n1014;
wire n1015;
wire n1016;
wire n1017;
wire n1018;
wire n1019;
wire n1020;
wire n1021;
wire n1022;
wire [7:0] n1023;
wire n1024;
wire [7:0] n1025;
wire [7:0] n1026;
wire [7:0] n1027;
wire [7:0] n1028;
wire [7:0] n1029;
wire [7:0] n1030;
wire [7:0] n1031;
wire [7:0] n1032;
wire [7:0] n1033;
wire [7:0] n1034;
wire [7:0] n1035;
wire [7:0] n1036;
wire [7:0] n1037;
wire [7:0] n1038;
wire [7:0] n1039;
wire [7:0] n1040;
wire [7:0] n1041;
wire [7:0] n1042;
wire [7:0] n1043;
wire [7:0] n1044;
wire [7:0] n1045;
wire [7:0] n1046;
wire [7:0] n1047;
wire [7:0] n1048;
wire [7:0] n1049;
wire [7:0] n1050;
wire [7:0] n1051;
wire [7:0] n1052;
wire [7:0] n1053;
wire [7:0] n1054;
wire [7:0] n1055;
wire [7:0] n1056;
wire [7:0] n1057;
wire [7:0] n1058;
wire [7:0] n1059;
wire [7:0] n1060;
wire [7:0] n1061;
wire [7:0] n1062;
wire [7:0] n1063;
wire [3:0] n1064;
wire [7:0] n1065;
wire [7:0] n1066;
wire [7:0] n1067;
wire [7:0] n1068;
wire [7:0] n1069;
wire [7:0] n1070;
wire [3:0] n1071;
wire [7:0] n1072;
wire [3:0] n1073;
wire [7:0] n1074;
wire [3:0] n1075;
wire [3:0] n1076;
wire [3:0] n1077;
wire [3:0] n1078;
wire [3:0] n1079;
wire [3:0] n1080;
wire [3:0] n1081;
wire n1082;
wire [2:0] n1083;
wire [7:0] n1084;
wire [7:0] n1085;
wire [7:0] n1086;
wire [0:0] n1087;
wire n1088;
wire n1089;
wire n1090;
wire n1091;
wire n1092;
wire n1093;
wire n1094;
wire n1095;
wire n1096;
wire n1097;
wire n1098;
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
wire [0:0] n1118;
wire n1119;
wire [15:0] n1120;
wire [15:0] n1121;
wire [15:0] n1122;
wire [15:0] n1123;
wire [15:0] n1124;
wire [7:0] n1125;
wire [7:0] n1126;
wire [7:0] n1127;
wire [7:0] n1128;
wire [3:0] n1129;
wire [7:0] n1130;
wire [7:0] n1131;
wire [7:0] n1132;
wire [7:0] n1133;
wire [2:0] n1134;
wire [15:0] n1135;
wire [7:0] n1136;
wire [3:0] n1137;
wire [7:0] n1138;
wire [7:0] n1139;
wire [3:0] n1140;
wire [7:0] n1141;
wire [7:0] n1142;
wire [7:0] n1143;
wire [7:0] n1144;
wire [7:0] n1145;
wire [0:0] n1146;
wire [8:0] n1147;
wire [8:0] n1148;
wire [7:0] n1149;
wire [0:0] n1150;
wire [0:0] n1151;
wire [2:0] n1152;
wire [0:0] n1153;
wire [1:0] n1154;
wire [7:0] n1155;
wire [7:0] n1156;
wire [7:0] n1157;
wire [7:0] n1158;
wire [7:0] n1159;
wire [7:0] n1160;
wire [7:0] n1161;
wire [7:0] n1162;
wire [7:0] n1163;
wire [7:0] n1164;
wire [7:0] n1165;
wire [7:0] n1166;
wire [7:0] n1167;
wire [7:0] n1168;
wire [7:0] n1169;
wire [7:0] n1170;
wire [7:0] n1171;
wire [7:0] n1172;
wire [7:0] n1173;
wire [7:0] n1174;
wire [7:0] n1175;
wire [7:0] n1176;
wire [7:0] n1177;
wire [7:0] n1178;
wire [7:0] n1179;
wire [7:0] n1180;
wire [15:0] n1181;
wire [7:0] n1182;
wire [7:0] n1183;
wire [7:0] n1184;
wire [8:0] n1185;
wire [8:0] n1186;
wire [8:0] n1187;
wire [8:0] n1188;
wire [8:0] n1189;
wire [0:0] n1190;
wire [3:0] n1191;
wire [4:0] n1192;
wire [4:0] n1193;
wire [4:0] n1194;
wire [4:0] n1195;
wire [4:0] n1196;
wire [0:0] n1197;
wire [8:0] n1198;
wire [8:0] n1199;
wire [8:0] n1200;
wire [8:0] n1201;
wire [0:0] n1202;
wire [0:0] n1203;
wire n1204;
wire n1205;
wire [0:0] n1206;
wire [7:0] n1207;
wire [7:0] n1208;
wire [8:0] n1209;
wire [8:0] n1210;
wire [8:0] n1211;
wire [0:0] n1212;
wire [3:0] n1213;
wire [4:0] n1214;
wire [4:0] n1215;
wire [4:0] n1216;
wire [4:0] n1217;
wire [0:0] n1218;
wire [8:0] n1219;
wire [8:0] n1220;
wire [8:0] n1221;
wire [0:0] n1222;
wire [0:0] n1223;
wire n1224;
wire n1225;
wire [0:0] n1226;
wire [7:0] n1227;
wire [7:0] n1228;
wire [8:0] n1229;
wire [8:0] n1230;
wire [8:0] n1231;
wire [0:0] n1232;
wire [3:0] n1233;
wire [4:0] n1234;
wire [4:0] n1235;
wire [4:0] n1236;
wire [0:0] n1237;
wire [8:0] n1238;
wire [8:0] n1239;
wire [8:0] n1240;
wire [0:0] n1241;
wire [0:0] n1242;
wire n1243;
wire n1244;
wire [0:0] n1245;
wire [7:0] n1246;
wire [8:0] n1247;
wire [8:0] n1248;
wire [8:0] n1249;
wire [0:0] n1250;
wire [8:0] n1251;
wire [8:0] n1252;
wire [0:0] n1253;
wire [0:0] n1254;
wire n1255;
wire n1256;
wire [0:0] n1257;
wire [7:0] n1258;
wire [7:0] n1259;
wire [8:0] n1260;
wire [8:0] n1261;
wire [8:0] n1262;
wire [0:0] n1263;
wire [4:0] n1264;
wire [4:0] n1265;
wire [4:0] n1266;
wire [0:0] n1267;
wire [8:0] n1268;
wire [8:0] n1269;
wire [8:0] n1270;
wire [0:0] n1271;
wire [0:0] n1272;
wire n1273;
wire n1274;
wire [0:0] n1275;
wire [7:0] n1276;
wire [4:0] n1277;
wire [4:0] n1278;
wire [0:0] n1279;
wire [7:0] n1280;
wire [8:0] n1281;
wire [8:0] n1282;
wire [0:0] n1283;
wire [8:0] n1284;
wire [8:0] n1285;
wire [0:0] n1286;
wire [0:0] n1287;
wire n1288;
wire n1289;
wire [0:0] n1290;
wire [7:0] n1291;
wire [7:0] n1292;
wire n1293;
wire [15:0] n1294;
wire [8:0] n1295;
wire [8:0] n1296;
wire [7:0] n1297;
wire [0:0] n1298;
wire [7:0] n1299;
wire [7:0] n1300;
wire [7:0] n1301;
wire [7:0] n1302;
wire [8:0] n1303;
wire [8:0] n1304;
wire [8:0] n1305;
wire [0:0] n1306;
wire [4:0] n1307;
wire [4:0] n1308;
wire [4:0] n1309;
wire [0:0] n1310;
wire [8:0] n1311;
wire [8:0] n1312;
wire [0:0] n1313;
wire [0:0] n1314;
wire n1315;
wire n1316;
wire [0:0] n1317;
wire [7:0] n1318;
wire [7:0] n1319;
wire [7:0] n1320;
wire [8:0] n1321;
wire [8:0] n1322;
wire [0:0] n1323;
wire [4:0] n1324;
wire [4:0] n1325;
wire [0:0] n1326;
wire [8:0] n1327;
wire [8:0] n1328;
wire [0:0] n1329;
wire [0:0] n1330;
wire n1331;
wire n1332;
wire [0:0] n1333;
wire [7:0] n1334;
wire [7:0] n1335;
wire [7:0] n1336;
wire [8:0] n1337;
wire [8:0] n1338;
wire [0:0] n1339;
wire [4:0] n1340;
wire [4:0] n1341;
wire [0:0] n1342;
wire [8:0] n1343;
wire [8:0] n1344;
wire [0:0] n1345;
wire [0:0] n1346;
wire n1347;
wire n1348;
wire [0:0] n1349;
wire [7:0] n1350;
wire [7:0] n1351;
wire [7:0] n1352;
wire [8:0] n1353;
wire [8:0] n1354;
wire [0:0] n1355;
wire [4:0] n1356;
wire [4:0] n1357;
wire [0:0] n1358;
wire [8:0] n1359;
wire [8:0] n1360;
wire [0:0] n1361;
wire [0:0] n1362;
wire n1363;
wire n1364;
wire [0:0] n1365;
wire [7:0] n1366;
wire n1367;
wire [15:0] n1368;
wire [15:0] n1369;
wire [15:0] n1370;
wire [7:0] n1371;
wire [7:0] n1372;
wire [7:0] n1373;
wire [7:0] n1374;
wire [7:0] n1375;
wire [7:0] n1376;
wire [7:0] n1377;
wire [7:0] n1378;
wire [7:0] n1379;
wire [7:0] n1380;
wire [7:0] n1381;
wire [7:0] n1382;
wire [7:0] n1383;
wire [7:0] n1384;
wire [7:0] n1385;
wire [7:0] n1386;
wire [7:0] n1387;
wire [7:0] n1388;
wire [7:0] n1389;
wire [7:0] n1390;
wire [7:0] n1391;
wire [7:0] n1392;
wire [7:0] n1393;
wire [7:0] n1394;
wire [7:0] n1395;
wire [7:0] n1396;
wire [7:0] n1397;
wire [7:0] n1398;
wire [7:0] n1399;
wire [7:0] n1400;
wire [7:0] n1401;
wire [7:0] n1402;
wire [7:0] n1403;
wire [7:0] n1404;
wire [7:0] n1405;
wire [7:0] n1406;
wire [7:0] n1407;
wire [7:0] n1408;
wire [7:0] n1409;
wire [7:0] n1410;
wire [7:0] n1411;
wire [7:0] n1412;
wire [7:0] n1413;
wire [7:0] n1414;
wire [7:0] n1415;
wire [7:0] n1416;
wire [7:0] n1417;
wire n1418;
wire [15:0] n1419;
wire [7:0] n1420;
wire [7:0] n1421;
wire [7:0] n1422;
wire [7:0] n1423;
wire [7:0] n1424;
wire [7:0] n1425;
wire [7:0] n1426;
wire [7:0] n1427;
wire [7:0] n1428;
wire [7:0] n1429;
wire [7:0] n1430;
wire [7:0] n1431;
wire [7:0] n1432;
wire [7:0] n1433;
wire [7:0] n1434;
wire [7:0] n1435;
wire [7:0] n1436;
wire [7:0] n1437;
wire [7:0] n1438;
wire [7:0] n1439;
wire [7:0] n1440;
wire [7:0] n1441;
wire [7:0] n1442;
wire [7:0] n1443;
wire [7:0] n1444;
wire [7:0] n1445;
wire [7:0] n1446;
wire [7:0] n1447;
wire [7:0] n1448;
wire [7:0] n1449;
wire [7:0] n1450;
wire [7:0] n1451;
wire [7:0] n1452;
wire [7:0] n1453;
wire [7:0] n1454;
wire [7:0] n1455;
wire [7:0] n1456;
wire [7:0] n1457;
wire [7:0] n1458;
wire [7:0] n1459;
wire [7:0] n1460;
wire [7:0] n1461;
wire [7:0] n1462;
wire [7:0] n1463;
wire [7:0] n1464;
wire [7:0] n1465;
wire [7:0] n1466;
wire n1467;
wire [15:0] n1468;
wire [7:0] n1469;
wire [7:0] n1470;
wire [7:0] n1471;
wire [7:0] n1472;
wire [7:0] n1473;
wire [7:0] n1474;
wire [7:0] n1475;
wire [7:0] n1476;
wire [7:0] n1477;
wire [7:0] n1478;
wire [7:0] n1479;
wire [7:0] n1480;
wire [7:0] n1481;
wire [7:0] n1482;
wire [7:0] n1483;
wire [7:0] n1484;
wire [7:0] n1485;
wire [7:0] n1486;
wire [7:0] n1487;
wire [7:0] n1488;
wire [7:0] n1489;
wire [7:0] n1490;
wire [7:0] n1491;
wire [7:0] n1492;
wire [7:0] n1493;
wire [7:0] n1494;
wire [7:0] n1495;
wire [7:0] n1496;
wire [7:0] n1497;
wire [7:0] n1498;
wire [7:0] n1499;
wire [7:0] n1500;
wire [7:0] n1501;
wire [7:0] n1502;
wire [7:0] n1503;
wire [7:0] n1504;
wire [7:0] n1505;
wire [7:0] n1506;
wire [7:0] n1507;
wire [7:0] n1508;
wire [7:0] n1509;
wire [7:0] n1510;
wire [7:0] n1511;
wire [7:0] n1512;
wire [7:0] n1513;
wire [7:0] n1514;
wire [7:0] n1515;
wire [7:0] n1516;
wire [7:0] n1517;
wire n1518;
wire [15:0] n1519;
wire [0:0] n1520;
wire [6:0] n1521;
wire [7:0] n1522;
wire [15:0] n1523;
wire [7:0] n1524;
wire [7:0] n1525;
wire [7:0] n1526;
wire [7:0] n1527;
wire [7:0] n1528;
wire [7:0] n1529;
wire [7:0] n1530;
wire [7:0] n1531;
wire [7:0] n1532;
wire [7:0] n1533;
wire [7:0] n1534;
wire [7:0] n1535;
wire [7:0] n1536;
wire [7:0] n1537;
wire [7:0] n1538;
wire [7:0] n1539;
wire [7:0] n1540;
wire [7:0] n1541;
wire [7:0] n1542;
wire [7:0] n1543;
wire [7:0] n1544;
wire [0:0] n1545;
wire [7:0] n1546;
wire n1547;
wire [7:0] n1548;
wire [7:0] n1549;
wire [7:0] n1550;
wire [7:0] n1551;
wire [7:0] n1552;
wire [3:0] n1553;
wire [0:0] n1554;
wire [7:0] n1555;
wire [0:0] n1556;
wire n1557;
wire n1558;
wire n1559;
wire n1560;
wire n1561;
wire n1562;
wire n1563;
wire n1564;
wire n1565;
wire n1566;
wire n1567;
wire n1568;
wire n1569;
wire n1570;
wire n1571;
wire n1572;
wire n1573;
wire n1574;
wire n1575;
wire n1576;
wire n1577;
wire n1578;
wire [7:0] n1579;
wire [7:0] n1580;
wire [7:0] n1581;
wire [7:0] n1582;
wire [7:0] n1583;
wire [7:0] n1584;
wire [7:0] n1585;
wire [7:0] n1586;
wire [7:0] n1587;
wire [7:0] n1588;
wire [7:0] n1589;
wire [7:0] n1590;
wire [7:0] n1591;
wire [7:0] n1592;
wire [7:0] n1593;
wire [7:0] n1594;
wire [7:0] n1595;
wire [7:0] n1596;
wire [7:0] n1597;
wire [7:0] n1598;
wire [7:0] n1599;
wire [7:0] n1600;
wire [7:0] n1601;
wire [7:0] n1602;
wire [7:0] n1603;
wire [7:0] n1604;
wire [7:0] n1605;
wire [7:0] n1606;
wire [7:0] n1607;
wire [7:0] n1608;
wire [7:0] n1609;
wire [7:0] n1610;
wire [7:0] n1611;
wire [7:0] n1612;
wire [7:0] n1613;
wire [7:0] n1614;
wire [7:0] n1615;
wire [7:0] n1616;
wire [7:0] n1617;
wire [7:0] n1618;
wire [7:0] n1619;
wire [7:0] n1620;
wire [7:0] n1621;
wire [7:0] n1622;
wire [7:0] n1623;
wire [7:0] n1624;
wire [7:0] n1625;
wire [7:0] n1626;
wire [7:0] n1627;
wire [7:0] n1628;
wire [7:0] n1629;
wire [7:0] n1630;
wire [7:0] n1631;
wire [7:0] n1632;
wire [7:0] n1633;
wire [7:0] n1634;
wire [7:0] n1635;
wire [7:0] n1636;
wire [7:0] n1637;
wire [7:0] n1638;
wire [7:0] n1639;
wire [7:0] n1640;
wire [7:0] n1641;
wire [7:0] n1642;
wire [7:0] n1643;
wire [7:0] n1644;
wire [7:0] n1645;
wire [7:0] n1646;
wire [7:0] n1647;
wire [7:0] n1648;
wire [7:0] n1649;
wire [7:0] n1650;
wire [7:0] n1651;
wire [7:0] n1652;
wire [7:0] n1653;
wire [7:0] n1654;
wire [7:0] n1655;
wire [7:0] n1656;
wire [7:0] n1657;
wire [7:0] n1658;
wire [7:0] n1659;
wire [7:0] n1660;
wire [7:0] n1661;
wire [7:0] n1662;
wire [7:0] n1663;
wire [7:0] n1664;
wire [7:0] n1665;
wire [7:0] n1666;
wire [7:0] n1667;
wire [7:0] n1668;
wire [7:0] n1669;
wire [7:0] n1670;
wire [7:0] n1671;
wire [7:0] n1672;
wire [7:0] n1673;
wire [7:0] n1674;
wire [7:0] n1675;
wire [7:0] n1676;
wire [7:0] n1677;
wire [7:0] n1678;
wire [7:0] n1679;
wire [7:0] n1680;
wire [7:0] n1681;
wire n1682;
wire [0:0] n1683;
wire n1684;
wire [0:0] n1685;
wire [8:0] n1686;
wire [0:0] n1687;
wire [0:0] n1688;
wire n1689;
wire n1690;
wire [0:0] n1691;
wire [7:0] n1692;
wire [7:0] n1693;
wire [7:0] n1694;
wire n1695;
wire [0:0] n1696;
wire n1697;
wire [0:0] n1698;
wire [8:0] n1699;
wire [0:0] n1700;
wire [0:0] n1701;
wire n1702;
wire n1703;
wire [0:0] n1704;
wire [7:0] n1705;
wire [7:0] n1706;
wire [7:0] n1707;
wire n1708;
wire [0:0] n1709;
wire n1710;
wire [0:0] n1711;
wire [8:0] n1712;
wire [0:0] n1713;
wire [0:0] n1714;
wire n1715;
wire n1716;
wire [0:0] n1717;
wire [7:0] n1718;
wire [7:0] n1719;
wire [7:0] n1720;
wire n1721;
wire [0:0] n1722;
wire n1723;
wire [0:0] n1724;
wire [8:0] n1725;
wire [0:0] n1726;
wire [0:0] n1727;
wire n1728;
wire n1729;
wire [0:0] n1730;
wire [7:0] n1731;
wire [0:0] n1732;
wire [0:0] n1733;
wire [7:0] n1734;
wire [7:0] n1735;
wire [15:0] n1736;
wire [7:0] n1737;
wire [7:0] n1738;
wire [15:0] n1739;
wire [15:0] n1740;
wire [7:0] n1741;
wire [7:0] n1742;
wire n1743;
wire n1744;
wire [0:0] n1745;
wire [7:0] n1746;
wire [7:0] n1747;
wire [7:0] n1748;
wire [0:0] n1749;
wire [7:0] n1750;
wire [7:0] n1751;
wire [7:0] n1752;
wire [7:0] n1753;
wire [7:0] n1754;
wire [7:0] n1755;
wire [7:0] n1756;
wire [7:0] n1757;
wire [7:0] n1758;
wire [7:0] n1759;
wire [7:0] n1760;
wire [7:0] n1761;
wire [7:0] n1762;
wire [7:0] n1763;
wire [7:0] n1764;
wire [0:0] n1765;
wire [7:0] n1766;
wire n1767;
wire n1768;
wire [15:0] n1769;
wire n1770;
wire [0:0] n1771;
wire [7:0] n1772;
wire n1773;
wire n1774;
wire [15:0] n1775;
wire n1776;
wire [0:0] n1777;
wire [7:0] n1778;
wire n1779;
wire n1780;
wire [15:0] n1781;
wire n1782;
wire [0:0] n1783;
wire [7:0] n1784;
wire n1785;
wire n1786;
wire [15:0] n1787;
wire n1788;
wire [0:0] n1789;
wire [7:0] n1790;
wire [7:0] n1791;
wire [3:0] n1792;
wire [7:0] n1793;
wire [7:0] n1794;
wire [7:0] n1795;
wire [7:0] n1796;
wire [7:0] n1797;
wire [7:0] n1798;
wire [7:0] n1799;
wire [7:0] n1800;
wire [7:0] n1801;
wire [7:0] n1802;
wire [7:0] n1803;
wire [7:0] n1804;
wire [7:0] n1805;
wire [7:0] n1806;
wire [7:0] n1807;
wire [7:0] n1808;
wire [7:0] n1809;
wire [7:0] n1810;
wire [7:0] n1811;
wire [7:0] n1812;
wire [7:0] n1813;
wire [7:0] n1814;
wire [7:0] n1815;
wire [7:0] n1816;
wire [7:0] n1817;
wire [7:0] n1818;
wire [7:0] n1819;
wire [7:0] n1820;
wire [7:0] n1821;
wire [7:0] n1822;
wire [7:0] n1823;
wire [7:0] n1824;
wire [7:0] n1825;
wire [7:0] n1826;
wire [7:0] n1827;
wire [7:0] n1828;
wire n1829;
wire [3:0] n1830;
wire n1831;
wire n1832;
wire [8:0] n1833;
wire [8:0] n1834;
wire [8:0] n1835;
wire [0:0] n1836;
wire [0:0] n1837;
wire n1838;
wire [3:0] n1839;
wire n1840;
wire n1841;
wire [8:0] n1842;
wire [8:0] n1843;
wire [8:0] n1844;
wire [7:0] n1845;
wire [0:0] n1846;
wire [0:0] n1847;
wire [7:0] n1848;
wire n1849;
wire n1850;
wire [15:0] n1851;
wire [7:0] n1852;
wire [3:0] n1853;
wire [7:0] n1854;
wire n1855;
wire n1856;
wire [15:0] n1857;
wire [7:0] n1858;
wire [7:0] n1859;
wire n1860;
wire [7:0] n1861;
wire n1862;
wire [7:0] n1863;
wire n1864;
wire [7:0] n1865;
wire n1866;
wire [7:0] n1867;
wire n1868;
wire [7:0] n1869;
wire n1870;
wire [7:0] n1871;
wire n1872;
wire [7:0] n1873;
wire n1874;
wire [7:0] n1875;
wire n1876;
wire [7:0] n1877;
wire n1878;
wire [7:0] n1879;
wire n1880;
wire [7:0] n1881;
wire n1882;
wire [7:0] n1883;
wire n1884;
wire n1885;
wire [7:0] n1886;
wire n1887;
wire [7:0] n1888;
wire n1889;
wire [7:0] n1890;
wire n1891;
wire [7:0] n1892;
wire n1893;
wire [7:0] n1894;
wire n1895;
wire [7:0] n1896;
wire n1897;
wire [7:0] n1898;
wire n1899;
wire [7:0] n1900;
wire n1901;
wire n1902;
wire [7:0] n1903;
wire n1904;
wire n1905;
wire n1906;
wire n1907;
wire [7:0] n1908;
wire n1909;
wire [7:0] n1910;
wire n1911;
wire [7:0] n1912;
wire n1913;
wire [7:0] n1914;
wire n1915;
wire [7:0] n1916;
wire n1917;
wire [7:0] n1918;
wire n1919;
wire [7:0] n1920;
wire n1921;
wire [7:0] n1922;
wire n1923;
wire [7:0] n1924;
wire n1925;
wire [7:0] n1926;
wire n1927;
wire [7:0] n1928;
wire n1929;
wire [7:0] n1930;
wire n1931;
wire [7:0] n1932;
wire n1933;
wire [7:0] n1934;
wire n1935;
wire [7:0] n1936;
wire n1937;
wire [7:0] n1938;
wire n1939;
wire [7:0] n1940;
wire n1941;
wire [7:0] n1942;
wire n1943;
wire [7:0] n1944;
wire n1945;
wire [7:0] n1946;
wire n1947;
wire [7:0] n1948;
wire n1949;
wire n1950;
wire n1951;
wire [7:0] n1952;
wire n1953;
wire [7:0] n1954;
wire n1955;
wire [7:0] n1956;
wire n1957;
wire [7:0] n1958;
wire n1959;
wire [7:0] n1960;
wire n1961;
wire [7:0] n1962;
wire n1963;
wire [7:0] n1964;
wire n1965;
wire [7:0] n1966;
wire n1967;
wire [7:0] n1968;
wire n1969;
wire [7:0] n1970;
wire n1971;
wire [7:0] n1972;
wire n1973;
wire [7:0] n1974;
wire n1975;
wire [7:0] n1976;
wire n1977;
wire [7:0] n1978;
wire n1979;
wire [7:0] n1980;
wire n1981;
wire [7:0] n1982;
wire n1983;

reg [7:0] IRAM[15:0];

// port: IRAM->RD_IRAM_0
// port: IRAM->RD_IRAM_1
// port: ROM->RD_ROM_0
// port: ROM->RD_ROM_1
// port: ROM->RD_ROM_2
// RD_IRAM_0_ADDR=(if (eq RD_ROM_0 (bv 5 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 6 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 7 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 8 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 9 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 10 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 11 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 12 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 13 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 14 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 15 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 16 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 21 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 22 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 23 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 24 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 25 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 26 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 27 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 28 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 29 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 30 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 31 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 32 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 34 8)) SP (if (eq RD_ROM_0 (bv 37 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 38 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 39 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 40 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 41 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 42 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 43 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 44 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 45 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 46 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 47 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 48 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 50 8)) SP (if (eq RD_ROM_0 (bv 53 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 54 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 55 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 56 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 57 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 58 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 59 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 60 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 61 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 62 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 63 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 66 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 67 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 69 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 70 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 71 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 72 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 73 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 74 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 75 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 76 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 77 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 78 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 79 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 82 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 83 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 85 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 86 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 87 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 88 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 89 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 90 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 91 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 92 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 93 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 94 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 95 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 98 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 99 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 101 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 102 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 103 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 104 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 105 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 106 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 107 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 108 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 109 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 110 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 111 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 114 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 118 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 119 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 130 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 133 8)) RD_ROM_2 (if (eq RD_ROM_0 (bv 134 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 135 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 136 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 137 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 138 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 139 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 140 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 141 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 142 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 143 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 146 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 149 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 150 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 151 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 152 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 153 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 154 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 155 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 156 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 157 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 158 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 159 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 160 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 162 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 166 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 167 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 168 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 169 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 170 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 171 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 172 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 173 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 174 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 175 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 176 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 178 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 181 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 182 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 183 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 184 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 185 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 186 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 187 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 188 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 189 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 190 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 191 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 192 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 194 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 197 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 198 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 199 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 200 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 201 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 202 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 203 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 204 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 205 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 206 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 207 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 208 8)) SP (if (eq RD_ROM_0 (bv 210 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 213 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 214 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 215 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 216 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 217 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 218 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 219 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 220 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 221 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 222 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 223 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 229 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 230 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 231 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 232 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 233 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 234 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 235 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 236 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 237 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 238 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 239 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 246 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
assign n0001 = 8'h5;
assign n0002 = ( RD_ROM_0 == n0001 );
assign n0003 = 8'h6;
assign n0004 = ( RD_ROM_0 == n0003 );
assign n0005 = 3'h0;
assign n0006 = PSW[4:3];
assign n0007 = { ( n0005 ), ( n0006 ), ( n0005 ) };
assign n0008 = 8'h7;
assign n0009 = ( RD_ROM_0 == n0008 );
assign n0010 = 3'h1;
assign n0011 = { ( n0005 ), ( n0006 ), ( n0010 ) };
assign n0012 = 8'h8;
assign n0013 = ( RD_ROM_0 == n0012 );
assign n0014 = 8'h9;
assign n0015 = ( RD_ROM_0 == n0014 );
assign n0016 = 8'ha;
assign n0017 = ( RD_ROM_0 == n0016 );
assign n0018 = 3'h2;
assign n0019 = { ( n0005 ), ( n0006 ), ( n0018 ) };
assign n0020 = 8'hb;
assign n0021 = ( RD_ROM_0 == n0020 );
assign n0022 = 3'h3;
assign n0023 = { ( n0005 ), ( n0006 ), ( n0022 ) };
assign n0024 = 8'hc;
assign n0025 = ( RD_ROM_0 == n0024 );
assign n0026 = 3'h4;
assign n0027 = { ( n0005 ), ( n0006 ), ( n0026 ) };
assign n0028 = 8'hd;
assign n0029 = ( RD_ROM_0 == n0028 );
assign n0030 = 3'h5;
assign n0031 = { ( n0005 ), ( n0006 ), ( n0030 ) };
assign n0032 = 8'he;
assign n0033 = ( RD_ROM_0 == n0032 );
assign n0034 = 3'h6;
assign n0035 = { ( n0005 ), ( n0006 ), ( n0034 ) };
assign n0036 = 8'hf;
assign n0037 = ( RD_ROM_0 == n0036 );
assign n0038 = 3'h7;
assign n0039 = { ( n0005 ), ( n0006 ), ( n0038 ) };
assign n0040 = 8'h10;
assign n0041 = ( RD_ROM_0 == n0040 );
assign n0042 = RD_ROM_1[7:7];
assign n0043 = 1'h1;
assign n0044 = ( n0042 == n0043 );
assign n0045 = RD_ROM_1[7:3];
assign n0046 = { ( n0045 ), ( n0005 ) };
assign n0047 = { 3'b0, n0045 };
assign n0048 = 8'h20;
assign n0049 = ( n0047 + n0048 );
assign n0050 = ( n0044 ) ? ( n0046 ) : ( n0049 );
assign n0051 = 8'h15;
assign n0052 = ( RD_ROM_0 == n0051 );
assign n0053 = 8'h16;
assign n0054 = ( RD_ROM_0 == n0053 );
assign n0055 = 8'h17;
assign n0056 = ( RD_ROM_0 == n0055 );
assign n0057 = 8'h18;
assign n0058 = ( RD_ROM_0 == n0057 );
assign n0059 = 8'h19;
assign n0060 = ( RD_ROM_0 == n0059 );
assign n0061 = 8'h1a;
assign n0062 = ( RD_ROM_0 == n0061 );
assign n0063 = 8'h1b;
assign n0064 = ( RD_ROM_0 == n0063 );
assign n0065 = 8'h1c;
assign n0066 = ( RD_ROM_0 == n0065 );
assign n0067 = 8'h1d;
assign n0068 = ( RD_ROM_0 == n0067 );
assign n0069 = 8'h1e;
assign n0070 = ( RD_ROM_0 == n0069 );
assign n0071 = 8'h1f;
assign n0072 = ( RD_ROM_0 == n0071 );
assign n0073 = ( RD_ROM_0 == n0048 );
assign n0074 = 8'h22;
assign n0075 = ( RD_ROM_0 == n0074 );
assign n0076 = 8'h25;
assign n0077 = ( RD_ROM_0 == n0076 );
assign n0078 = 8'h26;
assign n0079 = ( RD_ROM_0 == n0078 );
assign n0080 = 8'h27;
assign n0081 = ( RD_ROM_0 == n0080 );
assign n0082 = 8'h28;
assign n0083 = ( RD_ROM_0 == n0082 );
assign n0084 = 8'h29;
assign n0085 = ( RD_ROM_0 == n0084 );
assign n0086 = 8'h2a;
assign n0087 = ( RD_ROM_0 == n0086 );
assign n0088 = 8'h2b;
assign n0089 = ( RD_ROM_0 == n0088 );
assign n0090 = 8'h2c;
assign n0091 = ( RD_ROM_0 == n0090 );
assign n0092 = 8'h2d;
assign n0093 = ( RD_ROM_0 == n0092 );
assign n0094 = 8'h2e;
assign n0095 = ( RD_ROM_0 == n0094 );
assign n0096 = 8'h2f;
assign n0097 = ( RD_ROM_0 == n0096 );
assign n0098 = 8'h30;
assign n0099 = ( RD_ROM_0 == n0098 );
assign n0100 = 8'h32;
assign n0101 = ( RD_ROM_0 == n0100 );
assign n0102 = 8'h35;
assign n0103 = ( RD_ROM_0 == n0102 );
assign n0104 = 8'h36;
assign n0105 = ( RD_ROM_0 == n0104 );
assign n0106 = 8'h37;
assign n0107 = ( RD_ROM_0 == n0106 );
assign n0108 = 8'h38;
assign n0109 = ( RD_ROM_0 == n0108 );
assign n0110 = 8'h39;
assign n0111 = ( RD_ROM_0 == n0110 );
assign n0112 = 8'h3a;
assign n0113 = ( RD_ROM_0 == n0112 );
assign n0114 = 8'h3b;
assign n0115 = ( RD_ROM_0 == n0114 );
assign n0116 = 8'h3c;
assign n0117 = ( RD_ROM_0 == n0116 );
assign n0118 = 8'h3d;
assign n0119 = ( RD_ROM_0 == n0118 );
assign n0120 = 8'h3e;
assign n0121 = ( RD_ROM_0 == n0120 );
assign n0122 = 8'h3f;
assign n0123 = ( RD_ROM_0 == n0122 );
assign n0124 = 8'h42;
assign n0125 = ( RD_ROM_0 == n0124 );
assign n0126 = 8'h43;
assign n0127 = ( RD_ROM_0 == n0126 );
assign n0128 = 8'h45;
assign n0129 = ( RD_ROM_0 == n0128 );
assign n0130 = 8'h46;
assign n0131 = ( RD_ROM_0 == n0130 );
assign n0132 = 8'h47;
assign n0133 = ( RD_ROM_0 == n0132 );
assign n0134 = 8'h48;
assign n0135 = ( RD_ROM_0 == n0134 );
assign n0136 = 8'h49;
assign n0137 = ( RD_ROM_0 == n0136 );
assign n0138 = 8'h4a;
assign n0139 = ( RD_ROM_0 == n0138 );
assign n0140 = 8'h4b;
assign n0141 = ( RD_ROM_0 == n0140 );
assign n0142 = 8'h4c;
assign n0143 = ( RD_ROM_0 == n0142 );
assign n0144 = 8'h4d;
assign n0145 = ( RD_ROM_0 == n0144 );
assign n0146 = 8'h4e;
assign n0147 = ( RD_ROM_0 == n0146 );
assign n0148 = 8'h4f;
assign n0149 = ( RD_ROM_0 == n0148 );
assign n0150 = 8'h52;
assign n0151 = ( RD_ROM_0 == n0150 );
assign n0152 = 8'h53;
assign n0153 = ( RD_ROM_0 == n0152 );
assign n0154 = 8'h55;
assign n0155 = ( RD_ROM_0 == n0154 );
assign n0156 = 8'h56;
assign n0157 = ( RD_ROM_0 == n0156 );
assign n0158 = 8'h57;
assign n0159 = ( RD_ROM_0 == n0158 );
assign n0160 = 8'h58;
assign n0161 = ( RD_ROM_0 == n0160 );
assign n0162 = 8'h59;
assign n0163 = ( RD_ROM_0 == n0162 );
assign n0164 = 8'h5a;
assign n0165 = ( RD_ROM_0 == n0164 );
assign n0166 = 8'h5b;
assign n0167 = ( RD_ROM_0 == n0166 );
assign n0168 = 8'h5c;
assign n0169 = ( RD_ROM_0 == n0168 );
assign n0170 = 8'h5d;
assign n0171 = ( RD_ROM_0 == n0170 );
assign n0172 = 8'h5e;
assign n0173 = ( RD_ROM_0 == n0172 );
assign n0174 = 8'h5f;
assign n0175 = ( RD_ROM_0 == n0174 );
assign n0176 = 8'h62;
assign n0177 = ( RD_ROM_0 == n0176 );
assign n0178 = 8'h63;
assign n0179 = ( RD_ROM_0 == n0178 );
assign n0180 = 8'h65;
assign n0181 = ( RD_ROM_0 == n0180 );
assign n0182 = 8'h66;
assign n0183 = ( RD_ROM_0 == n0182 );
assign n0184 = 8'h67;
assign n0185 = ( RD_ROM_0 == n0184 );
assign n0186 = 8'h68;
assign n0187 = ( RD_ROM_0 == n0186 );
assign n0188 = 8'h69;
assign n0189 = ( RD_ROM_0 == n0188 );
assign n0190 = 8'h6a;
assign n0191 = ( RD_ROM_0 == n0190 );
assign n0192 = 8'h6b;
assign n0193 = ( RD_ROM_0 == n0192 );
assign n0194 = 8'h6c;
assign n0195 = ( RD_ROM_0 == n0194 );
assign n0196 = 8'h6d;
assign n0197 = ( RD_ROM_0 == n0196 );
assign n0198 = 8'h6e;
assign n0199 = ( RD_ROM_0 == n0198 );
assign n0200 = 8'h6f;
assign n0201 = ( RD_ROM_0 == n0200 );
assign n0202 = 8'h72;
assign n0203 = ( RD_ROM_0 == n0202 );
assign n0204 = 8'h76;
assign n0205 = ( RD_ROM_0 == n0204 );
assign n0206 = 8'h77;
assign n0207 = ( RD_ROM_0 == n0206 );
assign n0208 = 8'h82;
assign n0209 = ( RD_ROM_0 == n0208 );
assign n0210 = 8'h85;
assign n0211 = ( RD_ROM_0 == n0210 );
assign n0212 = 8'h86;
assign n0213 = ( RD_ROM_0 == n0212 );
assign n0214 = 8'h87;
assign n0215 = ( RD_ROM_0 == n0214 );
assign n0216 = 8'h88;
assign n0217 = ( RD_ROM_0 == n0216 );
assign n0218 = 8'h89;
assign n0219 = ( RD_ROM_0 == n0218 );
assign n0220 = 8'h8a;
assign n0221 = ( RD_ROM_0 == n0220 );
assign n0222 = 8'h8b;
assign n0223 = ( RD_ROM_0 == n0222 );
assign n0224 = 8'h8c;
assign n0225 = ( RD_ROM_0 == n0224 );
assign n0226 = 8'h8d;
assign n0227 = ( RD_ROM_0 == n0226 );
assign n0228 = 8'h8e;
assign n0229 = ( RD_ROM_0 == n0228 );
assign n0230 = 8'h8f;
assign n0231 = ( RD_ROM_0 == n0230 );
assign n0232 = 8'h92;
assign n0233 = ( RD_ROM_0 == n0232 );
assign n0234 = 8'h95;
assign n0235 = ( RD_ROM_0 == n0234 );
assign n0236 = 8'h96;
assign n0237 = ( RD_ROM_0 == n0236 );
assign n0238 = 8'h97;
assign n0239 = ( RD_ROM_0 == n0238 );
assign n0240 = 8'h98;
assign n0241 = ( RD_ROM_0 == n0240 );
assign n0242 = 8'h99;
assign n0243 = ( RD_ROM_0 == n0242 );
assign n0244 = 8'h9a;
assign n0245 = ( RD_ROM_0 == n0244 );
assign n0246 = 8'h9b;
assign n0247 = ( RD_ROM_0 == n0246 );
assign n0248 = 8'h9c;
assign n0249 = ( RD_ROM_0 == n0248 );
assign n0250 = 8'h9d;
assign n0251 = ( RD_ROM_0 == n0250 );
assign n0252 = 8'h9e;
assign n0253 = ( RD_ROM_0 == n0252 );
assign n0254 = 8'h9f;
assign n0255 = ( RD_ROM_0 == n0254 );
assign n0256 = 8'ha0;
assign n0257 = ( RD_ROM_0 == n0256 );
assign n0258 = 8'ha2;
assign n0259 = ( RD_ROM_0 == n0258 );
assign n0260 = 8'ha6;
assign n0261 = ( RD_ROM_0 == n0260 );
assign n0262 = 8'ha7;
assign n0263 = ( RD_ROM_0 == n0262 );
assign n0264 = 8'ha8;
assign n0265 = ( RD_ROM_0 == n0264 );
assign n0266 = 8'ha9;
assign n0267 = ( RD_ROM_0 == n0266 );
assign n0268 = 8'haa;
assign n0269 = ( RD_ROM_0 == n0268 );
assign n0270 = 8'hab;
assign n0271 = ( RD_ROM_0 == n0270 );
assign n0272 = 8'hac;
assign n0273 = ( RD_ROM_0 == n0272 );
assign n0274 = 8'had;
assign n0275 = ( RD_ROM_0 == n0274 );
assign n0276 = 8'hae;
assign n0277 = ( RD_ROM_0 == n0276 );
assign n0278 = 8'haf;
assign n0279 = ( RD_ROM_0 == n0278 );
assign n0280 = 8'hb0;
assign n0281 = ( RD_ROM_0 == n0280 );
assign n0282 = 8'hb2;
assign n0283 = ( RD_ROM_0 == n0282 );
assign n0284 = 8'hb5;
assign n0285 = ( RD_ROM_0 == n0284 );
assign n0286 = 8'hb6;
assign n0287 = ( RD_ROM_0 == n0286 );
assign n0288 = 8'hb7;
assign n0289 = ( RD_ROM_0 == n0288 );
assign n0290 = 8'hb8;
assign n0291 = ( RD_ROM_0 == n0290 );
assign n0292 = 8'hb9;
assign n0293 = ( RD_ROM_0 == n0292 );
assign n0294 = 8'hba;
assign n0295 = ( RD_ROM_0 == n0294 );
assign n0296 = 8'hbb;
assign n0297 = ( RD_ROM_0 == n0296 );
assign n0298 = 8'hbc;
assign n0299 = ( RD_ROM_0 == n0298 );
assign n0300 = 8'hbd;
assign n0301 = ( RD_ROM_0 == n0300 );
assign n0302 = 8'hbe;
assign n0303 = ( RD_ROM_0 == n0302 );
assign n0304 = 8'hbf;
assign n0305 = ( RD_ROM_0 == n0304 );
assign n0306 = 8'hc0;
assign n0307 = ( RD_ROM_0 == n0306 );
assign n0308 = 8'hc2;
assign n0309 = ( RD_ROM_0 == n0308 );
assign n0310 = 8'hc5;
assign n0311 = ( RD_ROM_0 == n0310 );
assign n0312 = 8'hc6;
assign n0313 = ( RD_ROM_0 == n0312 );
assign n0314 = 8'hc7;
assign n0315 = ( RD_ROM_0 == n0314 );
assign n0316 = 8'hc8;
assign n0317 = ( RD_ROM_0 == n0316 );
assign n0318 = 8'hc9;
assign n0319 = ( RD_ROM_0 == n0318 );
assign n0320 = 8'hca;
assign n0321 = ( RD_ROM_0 == n0320 );
assign n0322 = 8'hcb;
assign n0323 = ( RD_ROM_0 == n0322 );
assign n0324 = 8'hcc;
assign n0325 = ( RD_ROM_0 == n0324 );
assign n0326 = 8'hcd;
assign n0327 = ( RD_ROM_0 == n0326 );
assign n0328 = 8'hce;
assign n0329 = ( RD_ROM_0 == n0328 );
assign n0330 = 8'hcf;
assign n0331 = ( RD_ROM_0 == n0330 );
assign n0332 = 8'hd0;
assign n0333 = ( RD_ROM_0 == n0332 );
assign n0334 = 8'hd2;
assign n0335 = ( RD_ROM_0 == n0334 );
assign n0336 = 8'hd5;
assign n0337 = ( RD_ROM_0 == n0336 );
assign n0338 = 8'hd6;
assign n0339 = ( RD_ROM_0 == n0338 );
assign n0340 = 8'hd7;
assign n0341 = ( RD_ROM_0 == n0340 );
assign n0342 = 8'hd8;
assign n0343 = ( RD_ROM_0 == n0342 );
assign n0344 = 8'hd9;
assign n0345 = ( RD_ROM_0 == n0344 );
assign n0346 = 8'hda;
assign n0347 = ( RD_ROM_0 == n0346 );
assign n0348 = 8'hdb;
assign n0349 = ( RD_ROM_0 == n0348 );
assign n0350 = 8'hdc;
assign n0351 = ( RD_ROM_0 == n0350 );
assign n0352 = 8'hdd;
assign n0353 = ( RD_ROM_0 == n0352 );
assign n0354 = 8'hde;
assign n0355 = ( RD_ROM_0 == n0354 );
assign n0356 = 8'hdf;
assign n0357 = ( RD_ROM_0 == n0356 );
assign n0358 = 8'he5;
assign n0359 = ( RD_ROM_0 == n0358 );
assign n0360 = 8'he6;
assign n0361 = ( RD_ROM_0 == n0360 );
assign n0362 = 8'he7;
assign n0363 = ( RD_ROM_0 == n0362 );
assign n0364 = 8'he8;
assign n0365 = ( RD_ROM_0 == n0364 );
assign n0366 = 8'he9;
assign n0367 = ( RD_ROM_0 == n0366 );
assign n0368 = 8'hea;
assign n0369 = ( RD_ROM_0 == n0368 );
assign n0370 = 8'heb;
assign n0371 = ( RD_ROM_0 == n0370 );
assign n0372 = 8'hec;
assign n0373 = ( RD_ROM_0 == n0372 );
assign n0374 = 8'hed;
assign n0375 = ( RD_ROM_0 == n0374 );
assign n0376 = 8'hee;
assign n0377 = ( RD_ROM_0 == n0376 );
assign n0378 = 8'hef;
assign n0379 = ( RD_ROM_0 == n0378 );
assign n0380 = 8'hf6;
assign n0381 = ( RD_ROM_0 == n0380 );
assign n0382 = ( n0381 ) ? ( n0007 ) : ( n0011 );
assign n0383 = ( n0379 ) ? ( n0039 ) : ( n0382 );
assign n0384 = ( n0377 ) ? ( n0035 ) : ( n0383 );
assign n0385 = ( n0375 ) ? ( n0031 ) : ( n0384 );
assign n0386 = ( n0373 ) ? ( n0027 ) : ( n0385 );
assign n0387 = ( n0371 ) ? ( n0023 ) : ( n0386 );
assign n0388 = ( n0369 ) ? ( n0019 ) : ( n0387 );
assign n0389 = ( n0367 ) ? ( n0011 ) : ( n0388 );
assign n0390 = ( n0365 ) ? ( n0007 ) : ( n0389 );
assign n0391 = ( n0363 ) ? ( n0011 ) : ( n0390 );
assign n0392 = ( n0361 ) ? ( n0007 ) : ( n0391 );
assign n0393 = ( n0359 ) ? ( RD_ROM_1 ) : ( n0392 );
assign n0394 = ( n0357 ) ? ( n0039 ) : ( n0393 );
assign n0395 = ( n0355 ) ? ( n0035 ) : ( n0394 );
assign n0396 = ( n0353 ) ? ( n0031 ) : ( n0395 );
assign n0397 = ( n0351 ) ? ( n0027 ) : ( n0396 );
assign n0398 = ( n0349 ) ? ( n0023 ) : ( n0397 );
assign n0399 = ( n0347 ) ? ( n0019 ) : ( n0398 );
assign n0400 = ( n0345 ) ? ( n0011 ) : ( n0399 );
assign n0401 = ( n0343 ) ? ( n0007 ) : ( n0400 );
assign n0402 = ( n0341 ) ? ( n0011 ) : ( n0401 );
assign n0403 = ( n0339 ) ? ( n0007 ) : ( n0402 );
assign n0404 = ( n0337 ) ? ( RD_ROM_1 ) : ( n0403 );
assign n0405 = ( n0335 ) ? ( n0050 ) : ( n0404 );
assign n0406 = ( n0333 ) ? ( SP ) : ( n0405 );
assign n0407 = ( n0331 ) ? ( n0039 ) : ( n0406 );
assign n0408 = ( n0329 ) ? ( n0035 ) : ( n0407 );
assign n0409 = ( n0327 ) ? ( n0031 ) : ( n0408 );
assign n0410 = ( n0325 ) ? ( n0027 ) : ( n0409 );
assign n0411 = ( n0323 ) ? ( n0023 ) : ( n0410 );
assign n0412 = ( n0321 ) ? ( n0019 ) : ( n0411 );
assign n0413 = ( n0319 ) ? ( n0011 ) : ( n0412 );
assign n0414 = ( n0317 ) ? ( n0007 ) : ( n0413 );
assign n0415 = ( n0315 ) ? ( n0011 ) : ( n0414 );
assign n0416 = ( n0313 ) ? ( n0007 ) : ( n0415 );
assign n0417 = ( n0311 ) ? ( RD_ROM_1 ) : ( n0416 );
assign n0418 = ( n0309 ) ? ( n0050 ) : ( n0417 );
assign n0419 = ( n0307 ) ? ( RD_ROM_1 ) : ( n0418 );
assign n0420 = ( n0305 ) ? ( n0039 ) : ( n0419 );
assign n0421 = ( n0303 ) ? ( n0035 ) : ( n0420 );
assign n0422 = ( n0301 ) ? ( n0031 ) : ( n0421 );
assign n0423 = ( n0299 ) ? ( n0027 ) : ( n0422 );
assign n0424 = ( n0297 ) ? ( n0023 ) : ( n0423 );
assign n0425 = ( n0295 ) ? ( n0019 ) : ( n0424 );
assign n0426 = ( n0293 ) ? ( n0011 ) : ( n0425 );
assign n0427 = ( n0291 ) ? ( n0007 ) : ( n0426 );
assign n0428 = ( n0289 ) ? ( n0011 ) : ( n0427 );
assign n0429 = ( n0287 ) ? ( n0007 ) : ( n0428 );
assign n0430 = ( n0285 ) ? ( RD_ROM_1 ) : ( n0429 );
assign n0431 = ( n0283 ) ? ( n0050 ) : ( n0430 );
assign n0432 = ( n0281 ) ? ( n0050 ) : ( n0431 );
assign n0433 = ( n0279 ) ? ( RD_ROM_1 ) : ( n0432 );
assign n0434 = ( n0277 ) ? ( RD_ROM_1 ) : ( n0433 );
assign n0435 = ( n0275 ) ? ( RD_ROM_1 ) : ( n0434 );
assign n0436 = ( n0273 ) ? ( RD_ROM_1 ) : ( n0435 );
assign n0437 = ( n0271 ) ? ( RD_ROM_1 ) : ( n0436 );
assign n0438 = ( n0269 ) ? ( RD_ROM_1 ) : ( n0437 );
assign n0439 = ( n0267 ) ? ( RD_ROM_1 ) : ( n0438 );
assign n0440 = ( n0265 ) ? ( RD_ROM_1 ) : ( n0439 );
assign n0441 = ( n0263 ) ? ( n0011 ) : ( n0440 );
assign n0442 = ( n0261 ) ? ( n0007 ) : ( n0441 );
assign n0443 = ( n0259 ) ? ( n0050 ) : ( n0442 );
assign n0444 = ( n0257 ) ? ( n0050 ) : ( n0443 );
assign n0445 = ( n0255 ) ? ( n0039 ) : ( n0444 );
assign n0446 = ( n0253 ) ? ( n0035 ) : ( n0445 );
assign n0447 = ( n0251 ) ? ( n0031 ) : ( n0446 );
assign n0448 = ( n0249 ) ? ( n0027 ) : ( n0447 );
assign n0449 = ( n0247 ) ? ( n0023 ) : ( n0448 );
assign n0450 = ( n0245 ) ? ( n0019 ) : ( n0449 );
assign n0451 = ( n0243 ) ? ( n0011 ) : ( n0450 );
assign n0452 = ( n0241 ) ? ( n0007 ) : ( n0451 );
assign n0453 = ( n0239 ) ? ( n0011 ) : ( n0452 );
assign n0454 = ( n0237 ) ? ( n0007 ) : ( n0453 );
assign n0455 = ( n0235 ) ? ( RD_ROM_1 ) : ( n0454 );
assign n0456 = ( n0233 ) ? ( n0050 ) : ( n0455 );
assign n0457 = ( n0231 ) ? ( n0039 ) : ( n0456 );
assign n0458 = ( n0229 ) ? ( n0035 ) : ( n0457 );
assign n0459 = ( n0227 ) ? ( n0031 ) : ( n0458 );
assign n0460 = ( n0225 ) ? ( n0027 ) : ( n0459 );
assign n0461 = ( n0223 ) ? ( n0023 ) : ( n0460 );
assign n0462 = ( n0221 ) ? ( n0019 ) : ( n0461 );
assign n0463 = ( n0219 ) ? ( n0011 ) : ( n0462 );
assign n0464 = ( n0217 ) ? ( n0007 ) : ( n0463 );
assign n0465 = ( n0215 ) ? ( n0011 ) : ( n0464 );
assign n0466 = ( n0213 ) ? ( n0007 ) : ( n0465 );
assign n0467 = ( n0211 ) ? ( RD_ROM_2 ) : ( n0466 );
assign n0468 = ( n0209 ) ? ( n0050 ) : ( n0467 );
assign n0469 = ( n0207 ) ? ( n0011 ) : ( n0468 );
assign n0470 = ( n0205 ) ? ( n0007 ) : ( n0469 );
assign n0471 = ( n0203 ) ? ( n0050 ) : ( n0470 );
assign n0472 = ( n0201 ) ? ( n0039 ) : ( n0471 );
assign n0473 = ( n0199 ) ? ( n0035 ) : ( n0472 );
assign n0474 = ( n0197 ) ? ( n0031 ) : ( n0473 );
assign n0475 = ( n0195 ) ? ( n0027 ) : ( n0474 );
assign n0476 = ( n0193 ) ? ( n0023 ) : ( n0475 );
assign n0477 = ( n0191 ) ? ( n0019 ) : ( n0476 );
assign n0478 = ( n0189 ) ? ( n0011 ) : ( n0477 );
assign n0479 = ( n0187 ) ? ( n0007 ) : ( n0478 );
assign n0480 = ( n0185 ) ? ( n0011 ) : ( n0479 );
assign n0481 = ( n0183 ) ? ( n0007 ) : ( n0480 );
assign n0482 = ( n0181 ) ? ( RD_ROM_1 ) : ( n0481 );
assign n0483 = ( n0179 ) ? ( RD_ROM_1 ) : ( n0482 );
assign n0484 = ( n0177 ) ? ( RD_ROM_1 ) : ( n0483 );
assign n0485 = ( n0175 ) ? ( n0039 ) : ( n0484 );
assign n0486 = ( n0173 ) ? ( n0035 ) : ( n0485 );
assign n0487 = ( n0171 ) ? ( n0031 ) : ( n0486 );
assign n0488 = ( n0169 ) ? ( n0027 ) : ( n0487 );
assign n0489 = ( n0167 ) ? ( n0023 ) : ( n0488 );
assign n0490 = ( n0165 ) ? ( n0019 ) : ( n0489 );
assign n0491 = ( n0163 ) ? ( n0011 ) : ( n0490 );
assign n0492 = ( n0161 ) ? ( n0007 ) : ( n0491 );
assign n0493 = ( n0159 ) ? ( n0011 ) : ( n0492 );
assign n0494 = ( n0157 ) ? ( n0007 ) : ( n0493 );
assign n0495 = ( n0155 ) ? ( RD_ROM_1 ) : ( n0494 );
assign n0496 = ( n0153 ) ? ( RD_ROM_1 ) : ( n0495 );
assign n0497 = ( n0151 ) ? ( RD_ROM_1 ) : ( n0496 );
assign n0498 = ( n0149 ) ? ( n0039 ) : ( n0497 );
assign n0499 = ( n0147 ) ? ( n0035 ) : ( n0498 );
assign n0500 = ( n0145 ) ? ( n0031 ) : ( n0499 );
assign n0501 = ( n0143 ) ? ( n0027 ) : ( n0500 );
assign n0502 = ( n0141 ) ? ( n0023 ) : ( n0501 );
assign n0503 = ( n0139 ) ? ( n0019 ) : ( n0502 );
assign n0504 = ( n0137 ) ? ( n0011 ) : ( n0503 );
assign n0505 = ( n0135 ) ? ( n0007 ) : ( n0504 );
assign n0506 = ( n0133 ) ? ( n0011 ) : ( n0505 );
assign n0507 = ( n0131 ) ? ( n0007 ) : ( n0506 );
assign n0508 = ( n0129 ) ? ( RD_ROM_1 ) : ( n0507 );
assign n0509 = ( n0127 ) ? ( RD_ROM_1 ) : ( n0508 );
assign n0510 = ( n0125 ) ? ( RD_ROM_1 ) : ( n0509 );
assign n0511 = ( n0123 ) ? ( n0039 ) : ( n0510 );
assign n0512 = ( n0121 ) ? ( n0035 ) : ( n0511 );
assign n0513 = ( n0119 ) ? ( n0031 ) : ( n0512 );
assign n0514 = ( n0117 ) ? ( n0027 ) : ( n0513 );
assign n0515 = ( n0115 ) ? ( n0023 ) : ( n0514 );
assign n0516 = ( n0113 ) ? ( n0019 ) : ( n0515 );
assign n0517 = ( n0111 ) ? ( n0011 ) : ( n0516 );
assign n0518 = ( n0109 ) ? ( n0007 ) : ( n0517 );
assign n0519 = ( n0107 ) ? ( n0011 ) : ( n0518 );
assign n0520 = ( n0105 ) ? ( n0007 ) : ( n0519 );
assign n0521 = ( n0103 ) ? ( RD_ROM_1 ) : ( n0520 );
assign n0522 = ( n0101 ) ? ( SP ) : ( n0521 );
assign n0523 = ( n0099 ) ? ( n0050 ) : ( n0522 );
assign n0524 = ( n0097 ) ? ( n0039 ) : ( n0523 );
assign n0525 = ( n0095 ) ? ( n0035 ) : ( n0524 );
assign n0526 = ( n0093 ) ? ( n0031 ) : ( n0525 );
assign n0527 = ( n0091 ) ? ( n0027 ) : ( n0526 );
assign n0528 = ( n0089 ) ? ( n0023 ) : ( n0527 );
assign n0529 = ( n0087 ) ? ( n0019 ) : ( n0528 );
assign n0530 = ( n0085 ) ? ( n0011 ) : ( n0529 );
assign n0531 = ( n0083 ) ? ( n0007 ) : ( n0530 );
assign n0532 = ( n0081 ) ? ( n0011 ) : ( n0531 );
assign n0533 = ( n0079 ) ? ( n0007 ) : ( n0532 );
assign n0534 = ( n0077 ) ? ( RD_ROM_1 ) : ( n0533 );
assign n0535 = ( n0075 ) ? ( SP ) : ( n0534 );
assign n0536 = ( n0073 ) ? ( n0050 ) : ( n0535 );
assign n0537 = ( n0072 ) ? ( n0039 ) : ( n0536 );
assign n0538 = ( n0070 ) ? ( n0035 ) : ( n0537 );
assign n0539 = ( n0068 ) ? ( n0031 ) : ( n0538 );
assign n0540 = ( n0066 ) ? ( n0027 ) : ( n0539 );
assign n0541 = ( n0064 ) ? ( n0023 ) : ( n0540 );
assign n0542 = ( n0062 ) ? ( n0019 ) : ( n0541 );
assign n0543 = ( n0060 ) ? ( n0011 ) : ( n0542 );
assign n0544 = ( n0058 ) ? ( n0007 ) : ( n0543 );
assign n0545 = ( n0056 ) ? ( n0011 ) : ( n0544 );
assign n0546 = ( n0054 ) ? ( n0007 ) : ( n0545 );
assign n0547 = ( n0052 ) ? ( RD_ROM_1 ) : ( n0546 );
assign n0548 = ( n0041 ) ? ( n0050 ) : ( n0547 );
assign n0549 = ( n0037 ) ? ( n0039 ) : ( n0548 );
assign n0550 = ( n0033 ) ? ( n0035 ) : ( n0549 );
assign n0551 = ( n0029 ) ? ( n0031 ) : ( n0550 );
assign n0552 = ( n0025 ) ? ( n0027 ) : ( n0551 );
assign n0553 = ( n0021 ) ? ( n0023 ) : ( n0552 );
assign n0554 = ( n0017 ) ? ( n0019 ) : ( n0553 );
assign n0555 = ( n0015 ) ? ( n0011 ) : ( n0554 );
assign n0556 = ( n0013 ) ? ( n0007 ) : ( n0555 );
assign n0557 = ( n0009 ) ? ( n0011 ) : ( n0556 );
assign n0558 = ( n0004 ) ? ( n0007 ) : ( n0557 );
assign n0559 = ( n0002 ) ? ( RD_ROM_1 ) : ( n0558 );
assign RD_IRAM_0_ADDR = n0559;
assign n0560 = n0559[3:0];
assign n0561 = IRAM[n0560];
assign RD_IRAM_0 = n0561;
// RD_IRAM_1_ADDR=(if (eq RD_ROM_0 (bv 6 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 7 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 22 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 23 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 34 8)) (sub SP (bv 1 8)) (if (eq RD_ROM_0 (bv 38 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 39 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 50 8)) (sub SP (bv 1 8)) (if (eq RD_ROM_0 (bv 54 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 55 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 70 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 71 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 86 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 87 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 102 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 103 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 134 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 135 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 150 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 151 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 166 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 167 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 182 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 183 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 198 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 199 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 214 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 215 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 230 8)) RD_IRAM_0 RD_IRAM_0)))))))))))))))))))))))))))))
assign n0562 = 8'h1;
assign n0563 = ( SP - n0562 );
assign n0564 = ( n0361 ) ? ( RD_IRAM_0 ) : ( RD_IRAM_0 );
assign n0565 = ( n0341 ) ? ( RD_IRAM_0 ) : ( n0564 );
assign n0566 = ( n0339 ) ? ( RD_IRAM_0 ) : ( n0565 );
assign n0567 = ( n0315 ) ? ( RD_IRAM_0 ) : ( n0566 );
assign n0568 = ( n0313 ) ? ( RD_IRAM_0 ) : ( n0567 );
assign n0569 = ( n0289 ) ? ( RD_IRAM_0 ) : ( n0568 );
assign n0570 = ( n0287 ) ? ( RD_IRAM_0 ) : ( n0569 );
assign n0571 = ( n0263 ) ? ( RD_ROM_1 ) : ( n0570 );
assign n0572 = ( n0261 ) ? ( RD_ROM_1 ) : ( n0571 );
assign n0573 = ( n0239 ) ? ( RD_IRAM_0 ) : ( n0572 );
assign n0574 = ( n0237 ) ? ( RD_IRAM_0 ) : ( n0573 );
assign n0575 = ( n0215 ) ? ( RD_IRAM_0 ) : ( n0574 );
assign n0576 = ( n0213 ) ? ( RD_IRAM_0 ) : ( n0575 );
assign n0577 = ( n0185 ) ? ( RD_IRAM_0 ) : ( n0576 );
assign n0578 = ( n0183 ) ? ( RD_IRAM_0 ) : ( n0577 );
assign n0579 = ( n0159 ) ? ( RD_IRAM_0 ) : ( n0578 );
assign n0580 = ( n0157 ) ? ( RD_IRAM_0 ) : ( n0579 );
assign n0581 = ( n0133 ) ? ( RD_IRAM_0 ) : ( n0580 );
assign n0582 = ( n0131 ) ? ( RD_IRAM_0 ) : ( n0581 );
assign n0583 = ( n0107 ) ? ( RD_IRAM_0 ) : ( n0582 );
assign n0584 = ( n0105 ) ? ( RD_IRAM_0 ) : ( n0583 );
assign n0585 = ( n0101 ) ? ( n0563 ) : ( n0584 );
assign n0586 = ( n0081 ) ? ( RD_IRAM_0 ) : ( n0585 );
assign n0587 = ( n0079 ) ? ( RD_IRAM_0 ) : ( n0586 );
assign n0588 = ( n0075 ) ? ( n0563 ) : ( n0587 );
assign n0589 = ( n0056 ) ? ( RD_IRAM_0 ) : ( n0588 );
assign n0590 = ( n0054 ) ? ( RD_IRAM_0 ) : ( n0589 );
assign n0591 = ( n0009 ) ? ( RD_IRAM_0 ) : ( n0590 );
assign n0592 = ( n0004 ) ? ( RD_IRAM_0 ) : ( n0591 );
assign RD_IRAM_1_ADDR = n0592;
assign n0593 = n0592[3:0];
assign n0594 = IRAM[n0593];
assign RD_IRAM_1 = n0594;
// RD_ROM_0_ADDR=PC
assign RD_ROM_0_ADDR = PC;
// RD_ROM_1_ADDR=(if (eq RD_ROM_0 (bv 1 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 2 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 5 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 16 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 17 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 18 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 21 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 32 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 33 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 36 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 37 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 48 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 49 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 52 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 53 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 64 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 65 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 66 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 67 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 68 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 69 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 80 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 81 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 82 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 83 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 84 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 85 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 96 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 97 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 98 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 99 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 100 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 101 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 112 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 113 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 114 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 116 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 117 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 118 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 119 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 120 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 121 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 122 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 123 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 124 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 125 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 126 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 127 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 128 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 129 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 130 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 131 16)) (add (zero-ext 8 ACC) (add PC (bv 1 16))) (if (eq RD_ROM_0 (bv 133 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 134 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 135 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 136 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 137 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 138 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 139 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 140 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 141 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 142 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 143 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 144 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 145 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 146 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 147 16)) (add (zero-ext 8 ACC) (concat DPH DPL)) (if (eq RD_ROM_0 (bv 148 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 149 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 160 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 161 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 162 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 166 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 167 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 168 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 169 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 170 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 171 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 172 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 173 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 174 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 175 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 176 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 177 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 178 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 180 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 181 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 182 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 183 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 184 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 185 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 186 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 187 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 188 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 189 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 190 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 191 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 192 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 193 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 194 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 197 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 208 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 209 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 210 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 213 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 216 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 217 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 218 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 219 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 220 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 221 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 222 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 223 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 225 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 229 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 241 16)) (add PC (bv 2 16)) (add PC (bv 1 16))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
assign n0595 = 16'h1;
assign n0596 = ( RD_ROM_0 == n0595 );
assign n0597 = 16'h2;
assign n0598 = ( PC + n0597 );
assign n0599 = ( RD_ROM_0 == n0597 );
assign n0600 = ( PC + n0595 );
assign n0601 = 16'h5;
assign n0602 = ( RD_ROM_0 == n0601 );
assign n0603 = 16'h10;
assign n0604 = ( RD_ROM_0 == n0603 );
assign n0605 = 16'h11;
assign n0606 = ( RD_ROM_0 == n0605 );
assign n0607 = 16'h12;
assign n0608 = ( RD_ROM_0 == n0607 );
assign n0609 = 16'h15;
assign n0610 = ( RD_ROM_0 == n0609 );
assign n0611 = 16'h20;
assign n0612 = ( RD_ROM_0 == n0611 );
assign n0613 = 16'h21;
assign n0614 = ( RD_ROM_0 == n0613 );
assign n0615 = 16'h24;
assign n0616 = ( RD_ROM_0 == n0615 );
assign n0617 = 16'h25;
assign n0618 = ( RD_ROM_0 == n0617 );
assign n0619 = 16'h30;
assign n0620 = ( RD_ROM_0 == n0619 );
assign n0621 = 16'h31;
assign n0622 = ( RD_ROM_0 == n0621 );
assign n0623 = 16'h34;
assign n0624 = ( RD_ROM_0 == n0623 );
assign n0625 = 16'h35;
assign n0626 = ( RD_ROM_0 == n0625 );
assign n0627 = 16'h40;
assign n0628 = ( RD_ROM_0 == n0627 );
assign n0629 = 16'h41;
assign n0630 = ( RD_ROM_0 == n0629 );
assign n0631 = 16'h42;
assign n0632 = ( RD_ROM_0 == n0631 );
assign n0633 = 16'h43;
assign n0634 = ( RD_ROM_0 == n0633 );
assign n0635 = 16'h44;
assign n0636 = ( RD_ROM_0 == n0635 );
assign n0637 = 16'h45;
assign n0638 = ( RD_ROM_0 == n0637 );
assign n0639 = 16'h50;
assign n0640 = ( RD_ROM_0 == n0639 );
assign n0641 = 16'h51;
assign n0642 = ( RD_ROM_0 == n0641 );
assign n0643 = 16'h52;
assign n0644 = ( RD_ROM_0 == n0643 );
assign n0645 = 16'h53;
assign n0646 = ( RD_ROM_0 == n0645 );
assign n0647 = 16'h54;
assign n0648 = ( RD_ROM_0 == n0647 );
assign n0649 = 16'h55;
assign n0650 = ( RD_ROM_0 == n0649 );
assign n0651 = 16'h60;
assign n0652 = ( RD_ROM_0 == n0651 );
assign n0653 = 16'h61;
assign n0654 = ( RD_ROM_0 == n0653 );
assign n0655 = 16'h62;
assign n0656 = ( RD_ROM_0 == n0655 );
assign n0657 = 16'h63;
assign n0658 = ( RD_ROM_0 == n0657 );
assign n0659 = 16'h64;
assign n0660 = ( RD_ROM_0 == n0659 );
assign n0661 = 16'h65;
assign n0662 = ( RD_ROM_0 == n0661 );
assign n0663 = 16'h70;
assign n0664 = ( RD_ROM_0 == n0663 );
assign n0665 = 16'h71;
assign n0666 = ( RD_ROM_0 == n0665 );
assign n0667 = 16'h72;
assign n0668 = ( RD_ROM_0 == n0667 );
assign n0669 = 16'h74;
assign n0670 = ( RD_ROM_0 == n0669 );
assign n0671 = 16'h75;
assign n0672 = ( RD_ROM_0 == n0671 );
assign n0673 = 16'h76;
assign n0674 = ( RD_ROM_0 == n0673 );
assign n0675 = 16'h77;
assign n0676 = ( RD_ROM_0 == n0675 );
assign n0677 = 16'h78;
assign n0678 = ( RD_ROM_0 == n0677 );
assign n0679 = 16'h79;
assign n0680 = ( RD_ROM_0 == n0679 );
assign n0681 = 16'h7a;
assign n0682 = ( RD_ROM_0 == n0681 );
assign n0683 = 16'h7b;
assign n0684 = ( RD_ROM_0 == n0683 );
assign n0685 = 16'h7c;
assign n0686 = ( RD_ROM_0 == n0685 );
assign n0687 = 16'h7d;
assign n0688 = ( RD_ROM_0 == n0687 );
assign n0689 = 16'h7e;
assign n0690 = ( RD_ROM_0 == n0689 );
assign n0691 = 16'h7f;
assign n0692 = ( RD_ROM_0 == n0691 );
assign n0693 = 16'h80;
assign n0694 = ( RD_ROM_0 == n0693 );
assign n0695 = 16'h81;
assign n0696 = ( RD_ROM_0 == n0695 );
assign n0697 = 16'h82;
assign n0698 = ( RD_ROM_0 == n0697 );
assign n0699 = 16'h83;
assign n0700 = ( RD_ROM_0 == n0699 );
assign n0701 = { 8'b0, ACC };
assign n0702 = ( n0701 + n0600 );
assign n0703 = 16'h85;
assign n0704 = ( RD_ROM_0 == n0703 );
assign n0705 = 16'h86;
assign n0706 = ( RD_ROM_0 == n0705 );
assign n0707 = 16'h87;
assign n0708 = ( RD_ROM_0 == n0707 );
assign n0709 = 16'h88;
assign n0710 = ( RD_ROM_0 == n0709 );
assign n0711 = 16'h89;
assign n0712 = ( RD_ROM_0 == n0711 );
assign n0713 = 16'h8a;
assign n0714 = ( RD_ROM_0 == n0713 );
assign n0715 = 16'h8b;
assign n0716 = ( RD_ROM_0 == n0715 );
assign n0717 = 16'h8c;
assign n0718 = ( RD_ROM_0 == n0717 );
assign n0719 = 16'h8d;
assign n0720 = ( RD_ROM_0 == n0719 );
assign n0721 = 16'h8e;
assign n0722 = ( RD_ROM_0 == n0721 );
assign n0723 = 16'h8f;
assign n0724 = ( RD_ROM_0 == n0723 );
assign n0725 = 16'h90;
assign n0726 = ( RD_ROM_0 == n0725 );
assign n0727 = 16'h91;
assign n0728 = ( RD_ROM_0 == n0727 );
assign n0729 = 16'h92;
assign n0730 = ( RD_ROM_0 == n0729 );
assign n0731 = 16'h93;
assign n0732 = ( RD_ROM_0 == n0731 );
assign n0733 = { ( DPH ), ( DPL ) };
assign n0734 = ( n0701 + n0733 );
assign n0735 = 16'h94;
assign n0736 = ( RD_ROM_0 == n0735 );
assign n0737 = 16'h95;
assign n0738 = ( RD_ROM_0 == n0737 );
assign n0739 = 16'ha0;
assign n0740 = ( RD_ROM_0 == n0739 );
assign n0741 = 16'ha1;
assign n0742 = ( RD_ROM_0 == n0741 );
assign n0743 = 16'ha2;
assign n0744 = ( RD_ROM_0 == n0743 );
assign n0745 = 16'ha6;
assign n0746 = ( RD_ROM_0 == n0745 );
assign n0747 = 16'ha7;
assign n0748 = ( RD_ROM_0 == n0747 );
assign n0749 = 16'ha8;
assign n0750 = ( RD_ROM_0 == n0749 );
assign n0751 = 16'ha9;
assign n0752 = ( RD_ROM_0 == n0751 );
assign n0753 = 16'haa;
assign n0754 = ( RD_ROM_0 == n0753 );
assign n0755 = 16'hab;
assign n0756 = ( RD_ROM_0 == n0755 );
assign n0757 = 16'hac;
assign n0758 = ( RD_ROM_0 == n0757 );
assign n0759 = 16'had;
assign n0760 = ( RD_ROM_0 == n0759 );
assign n0761 = 16'hae;
assign n0762 = ( RD_ROM_0 == n0761 );
assign n0763 = 16'haf;
assign n0764 = ( RD_ROM_0 == n0763 );
assign n0765 = 16'hb0;
assign n0766 = ( RD_ROM_0 == n0765 );
assign n0767 = 16'hb1;
assign n0768 = ( RD_ROM_0 == n0767 );
assign n0769 = 16'hb2;
assign n0770 = ( RD_ROM_0 == n0769 );
assign n0771 = 16'hb4;
assign n0772 = ( RD_ROM_0 == n0771 );
assign n0773 = 16'hb5;
assign n0774 = ( RD_ROM_0 == n0773 );
assign n0775 = 16'hb6;
assign n0776 = ( RD_ROM_0 == n0775 );
assign n0777 = 16'hb7;
assign n0778 = ( RD_ROM_0 == n0777 );
assign n0779 = 16'hb8;
assign n0780 = ( RD_ROM_0 == n0779 );
assign n0781 = 16'hb9;
assign n0782 = ( RD_ROM_0 == n0781 );
assign n0783 = 16'hba;
assign n0784 = ( RD_ROM_0 == n0783 );
assign n0785 = 16'hbb;
assign n0786 = ( RD_ROM_0 == n0785 );
assign n0787 = 16'hbc;
assign n0788 = ( RD_ROM_0 == n0787 );
assign n0789 = 16'hbd;
assign n0790 = ( RD_ROM_0 == n0789 );
assign n0791 = 16'hbe;
assign n0792 = ( RD_ROM_0 == n0791 );
assign n0793 = 16'hbf;
assign n0794 = ( RD_ROM_0 == n0793 );
assign n0795 = 16'hc0;
assign n0796 = ( RD_ROM_0 == n0795 );
assign n0797 = 16'hc1;
assign n0798 = ( RD_ROM_0 == n0797 );
assign n0799 = 16'hc2;
assign n0800 = ( RD_ROM_0 == n0799 );
assign n0801 = 16'hc5;
assign n0802 = ( RD_ROM_0 == n0801 );
assign n0803 = 16'hd0;
assign n0804 = ( RD_ROM_0 == n0803 );
assign n0805 = 16'hd1;
assign n0806 = ( RD_ROM_0 == n0805 );
assign n0807 = 16'hd2;
assign n0808 = ( RD_ROM_0 == n0807 );
assign n0809 = 16'hd5;
assign n0810 = ( RD_ROM_0 == n0809 );
assign n0811 = 16'hd8;
assign n0812 = ( RD_ROM_0 == n0811 );
assign n0813 = 16'hd9;
assign n0814 = ( RD_ROM_0 == n0813 );
assign n0815 = 16'hda;
assign n0816 = ( RD_ROM_0 == n0815 );
assign n0817 = 16'hdb;
assign n0818 = ( RD_ROM_0 == n0817 );
assign n0819 = 16'hdc;
assign n0820 = ( RD_ROM_0 == n0819 );
assign n0821 = 16'hdd;
assign n0822 = ( RD_ROM_0 == n0821 );
assign n0823 = 16'hde;
assign n0824 = ( RD_ROM_0 == n0823 );
assign n0825 = 16'hdf;
assign n0826 = ( RD_ROM_0 == n0825 );
assign n0827 = 16'he1;
assign n0828 = ( RD_ROM_0 == n0827 );
assign n0829 = 16'he5;
assign n0830 = ( RD_ROM_0 == n0829 );
assign n0831 = 16'hf1;
assign n0832 = ( RD_ROM_0 == n0831 );
assign n0833 = ( n0832 ) ? ( n0598 ) : ( n0600 );
assign n0834 = ( n0830 ) ? ( n0600 ) : ( n0833 );
assign n0835 = ( n0828 ) ? ( n0598 ) : ( n0834 );
assign n0836 = ( n0826 ) ? ( n0600 ) : ( n0835 );
assign n0837 = ( n0824 ) ? ( n0600 ) : ( n0836 );
assign n0838 = ( n0822 ) ? ( n0600 ) : ( n0837 );
assign n0839 = ( n0820 ) ? ( n0600 ) : ( n0838 );
assign n0840 = ( n0818 ) ? ( n0600 ) : ( n0839 );
assign n0841 = ( n0816 ) ? ( n0600 ) : ( n0840 );
assign n0842 = ( n0814 ) ? ( n0600 ) : ( n0841 );
assign n0843 = ( n0812 ) ? ( n0600 ) : ( n0842 );
assign n0844 = ( n0810 ) ? ( n0600 ) : ( n0843 );
assign n0845 = ( n0808 ) ? ( n0600 ) : ( n0844 );
assign n0846 = ( n0806 ) ? ( n0598 ) : ( n0845 );
assign n0847 = ( n0804 ) ? ( n0600 ) : ( n0846 );
assign n0848 = ( n0802 ) ? ( n0600 ) : ( n0847 );
assign n0849 = ( n0800 ) ? ( n0600 ) : ( n0848 );
assign n0850 = ( n0798 ) ? ( n0598 ) : ( n0849 );
assign n0851 = ( n0796 ) ? ( n0600 ) : ( n0850 );
assign n0852 = ( n0794 ) ? ( n0600 ) : ( n0851 );
assign n0853 = ( n0792 ) ? ( n0600 ) : ( n0852 );
assign n0854 = ( n0790 ) ? ( n0600 ) : ( n0853 );
assign n0855 = ( n0788 ) ? ( n0600 ) : ( n0854 );
assign n0856 = ( n0786 ) ? ( n0600 ) : ( n0855 );
assign n0857 = ( n0784 ) ? ( n0600 ) : ( n0856 );
assign n0858 = ( n0782 ) ? ( n0600 ) : ( n0857 );
assign n0859 = ( n0780 ) ? ( n0600 ) : ( n0858 );
assign n0860 = ( n0778 ) ? ( n0600 ) : ( n0859 );
assign n0861 = ( n0776 ) ? ( n0600 ) : ( n0860 );
assign n0862 = ( n0774 ) ? ( n0600 ) : ( n0861 );
assign n0863 = ( n0772 ) ? ( n0600 ) : ( n0862 );
assign n0864 = ( n0770 ) ? ( n0600 ) : ( n0863 );
assign n0865 = ( n0768 ) ? ( n0598 ) : ( n0864 );
assign n0866 = ( n0766 ) ? ( n0600 ) : ( n0865 );
assign n0867 = ( n0764 ) ? ( n0600 ) : ( n0866 );
assign n0868 = ( n0762 ) ? ( n0600 ) : ( n0867 );
assign n0869 = ( n0760 ) ? ( n0600 ) : ( n0868 );
assign n0870 = ( n0758 ) ? ( n0600 ) : ( n0869 );
assign n0871 = ( n0756 ) ? ( n0600 ) : ( n0870 );
assign n0872 = ( n0754 ) ? ( n0600 ) : ( n0871 );
assign n0873 = ( n0752 ) ? ( n0600 ) : ( n0872 );
assign n0874 = ( n0750 ) ? ( n0600 ) : ( n0873 );
assign n0875 = ( n0748 ) ? ( n0600 ) : ( n0874 );
assign n0876 = ( n0746 ) ? ( n0600 ) : ( n0875 );
assign n0877 = ( n0744 ) ? ( n0600 ) : ( n0876 );
assign n0878 = ( n0742 ) ? ( n0598 ) : ( n0877 );
assign n0879 = ( n0740 ) ? ( n0600 ) : ( n0878 );
assign n0880 = ( n0738 ) ? ( n0600 ) : ( n0879 );
assign n0881 = ( n0736 ) ? ( n0600 ) : ( n0880 );
assign n0882 = ( n0732 ) ? ( n0734 ) : ( n0881 );
assign n0883 = ( n0730 ) ? ( n0600 ) : ( n0882 );
assign n0884 = ( n0728 ) ? ( n0598 ) : ( n0883 );
assign n0885 = ( n0726 ) ? ( n0600 ) : ( n0884 );
assign n0886 = ( n0724 ) ? ( n0600 ) : ( n0885 );
assign n0887 = ( n0722 ) ? ( n0600 ) : ( n0886 );
assign n0888 = ( n0720 ) ? ( n0600 ) : ( n0887 );
assign n0889 = ( n0718 ) ? ( n0600 ) : ( n0888 );
assign n0890 = ( n0716 ) ? ( n0600 ) : ( n0889 );
assign n0891 = ( n0714 ) ? ( n0600 ) : ( n0890 );
assign n0892 = ( n0712 ) ? ( n0600 ) : ( n0891 );
assign n0893 = ( n0710 ) ? ( n0600 ) : ( n0892 );
assign n0894 = ( n0708 ) ? ( n0600 ) : ( n0893 );
assign n0895 = ( n0706 ) ? ( n0600 ) : ( n0894 );
assign n0896 = ( n0704 ) ? ( n0598 ) : ( n0895 );
assign n0897 = ( n0700 ) ? ( n0702 ) : ( n0896 );
assign n0898 = ( n0698 ) ? ( n0600 ) : ( n0897 );
assign n0899 = ( n0696 ) ? ( n0598 ) : ( n0898 );
assign n0900 = ( n0694 ) ? ( n0600 ) : ( n0899 );
assign n0901 = ( n0692 ) ? ( n0600 ) : ( n0900 );
assign n0902 = ( n0690 ) ? ( n0600 ) : ( n0901 );
assign n0903 = ( n0688 ) ? ( n0600 ) : ( n0902 );
assign n0904 = ( n0686 ) ? ( n0600 ) : ( n0903 );
assign n0905 = ( n0684 ) ? ( n0600 ) : ( n0904 );
assign n0906 = ( n0682 ) ? ( n0600 ) : ( n0905 );
assign n0907 = ( n0680 ) ? ( n0600 ) : ( n0906 );
assign n0908 = ( n0678 ) ? ( n0600 ) : ( n0907 );
assign n0909 = ( n0676 ) ? ( n0600 ) : ( n0908 );
assign n0910 = ( n0674 ) ? ( n0600 ) : ( n0909 );
assign n0911 = ( n0672 ) ? ( n0600 ) : ( n0910 );
assign n0912 = ( n0670 ) ? ( n0600 ) : ( n0911 );
assign n0913 = ( n0668 ) ? ( n0600 ) : ( n0912 );
assign n0914 = ( n0666 ) ? ( n0598 ) : ( n0913 );
assign n0915 = ( n0664 ) ? ( n0600 ) : ( n0914 );
assign n0916 = ( n0662 ) ? ( n0600 ) : ( n0915 );
assign n0917 = ( n0660 ) ? ( n0600 ) : ( n0916 );
assign n0918 = ( n0658 ) ? ( n0600 ) : ( n0917 );
assign n0919 = ( n0656 ) ? ( n0600 ) : ( n0918 );
assign n0920 = ( n0654 ) ? ( n0598 ) : ( n0919 );
assign n0921 = ( n0652 ) ? ( n0600 ) : ( n0920 );
assign n0922 = ( n0650 ) ? ( n0600 ) : ( n0921 );
assign n0923 = ( n0648 ) ? ( n0600 ) : ( n0922 );
assign n0924 = ( n0646 ) ? ( n0600 ) : ( n0923 );
assign n0925 = ( n0644 ) ? ( n0600 ) : ( n0924 );
assign n0926 = ( n0642 ) ? ( n0598 ) : ( n0925 );
assign n0927 = ( n0640 ) ? ( n0600 ) : ( n0926 );
assign n0928 = ( n0638 ) ? ( n0600 ) : ( n0927 );
assign n0929 = ( n0636 ) ? ( n0600 ) : ( n0928 );
assign n0930 = ( n0634 ) ? ( n0600 ) : ( n0929 );
assign n0931 = ( n0632 ) ? ( n0600 ) : ( n0930 );
assign n0932 = ( n0630 ) ? ( n0598 ) : ( n0931 );
assign n0933 = ( n0628 ) ? ( n0600 ) : ( n0932 );
assign n0934 = ( n0626 ) ? ( n0600 ) : ( n0933 );
assign n0935 = ( n0624 ) ? ( n0600 ) : ( n0934 );
assign n0936 = ( n0622 ) ? ( n0598 ) : ( n0935 );
assign n0937 = ( n0620 ) ? ( n0600 ) : ( n0936 );
assign n0938 = ( n0618 ) ? ( n0600 ) : ( n0937 );
assign n0939 = ( n0616 ) ? ( n0600 ) : ( n0938 );
assign n0940 = ( n0614 ) ? ( n0598 ) : ( n0939 );
assign n0941 = ( n0612 ) ? ( n0600 ) : ( n0940 );
assign n0942 = ( n0610 ) ? ( n0600 ) : ( n0941 );
assign n0943 = ( n0608 ) ? ( n0600 ) : ( n0942 );
assign n0944 = ( n0606 ) ? ( n0598 ) : ( n0943 );
assign n0945 = ( n0604 ) ? ( n0600 ) : ( n0944 );
assign n0946 = ( n0602 ) ? ( n0600 ) : ( n0945 );
assign n0947 = ( n0599 ) ? ( n0600 ) : ( n0946 );
assign n0948 = ( n0596 ) ? ( n0598 ) : ( n0947 );
assign RD_ROM_1_ADDR = n0948;
// RD_ROM_2_ADDR=(if (eq RD_ROM_0 (bv 1 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 2 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 16 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 17 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 18 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 32 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 33 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 48 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 49 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 65 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 67 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 81 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 83 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 97 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 99 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 113 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 117 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 129 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 133 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 144 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 145 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 161 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 177 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 180 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 181 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 182 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 183 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 184 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 185 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 186 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 187 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 188 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 189 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 190 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 191 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 193 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 209 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 213 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 225 16)) (add PC (bv 1 16)) (add PC (bv 1 16)))))))))))))))))))))))))))))))))))))))))
assign n0949 = ( n0828 ) ? ( n0600 ) : ( n0600 );
assign n0950 = ( n0810 ) ? ( n0598 ) : ( n0949 );
assign n0951 = ( n0806 ) ? ( n0600 ) : ( n0950 );
assign n0952 = ( n0798 ) ? ( n0600 ) : ( n0951 );
assign n0953 = ( n0794 ) ? ( n0598 ) : ( n0952 );
assign n0954 = ( n0792 ) ? ( n0598 ) : ( n0953 );
assign n0955 = ( n0790 ) ? ( n0598 ) : ( n0954 );
assign n0956 = ( n0788 ) ? ( n0598 ) : ( n0955 );
assign n0957 = ( n0786 ) ? ( n0598 ) : ( n0956 );
assign n0958 = ( n0784 ) ? ( n0598 ) : ( n0957 );
assign n0959 = ( n0782 ) ? ( n0598 ) : ( n0958 );
assign n0960 = ( n0780 ) ? ( n0598 ) : ( n0959 );
assign n0961 = ( n0778 ) ? ( n0598 ) : ( n0960 );
assign n0962 = ( n0776 ) ? ( n0598 ) : ( n0961 );
assign n0963 = ( n0774 ) ? ( n0598 ) : ( n0962 );
assign n0964 = ( n0772 ) ? ( n0598 ) : ( n0963 );
assign n0965 = ( n0768 ) ? ( n0600 ) : ( n0964 );
assign n0966 = ( n0742 ) ? ( n0600 ) : ( n0965 );
assign n0967 = ( n0728 ) ? ( n0600 ) : ( n0966 );
assign n0968 = ( n0726 ) ? ( n0598 ) : ( n0967 );
assign n0969 = ( n0704 ) ? ( n0600 ) : ( n0968 );
assign n0970 = ( n0696 ) ? ( n0600 ) : ( n0969 );
assign n0971 = ( n0672 ) ? ( n0598 ) : ( n0970 );
assign n0972 = ( n0666 ) ? ( n0600 ) : ( n0971 );
assign n0973 = ( n0658 ) ? ( n0598 ) : ( n0972 );
assign n0974 = ( n0654 ) ? ( n0600 ) : ( n0973 );
assign n0975 = ( n0646 ) ? ( n0598 ) : ( n0974 );
assign n0976 = ( n0642 ) ? ( n0600 ) : ( n0975 );
assign n0977 = ( n0634 ) ? ( n0598 ) : ( n0976 );
assign n0978 = ( n0630 ) ? ( n0600 ) : ( n0977 );
assign n0979 = ( n0622 ) ? ( n0600 ) : ( n0978 );
assign n0980 = ( n0620 ) ? ( n0598 ) : ( n0979 );
assign n0981 = ( n0614 ) ? ( n0600 ) : ( n0980 );
assign n0982 = ( n0612 ) ? ( n0598 ) : ( n0981 );
assign n0983 = ( n0608 ) ? ( n0598 ) : ( n0982 );
assign n0984 = ( n0606 ) ? ( n0600 ) : ( n0983 );
assign n0985 = ( n0604 ) ? ( n0598 ) : ( n0984 );
assign n0986 = ( n0599 ) ? ( n0598 ) : ( n0985 );
assign n0987 = ( n0596 ) ? ( n0600 ) : ( n0986 );
assign RD_ROM_2_ADDR = n0987;
// 
// PC_00
// 
assign PC_00 = n0600;
// 
// PC_01
// 
assign n0988 = n0598[15:11];
assign n0989 = { ( RD_ROM_1 ), ( RD_ROM_2 ), ( RD_ROM_0 ) };
assign n0990 = n0989[7:5];
assign n0991 = n0989[15:8];
assign n0992 = { ( n0988 ), ( n0990 ), ( n0991 ) };
assign PC_01 = n0992;
// 
// PC_02
// 
assign n0993 = { ( RD_ROM_1 ), ( RD_ROM_2 ) };
assign PC_02 = n0993;
// 
// ACC_03
// 
assign n0994 = { ACC[0], ACC[7:1] };
assign ACC_03 = n0994;
// 
// PC_03
// 
assign PC_03 = n0600;
// 
// ACC_04
// 
assign n0995 = ( ACC + n0562 );
assign ACC_04 = n0995;
// 
// PC_04
// 
assign PC_04 = n0600;
// 
// ACC_05
// 
assign n0996 = 8'he0;
assign n0997 = ( RD_ROM_1 == n0996 );
assign n0998 = 1'h0;
assign n0999 = ( n0042 == n0998 );
assign n1000 = 8'h80;
assign n1001 = ( RD_ROM_1 == n1000 );
assign n1002 = 8'h81;
assign n1003 = ( RD_ROM_1 == n1002 );
assign n1004 = ( RD_ROM_1 == n0208 );
assign n1005 = 8'h83;
assign n1006 = ( RD_ROM_1 == n1005 );
assign n1007 = ( RD_ROM_1 == n0214 );
assign n1008 = ( RD_ROM_1 == n0216 );
assign n1009 = ( RD_ROM_1 == n0218 );
assign n1010 = ( RD_ROM_1 == n0220 );
assign n1011 = ( RD_ROM_1 == n0224 );
assign n1012 = ( RD_ROM_1 == n0222 );
assign n1013 = ( RD_ROM_1 == n0226 );
assign n1014 = 8'h90;
assign n1015 = ( RD_ROM_1 == n1014 );
assign n1016 = ( RD_ROM_1 == n0240 );
assign n1017 = ( RD_ROM_1 == n0242 );
assign n1018 = ( RD_ROM_1 == n0256 );
assign n1019 = ( RD_ROM_1 == n0264 );
assign n1020 = ( RD_ROM_1 == n0280 );
assign n1021 = ( RD_ROM_1 == n0290 );
assign n1022 = ( RD_ROM_1 == n0332 );
assign n1023 = 8'hf0;
assign n1024 = ( RD_ROM_1 == n1023 );
assign n1025 = 8'h0;
assign n1026 = ( n1024 ) ? ( B ) : ( n1025 );
assign n1027 = ( n0997 ) ? ( ACC ) : ( n1026 );
assign n1028 = ( n1022 ) ? ( PSW ) : ( n1027 );
assign n1029 = ( n1021 ) ? ( IP ) : ( n1028 );
assign n1030 = ( n1020 ) ? ( P3 ) : ( n1029 );
assign n1031 = ( n1019 ) ? ( IE ) : ( n1030 );
assign n1032 = ( n1018 ) ? ( P2 ) : ( n1031 );
assign n1033 = ( n1017 ) ? ( SBUF ) : ( n1032 );
assign n1034 = ( n1016 ) ? ( SCON ) : ( n1033 );
assign n1035 = ( n1015 ) ? ( P1 ) : ( n1034 );
assign n1036 = ( n1013 ) ? ( TH1 ) : ( n1035 );
assign n1037 = ( n1012 ) ? ( TL1 ) : ( n1036 );
assign n1038 = ( n1011 ) ? ( TH0 ) : ( n1037 );
assign n1039 = ( n1010 ) ? ( TL0 ) : ( n1038 );
assign n1040 = ( n1009 ) ? ( TMOD ) : ( n1039 );
assign n1041 = ( n1008 ) ? ( TCON ) : ( n1040 );
assign n1042 = ( n1007 ) ? ( PCON ) : ( n1041 );
assign n1043 = ( n1006 ) ? ( DPH ) : ( n1042 );
assign n1044 = ( n1004 ) ? ( DPL ) : ( n1043 );
assign n1045 = ( n1003 ) ? ( SP ) : ( n1044 );
assign n1046 = ( n1001 ) ? ( P0 ) : ( n1045 );
assign n1047 = ( n0999 ) ? ( RD_IRAM_0 ) : ( n1046 );
assign n1048 = ( n1047 + n0562 );
assign n1049 = ( n0997 ) ? ( n1048 ) : ( ACC );
assign ACC_05 = n1049;
// 
// PCON_05
// 
assign n1050 = ( n1007 ) ? ( n1048 ) : ( PCON );
assign PCON_05 = n1050;
// 
// P1_05
// 
assign n1051 = ( n1015 ) ? ( n1048 ) : ( P1 );
assign P1_05 = n1051;
// 
// TMOD_05
// 
assign n1052 = ( n1009 ) ? ( n1048 ) : ( TMOD );
assign TMOD_05 = n1052;
// 
// DPL_05
// 
assign n1053 = ( n1004 ) ? ( n1048 ) : ( DPL );
assign DPL_05 = n1053;
// 
// DPH_05
// 
assign n1054 = ( n1006 ) ? ( n1048 ) : ( DPH );
assign DPH_05 = n1054;
// 
// TL1_05
// 
assign n1055 = ( n1012 ) ? ( n1048 ) : ( TL1 );
assign TL1_05 = n1055;
// 
// TL0_05
// 
assign n1056 = ( n1010 ) ? ( n1048 ) : ( TL0 );
assign TL0_05 = n1056;
// 
// TCON_05
// 
assign n1057 = ( n1008 ) ? ( n1048 ) : ( TCON );
assign TCON_05 = n1057;
// 
// TH1_05
// 
assign n1058 = ( n1013 ) ? ( n1048 ) : ( TH1 );
assign TH1_05 = n1058;
// 
// TH0_05
// 
assign n1059 = ( n1011 ) ? ( n1048 ) : ( TH0 );
assign TH0_05 = n1059;
// 
// PC_05
// 
assign PC_05 = n0598;
// 
// P2_05
// 
assign n1060 = ( n1018 ) ? ( n1048 ) : ( P2 );
assign P2_05 = n1060;
// 
// P3_05
// 
assign n1061 = ( n1020 ) ? ( n1048 ) : ( P3 );
assign P3_05 = n1061;
// 
// P0_05
// 
assign n1062 = ( n1001 ) ? ( n1048 ) : ( P0 );
assign P0_05 = n1062;
// 
// B_05
// 
assign n1063 = ( n1024 ) ? ( n1048 ) : ( B );
assign B_05 = n1063;
// 
// IRAM_05
// 
assign n1064 = RD_ROM_1[3:0];
// 
// IP_05
// 
assign n1065 = ( n1021 ) ? ( n1048 ) : ( IP );
assign IP_05 = n1065;
// 
// IE_05
// 
assign n1066 = ( n1019 ) ? ( n1048 ) : ( IE );
assign IE_05 = n1066;
// 
// SCON_05
// 
assign n1067 = ( n1016 ) ? ( n1048 ) : ( SCON );
assign SCON_05 = n1067;
// 
// SP_05
// 
assign n1068 = ( n1003 ) ? ( n1048 ) : ( SP );
assign SP_05 = n1068;
// 
// SBUF_05
// 
assign n1069 = ( n1017 ) ? ( n1048 ) : ( SBUF );
assign SBUF_05 = n1069;
// 
// PSW_05
// 
assign n1070 = ( n1022 ) ? ( n1048 ) : ( PSW );
assign PSW_05 = n1070;
// 
// PC_06
// 
assign PC_06 = n0600;
// 
// IRAM_06
// 
assign n1071 = RD_IRAM_0[3:0];
assign n1072 = ( RD_IRAM_1 + n0562 );
// 
// PC_07
// 
assign PC_07 = n0600;
// 
// IRAM_07
// 
// 
// PC_08
// 
assign PC_08 = n0600;
// 
// IRAM_08
// 
assign n1073 = n0007[3:0];
assign n1074 = ( RD_IRAM_0 + n0562 );
// 
// PC_09
// 
assign PC_09 = n0600;
// 
// IRAM_09
// 
assign n1075 = n0011[3:0];
// 
// PC_0a
// 
assign PC_0a = n0600;
// 
// IRAM_0a
// 
assign n1076 = n0019[3:0];
// 
// PC_0b
// 
assign PC_0b = n0600;
// 
// IRAM_0b
// 
assign n1077 = n0023[3:0];
// 
// PC_0c
// 
assign PC_0c = n0600;
// 
// IRAM_0c
// 
assign n1078 = n0027[3:0];
// 
// PC_0d
// 
assign PC_0d = n0600;
// 
// IRAM_0d
// 
assign n1079 = n0031[3:0];
// 
// PC_0e
// 
assign PC_0e = n0600;
// 
// IRAM_0e
// 
assign n1080 = n0035[3:0];
// 
// PC_0f
// 
assign PC_0f = n0600;
// 
// IRAM_0f
// 
assign n1081 = n0039[3:0];
// 
// ACC_10
// 
assign n1082 = ( n0050 == n0996 );
assign n1083 = RD_ROM_1[2:0];
assign n1084 = { 5'b0, n1083 };
assign n1085 = ( n0562 << n1084 );
assign n1086 = ~( n1085 );
assign n1087 = n0050[7:7];
assign n1088 = ( n1087 == n0998 );
assign n1089 = ( n0050 == n1000 );
assign n1090 = ( n0050 == n0216 );
assign n1091 = ( n0050 == n1014 );
assign n1092 = ( n0050 == n0240 );
assign n1093 = ( n0050 == n0256 );
assign n1094 = ( n0050 == n0264 );
assign n1095 = ( n0050 == n0280 );
assign n1096 = ( n0050 == n0290 );
assign n1097 = ( n0050 == n0332 );
assign n1098 = ( n0050 == n1023 );
assign n1099 = ( n1098 ) ? ( B ) : ( n1025 );
assign n1100 = ( n1082 ) ? ( ACC ) : ( n1099 );
assign n1101 = ( n1097 ) ? ( PSW ) : ( n1100 );
assign n1102 = ( n1096 ) ? ( IP ) : ( n1101 );
assign n1103 = ( n1095 ) ? ( P3 ) : ( n1102 );
assign n1104 = ( n1094 ) ? ( IE ) : ( n1103 );
assign n1105 = ( n1093 ) ? ( P2 ) : ( n1104 );
assign n1106 = ( n1092 ) ? ( SCON ) : ( n1105 );
assign n1107 = ( n1091 ) ? ( P1 ) : ( n1106 );
assign n1108 = ( n1090 ) ? ( TCON ) : ( n1107 );
assign n1109 = ( n1089 ) ? ( P0 ) : ( n1108 );
assign n1110 = ( n1088 ) ? ( RD_IRAM_0 ) : ( n1109 );
assign n1111 = ( n1086 & n1110 );
assign n1112 = { 7'b0, n0998 };
assign n1113 = ( n1112 << n1084 );
assign n1114 = ( n1111 | n1113 );
assign n1115 = ( n1082 ) ? ( n1114 ) : ( ACC );
assign ACC_10 = n1115;
// 
// P1_10
// 
assign n1116 = ( n1091 ) ? ( n1114 ) : ( P1 );
assign P1_10 = n1116;
// 
// IE_10
// 
assign n1117 = ( n1094 ) ? ( n1114 ) : ( IE );
assign IE_10 = n1117;
// 
// PC_10
// 
assign n1118 = n1110[n1083];
assign n1119 = ( n1118 == n0043 );
assign n1120 = 16'h3;
assign n1121 = ( PC + n1120 );
assign n1122 = { RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2 };
assign n1123 = ( n1121 + n1122 );
assign n1124 = ( n1119 ) ? ( n1123 ) : ( n1121 );
assign PC_10 = n1124;
// 
// P2_10
// 
assign n1125 = ( n1093 ) ? ( n1114 ) : ( P2 );
assign P2_10 = n1125;
// 
// P3_10
// 
assign n1126 = ( n1095 ) ? ( n1114 ) : ( P3 );
assign P3_10 = n1126;
// 
// P0_10
// 
assign n1127 = ( n1089 ) ? ( n1114 ) : ( P0 );
assign P0_10 = n1127;
// 
// B_10
// 
assign n1128 = ( n1098 ) ? ( n1114 ) : ( B );
assign B_10 = n1128;
// 
// IRAM_10
// 
assign n1129 = n0050[3:0];
// 
// IP_10
// 
assign n1130 = ( n1096 ) ? ( n1114 ) : ( IP );
assign IP_10 = n1130;
// 
// TCON_10
// 
assign n1131 = ( n1090 ) ? ( n1114 ) : ( TCON );
assign TCON_10 = n1131;
// 
// SCON_10
// 
assign n1132 = ( n1092 ) ? ( n1114 ) : ( SCON );
assign SCON_10 = n1132;
// 
// PSW_10
// 
assign n1133 = ( n1097 ) ? ( n1114 ) : ( PSW );
assign PSW_10 = n1133;
// 
// PC_11
// 
assign n1134 = n0989[3:1];
assign n1135 = { ( n0988 ), ( n1134 ), ( n0991 ) };
assign PC_11 = n1135;
// 
// IRAM_11
// 
assign n1136 = ( SP + n0562 );
assign n1137 = n1136[3:0];
assign n1138 = n0598[7:0];
assign n1139 = ( n1136 + n0562 );
assign n1140 = n1139[3:0];
assign n1141 = n0598[15:8];
// 
// SP_11
// 
assign n1142 = 8'h2;
assign n1143 = ( SP + n1142 );
assign SP_11 = n1143;
// 
// PC_12
// 
assign PC_12 = n0993;
// 
// IRAM_12
// 
assign n1144 = n1121[7:0];
assign n1145 = n1121[15:8];
// 
// SP_12
// 
assign SP_12 = n1143;
// 
// ACC_13
// 
assign n1146 = PSW[7:7];
assign n1147 = { ( ACC ), ( n1146 ) };
assign n1148 = { n1147[0], n1147[8:1] };
assign n1149 = n1148[8:1];
assign ACC_13 = n1149;
// 
// PC_13
// 
assign PC_13 = n0600;
// 
// PSW_13
// 
assign n1150 = ACC[0:0];
assign n1151 = PSW[6:6];
assign n1152 = PSW[5:3];
assign n1153 = PSW[2:2];
assign n1154 = PSW[1:0];
assign n1155 = { ( n1150 ), ( n1151 ), ( n1152 ), ( n1153 ), ( n1154 ) };
assign PSW_13 = n1155;
// 
// ACC_14
// 
assign n1156 = ( ACC - n0562 );
assign ACC_14 = n1156;
// 
// PC_14
// 
assign PC_14 = n0600;
// 
// ACC_15
// 
assign n1157 = ( n1047 - n0562 );
assign n1158 = ( n0997 ) ? ( n1157 ) : ( ACC );
assign ACC_15 = n1158;
// 
// PCON_15
// 
assign n1159 = ( n1007 ) ? ( n1157 ) : ( PCON );
assign PCON_15 = n1159;
// 
// P1_15
// 
assign n1160 = ( n1015 ) ? ( n1157 ) : ( P1 );
assign P1_15 = n1160;
// 
// TMOD_15
// 
assign n1161 = ( n1009 ) ? ( n1157 ) : ( TMOD );
assign TMOD_15 = n1161;
// 
// DPL_15
// 
assign n1162 = ( n1004 ) ? ( n1157 ) : ( DPL );
assign DPL_15 = n1162;
// 
// DPH_15
// 
assign n1163 = ( n1006 ) ? ( n1157 ) : ( DPH );
assign DPH_15 = n1163;
// 
// TL1_15
// 
assign n1164 = ( n1012 ) ? ( n1157 ) : ( TL1 );
assign TL1_15 = n1164;
// 
// TL0_15
// 
assign n1165 = ( n1010 ) ? ( n1157 ) : ( TL0 );
assign TL0_15 = n1165;
// 
// IE_15
// 
assign n1166 = ( n1019 ) ? ( n1157 ) : ( IE );
assign IE_15 = n1166;
// 
// TH1_15
// 
assign n1167 = ( n1013 ) ? ( n1157 ) : ( TH1 );
assign TH1_15 = n1167;
// 
// TH0_15
// 
assign n1168 = ( n1011 ) ? ( n1157 ) : ( TH0 );
assign TH0_15 = n1168;
// 
// PC_15
// 
assign PC_15 = n0598;
// 
// P2_15
// 
assign n1169 = ( n1018 ) ? ( n1157 ) : ( P2 );
assign P2_15 = n1169;
// 
// P3_15
// 
assign n1170 = ( n1020 ) ? ( n1157 ) : ( P3 );
assign P3_15 = n1170;
// 
// P0_15
// 
assign n1171 = ( n1001 ) ? ( n1157 ) : ( P0 );
assign P0_15 = n1171;
// 
// B_15
// 
assign n1172 = ( n1024 ) ? ( n1157 ) : ( B );
assign B_15 = n1172;
// 
// IRAM_15
// 
// 
// IP_15
// 
assign n1173 = ( n1021 ) ? ( n1157 ) : ( IP );
assign IP_15 = n1173;
// 
// TCON_15
// 
assign n1174 = ( n1008 ) ? ( n1157 ) : ( TCON );
assign TCON_15 = n1174;
// 
// SCON_15
// 
assign n1175 = ( n1016 ) ? ( n1157 ) : ( SCON );
assign SCON_15 = n1175;
// 
// SP_15
// 
assign n1176 = ( n1003 ) ? ( n1157 ) : ( SP );
assign SP_15 = n1176;
// 
// SBUF_15
// 
assign n1177 = ( n1017 ) ? ( n1157 ) : ( SBUF );
assign SBUF_15 = n1177;
// 
// PSW_15
// 
assign n1178 = ( n1022 ) ? ( n1157 ) : ( PSW );
assign PSW_15 = n1178;
// 
// PC_16
// 
assign PC_16 = n0600;
// 
// IRAM_16
// 
assign n1179 = ( RD_IRAM_1 - n0562 );
// 
// PC_17
// 
assign PC_17 = n0600;
// 
// IRAM_17
// 
// 
// PC_18
// 
assign PC_18 = n0600;
// 
// IRAM_18
// 
assign n1180 = ( RD_IRAM_0 - n0562 );
// 
// PC_19
// 
assign PC_19 = n0600;
// 
// IRAM_19
// 
// 
// PC_1a
// 
assign PC_1a = n0600;
// 
// IRAM_1a
// 
// 
// PC_1b
// 
assign PC_1b = n0600;
// 
// IRAM_1b
// 
// 
// PC_1c
// 
assign PC_1c = n0600;
// 
// IRAM_1c
// 
// 
// PC_1d
// 
assign PC_1d = n0600;
// 
// IRAM_1d
// 
// 
// PC_1e
// 
assign PC_1e = n0600;
// 
// IRAM_1e
// 
// 
// PC_1f
// 
assign PC_1f = n0600;
// 
// IRAM_1f
// 
// 
// PC_20
// 
assign PC_20 = n1124;
// 
// PC_21
// 
assign PC_21 = n0992;
// 
// PC_22
// 
assign n1181 = { ( RD_IRAM_0 ), ( RD_IRAM_1 ) };
assign PC_22 = n1181;
// 
// SP_22
// 
assign n1182 = ( SP - n1142 );
assign SP_22 = n1182;
// 
// ACC_23
// 
assign n1183 = { ACC[6:0], ACC[7] };
assign ACC_23 = n1183;
// 
// PC_23
// 
assign PC_23 = n0600;
// 
// ACC_24
// 
assign n1184 = ( ACC + RD_ROM_1 );
assign ACC_24 = n1184;
// 
// PC_24
// 
assign PC_24 = n0598;
// 
// PSW_24
// 
assign n1185 = { 1'b0, ACC };
assign n1186 = { 1'b0, RD_ROM_1 };
assign n1187 = { n0998[0], n0998[0], n0998[0], n0998[0], n0998[0], n0998[0], n0998[0], n0998[0], n0998 };
assign n1188 = ( n1186 + n1187 );
assign n1189 = ( n1185 + n1188 );
assign n1190 = n1189[8:8];
assign n1191 = ACC[3:0];
assign n1192 = { 1'b0, n1191 };
assign n1193 = { 1'b0, n1064 };
assign n1194 = { 4'b0, n0998 };
assign n1195 = ( n1193 + n1194 );
assign n1196 = ( n1192 + n1195 );
assign n1197 = n1196[4:4];
assign n1198 = { ACC[7], ACC };
assign n1199 = { RD_ROM_1[7], RD_ROM_1 };
assign n1200 = ( n1199 + n1187 );
assign n1201 = ( n1198 + n1200 );
assign n1202 = n1201[8:8];
assign n1203 = n1201[7:7];
assign n1204 = ( n1202 == n1203 );
assign n1205 = !( n1204 );
assign n1206 = ( n1205 ) ? ( n0043 ) : ( n0998 );
assign n1207 = { ( n1190 ), ( n1197 ), ( n1152 ), ( n1206 ), ( n1154 ) };
assign PSW_24 = n1207;
// 
// ACC_25
// 
assign n1208 = ( ACC + n1047 );
assign ACC_25 = n1208;
// 
// PC_25
// 
assign PC_25 = n0598;
// 
// PSW_25
// 
assign n1209 = { 1'b0, n1047 };
assign n1210 = ( n1209 + n1187 );
assign n1211 = ( n1185 + n1210 );
assign n1212 = n1211[8:8];
assign n1213 = n1047[3:0];
assign n1214 = { 1'b0, n1213 };
assign n1215 = { n0998[0], n0998[0], n0998[0], n0998[0], n0998 };
assign n1216 = ( n1214 + n1215 );
assign n1217 = ( n1192 + n1216 );
assign n1218 = n1217[4:4];
assign n1219 = { n1047[7], n1047 };
assign n1220 = ( n1219 + n1187 );
assign n1221 = ( n1198 + n1220 );
assign n1222 = n1221[8:8];
assign n1223 = n1221[7:7];
assign n1224 = ( n1222 == n1223 );
assign n1225 = !( n1224 );
assign n1226 = ( n1225 ) ? ( n0043 ) : ( n0998 );
assign n1227 = { ( n1212 ), ( n1218 ), ( n1152 ), ( n1226 ), ( n1154 ) };
assign PSW_25 = n1227;
// 
// ACC_26
// 
assign n1228 = ( ACC + RD_IRAM_1 );
assign ACC_26 = n1228;
// 
// PC_26
// 
assign PC_26 = n0600;
// 
// PSW_26
// 
assign n1229 = { 1'b0, RD_IRAM_1 };
assign n1230 = ( n1229 + n1187 );
assign n1231 = ( n1185 + n1230 );
assign n1232 = n1231[8:8];
assign n1233 = RD_IRAM_1[3:0];
assign n1234 = { 1'b0, n1233 };
assign n1235 = ( n1234 + n1215 );
assign n1236 = ( n1192 + n1235 );
assign n1237 = n1236[4:4];
assign n1238 = { RD_IRAM_1[7], RD_IRAM_1 };
assign n1239 = ( n1238 + n1187 );
assign n1240 = ( n1198 + n1239 );
assign n1241 = n1240[8:8];
assign n1242 = n1240[7:7];
assign n1243 = ( n1241 == n1242 );
assign n1244 = !( n1243 );
assign n1245 = ( n1244 ) ? ( n0043 ) : ( n0998 );
assign n1246 = { ( n1232 ), ( n1237 ), ( n1152 ), ( n1245 ), ( n1154 ) };
assign PSW_26 = n1246;
// 
// ACC_27
// 
assign ACC_27 = n1228;
// 
// PC_27
// 
assign PC_27 = n0600;
// 
// PSW_27
// 
assign n1247 = { 8'b0, n0998 };
assign n1248 = ( n1229 + n1247 );
assign n1249 = ( n1185 + n1248 );
assign n1250 = n1249[8:8];
assign n1251 = ( n1238 + n1247 );
assign n1252 = ( n1198 + n1251 );
assign n1253 = n1252[8:8];
assign n1254 = n1252[7:7];
assign n1255 = ( n1253 == n1254 );
assign n1256 = !( n1255 );
assign n1257 = ( n1256 ) ? ( n0043 ) : ( n0998 );
assign n1258 = { ( n1250 ), ( n1237 ), ( n1152 ), ( n1257 ), ( n1154 ) };
assign PSW_27 = n1258;
// 
// ACC_28
// 
assign n1259 = ( ACC + RD_IRAM_0 );
assign ACC_28 = n1259;
// 
// PC_28
// 
assign PC_28 = n0600;
// 
// PSW_28
// 
assign n1260 = { 1'b0, RD_IRAM_0 };
assign n1261 = ( n1260 + n1247 );
assign n1262 = ( n1185 + n1261 );
assign n1263 = n1262[8:8];
assign n1264 = { 1'b0, n1071 };
assign n1265 = ( n1264 + n1194 );
assign n1266 = ( n1192 + n1265 );
assign n1267 = n1266[4:4];
assign n1268 = { RD_IRAM_0[7], RD_IRAM_0 };
assign n1269 = ( n1268 + n1247 );
assign n1270 = ( n1198 + n1269 );
assign n1271 = n1270[8:8];
assign n1272 = n1270[7:7];
assign n1273 = ( n1271 == n1272 );
assign n1274 = !( n1273 );
assign n1275 = ( n1274 ) ? ( n0043 ) : ( n0998 );
assign n1276 = { ( n1263 ), ( n1267 ), ( n1152 ), ( n1275 ), ( n1154 ) };
assign PSW_28 = n1276;
// 
// ACC_29
// 
assign ACC_29 = n1259;
// 
// PC_29
// 
assign PC_29 = n0600;
// 
// PSW_29
// 
assign PSW_29 = n1276;
// 
// ACC_2a
// 
assign ACC_2a = n1259;
// 
// PC_2a
// 
assign PC_2a = n0600;
// 
// PSW_2a
// 
assign n1277 = ( n1264 + n1215 );
assign n1278 = ( n1192 + n1277 );
assign n1279 = n1278[4:4];
assign n1280 = { ( n1263 ), ( n1279 ), ( n1152 ), ( n1275 ), ( n1154 ) };
assign PSW_2a = n1280;
// 
// ACC_2b
// 
assign ACC_2b = n1259;
// 
// PC_2b
// 
assign PC_2b = n0600;
// 
// PSW_2b
// 
assign n1281 = ( n1260 + n1187 );
assign n1282 = ( n1185 + n1281 );
assign n1283 = n1282[8:8];
assign n1284 = ( n1268 + n1187 );
assign n1285 = ( n1198 + n1284 );
assign n1286 = n1285[8:8];
assign n1287 = n1285[7:7];
assign n1288 = ( n1286 == n1287 );
assign n1289 = !( n1288 );
assign n1290 = ( n1289 ) ? ( n0043 ) : ( n0998 );
assign n1291 = { ( n1283 ), ( n1279 ), ( n1152 ), ( n1290 ), ( n1154 ) };
assign PSW_2b = n1291;
// 
// ACC_2c
// 
assign ACC_2c = n1259;
// 
// PC_2c
// 
assign PC_2c = n0600;
// 
// PSW_2c
// 
assign PSW_2c = n1291;
// 
// ACC_2d
// 
assign ACC_2d = n1259;
// 
// PC_2d
// 
assign PC_2d = n0600;
// 
// PSW_2d
// 
assign PSW_2d = n1276;
// 
// ACC_2e
// 
assign ACC_2e = n1259;
// 
// PC_2e
// 
assign PC_2e = n0600;
// 
// PSW_2e
// 
assign n1292 = { ( n1283 ), ( n1267 ), ( n1152 ), ( n1290 ), ( n1154 ) };
assign PSW_2e = n1292;
// 
// ACC_2f
// 
assign ACC_2f = n1259;
// 
// PC_2f
// 
assign PC_2f = n0600;
// 
// PSW_2f
// 
assign PSW_2f = n1292;
// 
// PC_30
// 
assign n1293 = ( n1118 == n0998 );
assign n1294 = ( n1293 ) ? ( n1123 ) : ( n1121 );
assign PC_30 = n1294;
// 
// PC_31
// 
assign PC_31 = n0992;
// 
// IRAM_31
// 
// 
// SP_31
// 
assign SP_31 = n1143;
// 
// PC_32
// 
assign PC_32 = n1181;
// 
// SP_32
// 
assign SP_32 = n1182;
// 
// ACC_33
// 
assign n1295 = { ( n1146 ), ( ACC ) };
assign n1296 = { n1295[7:0], n1295[8] };
assign n1297 = n1296[7:0];
assign ACC_33 = n1297;
// 
// PC_33
// 
assign PC_33 = n0600;
// 
// PSW_33
// 
assign n1298 = ACC[7:7];
assign n1299 = { ( n1298 ), ( n1151 ), ( n1152 ), ( n1153 ), ( n1154 ) };
assign PSW_33 = n1299;
// 
// ACC_34
// 
assign n1300 = { 7'b0, n1146 };
assign n1301 = ( RD_ROM_1 + n1300 );
assign n1302 = ( ACC + n1301 );
assign ACC_34 = n1302;
// 
// PC_34
// 
assign PC_34 = n0598;
// 
// PSW_34
// 
assign n1303 = { 8'b0, n1146 };
assign n1304 = ( n1186 + n1303 );
assign n1305 = ( n1185 + n1304 );
assign n1306 = n1305[8:8];
assign n1307 = { 4'b0, n1146 };
assign n1308 = ( n1193 + n1307 );
assign n1309 = ( n1192 + n1308 );
assign n1310 = n1309[4:4];
assign n1311 = ( n1199 + n1303 );
assign n1312 = ( n1198 + n1311 );
assign n1313 = n1312[8:8];
assign n1314 = n1312[7:7];
assign n1315 = ( n1313 == n1314 );
assign n1316 = !( n1315 );
assign n1317 = ( n1316 ) ? ( n0043 ) : ( n0998 );
assign n1318 = { ( n1306 ), ( n1310 ), ( n1152 ), ( n1317 ), ( n1154 ) };
assign PSW_34 = n1318;
// 
// ACC_35
// 
assign n1319 = ( n1047 + n1300 );
assign n1320 = ( ACC + n1319 );
assign ACC_35 = n1320;
// 
// PC_35
// 
assign PC_35 = n0598;
// 
// PSW_35
// 
assign n1321 = ( n1209 + n1303 );
assign n1322 = ( n1185 + n1321 );
assign n1323 = n1322[8:8];
assign n1324 = ( n1214 + n1307 );
assign n1325 = ( n1192 + n1324 );
assign n1326 = n1325[4:4];
assign n1327 = ( n1219 + n1303 );
assign n1328 = ( n1198 + n1327 );
assign n1329 = n1328[8:8];
assign n1330 = n1328[7:7];
assign n1331 = ( n1329 == n1330 );
assign n1332 = !( n1331 );
assign n1333 = ( n1332 ) ? ( n0043 ) : ( n0998 );
assign n1334 = { ( n1323 ), ( n1326 ), ( n1152 ), ( n1333 ), ( n1154 ) };
assign PSW_35 = n1334;
// 
// ACC_36
// 
assign n1335 = ( RD_IRAM_1 + n1300 );
assign n1336 = ( ACC + n1335 );
assign ACC_36 = n1336;
// 
// PC_36
// 
assign PC_36 = n0600;
// 
// PSW_36
// 
assign n1337 = ( n1229 + n1303 );
assign n1338 = ( n1185 + n1337 );
assign n1339 = n1338[8:8];
assign n1340 = ( n1234 + n1307 );
assign n1341 = ( n1192 + n1340 );
assign n1342 = n1341[4:4];
assign n1343 = ( n1238 + n1303 );
assign n1344 = ( n1198 + n1343 );
assign n1345 = n1344[8:8];
assign n1346 = n1344[7:7];
assign n1347 = ( n1345 == n1346 );
assign n1348 = !( n1347 );
assign n1349 = ( n1348 ) ? ( n0043 ) : ( n0998 );
assign n1350 = { ( n1339 ), ( n1342 ), ( n1152 ), ( n1349 ), ( n1154 ) };
assign PSW_36 = n1350;
// 
// ACC_37
// 
assign ACC_37 = n1336;
// 
// PC_37
// 
assign PC_37 = n0600;
// 
// PSW_37
// 
assign PSW_37 = n1350;
// 
// ACC_38
// 
assign n1351 = ( RD_IRAM_0 + n1300 );
assign n1352 = ( ACC + n1351 );
assign ACC_38 = n1352;
// 
// PC_38
// 
assign PC_38 = n0600;
// 
// PSW_38
// 
assign n1353 = ( n1260 + n1303 );
assign n1354 = ( n1185 + n1353 );
assign n1355 = n1354[8:8];
assign n1356 = ( n1264 + n1307 );
assign n1357 = ( n1192 + n1356 );
assign n1358 = n1357[4:4];
assign n1359 = ( n1268 + n1303 );
assign n1360 = ( n1198 + n1359 );
assign n1361 = n1360[8:8];
assign n1362 = n1360[7:7];
assign n1363 = ( n1361 == n1362 );
assign n1364 = !( n1363 );
assign n1365 = ( n1364 ) ? ( n0043 ) : ( n0998 );
assign n1366 = { ( n1355 ), ( n1358 ), ( n1152 ), ( n1365 ), ( n1154 ) };
assign PSW_38 = n1366;
// 
// ACC_39
// 
assign ACC_39 = n1352;
// 
// PC_39
// 
assign PC_39 = n0600;
// 
// PSW_39
// 
assign PSW_39 = n1366;
// 
// ACC_3a
// 
assign ACC_3a = n1352;
// 
// PC_3a
// 
assign PC_3a = n0600;
// 
// PSW_3a
// 
assign PSW_3a = n1366;
// 
// ACC_3b
// 
assign ACC_3b = n1352;
// 
// PC_3b
// 
assign PC_3b = n0600;
// 
// PSW_3b
// 
assign PSW_3b = n1366;
// 
// ACC_3c
// 
assign ACC_3c = n1352;
// 
// PC_3c
// 
assign PC_3c = n0600;
// 
// PSW_3c
// 
assign PSW_3c = n1366;
// 
// ACC_3d
// 
assign ACC_3d = n1352;
// 
// PC_3d
// 
assign PC_3d = n0600;
// 
// PSW_3d
// 
assign PSW_3d = n1366;
// 
// ACC_3e
// 
assign ACC_3e = n1352;
// 
// PC_3e
// 
assign PC_3e = n0600;
// 
// PSW_3e
// 
assign PSW_3e = n1366;
// 
// ACC_3f
// 
assign ACC_3f = n1352;
// 
// PC_3f
// 
assign PC_3f = n0600;
// 
// PSW_3f
// 
assign PSW_3f = n1366;
// 
// PC_40
// 
assign n1367 = ( n1146 == n0043 );
assign n1368 = { RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1 };
assign n1369 = ( n0598 + n1368 );
assign n1370 = ( n1367 ) ? ( n1369 ) : ( n0598 );
assign PC_40 = n1370;
// 
// PC_41
// 
assign PC_41 = n0992;
// 
// PCON_42
// 
assign n1371 = ( n1047 | ACC );
assign n1372 = ( n1007 ) ? ( n1371 ) : ( PCON );
assign PCON_42 = n1372;
// 
// B_42
// 
assign n1373 = ( n1024 ) ? ( n1371 ) : ( B );
assign B_42 = n1373;
// 
// TMOD_42
// 
assign n1374 = ( n1009 ) ? ( n1371 ) : ( TMOD );
assign TMOD_42 = n1374;
// 
// DPL_42
// 
assign n1375 = ( n1004 ) ? ( n1371 ) : ( DPL );
assign DPL_42 = n1375;
// 
// DPH_42
// 
assign n1376 = ( n1006 ) ? ( n1371 ) : ( DPH );
assign DPH_42 = n1376;
// 
// TL1_42
// 
assign n1377 = ( n1012 ) ? ( n1371 ) : ( TL1 );
assign TL1_42 = n1377;
// 
// TL0_42
// 
assign n1378 = ( n1010 ) ? ( n1371 ) : ( TL0 );
assign TL0_42 = n1378;
// 
// IE_42
// 
assign n1379 = ( n1019 ) ? ( n1371 ) : ( IE );
assign IE_42 = n1379;
// 
// TH1_42
// 
assign n1380 = ( n1013 ) ? ( n1371 ) : ( TH1 );
assign TH1_42 = n1380;
// 
// TH0_42
// 
assign n1381 = ( n1011 ) ? ( n1371 ) : ( TH0 );
assign TH0_42 = n1381;
// 
// PC_42
// 
assign PC_42 = n0598;
// 
// P2_42
// 
assign n1382 = ( n1018 ) ? ( n1371 ) : ( P2 );
assign P2_42 = n1382;
// 
// P3_42
// 
assign n1383 = ( n1020 ) ? ( n1371 ) : ( P3 );
assign P3_42 = n1383;
// 
// P0_42
// 
assign n1384 = ( n1001 ) ? ( n1371 ) : ( P0 );
assign P0_42 = n1384;
// 
// P1_42
// 
assign n1385 = ( n1015 ) ? ( n1371 ) : ( P1 );
assign P1_42 = n1385;
// 
// IRAM_42
// 
// 
// IP_42
// 
assign n1386 = ( n1021 ) ? ( n1371 ) : ( IP );
assign IP_42 = n1386;
// 
// TCON_42
// 
assign n1387 = ( n1008 ) ? ( n1371 ) : ( TCON );
assign TCON_42 = n1387;
// 
// SCON_42
// 
assign n1388 = ( n1016 ) ? ( n1371 ) : ( SCON );
assign SCON_42 = n1388;
// 
// SP_42
// 
assign n1389 = ( n1003 ) ? ( n1371 ) : ( SP );
assign SP_42 = n1389;
// 
// SBUF_42
// 
assign n1390 = ( n1017 ) ? ( n1371 ) : ( SBUF );
assign SBUF_42 = n1390;
// 
// PSW_42
// 
assign n1391 = ( n1022 ) ? ( n1371 ) : ( PSW );
assign PSW_42 = n1391;
// 
// ACC_43
// 
assign n1392 = ( n1047 | RD_ROM_2 );
assign n1393 = ( n0997 ) ? ( n1392 ) : ( ACC );
assign ACC_43 = n1393;
// 
// PCON_43
// 
assign n1394 = ( n1007 ) ? ( n1392 ) : ( PCON );
assign PCON_43 = n1394;
// 
// B_43
// 
assign n1395 = ( n1024 ) ? ( n1392 ) : ( B );
assign B_43 = n1395;
// 
// TMOD_43
// 
assign n1396 = ( n1009 ) ? ( n1392 ) : ( TMOD );
assign TMOD_43 = n1396;
// 
// DPL_43
// 
assign n1397 = ( n1004 ) ? ( n1392 ) : ( DPL );
assign DPL_43 = n1397;
// 
// DPH_43
// 
assign n1398 = ( n1006 ) ? ( n1392 ) : ( DPH );
assign DPH_43 = n1398;
// 
// TL1_43
// 
assign n1399 = ( n1012 ) ? ( n1392 ) : ( TL1 );
assign TL1_43 = n1399;
// 
// TL0_43
// 
assign n1400 = ( n1010 ) ? ( n1392 ) : ( TL0 );
assign TL0_43 = n1400;
// 
// IE_43
// 
assign n1401 = ( n1019 ) ? ( n1392 ) : ( IE );
assign IE_43 = n1401;
// 
// TH1_43
// 
assign n1402 = ( n1013 ) ? ( n1392 ) : ( TH1 );
assign TH1_43 = n1402;
// 
// TH0_43
// 
assign n1403 = ( n1011 ) ? ( n1392 ) : ( TH0 );
assign TH0_43 = n1403;
// 
// PC_43
// 
assign PC_43 = n1121;
// 
// P2_43
// 
assign n1404 = ( n1018 ) ? ( n1392 ) : ( P2 );
assign P2_43 = n1404;
// 
// P3_43
// 
assign n1405 = ( n1020 ) ? ( n1392 ) : ( P3 );
assign P3_43 = n1405;
// 
// P0_43
// 
assign n1406 = ( n1001 ) ? ( n1392 ) : ( P0 );
assign P0_43 = n1406;
// 
// P1_43
// 
assign n1407 = ( n1015 ) ? ( n1392 ) : ( P1 );
assign P1_43 = n1407;
// 
// IRAM_43
// 
// 
// IP_43
// 
assign n1408 = ( n1021 ) ? ( n1392 ) : ( IP );
assign IP_43 = n1408;
// 
// TCON_43
// 
assign n1409 = ( n1008 ) ? ( n1392 ) : ( TCON );
assign TCON_43 = n1409;
// 
// SCON_43
// 
assign n1410 = ( n1016 ) ? ( n1392 ) : ( SCON );
assign SCON_43 = n1410;
// 
// SP_43
// 
assign n1411 = ( n1003 ) ? ( n1392 ) : ( SP );
assign SP_43 = n1411;
// 
// SBUF_43
// 
assign n1412 = ( n1017 ) ? ( n1392 ) : ( SBUF );
assign SBUF_43 = n1412;
// 
// PSW_43
// 
assign n1413 = ( n1022 ) ? ( n1392 ) : ( PSW );
assign PSW_43 = n1413;
// 
// ACC_44
// 
assign n1414 = ( ACC | RD_ROM_1 );
assign ACC_44 = n1414;
// 
// PC_44
// 
assign PC_44 = n0598;
// 
// ACC_45
// 
assign n1415 = ( ACC | n1047 );
assign ACC_45 = n1415;
// 
// PC_45
// 
assign PC_45 = n0598;
// 
// ACC_46
// 
assign n1416 = ( ACC | RD_IRAM_1 );
assign ACC_46 = n1416;
// 
// PC_46
// 
assign PC_46 = n0600;
// 
// ACC_47
// 
assign ACC_47 = n1416;
// 
// PC_47
// 
assign PC_47 = n0600;
// 
// ACC_48
// 
assign n1417 = ( ACC | RD_IRAM_0 );
assign ACC_48 = n1417;
// 
// PC_48
// 
assign PC_48 = n0600;
// 
// ACC_49
// 
assign ACC_49 = n1417;
// 
// PC_49
// 
assign PC_49 = n0600;
// 
// ACC_4a
// 
assign ACC_4a = n1417;
// 
// PC_4a
// 
assign PC_4a = n0600;
// 
// ACC_4b
// 
assign ACC_4b = n1417;
// 
// PC_4b
// 
assign PC_4b = n0600;
// 
// ACC_4c
// 
assign ACC_4c = n1417;
// 
// PC_4c
// 
assign PC_4c = n0600;
// 
// ACC_4d
// 
assign ACC_4d = n1417;
// 
// PC_4d
// 
assign PC_4d = n0600;
// 
// ACC_4e
// 
assign ACC_4e = n1417;
// 
// PC_4e
// 
assign PC_4e = n0600;
// 
// ACC_4f
// 
assign ACC_4f = n1417;
// 
// PC_4f
// 
assign PC_4f = n0600;
// 
// PC_50
// 
assign n1418 = ( n1146 == n0998 );
assign n1419 = ( n1418 ) ? ( n1369 ) : ( n0598 );
assign PC_50 = n1419;
// 
// PC_51
// 
assign PC_51 = n0992;
// 
// IRAM_51
// 
// 
// SP_51
// 
assign SP_51 = n1143;
// 
// PCON_52
// 
assign n1420 = ( n1047 & ACC );
assign n1421 = ( n1007 ) ? ( n1420 ) : ( PCON );
assign PCON_52 = n1421;
// 
// B_52
// 
assign n1422 = ( n1024 ) ? ( n1420 ) : ( B );
assign B_52 = n1422;
// 
// TMOD_52
// 
assign n1423 = ( n1009 ) ? ( n1420 ) : ( TMOD );
assign TMOD_52 = n1423;
// 
// DPL_52
// 
assign n1424 = ( n1004 ) ? ( n1420 ) : ( DPL );
assign DPL_52 = n1424;
// 
// DPH_52
// 
assign n1425 = ( n1006 ) ? ( n1420 ) : ( DPH );
assign DPH_52 = n1425;
// 
// TL1_52
// 
assign n1426 = ( n1012 ) ? ( n1420 ) : ( TL1 );
assign TL1_52 = n1426;
// 
// TL0_52
// 
assign n1427 = ( n1010 ) ? ( n1420 ) : ( TL0 );
assign TL0_52 = n1427;
// 
// TCON_52
// 
assign n1428 = ( n1008 ) ? ( n1420 ) : ( TCON );
assign TCON_52 = n1428;
// 
// TH1_52
// 
assign n1429 = ( n1013 ) ? ( n1420 ) : ( TH1 );
assign TH1_52 = n1429;
// 
// TH0_52
// 
assign n1430 = ( n1011 ) ? ( n1420 ) : ( TH0 );
assign TH0_52 = n1430;
// 
// PC_52
// 
assign PC_52 = n0598;
// 
// P2_52
// 
assign n1431 = ( n1018 ) ? ( n1420 ) : ( P2 );
assign P2_52 = n1431;
// 
// P3_52
// 
assign n1432 = ( n1020 ) ? ( n1420 ) : ( P3 );
assign P3_52 = n1432;
// 
// P0_52
// 
assign n1433 = ( n1001 ) ? ( n1420 ) : ( P0 );
assign P0_52 = n1433;
// 
// P1_52
// 
assign n1434 = ( n1015 ) ? ( n1420 ) : ( P1 );
assign P1_52 = n1434;
// 
// IRAM_52
// 
// 
// IP_52
// 
assign n1435 = ( n1021 ) ? ( n1420 ) : ( IP );
assign IP_52 = n1435;
// 
// IE_52
// 
assign n1436 = ( n1019 ) ? ( n1420 ) : ( IE );
assign IE_52 = n1436;
// 
// SCON_52
// 
assign n1437 = ( n1016 ) ? ( n1420 ) : ( SCON );
assign SCON_52 = n1437;
// 
// SP_52
// 
assign n1438 = ( n1003 ) ? ( n1420 ) : ( SP );
assign SP_52 = n1438;
// 
// SBUF_52
// 
assign n1439 = ( n1017 ) ? ( n1420 ) : ( SBUF );
assign SBUF_52 = n1439;
// 
// PSW_52
// 
assign n1440 = ( n1022 ) ? ( n1420 ) : ( PSW );
assign PSW_52 = n1440;
// 
// ACC_53
// 
assign n1441 = ( n1047 & RD_ROM_2 );
assign n1442 = ( n0997 ) ? ( n1441 ) : ( ACC );
assign ACC_53 = n1442;
// 
// PCON_53
// 
assign n1443 = ( n1007 ) ? ( n1441 ) : ( PCON );
assign PCON_53 = n1443;
// 
// B_53
// 
assign n1444 = ( n1024 ) ? ( n1441 ) : ( B );
assign B_53 = n1444;
// 
// TMOD_53
// 
assign n1445 = ( n1009 ) ? ( n1441 ) : ( TMOD );
assign TMOD_53 = n1445;
// 
// DPL_53
// 
assign n1446 = ( n1004 ) ? ( n1441 ) : ( DPL );
assign DPL_53 = n1446;
// 
// DPH_53
// 
assign n1447 = ( n1006 ) ? ( n1441 ) : ( DPH );
assign DPH_53 = n1447;
// 
// TL1_53
// 
assign n1448 = ( n1012 ) ? ( n1441 ) : ( TL1 );
assign TL1_53 = n1448;
// 
// TL0_53
// 
assign n1449 = ( n1010 ) ? ( n1441 ) : ( TL0 );
assign TL0_53 = n1449;
// 
// IE_53
// 
assign n1450 = ( n1019 ) ? ( n1441 ) : ( IE );
assign IE_53 = n1450;
// 
// TH1_53
// 
assign n1451 = ( n1013 ) ? ( n1441 ) : ( TH1 );
assign TH1_53 = n1451;
// 
// TH0_53
// 
assign n1452 = ( n1011 ) ? ( n1441 ) : ( TH0 );
assign TH0_53 = n1452;
// 
// PC_53
// 
assign PC_53 = n1121;
// 
// P2_53
// 
assign n1453 = ( n1018 ) ? ( n1441 ) : ( P2 );
assign P2_53 = n1453;
// 
// P3_53
// 
assign n1454 = ( n1020 ) ? ( n1441 ) : ( P3 );
assign P3_53 = n1454;
// 
// P0_53
// 
assign n1455 = ( n1001 ) ? ( n1441 ) : ( P0 );
assign P0_53 = n1455;
// 
// P1_53
// 
assign n1456 = ( n1015 ) ? ( n1441 ) : ( P1 );
assign P1_53 = n1456;
// 
// IRAM_53
// 
// 
// IP_53
// 
assign n1457 = ( n1021 ) ? ( n1441 ) : ( IP );
assign IP_53 = n1457;
// 
// TCON_53
// 
assign n1458 = ( n1008 ) ? ( n1441 ) : ( TCON );
assign TCON_53 = n1458;
// 
// SCON_53
// 
assign n1459 = ( n1016 ) ? ( n1441 ) : ( SCON );
assign SCON_53 = n1459;
// 
// SP_53
// 
assign n1460 = ( n1003 ) ? ( n1441 ) : ( SP );
assign SP_53 = n1460;
// 
// SBUF_53
// 
assign n1461 = ( n1017 ) ? ( n1441 ) : ( SBUF );
assign SBUF_53 = n1461;
// 
// PSW_53
// 
assign n1462 = ( n1022 ) ? ( n1441 ) : ( PSW );
assign PSW_53 = n1462;
// 
// ACC_54
// 
assign n1463 = ( ACC & RD_ROM_1 );
assign ACC_54 = n1463;
// 
// PC_54
// 
assign PC_54 = n0598;
// 
// ACC_55
// 
assign n1464 = ( ACC & n1047 );
assign ACC_55 = n1464;
// 
// PC_55
// 
assign PC_55 = n0598;
// 
// ACC_56
// 
assign n1465 = ( ACC & RD_IRAM_1 );
assign ACC_56 = n1465;
// 
// PC_56
// 
assign PC_56 = n0600;
// 
// ACC_57
// 
assign ACC_57 = n1465;
// 
// PC_57
// 
assign PC_57 = n0600;
// 
// ACC_58
// 
assign n1466 = ( ACC & RD_IRAM_0 );
assign ACC_58 = n1466;
// 
// PC_58
// 
assign PC_58 = n0600;
// 
// ACC_59
// 
assign ACC_59 = n1466;
// 
// PC_59
// 
assign PC_59 = n0600;
// 
// ACC_5a
// 
assign ACC_5a = n1466;
// 
// PC_5a
// 
assign PC_5a = n0600;
// 
// ACC_5b
// 
assign ACC_5b = n1466;
// 
// PC_5b
// 
assign PC_5b = n0600;
// 
// ACC_5c
// 
assign ACC_5c = n1466;
// 
// PC_5c
// 
assign PC_5c = n0600;
// 
// ACC_5d
// 
assign ACC_5d = n1466;
// 
// PC_5d
// 
assign PC_5d = n0600;
// 
// ACC_5e
// 
assign ACC_5e = n1466;
// 
// PC_5e
// 
assign PC_5e = n0600;
// 
// ACC_5f
// 
assign ACC_5f = n1466;
// 
// PC_5f
// 
assign PC_5f = n0600;
// 
// PC_60
// 
assign n1467 = ( ACC == n1025 );
assign n1468 = ( n1467 ) ? ( n1369 ) : ( n0598 );
assign PC_60 = n1468;
// 
// PC_61
// 
assign PC_61 = n0992;
// 
// ACC_62
// 
assign n1469 = ( n1047 ^ n1047 );
assign n1470 = ( n0997 ) ? ( n1469 ) : ( ACC );
assign ACC_62 = n1470;
// 
// PCON_62
// 
assign n1471 = ( n1047 ^ ACC );
assign n1472 = ( n1007 ) ? ( n1471 ) : ( PCON );
assign PCON_62 = n1472;
// 
// P1_62
// 
assign n1473 = ( n1015 ) ? ( n1471 ) : ( P1 );
assign P1_62 = n1473;
// 
// TMOD_62
// 
assign n1474 = ( n1009 ) ? ( n1471 ) : ( TMOD );
assign TMOD_62 = n1474;
// 
// DPL_62
// 
assign n1475 = ( n1004 ) ? ( n1471 ) : ( DPL );
assign DPL_62 = n1475;
// 
// DPH_62
// 
assign n1476 = ( n1006 ) ? ( n1471 ) : ( DPH );
assign DPH_62 = n1476;
// 
// TL1_62
// 
assign n1477 = ( n1012 ) ? ( n1471 ) : ( TL1 );
assign TL1_62 = n1477;
// 
// TL0_62
// 
assign n1478 = ( n1010 ) ? ( n1471 ) : ( TL0 );
assign TL0_62 = n1478;
// 
// TCON_62
// 
assign n1479 = ( n1008 ) ? ( n1471 ) : ( TCON );
assign TCON_62 = n1479;
// 
// TH1_62
// 
assign n1480 = ( n1013 ) ? ( n1471 ) : ( TH1 );
assign TH1_62 = n1480;
// 
// TH0_62
// 
assign n1481 = ( n1011 ) ? ( n1471 ) : ( TH0 );
assign TH0_62 = n1481;
// 
// PC_62
// 
assign PC_62 = n0598;
// 
// P2_62
// 
assign n1482 = ( n1018 ) ? ( n1471 ) : ( P2 );
assign P2_62 = n1482;
// 
// P3_62
// 
assign n1483 = ( n1020 ) ? ( n1471 ) : ( P3 );
assign P3_62 = n1483;
// 
// P0_62
// 
assign n1484 = ( n1001 ) ? ( n1471 ) : ( P0 );
assign P0_62 = n1484;
// 
// B_62
// 
assign n1485 = ( n1024 ) ? ( n1471 ) : ( B );
assign B_62 = n1485;
// 
// IRAM_62
// 
// 
// IP_62
// 
assign n1486 = ( n1021 ) ? ( n1471 ) : ( IP );
assign IP_62 = n1486;
// 
// IE_62
// 
assign n1487 = ( n1019 ) ? ( n1471 ) : ( IE );
assign IE_62 = n1487;
// 
// SCON_62
// 
assign n1488 = ( n1016 ) ? ( n1471 ) : ( SCON );
assign SCON_62 = n1488;
// 
// SP_62
// 
assign n1489 = ( n1003 ) ? ( n1471 ) : ( SP );
assign SP_62 = n1489;
// 
// SBUF_62
// 
assign n1490 = ( n1017 ) ? ( n1471 ) : ( SBUF );
assign SBUF_62 = n1490;
// 
// PSW_62
// 
assign n1491 = ( n1022 ) ? ( n1471 ) : ( PSW );
assign PSW_62 = n1491;
// 
// ACC_63
// 
assign n1492 = ( n1047 ^ RD_ROM_2 );
assign n1493 = ( n0997 ) ? ( n1492 ) : ( ACC );
assign ACC_63 = n1493;
// 
// PCON_63
// 
assign n1494 = ( n1007 ) ? ( n1492 ) : ( PCON );
assign PCON_63 = n1494;
// 
// P1_63
// 
assign n1495 = ( n1015 ) ? ( n1492 ) : ( P1 );
assign P1_63 = n1495;
// 
// TMOD_63
// 
assign n1496 = ( n1009 ) ? ( n1492 ) : ( TMOD );
assign TMOD_63 = n1496;
// 
// DPL_63
// 
assign n1497 = ( n1004 ) ? ( n1492 ) : ( DPL );
assign DPL_63 = n1497;
// 
// DPH_63
// 
assign n1498 = ( n1006 ) ? ( n1492 ) : ( DPH );
assign DPH_63 = n1498;
// 
// TL1_63
// 
assign n1499 = ( n1012 ) ? ( n1492 ) : ( TL1 );
assign TL1_63 = n1499;
// 
// TL0_63
// 
assign n1500 = ( n1010 ) ? ( n1492 ) : ( TL0 );
assign TL0_63 = n1500;
// 
// IE_63
// 
assign n1501 = ( n1019 ) ? ( n1492 ) : ( IE );
assign IE_63 = n1501;
// 
// TH1_63
// 
assign n1502 = ( n1013 ) ? ( n1492 ) : ( TH1 );
assign TH1_63 = n1502;
// 
// TH0_63
// 
assign n1503 = ( n1011 ) ? ( n1492 ) : ( TH0 );
assign TH0_63 = n1503;
// 
// PC_63
// 
assign PC_63 = n1121;
// 
// P2_63
// 
assign n1504 = ( n1018 ) ? ( n1492 ) : ( P2 );
assign P2_63 = n1504;
// 
// P3_63
// 
assign n1505 = ( n1020 ) ? ( n1492 ) : ( P3 );
assign P3_63 = n1505;
// 
// P0_63
// 
assign n1506 = ( n1001 ) ? ( n1492 ) : ( P0 );
assign P0_63 = n1506;
// 
// B_63
// 
assign n1507 = ( n1024 ) ? ( n1492 ) : ( B );
assign B_63 = n1507;
// 
// IRAM_63
// 
// 
// IP_63
// 
assign n1508 = ( n1021 ) ? ( n1492 ) : ( IP );
assign IP_63 = n1508;
// 
// TCON_63
// 
assign n1509 = ( n1008 ) ? ( n1492 ) : ( TCON );
assign TCON_63 = n1509;
// 
// SCON_63
// 
assign n1510 = ( n1016 ) ? ( n1492 ) : ( SCON );
assign SCON_63 = n1510;
// 
// SP_63
// 
assign n1511 = ( n1003 ) ? ( n1492 ) : ( SP );
assign SP_63 = n1511;
// 
// SBUF_63
// 
assign n1512 = ( n1017 ) ? ( n1492 ) : ( SBUF );
assign SBUF_63 = n1512;
// 
// PSW_63
// 
assign n1513 = ( n1022 ) ? ( n1492 ) : ( PSW );
assign PSW_63 = n1513;
// 
// ACC_64
// 
assign n1514 = ( ACC ^ RD_ROM_1 );
assign ACC_64 = n1514;
// 
// PC_64
// 
assign PC_64 = n0598;
// 
// ACC_65
// 
assign n1515 = ( ACC ^ n1047 );
assign ACC_65 = n1515;
// 
// PC_65
// 
assign PC_65 = n0598;
// 
// ACC_66
// 
assign n1516 = ( ACC ^ RD_IRAM_1 );
assign ACC_66 = n1516;
// 
// PC_66
// 
assign PC_66 = n0600;
// 
// ACC_67
// 
assign ACC_67 = n1516;
// 
// PC_67
// 
assign PC_67 = n0600;
// 
// ACC_68
// 
assign n1517 = ( ACC ^ RD_IRAM_0 );
assign ACC_68 = n1517;
// 
// PC_68
// 
assign PC_68 = n0600;
// 
// ACC_69
// 
assign ACC_69 = n1517;
// 
// PC_69
// 
assign PC_69 = n0600;
// 
// ACC_6a
// 
assign ACC_6a = n1517;
// 
// PC_6a
// 
assign PC_6a = n0600;
// 
// ACC_6b
// 
assign ACC_6b = n1517;
// 
// PC_6b
// 
assign PC_6b = n0600;
// 
// ACC_6c
// 
assign ACC_6c = n1517;
// 
// PC_6c
// 
assign PC_6c = n0600;
// 
// ACC_6d
// 
assign ACC_6d = n1517;
// 
// PC_6d
// 
assign PC_6d = n0600;
// 
// ACC_6e
// 
assign ACC_6e = n1517;
// 
// PC_6e
// 
assign PC_6e = n0600;
// 
// ACC_6f
// 
assign ACC_6f = n1517;
// 
// PC_6f
// 
assign PC_6f = n0600;
// 
// PC_70
// 
assign n1518 = !( n1467 );
assign n1519 = ( n1518 ) ? ( n1369 ) : ( n0598 );
assign PC_70 = n1519;
// 
// PC_71
// 
assign PC_71 = n0992;
// 
// IRAM_71
// 
// 
// SP_71
// 
assign SP_71 = n1143;
// 
// PC_72
// 
assign PC_72 = n0598;
// 
// PSW_72
// 
assign n1520 = ( n1146 | n1118 );
assign n1521 = PSW[6:0];
assign n1522 = { ( n1520 ), ( n1521 ) };
assign PSW_72 = n1522;
// 
// PC_73
// 
assign n1523 = ( n0733 + n0701 );
assign PC_73 = n1523;
// 
// ACC_74
// 
assign ACC_74 = RD_ROM_1;
// 
// PC_74
// 
assign PC_74 = n0598;
// 
// ACC_75
// 
assign n1524 = ( n0997 ) ? ( RD_ROM_2 ) : ( ACC );
assign ACC_75 = n1524;
// 
// PCON_75
// 
assign n1525 = ( n1007 ) ? ( RD_ROM_2 ) : ( PCON );
assign PCON_75 = n1525;
// 
// B_75
// 
assign n1526 = ( n1024 ) ? ( RD_ROM_2 ) : ( B );
assign B_75 = n1526;
// 
// TMOD_75
// 
assign n1527 = ( n1009 ) ? ( RD_ROM_2 ) : ( TMOD );
assign TMOD_75 = n1527;
// 
// DPL_75
// 
assign n1528 = ( n1004 ) ? ( RD_ROM_2 ) : ( DPL );
assign DPL_75 = n1528;
// 
// DPH_75
// 
assign n1529 = ( n1006 ) ? ( RD_ROM_2 ) : ( DPH );
assign DPH_75 = n1529;
// 
// TL1_75
// 
assign n1530 = ( n1012 ) ? ( RD_ROM_2 ) : ( TL1 );
assign TL1_75 = n1530;
// 
// TL0_75
// 
assign n1531 = ( n1010 ) ? ( RD_ROM_2 ) : ( TL0 );
assign TL0_75 = n1531;
// 
// TCON_75
// 
assign n1532 = ( n1008 ) ? ( RD_ROM_2 ) : ( TCON );
assign TCON_75 = n1532;
// 
// TH1_75
// 
assign n1533 = ( n1013 ) ? ( RD_ROM_2 ) : ( TH1 );
assign TH1_75 = n1533;
// 
// TH0_75
// 
assign n1534 = ( n1011 ) ? ( RD_ROM_2 ) : ( TH0 );
assign TH0_75 = n1534;
// 
// PC_75
// 
assign PC_75 = n1121;
// 
// P2_75
// 
assign n1535 = ( n1018 ) ? ( RD_ROM_2 ) : ( P2 );
assign P2_75 = n1535;
// 
// P3_75
// 
assign n1536 = ( n1020 ) ? ( RD_ROM_2 ) : ( P3 );
assign P3_75 = n1536;
// 
// P0_75
// 
assign n1537 = ( n1001 ) ? ( RD_ROM_2 ) : ( P0 );
assign P0_75 = n1537;
// 
// P1_75
// 
assign n1538 = ( n1015 ) ? ( RD_ROM_2 ) : ( P1 );
assign P1_75 = n1538;
// 
// IRAM_75
// 
// 
// IP_75
// 
assign n1539 = ( n1021 ) ? ( RD_ROM_2 ) : ( IP );
assign IP_75 = n1539;
// 
// IE_75
// 
assign n1540 = ( n1019 ) ? ( RD_ROM_2 ) : ( IE );
assign IE_75 = n1540;
// 
// SCON_75
// 
assign n1541 = ( n1016 ) ? ( RD_ROM_2 ) : ( SCON );
assign SCON_75 = n1541;
// 
// SP_75
// 
assign n1542 = ( n1003 ) ? ( RD_ROM_2 ) : ( SP );
assign SP_75 = n1542;
// 
// SBUF_75
// 
assign n1543 = ( n1017 ) ? ( RD_ROM_2 ) : ( SBUF );
assign SBUF_75 = n1543;
// 
// PSW_75
// 
assign n1544 = ( n1022 ) ? ( RD_ROM_2 ) : ( PSW );
assign PSW_75 = n1544;
// 
// PC_76
// 
assign PC_76 = n0598;
// 
// IRAM_76
// 
// 
// PC_77
// 
assign PC_77 = n0598;
// 
// IRAM_77
// 
// 
// PC_78
// 
assign PC_78 = n0598;
// 
// IRAM_78
// 
// 
// PC_79
// 
assign PC_79 = n0598;
// 
// IRAM_79
// 
// 
// PC_7a
// 
assign PC_7a = n0598;
// 
// IRAM_7a
// 
// 
// PC_7b
// 
assign PC_7b = n0598;
// 
// IRAM_7b
// 
// 
// PC_7c
// 
assign PC_7c = n0598;
// 
// IRAM_7c
// 
// 
// PC_7d
// 
assign PC_7d = n0598;
// 
// IRAM_7d
// 
// 
// PC_7e
// 
assign PC_7e = n0598;
// 
// IRAM_7e
// 
// 
// PC_7f
// 
assign PC_7f = n0598;
// 
// IRAM_7f
// 
// 
// PC_80
// 
assign PC_80 = n1369;
// 
// PC_81
// 
assign PC_81 = n0992;
// 
// PC_82
// 
assign PC_82 = n0598;
// 
// PSW_82
// 
assign n1545 = ( n1146 & n1118 );
assign n1546 = { ( n1545 ), ( n1521 ) };
assign PSW_82 = n1546;
// 
// ACC_83
// 
assign ACC_83 = RD_ROM_1;
// 
// PC_83
// 
assign PC_83 = n0600;
// 
// ACC_84
// 
assign n1547 = ( B == n1025 );
assign n1548 = 8'hff;
assign n1549 = ( ACC / B );
assign n1550 = ( n1547 ) ? ( n1548 ) : ( n1549 );
assign ACC_84 = n1550;
// 
// B_84
// 
assign n1551 = ( ACC % B );
assign n1552 = ( n1547 ) ? ( ACC ) : ( n1551 );
assign B_84 = n1552;
// 
// PC_84
// 
assign PC_84 = n0600;
// 
// PSW_84
// 
assign n1553 = PSW[6:3];
assign n1554 = ( n1547 ) ? ( n0043 ) : ( n0998 );
assign n1555 = { ( n0998 ), ( n1553 ), ( n1554 ), ( n1154 ) };
assign PSW_84 = n1555;
// 
// ACC_85
// 
assign n1556 = RD_ROM_2[7:7];
assign n1557 = ( n1556 == n0998 );
assign n1558 = ( RD_ROM_2 == n1000 );
assign n1559 = ( RD_ROM_2 == n1002 );
assign n1560 = ( RD_ROM_2 == n0208 );
assign n1561 = ( RD_ROM_2 == n1005 );
assign n1562 = ( RD_ROM_2 == n0214 );
assign n1563 = ( RD_ROM_2 == n0216 );
assign n1564 = ( RD_ROM_2 == n0218 );
assign n1565 = ( RD_ROM_2 == n0220 );
assign n1566 = ( RD_ROM_2 == n0224 );
assign n1567 = ( RD_ROM_2 == n0222 );
assign n1568 = ( RD_ROM_2 == n0226 );
assign n1569 = ( RD_ROM_2 == n1014 );
assign n1570 = ( RD_ROM_2 == n0240 );
assign n1571 = ( RD_ROM_2 == n0242 );
assign n1572 = ( RD_ROM_2 == n0256 );
assign n1573 = ( RD_ROM_2 == n0264 );
assign n1574 = ( RD_ROM_2 == n0280 );
assign n1575 = ( RD_ROM_2 == n0290 );
assign n1576 = ( RD_ROM_2 == n0332 );
assign n1577 = ( RD_ROM_2 == n0996 );
assign n1578 = ( RD_ROM_2 == n1023 );
assign n1579 = ( n1578 ) ? ( B ) : ( n1025 );
assign n1580 = ( n1577 ) ? ( ACC ) : ( n1579 );
assign n1581 = ( n1576 ) ? ( PSW ) : ( n1580 );
assign n1582 = ( n1575 ) ? ( IP ) : ( n1581 );
assign n1583 = ( n1574 ) ? ( P3 ) : ( n1582 );
assign n1584 = ( n1573 ) ? ( IE ) : ( n1583 );
assign n1585 = ( n1572 ) ? ( P2 ) : ( n1584 );
assign n1586 = ( n1571 ) ? ( SBUF ) : ( n1585 );
assign n1587 = ( n1570 ) ? ( SCON ) : ( n1586 );
assign n1588 = ( n1569 ) ? ( P1 ) : ( n1587 );
assign n1589 = ( n1568 ) ? ( TH1 ) : ( n1588 );
assign n1590 = ( n1567 ) ? ( TL1 ) : ( n1589 );
assign n1591 = ( n1566 ) ? ( TH0 ) : ( n1590 );
assign n1592 = ( n1565 ) ? ( TL0 ) : ( n1591 );
assign n1593 = ( n1564 ) ? ( TMOD ) : ( n1592 );
assign n1594 = ( n1563 ) ? ( TCON ) : ( n1593 );
assign n1595 = ( n1562 ) ? ( PCON ) : ( n1594 );
assign n1596 = ( n1561 ) ? ( DPH ) : ( n1595 );
assign n1597 = ( n1560 ) ? ( DPL ) : ( n1596 );
assign n1598 = ( n1559 ) ? ( SP ) : ( n1597 );
assign n1599 = ( n1558 ) ? ( P0 ) : ( n1598 );
assign n1600 = ( n1557 ) ? ( RD_IRAM_0 ) : ( n1599 );
assign n1601 = ( n0997 ) ? ( n1600 ) : ( ACC );
assign ACC_85 = n1601;
// 
// PCON_85
// 
assign n1602 = ( n1007 ) ? ( n1600 ) : ( PCON );
assign PCON_85 = n1602;
// 
// B_85
// 
assign n1603 = ( n1024 ) ? ( n1600 ) : ( B );
assign B_85 = n1603;
// 
// TMOD_85
// 
assign n1604 = ( n1009 ) ? ( n1600 ) : ( TMOD );
assign TMOD_85 = n1604;
// 
// DPL_85
// 
assign n1605 = ( n1004 ) ? ( n1600 ) : ( DPL );
assign DPL_85 = n1605;
// 
// DPH_85
// 
assign n1606 = ( n1006 ) ? ( n1600 ) : ( DPH );
assign DPH_85 = n1606;
// 
// TL1_85
// 
assign n1607 = ( n1012 ) ? ( n1600 ) : ( TL1 );
assign TL1_85 = n1607;
// 
// TL0_85
// 
assign n1608 = ( n1010 ) ? ( n1600 ) : ( TL0 );
assign TL0_85 = n1608;
// 
// TCON_85
// 
assign n1609 = ( n1008 ) ? ( n1600 ) : ( TCON );
assign TCON_85 = n1609;
// 
// TH1_85
// 
assign n1610 = ( n1013 ) ? ( n1600 ) : ( TH1 );
assign TH1_85 = n1610;
// 
// TH0_85
// 
assign n1611 = ( n1011 ) ? ( n1600 ) : ( TH0 );
assign TH0_85 = n1611;
// 
// PC_85
// 
assign PC_85 = n1121;
// 
// P2_85
// 
assign n1612 = ( n1018 ) ? ( n1600 ) : ( P2 );
assign P2_85 = n1612;
// 
// P3_85
// 
assign n1613 = ( n1020 ) ? ( n1600 ) : ( P3 );
assign P3_85 = n1613;
// 
// P0_85
// 
assign n1614 = ( n1001 ) ? ( n1600 ) : ( P0 );
assign P0_85 = n1614;
// 
// P1_85
// 
assign n1615 = ( n1015 ) ? ( n1600 ) : ( P1 );
assign P1_85 = n1615;
// 
// IRAM_85
// 
// 
// IP_85
// 
assign n1616 = ( n1021 ) ? ( n1600 ) : ( IP );
assign IP_85 = n1616;
// 
// IE_85
// 
assign n1617 = ( n1019 ) ? ( n1600 ) : ( IE );
assign IE_85 = n1617;
// 
// SCON_85
// 
assign n1618 = ( n1016 ) ? ( n1600 ) : ( SCON );
assign SCON_85 = n1618;
// 
// SP_85
// 
assign n1619 = ( n1003 ) ? ( n1600 ) : ( SP );
assign SP_85 = n1619;
// 
// SBUF_85
// 
assign n1620 = ( n1017 ) ? ( n1600 ) : ( SBUF );
assign SBUF_85 = n1620;
// 
// PSW_85
// 
assign n1621 = ( n1022 ) ? ( n1600 ) : ( PSW );
assign PSW_85 = n1621;
// 
// ACC_86
// 
assign n1622 = ( n0997 ) ? ( RD_IRAM_1 ) : ( ACC );
assign ACC_86 = n1622;
// 
// PCON_86
// 
assign n1623 = ( n1007 ) ? ( RD_IRAM_1 ) : ( PCON );
assign PCON_86 = n1623;
// 
// P1_86
// 
assign n1624 = ( n1015 ) ? ( RD_IRAM_1 ) : ( P1 );
assign P1_86 = n1624;
// 
// TMOD_86
// 
assign n1625 = ( n1009 ) ? ( RD_IRAM_1 ) : ( TMOD );
assign TMOD_86 = n1625;
// 
// DPL_86
// 
assign n1626 = ( n1004 ) ? ( RD_IRAM_1 ) : ( DPL );
assign DPL_86 = n1626;
// 
// DPH_86
// 
assign n1627 = ( n1006 ) ? ( RD_IRAM_1 ) : ( DPH );
assign DPH_86 = n1627;
// 
// TL1_86
// 
assign n1628 = ( n1012 ) ? ( RD_IRAM_1 ) : ( TL1 );
assign TL1_86 = n1628;
// 
// TL0_86
// 
assign n1629 = ( n1010 ) ? ( RD_IRAM_1 ) : ( TL0 );
assign TL0_86 = n1629;
// 
// IE_86
// 
assign n1630 = ( n1019 ) ? ( RD_IRAM_1 ) : ( IE );
assign IE_86 = n1630;
// 
// TH1_86
// 
assign n1631 = ( n1013 ) ? ( RD_IRAM_1 ) : ( TH1 );
assign TH1_86 = n1631;
// 
// TH0_86
// 
assign n1632 = ( n1011 ) ? ( RD_IRAM_1 ) : ( TH0 );
assign TH0_86 = n1632;
// 
// PC_86
// 
assign PC_86 = n0598;
// 
// P2_86
// 
assign n1633 = ( n1018 ) ? ( RD_IRAM_1 ) : ( P2 );
assign P2_86 = n1633;
// 
// P3_86
// 
assign n1634 = ( n1020 ) ? ( RD_IRAM_1 ) : ( P3 );
assign P3_86 = n1634;
// 
// P0_86
// 
assign n1635 = ( n1001 ) ? ( RD_IRAM_1 ) : ( P0 );
assign P0_86 = n1635;
// 
// B_86
// 
assign n1636 = ( n1024 ) ? ( RD_IRAM_1 ) : ( B );
assign B_86 = n1636;
// 
// IRAM_86
// 
// 
// IP_86
// 
assign n1637 = ( n1021 ) ? ( RD_IRAM_1 ) : ( IP );
assign IP_86 = n1637;
// 
// TCON_86
// 
assign n1638 = ( n1008 ) ? ( RD_IRAM_1 ) : ( TCON );
assign TCON_86 = n1638;
// 
// SCON_86
// 
assign n1639 = ( n1016 ) ? ( RD_IRAM_1 ) : ( SCON );
assign SCON_86 = n1639;
// 
// SP_86
// 
assign n1640 = ( n1003 ) ? ( RD_IRAM_1 ) : ( SP );
assign SP_86 = n1640;
// 
// SBUF_86
// 
assign n1641 = ( n1017 ) ? ( RD_IRAM_1 ) : ( SBUF );
assign SBUF_86 = n1641;
// 
// PSW_86
// 
assign n1642 = ( n1022 ) ? ( RD_IRAM_1 ) : ( PSW );
assign PSW_86 = n1642;
// 
// ACC_87
// 
assign ACC_87 = n1622;
// 
// PCON_87
// 
assign PCON_87 = n1623;
// 
// B_87
// 
assign B_87 = n1636;
// 
// TMOD_87
// 
assign TMOD_87 = n1625;
// 
// DPL_87
// 
assign DPL_87 = n1626;
// 
// DPH_87
// 
assign DPH_87 = n1627;
// 
// TL1_87
// 
assign TL1_87 = n1628;
// 
// TL0_87
// 
assign TL0_87 = n1629;
// 
// IE_87
// 
assign IE_87 = n1630;
// 
// TH1_87
// 
assign TH1_87 = n1631;
// 
// TH0_87
// 
assign TH0_87 = n1632;
// 
// PC_87
// 
assign PC_87 = n0598;
// 
// P2_87
// 
assign P2_87 = n1633;
// 
// P3_87
// 
assign P3_87 = n1634;
// 
// P0_87
// 
assign P0_87 = n1635;
// 
// P1_87
// 
assign P1_87 = n1624;
// 
// IRAM_87
// 
// 
// IP_87
// 
assign IP_87 = n1637;
// 
// TCON_87
// 
assign TCON_87 = n1638;
// 
// SCON_87
// 
assign SCON_87 = n1639;
// 
// SP_87
// 
assign SP_87 = n1640;
// 
// SBUF_87
// 
assign SBUF_87 = n1641;
// 
// PSW_87
// 
assign PSW_87 = n1642;
// 
// ACC_88
// 
assign n1643 = ( n0997 ) ? ( RD_IRAM_0 ) : ( ACC );
assign ACC_88 = n1643;
// 
// PCON_88
// 
assign n1644 = ( n1007 ) ? ( RD_IRAM_0 ) : ( PCON );
assign PCON_88 = n1644;
// 
// B_88
// 
assign n1645 = ( n1024 ) ? ( RD_IRAM_0 ) : ( B );
assign B_88 = n1645;
// 
// TMOD_88
// 
assign n1646 = ( n1009 ) ? ( RD_IRAM_0 ) : ( TMOD );
assign TMOD_88 = n1646;
// 
// DPL_88
// 
assign n1647 = ( n1004 ) ? ( RD_IRAM_0 ) : ( DPL );
assign DPL_88 = n1647;
// 
// DPH_88
// 
assign n1648 = ( n1006 ) ? ( RD_IRAM_0 ) : ( DPH );
assign DPH_88 = n1648;
// 
// TL1_88
// 
assign n1649 = ( n1012 ) ? ( RD_IRAM_0 ) : ( TL1 );
assign TL1_88 = n1649;
// 
// TL0_88
// 
assign n1650 = ( n1010 ) ? ( RD_IRAM_0 ) : ( TL0 );
assign TL0_88 = n1650;
// 
// IE_88
// 
assign n1651 = ( n1019 ) ? ( RD_IRAM_0 ) : ( IE );
assign IE_88 = n1651;
// 
// TH1_88
// 
assign n1652 = ( n1013 ) ? ( RD_IRAM_0 ) : ( TH1 );
assign TH1_88 = n1652;
// 
// TH0_88
// 
assign n1653 = ( n1011 ) ? ( RD_IRAM_0 ) : ( TH0 );
assign TH0_88 = n1653;
// 
// PC_88
// 
assign PC_88 = n0598;
// 
// P2_88
// 
assign n1654 = ( n1018 ) ? ( RD_IRAM_0 ) : ( P2 );
assign P2_88 = n1654;
// 
// P3_88
// 
assign n1655 = ( n1020 ) ? ( RD_IRAM_0 ) : ( P3 );
assign P3_88 = n1655;
// 
// P0_88
// 
assign n1656 = ( n1001 ) ? ( RD_IRAM_0 ) : ( P0 );
assign P0_88 = n1656;
// 
// P1_88
// 
assign n1657 = ( n1015 ) ? ( RD_IRAM_0 ) : ( P1 );
assign P1_88 = n1657;
// 
// IRAM_88
// 
// 
// IP_88
// 
assign n1658 = ( n1021 ) ? ( RD_IRAM_0 ) : ( IP );
assign IP_88 = n1658;
// 
// TCON_88
// 
assign n1659 = ( n1008 ) ? ( RD_IRAM_0 ) : ( TCON );
assign TCON_88 = n1659;
// 
// SCON_88
// 
assign n1660 = ( n1016 ) ? ( RD_IRAM_0 ) : ( SCON );
assign SCON_88 = n1660;
// 
// SP_88
// 
assign n1661 = ( n1003 ) ? ( RD_IRAM_0 ) : ( SP );
assign SP_88 = n1661;
// 
// SBUF_88
// 
assign n1662 = ( n1017 ) ? ( RD_IRAM_0 ) : ( SBUF );
assign SBUF_88 = n1662;
// 
// PSW_88
// 
assign n1663 = ( n1022 ) ? ( RD_IRAM_0 ) : ( PSW );
assign PSW_88 = n1663;
// 
// ACC_89
// 
assign ACC_89 = n1643;
// 
// PCON_89
// 
assign PCON_89 = n1644;
// 
// B_89
// 
assign B_89 = n1645;
// 
// TMOD_89
// 
assign TMOD_89 = n1646;
// 
// DPL_89
// 
assign DPL_89 = n1647;
// 
// DPH_89
// 
assign DPH_89 = n1648;
// 
// TL1_89
// 
assign TL1_89 = n1649;
// 
// TL0_89
// 
assign TL0_89 = n1650;
// 
// IE_89
// 
assign IE_89 = n1651;
// 
// TH1_89
// 
assign TH1_89 = n1652;
// 
// TH0_89
// 
assign TH0_89 = n1653;
// 
// PC_89
// 
assign PC_89 = n0598;
// 
// P2_89
// 
assign P2_89 = n1654;
// 
// P3_89
// 
assign P3_89 = n1655;
// 
// P0_89
// 
assign P0_89 = n1656;
// 
// P1_89
// 
assign P1_89 = n1657;
// 
// IRAM_89
// 
// 
// IP_89
// 
assign IP_89 = n1658;
// 
// TCON_89
// 
assign TCON_89 = n1659;
// 
// SCON_89
// 
assign SCON_89 = n1660;
// 
// SP_89
// 
assign SP_89 = n1661;
// 
// SBUF_89
// 
assign SBUF_89 = n1662;
// 
// PSW_89
// 
assign PSW_89 = n1663;
// 
// ACC_8a
// 
assign ACC_8a = n1643;
// 
// PCON_8a
// 
assign PCON_8a = n1644;
// 
// P1_8a
// 
assign P1_8a = n1657;
// 
// TMOD_8a
// 
assign TMOD_8a = n1646;
// 
// DPL_8a
// 
assign DPL_8a = n1647;
// 
// DPH_8a
// 
assign DPH_8a = n1648;
// 
// TL1_8a
// 
assign TL1_8a = n1649;
// 
// TL0_8a
// 
assign TL0_8a = n1650;
// 
// TCON_8a
// 
assign TCON_8a = n1659;
// 
// TH1_8a
// 
assign TH1_8a = n1652;
// 
// TH0_8a
// 
assign TH0_8a = n1653;
// 
// PC_8a
// 
assign PC_8a = n0598;
// 
// P2_8a
// 
assign P2_8a = n1654;
// 
// P3_8a
// 
assign P3_8a = n1655;
// 
// P0_8a
// 
assign P0_8a = n1656;
// 
// B_8a
// 
assign B_8a = n1645;
// 
// IRAM_8a
// 
// 
// IP_8a
// 
assign IP_8a = n1658;
// 
// IE_8a
// 
assign IE_8a = n1651;
// 
// SCON_8a
// 
assign SCON_8a = n1660;
// 
// SP_8a
// 
assign SP_8a = n1661;
// 
// SBUF_8a
// 
assign SBUF_8a = n1662;
// 
// PSW_8a
// 
assign PSW_8a = n1663;
// 
// ACC_8b
// 
assign ACC_8b = n1643;
// 
// PCON_8b
// 
assign PCON_8b = n1644;
// 
// B_8b
// 
assign B_8b = n1645;
// 
// TMOD_8b
// 
assign TMOD_8b = n1646;
// 
// DPL_8b
// 
assign DPL_8b = n1647;
// 
// DPH_8b
// 
assign DPH_8b = n1648;
// 
// TL1_8b
// 
assign TL1_8b = n1649;
// 
// TL0_8b
// 
assign TL0_8b = n1650;
// 
// IE_8b
// 
assign IE_8b = n1651;
// 
// TH1_8b
// 
assign TH1_8b = n1652;
// 
// TH0_8b
// 
assign TH0_8b = n1653;
// 
// PC_8b
// 
assign PC_8b = n0598;
// 
// P2_8b
// 
assign P2_8b = n1654;
// 
// P3_8b
// 
assign P3_8b = n1655;
// 
// P0_8b
// 
assign P0_8b = n1656;
// 
// P1_8b
// 
assign P1_8b = n1657;
// 
// IRAM_8b
// 
// 
// IP_8b
// 
assign IP_8b = n1658;
// 
// TCON_8b
// 
assign TCON_8b = n1659;
// 
// SCON_8b
// 
assign SCON_8b = n1660;
// 
// SP_8b
// 
assign SP_8b = n1661;
// 
// SBUF_8b
// 
assign SBUF_8b = n1662;
// 
// PSW_8b
// 
assign PSW_8b = n1663;
// 
// ACC_8c
// 
assign ACC_8c = n1643;
// 
// PCON_8c
// 
assign PCON_8c = n1644;
// 
// P1_8c
// 
assign P1_8c = n1657;
// 
// TMOD_8c
// 
assign TMOD_8c = n1646;
// 
// DPL_8c
// 
assign DPL_8c = n1647;
// 
// DPH_8c
// 
assign DPH_8c = n1648;
// 
// TL1_8c
// 
assign TL1_8c = n1649;
// 
// TL0_8c
// 
assign TL0_8c = n1650;
// 
// IE_8c
// 
assign IE_8c = n1651;
// 
// TH1_8c
// 
assign TH1_8c = n1652;
// 
// TH0_8c
// 
assign TH0_8c = n1653;
// 
// PC_8c
// 
assign PC_8c = n0598;
// 
// P2_8c
// 
assign P2_8c = n1654;
// 
// P3_8c
// 
assign P3_8c = n1655;
// 
// P0_8c
// 
assign P0_8c = n1656;
// 
// B_8c
// 
assign B_8c = n1645;
// 
// IRAM_8c
// 
// 
// IP_8c
// 
assign IP_8c = n1658;
// 
// TCON_8c
// 
assign TCON_8c = n1659;
// 
// SCON_8c
// 
assign SCON_8c = n1660;
// 
// SP_8c
// 
assign SP_8c = n1661;
// 
// SBUF_8c
// 
assign SBUF_8c = n1662;
// 
// PSW_8c
// 
assign PSW_8c = n1663;
// 
// ACC_8d
// 
assign ACC_8d = n1643;
// 
// PCON_8d
// 
assign PCON_8d = n1644;
// 
// B_8d
// 
assign B_8d = n1645;
// 
// TMOD_8d
// 
assign TMOD_8d = n1646;
// 
// DPL_8d
// 
assign DPL_8d = n1647;
// 
// DPH_8d
// 
assign DPH_8d = n1648;
// 
// TL1_8d
// 
assign TL1_8d = n1649;
// 
// TL0_8d
// 
assign TL0_8d = n1650;
// 
// IE_8d
// 
assign IE_8d = n1651;
// 
// TH1_8d
// 
assign TH1_8d = n1652;
// 
// TH0_8d
// 
assign TH0_8d = n1653;
// 
// PC_8d
// 
assign PC_8d = n0598;
// 
// P2_8d
// 
assign P2_8d = n1654;
// 
// P3_8d
// 
assign P3_8d = n1655;
// 
// P0_8d
// 
assign P0_8d = n1656;
// 
// P1_8d
// 
assign P1_8d = n1657;
// 
// IRAM_8d
// 
// 
// IP_8d
// 
assign IP_8d = n1658;
// 
// TCON_8d
// 
assign TCON_8d = n1659;
// 
// SCON_8d
// 
assign SCON_8d = n1660;
// 
// SP_8d
// 
assign SP_8d = n1661;
// 
// SBUF_8d
// 
assign SBUF_8d = n1662;
// 
// PSW_8d
// 
assign PSW_8d = n1663;
// 
// ACC_8e
// 
assign ACC_8e = n1643;
// 
// PCON_8e
// 
assign PCON_8e = n1644;
// 
// B_8e
// 
assign B_8e = n1645;
// 
// TMOD_8e
// 
assign TMOD_8e = n1646;
// 
// DPL_8e
// 
assign DPL_8e = n1647;
// 
// DPH_8e
// 
assign DPH_8e = n1648;
// 
// TL1_8e
// 
assign TL1_8e = n1649;
// 
// TL0_8e
// 
assign TL0_8e = n1650;
// 
// IE_8e
// 
assign IE_8e = n1651;
// 
// TH1_8e
// 
assign TH1_8e = n1652;
// 
// TH0_8e
// 
assign TH0_8e = n1653;
// 
// PC_8e
// 
assign PC_8e = n0598;
// 
// P2_8e
// 
assign P2_8e = n1654;
// 
// P3_8e
// 
assign P3_8e = n1655;
// 
// P0_8e
// 
assign P0_8e = n1656;
// 
// P1_8e
// 
assign P1_8e = n1657;
// 
// IRAM_8e
// 
// 
// IP_8e
// 
assign IP_8e = n1658;
// 
// TCON_8e
// 
assign TCON_8e = n1659;
// 
// SCON_8e
// 
assign SCON_8e = n1660;
// 
// SP_8e
// 
assign SP_8e = n1661;
// 
// SBUF_8e
// 
assign SBUF_8e = n1662;
// 
// PSW_8e
// 
assign PSW_8e = n1663;
// 
// ACC_8f
// 
assign ACC_8f = n1643;
// 
// PCON_8f
// 
assign PCON_8f = n1644;
// 
// P1_8f
// 
assign P1_8f = n1657;
// 
// TMOD_8f
// 
assign TMOD_8f = n1646;
// 
// DPL_8f
// 
assign DPL_8f = n1647;
// 
// DPH_8f
// 
assign DPH_8f = n1648;
// 
// TL1_8f
// 
assign TL1_8f = n1649;
// 
// TL0_8f
// 
assign TL0_8f = n1650;
// 
// IE_8f
// 
assign IE_8f = n1651;
// 
// TH1_8f
// 
assign TH1_8f = n1652;
// 
// TH0_8f
// 
assign TH0_8f = n1653;
// 
// PC_8f
// 
assign PC_8f = n0598;
// 
// P2_8f
// 
assign P2_8f = n1654;
// 
// P3_8f
// 
assign P3_8f = n1655;
// 
// P0_8f
// 
assign P0_8f = n1656;
// 
// B_8f
// 
assign B_8f = n1645;
// 
// IRAM_8f
// 
// 
// IP_8f
// 
assign IP_8f = n1658;
// 
// TCON_8f
// 
assign TCON_8f = n1659;
// 
// SCON_8f
// 
assign SCON_8f = n1660;
// 
// SP_8f
// 
assign SP_8f = n1661;
// 
// SBUF_8f
// 
assign SBUF_8f = n1662;
// 
// PSW_8f
// 
assign PSW_8f = n1663;
// 
// DPL_90
// 
assign n1664 = n0993[7:0];
assign DPL_90 = n1664;
// 
// DPH_90
// 
assign n1665 = n0993[15:8];
assign DPH_90 = n1665;
// 
// PC_90
// 
assign PC_90 = n1121;
// 
// PC_91
// 
assign PC_91 = n0992;
// 
// IRAM_91
// 
// 
// SP_91
// 
assign SP_91 = n1143;
// 
// ACC_92
// 
assign n1666 = ( n1300 << n1084 );
assign n1667 = ( n1111 | n1666 );
assign n1668 = ( n1082 ) ? ( n1667 ) : ( ACC );
assign ACC_92 = n1668;
// 
// B_92
// 
assign n1669 = ( n1098 ) ? ( n1667 ) : ( B );
assign B_92 = n1669;
// 
// IE_92
// 
assign n1670 = ( n1094 ) ? ( n1667 ) : ( IE );
assign IE_92 = n1670;
// 
// PC_92
// 
assign PC_92 = n0598;
// 
// P2_92
// 
assign n1671 = ( n1093 ) ? ( n1667 ) : ( P2 );
assign P2_92 = n1671;
// 
// P3_92
// 
assign n1672 = ( n1095 ) ? ( n1667 ) : ( P3 );
assign P3_92 = n1672;
// 
// P0_92
// 
assign n1673 = ( n1089 ) ? ( n1667 ) : ( P0 );
assign P0_92 = n1673;
// 
// P1_92
// 
assign n1674 = ( n1091 ) ? ( n1667 ) : ( P1 );
assign P1_92 = n1674;
// 
// IRAM_92
// 
// 
// IP_92
// 
assign n1675 = ( n1096 ) ? ( n1667 ) : ( IP );
assign IP_92 = n1675;
// 
// TCON_92
// 
assign n1676 = ( n1090 ) ? ( n1667 ) : ( TCON );
assign TCON_92 = n1676;
// 
// SCON_92
// 
assign n1677 = ( n1092 ) ? ( n1667 ) : ( SCON );
assign SCON_92 = n1677;
// 
// PSW_92
// 
assign n1678 = ( n1097 ) ? ( n1667 ) : ( PSW );
assign PSW_92 = n1678;
// 
// ACC_93
// 
assign ACC_93 = RD_ROM_1;
// 
// PC_93
// 
assign PC_93 = n0600;
// 
// ACC_94
// 
assign n1679 = ( ACC - RD_ROM_1 );
assign n1680 = { n1146[0], n1146[0], n1146[0], n1146[0], n1146[0], n1146[0], n1146[0], n1146 };
assign n1681 = ( n1679 + n1680 );
assign ACC_94 = n1681;
// 
// PC_94
// 
assign PC_94 = n0598;
// 
// PSW_94
// 
assign n1682 = ( n1185 < n1304 );
assign n1683 = ( n1682 ) ? ( n0043 ) : ( n0998 );
assign n1684 = ( n1192 < n1308 );
assign n1685 = ( n1684 ) ? ( n0043 ) : ( n0998 );
assign n1686 = ( n1198 - n1311 );
assign n1687 = n1686[8:8];
assign n1688 = n1686[7:7];
assign n1689 = ( n1687 == n1688 );
assign n1690 = !( n1689 );
assign n1691 = ( n1690 ) ? ( n0043 ) : ( n0998 );
assign n1692 = { ( n1683 ), ( n1685 ), ( n1152 ), ( n1691 ), ( n1154 ) };
assign PSW_94 = n1692;
// 
// ACC_95
// 
assign n1693 = ( ACC - n1047 );
assign n1694 = ( n1693 + n1680 );
assign ACC_95 = n1694;
// 
// PC_95
// 
assign PC_95 = n0598;
// 
// PSW_95
// 
assign n1695 = ( n1185 < n1321 );
assign n1696 = ( n1695 ) ? ( n0043 ) : ( n0998 );
assign n1697 = ( n1192 < n1324 );
assign n1698 = ( n1697 ) ? ( n0043 ) : ( n0998 );
assign n1699 = ( n1198 - n1327 );
assign n1700 = n1699[8:8];
assign n1701 = n1699[7:7];
assign n1702 = ( n1700 == n1701 );
assign n1703 = !( n1702 );
assign n1704 = ( n1703 ) ? ( n0043 ) : ( n0998 );
assign n1705 = { ( n1696 ), ( n1698 ), ( n1152 ), ( n1704 ), ( n1154 ) };
assign PSW_95 = n1705;
// 
// ACC_96
// 
assign n1706 = ( ACC - RD_IRAM_1 );
assign n1707 = ( n1706 + n1680 );
assign ACC_96 = n1707;
// 
// PC_96
// 
assign PC_96 = n0600;
// 
// PSW_96
// 
assign n1708 = ( n1185 < n1337 );
assign n1709 = ( n1708 ) ? ( n0043 ) : ( n0998 );
assign n1710 = ( n1192 < n1340 );
assign n1711 = ( n1710 ) ? ( n0043 ) : ( n0998 );
assign n1712 = ( n1198 - n1343 );
assign n1713 = n1712[8:8];
assign n1714 = n1712[7:7];
assign n1715 = ( n1713 == n1714 );
assign n1716 = !( n1715 );
assign n1717 = ( n1716 ) ? ( n0043 ) : ( n0998 );
assign n1718 = { ( n1709 ), ( n1711 ), ( n1152 ), ( n1717 ), ( n1154 ) };
assign PSW_96 = n1718;
// 
// ACC_97
// 
assign ACC_97 = n1707;
// 
// PC_97
// 
assign PC_97 = n0600;
// 
// PSW_97
// 
assign PSW_97 = n1718;
// 
// ACC_98
// 
assign n1719 = ( ACC - RD_IRAM_0 );
assign n1720 = ( n1719 + n1680 );
assign ACC_98 = n1720;
// 
// PC_98
// 
assign PC_98 = n0600;
// 
// PSW_98
// 
assign n1721 = ( n1185 < n1353 );
assign n1722 = ( n1721 ) ? ( n0043 ) : ( n0998 );
assign n1723 = ( n1192 < n1356 );
assign n1724 = ( n1723 ) ? ( n0043 ) : ( n0998 );
assign n1725 = ( n1198 - n1359 );
assign n1726 = n1725[8:8];
assign n1727 = n1725[7:7];
assign n1728 = ( n1726 == n1727 );
assign n1729 = !( n1728 );
assign n1730 = ( n1729 ) ? ( n0043 ) : ( n0998 );
assign n1731 = { ( n1722 ), ( n1724 ), ( n1152 ), ( n1730 ), ( n1154 ) };
assign PSW_98 = n1731;
// 
// ACC_99
// 
assign ACC_99 = n1720;
// 
// PC_99
// 
assign PC_99 = n0600;
// 
// PSW_99
// 
assign PSW_99 = n1731;
// 
// ACC_9a
// 
assign ACC_9a = n1720;
// 
// PC_9a
// 
assign PC_9a = n0600;
// 
// PSW_9a
// 
assign PSW_9a = n1731;
// 
// ACC_9b
// 
assign ACC_9b = n1720;
// 
// PC_9b
// 
assign PC_9b = n0600;
// 
// PSW_9b
// 
assign PSW_9b = n1731;
// 
// ACC_9c
// 
assign ACC_9c = n1720;
// 
// PC_9c
// 
assign PC_9c = n0600;
// 
// PSW_9c
// 
assign PSW_9c = n1731;
// 
// ACC_9d
// 
assign ACC_9d = n1720;
// 
// PC_9d
// 
assign PC_9d = n0600;
// 
// PSW_9d
// 
assign PSW_9d = n1731;
// 
// ACC_9e
// 
assign ACC_9e = n1720;
// 
// PC_9e
// 
assign PC_9e = n0600;
// 
// PSW_9e
// 
assign PSW_9e = n1731;
// 
// ACC_9f
// 
assign ACC_9f = n1720;
// 
// PC_9f
// 
assign PC_9f = n0600;
// 
// PSW_9f
// 
assign PSW_9f = n1731;
// 
// PC_a0
// 
assign PC_a0 = n0598;
// 
// PSW_a0
// 
assign n1732 = ~( n1118 );
assign n1733 = ( n1146 | n1732 );
assign n1734 = { ( n1733 ), ( n1521 ) };
assign PSW_a0 = n1734;
// 
// PC_a1
// 
assign PC_a1 = n0992;
// 
// PC_a2
// 
assign PC_a2 = n0598;
// 
// PSW_a2
// 
assign n1735 = { ( n1118 ), ( n1521 ) };
assign PSW_a2 = n1735;
// 
// DPL_a3
// 
assign n1736 = ( n0733 + n0595 );
assign n1737 = n1736[7:0];
assign DPL_a3 = n1737;
// 
// DPH_a3
// 
assign n1738 = n1736[15:8];
assign DPH_a3 = n1738;
// 
// PC_a3
// 
assign PC_a3 = n0600;
// 
// ACC_a4
// 
assign n1739 = { 8'b0, B };
assign n1740 = ( n0701 * n1739 );
assign n1741 = n1740[7:0];
assign ACC_a4 = n1741;
// 
// B_a4
// 
assign n1742 = n1740[15:8];
assign B_a4 = n1742;
// 
// PC_a4
// 
assign PC_a4 = n0600;
// 
// PSW_a4
// 
assign n1743 = ( n1742 == n1025 );
assign n1744 = !( n1743 );
assign n1745 = ( n1744 ) ? ( n0043 ) : ( n0998 );
assign n1746 = { ( n0998 ), ( n1553 ), ( n1745 ), ( n1154 ) };
assign PSW_a4 = n1746;
// 
// PC_a5
// 
assign PC_a5 = n0600;
// 
// PC_a6
// 
assign PC_a6 = n0598;
// 
// IRAM_a6
// 
assign n1747 = ( n0999 ) ? ( RD_IRAM_1 ) : ( n1046 );
// 
// PC_a7
// 
assign PC_a7 = n0598;
// 
// IRAM_a7
// 
// 
// PC_a8
// 
assign PC_a8 = n0598;
// 
// IRAM_a8
// 
// 
// PC_a9
// 
assign PC_a9 = n0598;
// 
// IRAM_a9
// 
// 
// PC_aa
// 
assign PC_aa = n0598;
// 
// IRAM_aa
// 
// 
// PC_ab
// 
assign PC_ab = n0598;
// 
// IRAM_ab
// 
// 
// PC_ac
// 
assign PC_ac = n0598;
// 
// IRAM_ac
// 
// 
// PC_ad
// 
assign PC_ad = n0598;
// 
// P3_ad
// 
assign n1748 = ( n1020 ) ? ( n1047 ) : ( P3 );
assign P3_ad = n1748;
// 
// IRAM_ad
// 
// 
// PC_ae
// 
assign PC_ae = n0598;
// 
// IRAM_ae
// 
// 
// PC_af
// 
assign PC_af = n0598;
// 
// IRAM_af
// 
// 
// PC_b0
// 
assign PC_b0 = n0598;
// 
// PSW_b0
// 
assign n1749 = ( n1146 & n1732 );
assign n1750 = { ( n1749 ), ( n1521 ) };
assign PSW_b0 = n1750;
// 
// PC_b1
// 
assign PC_b1 = n0992;
// 
// IRAM_b1
// 
// 
// SP_b1
// 
assign SP_b1 = n1143;
// 
// ACC_b2
// 
assign n1751 = { 7'b0, n1732 };
assign n1752 = ( n1751 << n1084 );
assign n1753 = ( n1111 | n1752 );
assign n1754 = ( n1082 ) ? ( n1753 ) : ( ACC );
assign ACC_b2 = n1754;
// 
// P1_b2
// 
assign n1755 = ( n1091 ) ? ( n1753 ) : ( P1 );
assign P1_b2 = n1755;
// 
// TCON_b2
// 
assign n1756 = ( n1090 ) ? ( n1753 ) : ( TCON );
assign TCON_b2 = n1756;
// 
// PC_b2
// 
assign PC_b2 = n0598;
// 
// P2_b2
// 
assign n1757 = ( n1093 ) ? ( n1753 ) : ( P2 );
assign P2_b2 = n1757;
// 
// P3_b2
// 
assign n1758 = ( n1095 ) ? ( n1753 ) : ( P3 );
assign P3_b2 = n1758;
// 
// P0_b2
// 
assign n1759 = ( n1089 ) ? ( n1753 ) : ( P0 );
assign P0_b2 = n1759;
// 
// B_b2
// 
assign n1760 = ( n1098 ) ? ( n1753 ) : ( B );
assign B_b2 = n1760;
// 
// IRAM_b2
// 
// 
// IP_b2
// 
assign n1761 = ( n1096 ) ? ( n1753 ) : ( IP );
assign IP_b2 = n1761;
// 
// IE_b2
// 
assign n1762 = ( n1094 ) ? ( n1753 ) : ( IE );
assign IE_b2 = n1762;
// 
// SCON_b2
// 
assign n1763 = ( n1092 ) ? ( n1753 ) : ( SCON );
assign SCON_b2 = n1763;
// 
// PSW_b2
// 
assign n1764 = ( n1097 ) ? ( n1753 ) : ( PSW );
assign PSW_b2 = n1764;
// 
// PC_b3
// 
assign PC_b3 = n0600;
// 
// PSW_b3
// 
assign n1765 = ~( n1146 );
assign n1766 = { ( n1765 ), ( n1521 ) };
assign PSW_b3 = n1766;
// 
// PC_b4
// 
assign n1767 = ( ACC == RD_ROM_1 );
assign n1768 = !( n1767 );
assign n1769 = ( n1768 ) ? ( n1123 ) : ( n1121 );
assign PC_b4 = n1769;
// 
// PSW_b4
// 
assign n1770 = ( ACC < RD_ROM_1 );
assign n1771 = ( n1770 ) ? ( n0043 ) : ( n0998 );
assign n1772 = { ( n1771 ), ( n1521 ) };
assign PSW_b4 = n1772;
// 
// PC_b5
// 
assign n1773 = ( ACC == n1047 );
assign n1774 = !( n1773 );
assign n1775 = ( n1774 ) ? ( n1123 ) : ( n1121 );
assign PC_b5 = n1775;
// 
// PSW_b5
// 
assign n1776 = ( ACC < n1047 );
assign n1777 = ( n1776 ) ? ( n0043 ) : ( n0998 );
assign n1778 = { ( n1777 ), ( n1521 ) };
assign PSW_b5 = n1778;
// 
// PC_b6
// 
assign n1779 = ( RD_IRAM_1 == RD_ROM_1 );
assign n1780 = !( n1779 );
assign n1781 = ( n1780 ) ? ( n1123 ) : ( n1121 );
assign PC_b6 = n1781;
// 
// PSW_b6
// 
assign n1782 = ( RD_IRAM_1 < RD_ROM_1 );
assign n1783 = ( n1782 ) ? ( n0043 ) : ( n0998 );
assign n1784 = { ( n1783 ), ( n1521 ) };
assign PSW_b6 = n1784;
// 
// PC_b7
// 
assign PC_b7 = n1781;
// 
// PSW_b7
// 
assign PSW_b7 = n1784;
// 
// PC_b8
// 
assign n1785 = ( RD_IRAM_0 == RD_ROM_1 );
assign n1786 = !( n1785 );
assign n1787 = ( n1786 ) ? ( n1123 ) : ( n1121 );
assign PC_b8 = n1787;
// 
// PSW_b8
// 
assign n1788 = ( RD_IRAM_0 < RD_ROM_1 );
assign n1789 = ( n1788 ) ? ( n0043 ) : ( n0998 );
assign n1790 = { ( n1789 ), ( n1521 ) };
assign PSW_b8 = n1790;
// 
// PC_b9
// 
assign PC_b9 = n1787;
// 
// PSW_b9
// 
assign PSW_b9 = n1790;
// 
// PC_ba
// 
assign PC_ba = n1787;
// 
// PSW_ba
// 
assign PSW_ba = n1790;
// 
// PC_bb
// 
assign PC_bb = n1787;
// 
// PSW_bb
// 
assign PSW_bb = n1790;
// 
// PC_bc
// 
assign PC_bc = n1787;
// 
// PSW_bc
// 
assign PSW_bc = n1790;
// 
// PC_bd
// 
assign PC_bd = n1787;
// 
// PSW_bd
// 
assign PSW_bd = n1790;
// 
// PC_be
// 
assign PC_be = n1787;
// 
// PSW_be
// 
assign PSW_be = n1790;
// 
// PC_bf
// 
assign PC_bf = n1787;
// 
// PSW_bf
// 
assign PSW_bf = n1790;
// 
// PC_c0
// 
assign PC_c0 = n0598;
// 
// IRAM_c0
// 
// 
// SP_c0
// 
assign SP_c0 = n1136;
// 
// PC_c1
// 
assign PC_c1 = n0992;
// 
// ACC_c2
// 
assign ACC_c2 = n1115;
// 
// P1_c2
// 
assign P1_c2 = n1116;
// 
// IE_c2
// 
assign IE_c2 = n1117;
// 
// PC_c2
// 
assign PC_c2 = n0598;
// 
// P2_c2
// 
assign P2_c2 = n1125;
// 
// P3_c2
// 
assign P3_c2 = n1126;
// 
// P0_c2
// 
assign P0_c2 = n1127;
// 
// B_c2
// 
assign B_c2 = n1128;
// 
// IRAM_c2
// 
// 
// IP_c2
// 
assign IP_c2 = n1130;
// 
// TCON_c2
// 
assign TCON_c2 = n1131;
// 
// SCON_c2
// 
assign SCON_c2 = n1132;
// 
// PSW_c2
// 
assign PSW_c2 = n1133;
// 
// PC_c3
// 
assign PC_c3 = n0600;
// 
// PSW_c3
// 
assign n1791 = { ( n0998 ), ( n1521 ) };
assign PSW_c3 = n1791;
// 
// ACC_c4
// 
assign n1792 = ACC[7:4];
assign n1793 = { ( n1191 ), ( n1792 ) };
assign ACC_c4 = n1793;
// 
// PC_c4
// 
assign PC_c4 = n0600;
// 
// ACC_c5
// 
assign ACC_c5 = n1047;
// 
// PCON_c5
// 
assign n1794 = ( n1007 ) ? ( ACC ) : ( PCON );
assign PCON_c5 = n1794;
// 
// P1_c5
// 
assign n1795 = ( n1015 ) ? ( ACC ) : ( P1 );
assign P1_c5 = n1795;
// 
// TMOD_c5
// 
assign n1796 = ( n1009 ) ? ( ACC ) : ( TMOD );
assign TMOD_c5 = n1796;
// 
// DPL_c5
// 
assign n1797 = ( n1004 ) ? ( ACC ) : ( DPL );
assign DPL_c5 = n1797;
// 
// DPH_c5
// 
assign n1798 = ( n1006 ) ? ( ACC ) : ( DPH );
assign DPH_c5 = n1798;
// 
// TL1_c5
// 
assign n1799 = ( n1012 ) ? ( ACC ) : ( TL1 );
assign TL1_c5 = n1799;
// 
// TL0_c5
// 
assign n1800 = ( n1010 ) ? ( ACC ) : ( TL0 );
assign TL0_c5 = n1800;
// 
// TCON_c5
// 
assign n1801 = ( n1008 ) ? ( ACC ) : ( TCON );
assign TCON_c5 = n1801;
// 
// TH1_c5
// 
assign n1802 = ( n1013 ) ? ( ACC ) : ( TH1 );
assign TH1_c5 = n1802;
// 
// TH0_c5
// 
assign n1803 = ( n1011 ) ? ( ACC ) : ( TH0 );
assign TH0_c5 = n1803;
// 
// PC_c5
// 
assign PC_c5 = n0598;
// 
// P2_c5
// 
assign n1804 = ( n1018 ) ? ( ACC ) : ( P2 );
assign P2_c5 = n1804;
// 
// P3_c5
// 
assign n1805 = ( n1020 ) ? ( ACC ) : ( P3 );
assign P3_c5 = n1805;
// 
// P0_c5
// 
assign n1806 = ( n1001 ) ? ( ACC ) : ( P0 );
assign P0_c5 = n1806;
// 
// B_c5
// 
assign n1807 = ( n1024 ) ? ( ACC ) : ( B );
assign B_c5 = n1807;
// 
// IRAM_c5
// 
// 
// IP_c5
// 
assign n1808 = ( n1021 ) ? ( ACC ) : ( IP );
assign IP_c5 = n1808;
// 
// IE_c5
// 
assign n1809 = ( n1019 ) ? ( ACC ) : ( IE );
assign IE_c5 = n1809;
// 
// SCON_c5
// 
assign n1810 = ( n1016 ) ? ( ACC ) : ( SCON );
assign SCON_c5 = n1810;
// 
// SP_c5
// 
assign n1811 = ( n1003 ) ? ( ACC ) : ( SP );
assign SP_c5 = n1811;
// 
// SBUF_c5
// 
assign n1812 = ( n1017 ) ? ( ACC ) : ( SBUF );
assign SBUF_c5 = n1812;
// 
// PSW_c5
// 
assign n1813 = ( n1022 ) ? ( ACC ) : ( PSW );
assign PSW_c5 = n1813;
// 
// ACC_c6
// 
assign ACC_c6 = RD_IRAM_1;
// 
// PC_c6
// 
assign PC_c6 = n0600;
// 
// IRAM_c6
// 
// 
// ACC_c7
// 
assign ACC_c7 = RD_IRAM_1;
// 
// PC_c7
// 
assign PC_c7 = n0600;
// 
// IRAM_c7
// 
// 
// ACC_c8
// 
assign ACC_c8 = RD_IRAM_0;
// 
// PC_c8
// 
assign PC_c8 = n0600;
// 
// IRAM_c8
// 
// 
// ACC_c9
// 
assign ACC_c9 = RD_IRAM_0;
// 
// PC_c9
// 
assign PC_c9 = n0600;
// 
// IRAM_c9
// 
// 
// ACC_ca
// 
assign ACC_ca = RD_IRAM_0;
// 
// PC_ca
// 
assign PC_ca = n0600;
// 
// IRAM_ca
// 
// 
// ACC_cb
// 
assign ACC_cb = RD_IRAM_0;
// 
// PC_cb
// 
assign PC_cb = n0600;
// 
// IRAM_cb
// 
// 
// ACC_cc
// 
assign ACC_cc = RD_IRAM_0;
// 
// PC_cc
// 
assign PC_cc = n0600;
// 
// IRAM_cc
// 
// 
// ACC_cd
// 
assign ACC_cd = RD_IRAM_0;
// 
// PC_cd
// 
assign PC_cd = n0600;
// 
// IRAM_cd
// 
// 
// ACC_ce
// 
assign ACC_ce = RD_IRAM_0;
// 
// PC_ce
// 
assign PC_ce = n0600;
// 
// IRAM_ce
// 
// 
// ACC_cf
// 
assign ACC_cf = RD_IRAM_0;
// 
// PC_cf
// 
assign PC_cf = n0600;
// 
// IRAM_cf
// 
// 
// ACC_d0
// 
assign ACC_d0 = n1643;
// 
// PCON_d0
// 
assign PCON_d0 = n1644;
// 
// B_d0
// 
assign B_d0 = n1645;
// 
// TMOD_d0
// 
assign TMOD_d0 = n1646;
// 
// DPL_d0
// 
assign DPL_d0 = n1647;
// 
// DPH_d0
// 
assign DPH_d0 = n1648;
// 
// TL1_d0
// 
assign TL1_d0 = n1649;
// 
// TL0_d0
// 
assign TL0_d0 = n1650;
// 
// IE_d0
// 
assign IE_d0 = n1651;
// 
// TH1_d0
// 
assign TH1_d0 = n1652;
// 
// TH0_d0
// 
assign TH0_d0 = n1653;
// 
// PC_d0
// 
assign PC_d0 = n0598;
// 
// P2_d0
// 
assign P2_d0 = n1654;
// 
// P3_d0
// 
assign P3_d0 = n1655;
// 
// P0_d0
// 
assign P0_d0 = n1656;
// 
// P1_d0
// 
assign P1_d0 = n1657;
// 
// IRAM_d0
// 
// 
// IP_d0
// 
assign IP_d0 = n1658;
// 
// TCON_d0
// 
assign TCON_d0 = n1659;
// 
// SCON_d0
// 
assign SCON_d0 = n1660;
// 
// SP_d0
// 
assign SP_d0 = n0563;
// 
// SBUF_d0
// 
assign SBUF_d0 = n1662;
// 
// PSW_d0
// 
assign PSW_d0 = n1663;
// 
// PC_d1
// 
assign PC_d1 = n0992;
// 
// IRAM_d1
// 
// 
// SP_d1
// 
assign SP_d1 = n1143;
// 
// ACC_d2
// 
assign n1814 = { 7'b0, n0043 };
assign n1815 = ( n1814 << n1084 );
assign n1816 = ( n1111 | n1815 );
assign n1817 = ( n1082 ) ? ( n1816 ) : ( ACC );
assign ACC_d2 = n1817;
// 
// B_d2
// 
assign n1818 = ( n1098 ) ? ( n1816 ) : ( B );
assign B_d2 = n1818;
// 
// TCON_d2
// 
assign n1819 = ( n1090 ) ? ( n1816 ) : ( TCON );
assign TCON_d2 = n1819;
// 
// PC_d2
// 
assign PC_d2 = n0598;
// 
// P2_d2
// 
assign n1820 = ( n1093 ) ? ( n1816 ) : ( P2 );
assign P2_d2 = n1820;
// 
// P3_d2
// 
assign n1821 = ( n1095 ) ? ( n1816 ) : ( P3 );
assign P3_d2 = n1821;
// 
// P0_d2
// 
assign n1822 = ( n1089 ) ? ( n1816 ) : ( P0 );
assign P0_d2 = n1822;
// 
// P1_d2
// 
assign n1823 = ( n1091 ) ? ( n1816 ) : ( P1 );
assign P1_d2 = n1823;
// 
// IRAM_d2
// 
// 
// IP_d2
// 
assign n1824 = ( n1096 ) ? ( n1816 ) : ( IP );
assign IP_d2 = n1824;
// 
// IE_d2
// 
assign n1825 = ( n1094 ) ? ( n1816 ) : ( IE );
assign IE_d2 = n1825;
// 
// SCON_d2
// 
assign n1826 = ( n1092 ) ? ( n1816 ) : ( SCON );
assign SCON_d2 = n1826;
// 
// PSW_d2
// 
assign n1827 = ( n1097 ) ? ( n1816 ) : ( PSW );
assign PSW_d2 = n1827;
// 
// PC_d3
// 
assign PC_d3 = n0600;
// 
// PSW_d3
// 
assign n1828 = { ( n0043 ), ( n1521 ) };
assign PSW_d3 = n1828;
// 
// ACC_d4
// 
assign n1829 = ( n1151 == n0043 );
assign n1830 = 4'h9;
assign n1831 = ( n1191 > n1830 );
assign n1832 = ( n1829 || n1831 );
assign n1833 = 9'h6;
assign n1834 = ( n1185 + n1833 );
assign n1835 = ( n1832 ) ? ( n1834 ) : ( n1185 );
assign n1836 = n1835[8:8];
assign n1837 = ( n1836 | n1146 );
assign n1838 = ( n1837 == n0043 );
assign n1839 = n1835[7:4];
assign n1840 = ( n1839 > n1830 );
assign n1841 = ( n1838 || n1840 );
assign n1842 = 9'h60;
assign n1843 = ( n1835 + n1842 );
assign n1844 = ( n1841 ) ? ( n1843 ) : ( n1835 );
assign n1845 = n1844[7:0];
assign ACC_d4 = n1845;
// 
// PC_d4
// 
assign PC_d4 = n0600;
// 
// PSW_d4
// 
assign n1846 = n1844[8:8];
assign n1847 = ( n1846 | n1837 );
assign n1848 = { ( n1847 ), ( n1521 ) };
assign PSW_d4 = n1848;
// 
// ACC_d5
// 
assign ACC_d5 = n1158;
// 
// PCON_d5
// 
assign PCON_d5 = n1159;
// 
// B_d5
// 
assign B_d5 = n1172;
// 
// TMOD_d5
// 
assign TMOD_d5 = n1161;
// 
// DPL_d5
// 
assign DPL_d5 = n1162;
// 
// DPH_d5
// 
assign DPH_d5 = n1163;
// 
// TL1_d5
// 
assign TL1_d5 = n1164;
// 
// TL0_d5
// 
assign TL0_d5 = n1165;
// 
// TCON_d5
// 
assign TCON_d5 = n1174;
// 
// TH1_d5
// 
assign TH1_d5 = n1167;
// 
// TH0_d5
// 
assign TH0_d5 = n1168;
// 
// PC_d5
// 
assign n1849 = ( n1047 == n0562 );
assign n1850 = !( n1849 );
assign n1851 = ( n1850 ) ? ( n1123 ) : ( n1121 );
assign PC_d5 = n1851;
// 
// P2_d5
// 
assign P2_d5 = n1169;
// 
// P3_d5
// 
assign P3_d5 = n1170;
// 
// P0_d5
// 
assign P0_d5 = n1171;
// 
// P1_d5
// 
assign P1_d5 = n1160;
// 
// IRAM_d5
// 
// 
// IP_d5
// 
assign IP_d5 = n1173;
// 
// IE_d5
// 
assign IE_d5 = n1166;
// 
// SCON_d5
// 
assign SCON_d5 = n1175;
// 
// SP_d5
// 
assign SP_d5 = n1176;
// 
// SBUF_d5
// 
assign SBUF_d5 = n1177;
// 
// PSW_d5
// 
assign PSW_d5 = n1178;
// 
// ACC_d6
// 
assign n1852 = { ( n1792 ), ( n1233 ) };
assign ACC_d6 = n1852;
// 
// PC_d6
// 
assign PC_d6 = n0600;
// 
// IRAM_d6
// 
assign n1853 = RD_IRAM_1[7:4];
assign n1854 = { ( n1853 ), ( n1191 ) };
// 
// ACC_d7
// 
assign ACC_d7 = n1852;
// 
// PC_d7
// 
assign PC_d7 = n0600;
// 
// IRAM_d7
// 
// 
// PC_d8
// 
assign n1855 = ( RD_IRAM_0 == n0562 );
assign n1856 = !( n1855 );
assign n1857 = ( n1856 ) ? ( n1369 ) : ( n0598 );
assign PC_d8 = n1857;
// 
// IRAM_d8
// 
// 
// PC_d9
// 
assign PC_d9 = n1857;
// 
// IRAM_d9
// 
// 
// PC_da
// 
assign PC_da = n1857;
// 
// IRAM_da
// 
// 
// PC_db
// 
assign PC_db = n1857;
// 
// IRAM_db
// 
// 
// PC_dc
// 
assign PC_dc = n1857;
// 
// IRAM_dc
// 
// 
// PC_dd
// 
assign PC_dd = n1857;
// 
// IRAM_dd
// 
// 
// PC_de
// 
assign PC_de = n1857;
// 
// IRAM_de
// 
// 
// PC_df
// 
assign PC_df = n1857;
// 
// IRAM_df
// 
// 
// ACC_e1
// 
assign ACC_e1 = n1025;
// 
// PC_e1
// 
assign PC_e1 = n0600;
// 
// ACC_e4
// 
assign ACC_e4 = RD_IRAM_1;
// 
// PC_e4
// 
assign PC_e4 = n0600;
// 
// ACC_e5
// 
assign ACC_e5 = RD_IRAM_0;
// 
// PC_e5
// 
assign PC_e5 = n0600;
// 
// ACC_e6
// 
assign ACC_e6 = RD_IRAM_0;
// 
// PC_e6
// 
assign PC_e6 = n0600;
// 
// ACC_e7
// 
assign ACC_e7 = RD_IRAM_0;
// 
// PC_e7
// 
assign PC_e7 = n0600;
// 
// ACC_e8
// 
assign ACC_e8 = RD_IRAM_0;
// 
// PC_e8
// 
assign PC_e8 = n0600;
// 
// ACC_e9
// 
assign ACC_e9 = RD_IRAM_0;
// 
// PC_e9
// 
assign PC_e9 = n0600;
// 
// ACC_ea
// 
assign ACC_ea = RD_IRAM_0;
// 
// PC_ea
// 
assign PC_ea = n0600;
// 
// ACC_eb
// 
assign ACC_eb = RD_IRAM_0;
// 
// PC_eb
// 
assign PC_eb = n0600;
// 
// ACC_ec
// 
assign ACC_ec = RD_IRAM_0;
// 
// PC_ec
// 
assign PC_ec = n0600;
// 
// PC_ed
// 
assign PC_ed = n0992;
// 
// IRAM_ed
// 
// 
// SP_ed
// 
assign SP_ed = n1143;
// 
// ACC_ee
// 
assign n1858 = ~( ACC );
assign ACC_ee = n1858;
// 
// PC_ee
// 
assign PC_ee = n0600;
// 
// PCON_ef
// 
assign PCON_ef = n1794;
// 
// P1_ef
// 
assign P1_ef = n1795;
// 
// TMOD_ef
// 
assign TMOD_ef = n1796;
// 
// DPL_ef
// 
assign DPL_ef = n1797;
// 
// DPH_ef
// 
assign DPH_ef = n1798;
// 
// TL1_ef
// 
assign TL1_ef = n1799;
// 
// TL0_ef
// 
assign TL0_ef = n1800;
// 
// TCON_ef
// 
assign TCON_ef = n1801;
// 
// TH1_ef
// 
assign TH1_ef = n1802;
// 
// TH0_ef
// 
assign TH0_ef = n1803;
// 
// PC_ef
// 
assign PC_ef = n0598;
// 
// P2_ef
// 
assign P2_ef = n1804;
// 
// P3_ef
// 
assign P3_ef = n1805;
// 
// P0_ef
// 
assign P0_ef = n1806;
// 
// B_ef
// 
assign B_ef = n1807;
// 
// IRAM_ef
// 
// 
// IP_ef
// 
assign IP_ef = n1808;
// 
// IE_ef
// 
assign IE_ef = n1809;
// 
// SCON_ef
// 
assign SCON_ef = n1810;
// 
// SP_ef
// 
assign SP_ef = n1811;
// 
// SBUF_ef
// 
assign SBUF_ef = n1812;
// 
// PSW_ef
// 
assign PSW_ef = n1813;
// 
// PC_f1
// 
assign PC_f1 = n0600;
// 
// IRAM_f1
// 
// 
// PC_f4
// 
assign PC_f4 = n0600;
// 
// IRAM_f4
// 
// 
// PC_f5
// 
assign PC_f5 = n0600;
// 
// IRAM_f5
// 
// 
// PC_f6
// 
assign PC_f6 = n0600;
// 
// IRAM_f6
// 
// 
// PC_f7
// 
assign PC_f7 = n0600;
// 
// IRAM_f7
// 
// 
// PC_f8
// 
assign PC_f8 = n0600;
// 
// IRAM_f8
// 
// 
// PC_f9
// 
assign PC_f9 = n0600;
// 
// IRAM_f9
// 
assign n1859 = 8'h3;
assign n1860 = ( RD_ROM_0 == n1859 );
assign n1861 = 8'h4;
assign n1862 = ( RD_ROM_0 == n1861 );
assign n1863 = 8'h13;
assign n1864 = ( RD_ROM_0 == n1863 );
assign n1865 = 8'h14;
assign n1866 = ( RD_ROM_0 == n1865 );
assign n1867 = 8'h23;
assign n1868 = ( RD_ROM_0 == n1867 );
assign n1869 = 8'h24;
assign n1870 = ( RD_ROM_0 == n1869 );
assign n1871 = 8'h33;
assign n1872 = ( RD_ROM_0 == n1871 );
assign n1873 = 8'h34;
assign n1874 = ( RD_ROM_0 == n1873 );
assign n1875 = 8'h44;
assign n1876 = ( RD_ROM_0 == n1875 );
assign n1877 = 8'h54;
assign n1878 = ( RD_ROM_0 == n1877 );
assign n1879 = 8'h64;
assign n1880 = ( RD_ROM_0 == n1879 );
assign n1881 = 8'h74;
assign n1882 = ( RD_ROM_0 == n1881 );
assign n1883 = 8'h75;
assign n1884 = ( RD_ROM_0 == n1883 );
assign n1885 = ( RD_ROM_0 == n1005 );
assign n1886 = 8'h84;
assign n1887 = ( RD_ROM_0 == n1886 );
assign n1888 = 8'h93;
assign n1889 = ( RD_ROM_0 == n1888 );
assign n1890 = 8'h94;
assign n1891 = ( RD_ROM_0 == n1890 );
assign n1892 = 8'ha4;
assign n1893 = ( RD_ROM_0 == n1892 );
assign n1894 = 8'hc4;
assign n1895 = ( RD_ROM_0 == n1894 );
assign n1896 = 8'hd4;
assign n1897 = ( RD_ROM_0 == n1896 );
assign n1898 = 8'he1;
assign n1899 = ( RD_ROM_0 == n1898 );
assign n1900 = 8'he4;
assign n1901 = ( RD_ROM_0 == n1900 );
assign ACC_next = 
  ( n1860 ) ? ACC_03 : 
  ( n1862 ) ? ACC_04 : 
  ( n0002 ) ? ACC_05 : 
  ( n0041 ) ? ACC_10 : 
  ( n1864 ) ? ACC_13 : 
  ( n1866 ) ? ACC_14 : 
  ( n0052 ) ? ACC_15 : 
  ( n1868 ) ? ACC_23 : 
  ( n1870 ) ? ACC_24 : 
  ( n0077 ) ? ACC_25 : 
  ( n0079 ) ? ACC_26 : 
  ( n0081 ) ? ACC_27 : 
  ( n0083 ) ? ACC_28 : 
  ( n0085 ) ? ACC_29 : 
  ( n0087 ) ? ACC_2a : 
  ( n0089 ) ? ACC_2b : 
  ( n0091 ) ? ACC_2c : 
  ( n0093 ) ? ACC_2d : 
  ( n0095 ) ? ACC_2e : 
  ( n0097 ) ? ACC_2f : 
  ( n1872 ) ? ACC_33 : 
  ( n1874 ) ? ACC_34 : 
  ( n0103 ) ? ACC_35 : 
  ( n0105 ) ? ACC_36 : 
  ( n0107 ) ? ACC_37 : 
  ( n0109 ) ? ACC_38 : 
  ( n0111 ) ? ACC_39 : 
  ( n0113 ) ? ACC_3a : 
  ( n0115 ) ? ACC_3b : 
  ( n0117 ) ? ACC_3c : 
  ( n0119 ) ? ACC_3d : 
  ( n0121 ) ? ACC_3e : 
  ( n0123 ) ? ACC_3f : 
  ( n0127 ) ? ACC_43 : 
  ( n1876 ) ? ACC_44 : 
  ( n0129 ) ? ACC_45 : 
  ( n0131 ) ? ACC_46 : 
  ( n0133 ) ? ACC_47 : 
  ( n0135 ) ? ACC_48 : 
  ( n0137 ) ? ACC_49 : 
  ( n0139 ) ? ACC_4a : 
  ( n0141 ) ? ACC_4b : 
  ( n0143 ) ? ACC_4c : 
  ( n0145 ) ? ACC_4d : 
  ( n0147 ) ? ACC_4e : 
  ( n0149 ) ? ACC_4f : 
  ( n0153 ) ? ACC_53 : 
  ( n1878 ) ? ACC_54 : 
  ( n0155 ) ? ACC_55 : 
  ( n0157 ) ? ACC_56 : 
  ( n0159 ) ? ACC_57 : 
  ( n0161 ) ? ACC_58 : 
  ( n0163 ) ? ACC_59 : 
  ( n0165 ) ? ACC_5a : 
  ( n0167 ) ? ACC_5b : 
  ( n0169 ) ? ACC_5c : 
  ( n0171 ) ? ACC_5d : 
  ( n0173 ) ? ACC_5e : 
  ( n0175 ) ? ACC_5f : 
  ( n0177 ) ? ACC_62 : 
  ( n0179 ) ? ACC_63 : 
  ( n1880 ) ? ACC_64 : 
  ( n0181 ) ? ACC_65 : 
  ( n0183 ) ? ACC_66 : 
  ( n0185 ) ? ACC_67 : 
  ( n0187 ) ? ACC_68 : 
  ( n0189 ) ? ACC_69 : 
  ( n0191 ) ? ACC_6a : 
  ( n0193 ) ? ACC_6b : 
  ( n0195 ) ? ACC_6c : 
  ( n0197 ) ? ACC_6d : 
  ( n0199 ) ? ACC_6e : 
  ( n0201 ) ? ACC_6f : 
  ( n1882 ) ? ACC_74 : 
  ( n1884 ) ? ACC_75 : 
  ( n1885 ) ? ACC_83 : 
  ( n1887 ) ? ACC_84 : 
  ( n0211 ) ? ACC_85 : 
  ( n0213 ) ? ACC_86 : 
  ( n0215 ) ? ACC_87 : 
  ( n0217 ) ? ACC_88 : 
  ( n0219 ) ? ACC_89 : 
  ( n0221 ) ? ACC_8a : 
  ( n0223 ) ? ACC_8b : 
  ( n0225 ) ? ACC_8c : 
  ( n0227 ) ? ACC_8d : 
  ( n0229 ) ? ACC_8e : 
  ( n0231 ) ? ACC_8f : 
  ( n0233 ) ? ACC_92 : 
  ( n1889 ) ? ACC_93 : 
  ( n1891 ) ? ACC_94 : 
  ( n0235 ) ? ACC_95 : 
  ( n0237 ) ? ACC_96 : 
  ( n0239 ) ? ACC_97 : 
  ( n0241 ) ? ACC_98 : 
  ( n0243 ) ? ACC_99 : 
  ( n0245 ) ? ACC_9a : 
  ( n0247 ) ? ACC_9b : 
  ( n0249 ) ? ACC_9c : 
  ( n0251 ) ? ACC_9d : 
  ( n0253 ) ? ACC_9e : 
  ( n0255 ) ? ACC_9f : 
  ( n1893 ) ? ACC_a4 : 
  ( n0283 ) ? ACC_b2 : 
  ( n0309 ) ? ACC_c2 : 
  ( n1895 ) ? ACC_c4 : 
  ( n0311 ) ? ACC_c5 : 
  ( n0313 ) ? ACC_c6 : 
  ( n0315 ) ? ACC_c7 : 
  ( n0317 ) ? ACC_c8 : 
  ( n0319 ) ? ACC_c9 : 
  ( n0321 ) ? ACC_ca : 
  ( n0323 ) ? ACC_cb : 
  ( n0325 ) ? ACC_cc : 
  ( n0327 ) ? ACC_cd : 
  ( n0329 ) ? ACC_ce : 
  ( n0331 ) ? ACC_cf : 
  ( n0333 ) ? ACC_d0 : 
  ( n0335 ) ? ACC_d2 : 
  ( n1897 ) ? ACC_d4 : 
  ( n0337 ) ? ACC_d5 : 
  ( n0339 ) ? ACC_d6 : 
  ( n0341 ) ? ACC_d7 : 
  ( n1899 ) ? ACC_e1 : 
  ( n1901 ) ? ACC_e4 : 
  ( n0359 ) ? ACC_e5 : 
  ( n0361 ) ? ACC_e6 : 
  ( n0363 ) ? ACC_e7 : 
  ( n0365 ) ? ACC_e8 : 
  ( n0367 ) ? ACC_e9 : 
  ( n0369 ) ? ACC_ea : 
  ( n0371 ) ? ACC_eb : 
  ( n0373 ) ? ACC_ec : 
  ( n0377 ) ? ACC_ee : 
  ( ACC );
assign PCON_next = 
  ( n0002 ) ? PCON_05 : 
  ( n0052 ) ? PCON_15 : 
  ( n0125 ) ? PCON_42 : 
  ( n0127 ) ? PCON_43 : 
  ( n0151 ) ? PCON_52 : 
  ( n0153 ) ? PCON_53 : 
  ( n0177 ) ? PCON_62 : 
  ( n0179 ) ? PCON_63 : 
  ( n1884 ) ? PCON_75 : 
  ( n0211 ) ? PCON_85 : 
  ( n0213 ) ? PCON_86 : 
  ( n0215 ) ? PCON_87 : 
  ( n0217 ) ? PCON_88 : 
  ( n0219 ) ? PCON_89 : 
  ( n0221 ) ? PCON_8a : 
  ( n0223 ) ? PCON_8b : 
  ( n0225 ) ? PCON_8c : 
  ( n0227 ) ? PCON_8d : 
  ( n0229 ) ? PCON_8e : 
  ( n0231 ) ? PCON_8f : 
  ( n0311 ) ? PCON_c5 : 
  ( n0333 ) ? PCON_d0 : 
  ( n0337 ) ? PCON_d5 : 
  ( n0379 ) ? PCON_ef : 
  ( PCON );
assign B_next = 
  ( n0002 ) ? B_05 : 
  ( n0041 ) ? B_10 : 
  ( n0052 ) ? B_15 : 
  ( n0125 ) ? B_42 : 
  ( n0127 ) ? B_43 : 
  ( n0151 ) ? B_52 : 
  ( n0153 ) ? B_53 : 
  ( n0177 ) ? B_62 : 
  ( n0179 ) ? B_63 : 
  ( n1884 ) ? B_75 : 
  ( n1887 ) ? B_84 : 
  ( n0211 ) ? B_85 : 
  ( n0213 ) ? B_86 : 
  ( n0215 ) ? B_87 : 
  ( n0217 ) ? B_88 : 
  ( n0219 ) ? B_89 : 
  ( n0221 ) ? B_8a : 
  ( n0223 ) ? B_8b : 
  ( n0225 ) ? B_8c : 
  ( n0227 ) ? B_8d : 
  ( n0229 ) ? B_8e : 
  ( n0231 ) ? B_8f : 
  ( n0233 ) ? B_92 : 
  ( n1893 ) ? B_a4 : 
  ( n0283 ) ? B_b2 : 
  ( n0309 ) ? B_c2 : 
  ( n0311 ) ? B_c5 : 
  ( n0333 ) ? B_d0 : 
  ( n0335 ) ? B_d2 : 
  ( n0337 ) ? B_d5 : 
  ( n0379 ) ? B_ef : 
  ( B );
assign TMOD_next = 
  ( n0002 ) ? TMOD_05 : 
  ( n0052 ) ? TMOD_15 : 
  ( n0125 ) ? TMOD_42 : 
  ( n0127 ) ? TMOD_43 : 
  ( n0151 ) ? TMOD_52 : 
  ( n0153 ) ? TMOD_53 : 
  ( n0177 ) ? TMOD_62 : 
  ( n0179 ) ? TMOD_63 : 
  ( n1884 ) ? TMOD_75 : 
  ( n0211 ) ? TMOD_85 : 
  ( n0213 ) ? TMOD_86 : 
  ( n0215 ) ? TMOD_87 : 
  ( n0217 ) ? TMOD_88 : 
  ( n0219 ) ? TMOD_89 : 
  ( n0221 ) ? TMOD_8a : 
  ( n0223 ) ? TMOD_8b : 
  ( n0225 ) ? TMOD_8c : 
  ( n0227 ) ? TMOD_8d : 
  ( n0229 ) ? TMOD_8e : 
  ( n0231 ) ? TMOD_8f : 
  ( n0311 ) ? TMOD_c5 : 
  ( n0333 ) ? TMOD_d0 : 
  ( n0337 ) ? TMOD_d5 : 
  ( n0379 ) ? TMOD_ef : 
  ( TMOD );
assign n1902 = ( RD_ROM_0 == n1014 );
assign n1903 = 8'ha3;
assign n1904 = ( RD_ROM_0 == n1903 );
assign DPL_next = 
  ( n0002 ) ? DPL_05 : 
  ( n0052 ) ? DPL_15 : 
  ( n0125 ) ? DPL_42 : 
  ( n0127 ) ? DPL_43 : 
  ( n0151 ) ? DPL_52 : 
  ( n0153 ) ? DPL_53 : 
  ( n0177 ) ? DPL_62 : 
  ( n0179 ) ? DPL_63 : 
  ( n1884 ) ? DPL_75 : 
  ( n0211 ) ? DPL_85 : 
  ( n0213 ) ? DPL_86 : 
  ( n0215 ) ? DPL_87 : 
  ( n0217 ) ? DPL_88 : 
  ( n0219 ) ? DPL_89 : 
  ( n0221 ) ? DPL_8a : 
  ( n0223 ) ? DPL_8b : 
  ( n0225 ) ? DPL_8c : 
  ( n0227 ) ? DPL_8d : 
  ( n0229 ) ? DPL_8e : 
  ( n0231 ) ? DPL_8f : 
  ( n1902 ) ? DPL_90 : 
  ( n1904 ) ? DPL_a3 : 
  ( n0311 ) ? DPL_c5 : 
  ( n0333 ) ? DPL_d0 : 
  ( n0337 ) ? DPL_d5 : 
  ( n0379 ) ? DPL_ef : 
  ( DPL );
assign DPH_next = 
  ( n0002 ) ? DPH_05 : 
  ( n0052 ) ? DPH_15 : 
  ( n0125 ) ? DPH_42 : 
  ( n0127 ) ? DPH_43 : 
  ( n0151 ) ? DPH_52 : 
  ( n0153 ) ? DPH_53 : 
  ( n0177 ) ? DPH_62 : 
  ( n0179 ) ? DPH_63 : 
  ( n1884 ) ? DPH_75 : 
  ( n0211 ) ? DPH_85 : 
  ( n0213 ) ? DPH_86 : 
  ( n0215 ) ? DPH_87 : 
  ( n0217 ) ? DPH_88 : 
  ( n0219 ) ? DPH_89 : 
  ( n0221 ) ? DPH_8a : 
  ( n0223 ) ? DPH_8b : 
  ( n0225 ) ? DPH_8c : 
  ( n0227 ) ? DPH_8d : 
  ( n0229 ) ? DPH_8e : 
  ( n0231 ) ? DPH_8f : 
  ( n1902 ) ? DPH_90 : 
  ( n1904 ) ? DPH_a3 : 
  ( n0311 ) ? DPH_c5 : 
  ( n0333 ) ? DPH_d0 : 
  ( n0337 ) ? DPH_d5 : 
  ( n0379 ) ? DPH_ef : 
  ( DPH );
assign TL1_next = 
  ( n0002 ) ? TL1_05 : 
  ( n0052 ) ? TL1_15 : 
  ( n0125 ) ? TL1_42 : 
  ( n0127 ) ? TL1_43 : 
  ( n0151 ) ? TL1_52 : 
  ( n0153 ) ? TL1_53 : 
  ( n0177 ) ? TL1_62 : 
  ( n0179 ) ? TL1_63 : 
  ( n1884 ) ? TL1_75 : 
  ( n0211 ) ? TL1_85 : 
  ( n0213 ) ? TL1_86 : 
  ( n0215 ) ? TL1_87 : 
  ( n0217 ) ? TL1_88 : 
  ( n0219 ) ? TL1_89 : 
  ( n0221 ) ? TL1_8a : 
  ( n0223 ) ? TL1_8b : 
  ( n0225 ) ? TL1_8c : 
  ( n0227 ) ? TL1_8d : 
  ( n0229 ) ? TL1_8e : 
  ( n0231 ) ? TL1_8f : 
  ( n0311 ) ? TL1_c5 : 
  ( n0333 ) ? TL1_d0 : 
  ( n0337 ) ? TL1_d5 : 
  ( n0379 ) ? TL1_ef : 
  ( TL1 );
assign TL0_next = 
  ( n0002 ) ? TL0_05 : 
  ( n0052 ) ? TL0_15 : 
  ( n0125 ) ? TL0_42 : 
  ( n0127 ) ? TL0_43 : 
  ( n0151 ) ? TL0_52 : 
  ( n0153 ) ? TL0_53 : 
  ( n0177 ) ? TL0_62 : 
  ( n0179 ) ? TL0_63 : 
  ( n1884 ) ? TL0_75 : 
  ( n0211 ) ? TL0_85 : 
  ( n0213 ) ? TL0_86 : 
  ( n0215 ) ? TL0_87 : 
  ( n0217 ) ? TL0_88 : 
  ( n0219 ) ? TL0_89 : 
  ( n0221 ) ? TL0_8a : 
  ( n0223 ) ? TL0_8b : 
  ( n0225 ) ? TL0_8c : 
  ( n0227 ) ? TL0_8d : 
  ( n0229 ) ? TL0_8e : 
  ( n0231 ) ? TL0_8f : 
  ( n0311 ) ? TL0_c5 : 
  ( n0333 ) ? TL0_d0 : 
  ( n0337 ) ? TL0_d5 : 
  ( n0379 ) ? TL0_ef : 
  ( TL0 );
assign TCON_next = 
  ( n0002 ) ? TCON_05 : 
  ( n0041 ) ? TCON_10 : 
  ( n0052 ) ? TCON_15 : 
  ( n0125 ) ? TCON_42 : 
  ( n0127 ) ? TCON_43 : 
  ( n0151 ) ? TCON_52 : 
  ( n0153 ) ? TCON_53 : 
  ( n0177 ) ? TCON_62 : 
  ( n0179 ) ? TCON_63 : 
  ( n1884 ) ? TCON_75 : 
  ( n0211 ) ? TCON_85 : 
  ( n0213 ) ? TCON_86 : 
  ( n0215 ) ? TCON_87 : 
  ( n0217 ) ? TCON_88 : 
  ( n0219 ) ? TCON_89 : 
  ( n0221 ) ? TCON_8a : 
  ( n0223 ) ? TCON_8b : 
  ( n0225 ) ? TCON_8c : 
  ( n0227 ) ? TCON_8d : 
  ( n0229 ) ? TCON_8e : 
  ( n0231 ) ? TCON_8f : 
  ( n0233 ) ? TCON_92 : 
  ( n0283 ) ? TCON_b2 : 
  ( n0309 ) ? TCON_c2 : 
  ( n0311 ) ? TCON_c5 : 
  ( n0333 ) ? TCON_d0 : 
  ( n0335 ) ? TCON_d2 : 
  ( n0337 ) ? TCON_d5 : 
  ( n0379 ) ? TCON_ef : 
  ( TCON );
assign TH1_next = 
  ( n0002 ) ? TH1_05 : 
  ( n0052 ) ? TH1_15 : 
  ( n0125 ) ? TH1_42 : 
  ( n0127 ) ? TH1_43 : 
  ( n0151 ) ? TH1_52 : 
  ( n0153 ) ? TH1_53 : 
  ( n0177 ) ? TH1_62 : 
  ( n0179 ) ? TH1_63 : 
  ( n1884 ) ? TH1_75 : 
  ( n0211 ) ? TH1_85 : 
  ( n0213 ) ? TH1_86 : 
  ( n0215 ) ? TH1_87 : 
  ( n0217 ) ? TH1_88 : 
  ( n0219 ) ? TH1_89 : 
  ( n0221 ) ? TH1_8a : 
  ( n0223 ) ? TH1_8b : 
  ( n0225 ) ? TH1_8c : 
  ( n0227 ) ? TH1_8d : 
  ( n0229 ) ? TH1_8e : 
  ( n0231 ) ? TH1_8f : 
  ( n0311 ) ? TH1_c5 : 
  ( n0333 ) ? TH1_d0 : 
  ( n0337 ) ? TH1_d5 : 
  ( n0379 ) ? TH1_ef : 
  ( TH1 );
assign TH0_next = 
  ( n0002 ) ? TH0_05 : 
  ( n0052 ) ? TH0_15 : 
  ( n0125 ) ? TH0_42 : 
  ( n0127 ) ? TH0_43 : 
  ( n0151 ) ? TH0_52 : 
  ( n0153 ) ? TH0_53 : 
  ( n0177 ) ? TH0_62 : 
  ( n0179 ) ? TH0_63 : 
  ( n1884 ) ? TH0_75 : 
  ( n0211 ) ? TH0_85 : 
  ( n0213 ) ? TH0_86 : 
  ( n0215 ) ? TH0_87 : 
  ( n0217 ) ? TH0_88 : 
  ( n0219 ) ? TH0_89 : 
  ( n0221 ) ? TH0_8a : 
  ( n0223 ) ? TH0_8b : 
  ( n0225 ) ? TH0_8c : 
  ( n0227 ) ? TH0_8d : 
  ( n0229 ) ? TH0_8e : 
  ( n0231 ) ? TH0_8f : 
  ( n0311 ) ? TH0_c5 : 
  ( n0333 ) ? TH0_d0 : 
  ( n0337 ) ? TH0_d5 : 
  ( n0379 ) ? TH0_ef : 
  ( TH0 );
assign n1905 = ( RD_ROM_0 == n1025 );
assign n1906 = ( RD_ROM_0 == n0562 );
assign n1907 = ( RD_ROM_0 == n1142 );
assign n1908 = 8'h11;
assign n1909 = ( RD_ROM_0 == n1908 );
assign n1910 = 8'h12;
assign n1911 = ( RD_ROM_0 == n1910 );
assign n1912 = 8'h21;
assign n1913 = ( RD_ROM_0 == n1912 );
assign n1914 = 8'h31;
assign n1915 = ( RD_ROM_0 == n1914 );
assign n1916 = 8'h40;
assign n1917 = ( RD_ROM_0 == n1916 );
assign n1918 = 8'h41;
assign n1919 = ( RD_ROM_0 == n1918 );
assign n1920 = 8'h50;
assign n1921 = ( RD_ROM_0 == n1920 );
assign n1922 = 8'h51;
assign n1923 = ( RD_ROM_0 == n1922 );
assign n1924 = 8'h60;
assign n1925 = ( RD_ROM_0 == n1924 );
assign n1926 = 8'h61;
assign n1927 = ( RD_ROM_0 == n1926 );
assign n1928 = 8'h70;
assign n1929 = ( RD_ROM_0 == n1928 );
assign n1930 = 8'h71;
assign n1931 = ( RD_ROM_0 == n1930 );
assign n1932 = 8'h73;
assign n1933 = ( RD_ROM_0 == n1932 );
assign n1934 = 8'h78;
assign n1935 = ( RD_ROM_0 == n1934 );
assign n1936 = 8'h79;
assign n1937 = ( RD_ROM_0 == n1936 );
assign n1938 = 8'h7a;
assign n1939 = ( RD_ROM_0 == n1938 );
assign n1940 = 8'h7b;
assign n1941 = ( RD_ROM_0 == n1940 );
assign n1942 = 8'h7c;
assign n1943 = ( RD_ROM_0 == n1942 );
assign n1944 = 8'h7d;
assign n1945 = ( RD_ROM_0 == n1944 );
assign n1946 = 8'h7e;
assign n1947 = ( RD_ROM_0 == n1946 );
assign n1948 = 8'h7f;
assign n1949 = ( RD_ROM_0 == n1948 );
assign n1950 = ( RD_ROM_0 == n1000 );
assign n1951 = ( RD_ROM_0 == n1002 );
assign n1952 = 8'h91;
assign n1953 = ( RD_ROM_0 == n1952 );
assign n1954 = 8'ha1;
assign n1955 = ( RD_ROM_0 == n1954 );
assign n1956 = 8'ha5;
assign n1957 = ( RD_ROM_0 == n1956 );
assign n1958 = 8'hb1;
assign n1959 = ( RD_ROM_0 == n1958 );
assign n1960 = 8'hb3;
assign n1961 = ( RD_ROM_0 == n1960 );
assign n1962 = 8'hb4;
assign n1963 = ( RD_ROM_0 == n1962 );
assign n1964 = 8'hc1;
assign n1965 = ( RD_ROM_0 == n1964 );
assign n1966 = 8'hc3;
assign n1967 = ( RD_ROM_0 == n1966 );
assign n1968 = 8'hd1;
assign n1969 = ( RD_ROM_0 == n1968 );
assign n1970 = 8'hd3;
assign n1971 = ( RD_ROM_0 == n1970 );
assign n1972 = 8'hf1;
assign n1973 = ( RD_ROM_0 == n1972 );
assign n1974 = 8'hf4;
assign n1975 = ( RD_ROM_0 == n1974 );
assign n1976 = 8'hf5;
assign n1977 = ( RD_ROM_0 == n1976 );
assign n1978 = 8'hf7;
assign n1979 = ( RD_ROM_0 == n1978 );
assign n1980 = 8'hf8;
assign n1981 = ( RD_ROM_0 == n1980 );
assign n1982 = 8'hf9;
assign n1983 = ( RD_ROM_0 == n1982 );
assign PC_next = 
  ( n1905 ) ? PC_00 : 
  ( n1906 ) ? PC_01 : 
  ( n1907 ) ? PC_02 : 
  ( n1860 ) ? PC_03 : 
  ( n1862 ) ? PC_04 : 
  ( n0002 ) ? PC_05 : 
  ( n0004 ) ? PC_06 : 
  ( n0009 ) ? PC_07 : 
  ( n0013 ) ? PC_08 : 
  ( n0015 ) ? PC_09 : 
  ( n0017 ) ? PC_0a : 
  ( n0021 ) ? PC_0b : 
  ( n0025 ) ? PC_0c : 
  ( n0029 ) ? PC_0d : 
  ( n0033 ) ? PC_0e : 
  ( n0037 ) ? PC_0f : 
  ( n0041 ) ? PC_10 : 
  ( n1909 ) ? PC_11 : 
  ( n1911 ) ? PC_12 : 
  ( n1864 ) ? PC_13 : 
  ( n1866 ) ? PC_14 : 
  ( n0052 ) ? PC_15 : 
  ( n0054 ) ? PC_16 : 
  ( n0056 ) ? PC_17 : 
  ( n0058 ) ? PC_18 : 
  ( n0060 ) ? PC_19 : 
  ( n0062 ) ? PC_1a : 
  ( n0064 ) ? PC_1b : 
  ( n0066 ) ? PC_1c : 
  ( n0068 ) ? PC_1d : 
  ( n0070 ) ? PC_1e : 
  ( n0072 ) ? PC_1f : 
  ( n0073 ) ? PC_20 : 
  ( n1913 ) ? PC_21 : 
  ( n0075 ) ? PC_22 : 
  ( n1868 ) ? PC_23 : 
  ( n1870 ) ? PC_24 : 
  ( n0077 ) ? PC_25 : 
  ( n0079 ) ? PC_26 : 
  ( n0081 ) ? PC_27 : 
  ( n0083 ) ? PC_28 : 
  ( n0085 ) ? PC_29 : 
  ( n0087 ) ? PC_2a : 
  ( n0089 ) ? PC_2b : 
  ( n0091 ) ? PC_2c : 
  ( n0093 ) ? PC_2d : 
  ( n0095 ) ? PC_2e : 
  ( n0097 ) ? PC_2f : 
  ( n0099 ) ? PC_30 : 
  ( n1915 ) ? PC_31 : 
  ( n0101 ) ? PC_32 : 
  ( n1872 ) ? PC_33 : 
  ( n1874 ) ? PC_34 : 
  ( n0103 ) ? PC_35 : 
  ( n0105 ) ? PC_36 : 
  ( n0107 ) ? PC_37 : 
  ( n0109 ) ? PC_38 : 
  ( n0111 ) ? PC_39 : 
  ( n0113 ) ? PC_3a : 
  ( n0115 ) ? PC_3b : 
  ( n0117 ) ? PC_3c : 
  ( n0119 ) ? PC_3d : 
  ( n0121 ) ? PC_3e : 
  ( n0123 ) ? PC_3f : 
  ( n1917 ) ? PC_40 : 
  ( n1919 ) ? PC_41 : 
  ( n0125 ) ? PC_42 : 
  ( n0127 ) ? PC_43 : 
  ( n1876 ) ? PC_44 : 
  ( n0129 ) ? PC_45 : 
  ( n0131 ) ? PC_46 : 
  ( n0133 ) ? PC_47 : 
  ( n0135 ) ? PC_48 : 
  ( n0137 ) ? PC_49 : 
  ( n0139 ) ? PC_4a : 
  ( n0141 ) ? PC_4b : 
  ( n0143 ) ? PC_4c : 
  ( n0145 ) ? PC_4d : 
  ( n0147 ) ? PC_4e : 
  ( n0149 ) ? PC_4f : 
  ( n1921 ) ? PC_50 : 
  ( n1923 ) ? PC_51 : 
  ( n0151 ) ? PC_52 : 
  ( n0153 ) ? PC_53 : 
  ( n1878 ) ? PC_54 : 
  ( n0155 ) ? PC_55 : 
  ( n0157 ) ? PC_56 : 
  ( n0159 ) ? PC_57 : 
  ( n0161 ) ? PC_58 : 
  ( n0163 ) ? PC_59 : 
  ( n0165 ) ? PC_5a : 
  ( n0167 ) ? PC_5b : 
  ( n0169 ) ? PC_5c : 
  ( n0171 ) ? PC_5d : 
  ( n0173 ) ? PC_5e : 
  ( n0175 ) ? PC_5f : 
  ( n1925 ) ? PC_60 : 
  ( n1927 ) ? PC_61 : 
  ( n0177 ) ? PC_62 : 
  ( n0179 ) ? PC_63 : 
  ( n1880 ) ? PC_64 : 
  ( n0181 ) ? PC_65 : 
  ( n0183 ) ? PC_66 : 
  ( n0185 ) ? PC_67 : 
  ( n0187 ) ? PC_68 : 
  ( n0189 ) ? PC_69 : 
  ( n0191 ) ? PC_6a : 
  ( n0193 ) ? PC_6b : 
  ( n0195 ) ? PC_6c : 
  ( n0197 ) ? PC_6d : 
  ( n0199 ) ? PC_6e : 
  ( n0201 ) ? PC_6f : 
  ( n1929 ) ? PC_70 : 
  ( n1931 ) ? PC_71 : 
  ( n0203 ) ? PC_72 : 
  ( n1933 ) ? PC_73 : 
  ( n1882 ) ? PC_74 : 
  ( n1884 ) ? PC_75 : 
  ( n0205 ) ? PC_76 : 
  ( n0207 ) ? PC_77 : 
  ( n1935 ) ? PC_78 : 
  ( n1937 ) ? PC_79 : 
  ( n1939 ) ? PC_7a : 
  ( n1941 ) ? PC_7b : 
  ( n1943 ) ? PC_7c : 
  ( n1945 ) ? PC_7d : 
  ( n1947 ) ? PC_7e : 
  ( n1949 ) ? PC_7f : 
  ( n1950 ) ? PC_80 : 
  ( n1951 ) ? PC_81 : 
  ( n0209 ) ? PC_82 : 
  ( n1885 ) ? PC_83 : 
  ( n1887 ) ? PC_84 : 
  ( n0211 ) ? PC_85 : 
  ( n0213 ) ? PC_86 : 
  ( n0215 ) ? PC_87 : 
  ( n0217 ) ? PC_88 : 
  ( n0219 ) ? PC_89 : 
  ( n0221 ) ? PC_8a : 
  ( n0223 ) ? PC_8b : 
  ( n0225 ) ? PC_8c : 
  ( n0227 ) ? PC_8d : 
  ( n0229 ) ? PC_8e : 
  ( n0231 ) ? PC_8f : 
  ( n1902 ) ? PC_90 : 
  ( n1953 ) ? PC_91 : 
  ( n0233 ) ? PC_92 : 
  ( n1889 ) ? PC_93 : 
  ( n1891 ) ? PC_94 : 
  ( n0235 ) ? PC_95 : 
  ( n0237 ) ? PC_96 : 
  ( n0239 ) ? PC_97 : 
  ( n0241 ) ? PC_98 : 
  ( n0243 ) ? PC_99 : 
  ( n0245 ) ? PC_9a : 
  ( n0247 ) ? PC_9b : 
  ( n0249 ) ? PC_9c : 
  ( n0251 ) ? PC_9d : 
  ( n0253 ) ? PC_9e : 
  ( n0255 ) ? PC_9f : 
  ( n0257 ) ? PC_a0 : 
  ( n1955 ) ? PC_a1 : 
  ( n0259 ) ? PC_a2 : 
  ( n1904 ) ? PC_a3 : 
  ( n1893 ) ? PC_a4 : 
  ( n1957 ) ? PC_a5 : 
  ( n0261 ) ? PC_a6 : 
  ( n0263 ) ? PC_a7 : 
  ( n0265 ) ? PC_a8 : 
  ( n0267 ) ? PC_a9 : 
  ( n0269 ) ? PC_aa : 
  ( n0271 ) ? PC_ab : 
  ( n0273 ) ? PC_ac : 
  ( n0275 ) ? PC_ad : 
  ( n0277 ) ? PC_ae : 
  ( n0279 ) ? PC_af : 
  ( n0281 ) ? PC_b0 : 
  ( n1959 ) ? PC_b1 : 
  ( n0283 ) ? PC_b2 : 
  ( n1961 ) ? PC_b3 : 
  ( n1963 ) ? PC_b4 : 
  ( n0285 ) ? PC_b5 : 
  ( n0287 ) ? PC_b6 : 
  ( n0289 ) ? PC_b7 : 
  ( n0291 ) ? PC_b8 : 
  ( n0293 ) ? PC_b9 : 
  ( n0295 ) ? PC_ba : 
  ( n0297 ) ? PC_bb : 
  ( n0299 ) ? PC_bc : 
  ( n0301 ) ? PC_bd : 
  ( n0303 ) ? PC_be : 
  ( n0305 ) ? PC_bf : 
  ( n0307 ) ? PC_c0 : 
  ( n1965 ) ? PC_c1 : 
  ( n0309 ) ? PC_c2 : 
  ( n1967 ) ? PC_c3 : 
  ( n1895 ) ? PC_c4 : 
  ( n0311 ) ? PC_c5 : 
  ( n0313 ) ? PC_c6 : 
  ( n0315 ) ? PC_c7 : 
  ( n0317 ) ? PC_c8 : 
  ( n0319 ) ? PC_c9 : 
  ( n0321 ) ? PC_ca : 
  ( n0323 ) ? PC_cb : 
  ( n0325 ) ? PC_cc : 
  ( n0327 ) ? PC_cd : 
  ( n0329 ) ? PC_ce : 
  ( n0331 ) ? PC_cf : 
  ( n0333 ) ? PC_d0 : 
  ( n1969 ) ? PC_d1 : 
  ( n0335 ) ? PC_d2 : 
  ( n1971 ) ? PC_d3 : 
  ( n1897 ) ? PC_d4 : 
  ( n0337 ) ? PC_d5 : 
  ( n0339 ) ? PC_d6 : 
  ( n0341 ) ? PC_d7 : 
  ( n0343 ) ? PC_d8 : 
  ( n0345 ) ? PC_d9 : 
  ( n0347 ) ? PC_da : 
  ( n0349 ) ? PC_db : 
  ( n0351 ) ? PC_dc : 
  ( n0353 ) ? PC_dd : 
  ( n0355 ) ? PC_de : 
  ( n0357 ) ? PC_df : 
  ( n1899 ) ? PC_e1 : 
  ( n1901 ) ? PC_e4 : 
  ( n0359 ) ? PC_e5 : 
  ( n0361 ) ? PC_e6 : 
  ( n0363 ) ? PC_e7 : 
  ( n0365 ) ? PC_e8 : 
  ( n0367 ) ? PC_e9 : 
  ( n0369 ) ? PC_ea : 
  ( n0371 ) ? PC_eb : 
  ( n0373 ) ? PC_ec : 
  ( n0375 ) ? PC_ed : 
  ( n0377 ) ? PC_ee : 
  ( n0379 ) ? PC_ef : 
  ( n1973 ) ? PC_f1 : 
  ( n1975 ) ? PC_f4 : 
  ( n1977 ) ? PC_f5 : 
  ( n0381 ) ? PC_f6 : 
  ( n1979 ) ? PC_f7 : 
  ( n1981 ) ? PC_f8 : 
  ( n1983 ) ? PC_f9 : 
  ( PC );
assign P2_next = 
  ( n0002 ) ? P2_05 : 
  ( n0041 ) ? P2_10 : 
  ( n0052 ) ? P2_15 : 
  ( n0125 ) ? P2_42 : 
  ( n0127 ) ? P2_43 : 
  ( n0151 ) ? P2_52 : 
  ( n0153 ) ? P2_53 : 
  ( n0177 ) ? P2_62 : 
  ( n0179 ) ? P2_63 : 
  ( n1884 ) ? P2_75 : 
  ( n0211 ) ? P2_85 : 
  ( n0213 ) ? P2_86 : 
  ( n0215 ) ? P2_87 : 
  ( n0217 ) ? P2_88 : 
  ( n0219 ) ? P2_89 : 
  ( n0221 ) ? P2_8a : 
  ( n0223 ) ? P2_8b : 
  ( n0225 ) ? P2_8c : 
  ( n0227 ) ? P2_8d : 
  ( n0229 ) ? P2_8e : 
  ( n0231 ) ? P2_8f : 
  ( n0233 ) ? P2_92 : 
  ( n0283 ) ? P2_b2 : 
  ( n0309 ) ? P2_c2 : 
  ( n0311 ) ? P2_c5 : 
  ( n0333 ) ? P2_d0 : 
  ( n0335 ) ? P2_d2 : 
  ( n0337 ) ? P2_d5 : 
  ( n0379 ) ? P2_ef : 
  ( P2 );
assign P3_next = 
  ( n0002 ) ? P3_05 : 
  ( n0041 ) ? P3_10 : 
  ( n0052 ) ? P3_15 : 
  ( n0125 ) ? P3_42 : 
  ( n0127 ) ? P3_43 : 
  ( n0151 ) ? P3_52 : 
  ( n0153 ) ? P3_53 : 
  ( n0177 ) ? P3_62 : 
  ( n0179 ) ? P3_63 : 
  ( n1884 ) ? P3_75 : 
  ( n0211 ) ? P3_85 : 
  ( n0213 ) ? P3_86 : 
  ( n0215 ) ? P3_87 : 
  ( n0217 ) ? P3_88 : 
  ( n0219 ) ? P3_89 : 
  ( n0221 ) ? P3_8a : 
  ( n0223 ) ? P3_8b : 
  ( n0225 ) ? P3_8c : 
  ( n0227 ) ? P3_8d : 
  ( n0229 ) ? P3_8e : 
  ( n0231 ) ? P3_8f : 
  ( n0233 ) ? P3_92 : 
  ( n0275 ) ? P3_ad : 
  ( n0283 ) ? P3_b2 : 
  ( n0309 ) ? P3_c2 : 
  ( n0311 ) ? P3_c5 : 
  ( n0333 ) ? P3_d0 : 
  ( n0335 ) ? P3_d2 : 
  ( n0337 ) ? P3_d5 : 
  ( n0379 ) ? P3_ef : 
  ( P3 );
assign P0_next = 
  ( n0002 ) ? P0_05 : 
  ( n0041 ) ? P0_10 : 
  ( n0052 ) ? P0_15 : 
  ( n0125 ) ? P0_42 : 
  ( n0127 ) ? P0_43 : 
  ( n0151 ) ? P0_52 : 
  ( n0153 ) ? P0_53 : 
  ( n0177 ) ? P0_62 : 
  ( n0179 ) ? P0_63 : 
  ( n1884 ) ? P0_75 : 
  ( n0211 ) ? P0_85 : 
  ( n0213 ) ? P0_86 : 
  ( n0215 ) ? P0_87 : 
  ( n0217 ) ? P0_88 : 
  ( n0219 ) ? P0_89 : 
  ( n0221 ) ? P0_8a : 
  ( n0223 ) ? P0_8b : 
  ( n0225 ) ? P0_8c : 
  ( n0227 ) ? P0_8d : 
  ( n0229 ) ? P0_8e : 
  ( n0231 ) ? P0_8f : 
  ( n0233 ) ? P0_92 : 
  ( n0283 ) ? P0_b2 : 
  ( n0309 ) ? P0_c2 : 
  ( n0311 ) ? P0_c5 : 
  ( n0333 ) ? P0_d0 : 
  ( n0335 ) ? P0_d2 : 
  ( n0337 ) ? P0_d5 : 
  ( n0379 ) ? P0_ef : 
  ( P0 );
assign P1_next = 
  ( n0002 ) ? P1_05 : 
  ( n0041 ) ? P1_10 : 
  ( n0052 ) ? P1_15 : 
  ( n0125 ) ? P1_42 : 
  ( n0127 ) ? P1_43 : 
  ( n0151 ) ? P1_52 : 
  ( n0153 ) ? P1_53 : 
  ( n0177 ) ? P1_62 : 
  ( n0179 ) ? P1_63 : 
  ( n1884 ) ? P1_75 : 
  ( n0211 ) ? P1_85 : 
  ( n0213 ) ? P1_86 : 
  ( n0215 ) ? P1_87 : 
  ( n0217 ) ? P1_88 : 
  ( n0219 ) ? P1_89 : 
  ( n0221 ) ? P1_8a : 
  ( n0223 ) ? P1_8b : 
  ( n0225 ) ? P1_8c : 
  ( n0227 ) ? P1_8d : 
  ( n0229 ) ? P1_8e : 
  ( n0231 ) ? P1_8f : 
  ( n0233 ) ? P1_92 : 
  ( n0283 ) ? P1_b2 : 
  ( n0309 ) ? P1_c2 : 
  ( n0311 ) ? P1_c5 : 
  ( n0333 ) ? P1_d0 : 
  ( n0335 ) ? P1_d2 : 
  ( n0337 ) ? P1_d5 : 
  ( n0379 ) ? P1_ef : 
  ( P1 );
assign IP_next = 
  ( n0002 ) ? IP_05 : 
  ( n0041 ) ? IP_10 : 
  ( n0052 ) ? IP_15 : 
  ( n0125 ) ? IP_42 : 
  ( n0127 ) ? IP_43 : 
  ( n0151 ) ? IP_52 : 
  ( n0153 ) ? IP_53 : 
  ( n0177 ) ? IP_62 : 
  ( n0179 ) ? IP_63 : 
  ( n1884 ) ? IP_75 : 
  ( n0211 ) ? IP_85 : 
  ( n0213 ) ? IP_86 : 
  ( n0215 ) ? IP_87 : 
  ( n0217 ) ? IP_88 : 
  ( n0219 ) ? IP_89 : 
  ( n0221 ) ? IP_8a : 
  ( n0223 ) ? IP_8b : 
  ( n0225 ) ? IP_8c : 
  ( n0227 ) ? IP_8d : 
  ( n0229 ) ? IP_8e : 
  ( n0231 ) ? IP_8f : 
  ( n0233 ) ? IP_92 : 
  ( n0283 ) ? IP_b2 : 
  ( n0309 ) ? IP_c2 : 
  ( n0311 ) ? IP_c5 : 
  ( n0333 ) ? IP_d0 : 
  ( n0335 ) ? IP_d2 : 
  ( n0337 ) ? IP_d5 : 
  ( n0379 ) ? IP_ef : 
  ( IP );
assign IE_next = 
  ( n0002 ) ? IE_05 : 
  ( n0041 ) ? IE_10 : 
  ( n0052 ) ? IE_15 : 
  ( n0125 ) ? IE_42 : 
  ( n0127 ) ? IE_43 : 
  ( n0151 ) ? IE_52 : 
  ( n0153 ) ? IE_53 : 
  ( n0177 ) ? IE_62 : 
  ( n0179 ) ? IE_63 : 
  ( n1884 ) ? IE_75 : 
  ( n0211 ) ? IE_85 : 
  ( n0213 ) ? IE_86 : 
  ( n0215 ) ? IE_87 : 
  ( n0217 ) ? IE_88 : 
  ( n0219 ) ? IE_89 : 
  ( n0221 ) ? IE_8a : 
  ( n0223 ) ? IE_8b : 
  ( n0225 ) ? IE_8c : 
  ( n0227 ) ? IE_8d : 
  ( n0229 ) ? IE_8e : 
  ( n0231 ) ? IE_8f : 
  ( n0233 ) ? IE_92 : 
  ( n0283 ) ? IE_b2 : 
  ( n0309 ) ? IE_c2 : 
  ( n0311 ) ? IE_c5 : 
  ( n0333 ) ? IE_d0 : 
  ( n0335 ) ? IE_d2 : 
  ( n0337 ) ? IE_d5 : 
  ( n0379 ) ? IE_ef : 
  ( IE );
assign SCON_next = 
  ( n0002 ) ? SCON_05 : 
  ( n0041 ) ? SCON_10 : 
  ( n0052 ) ? SCON_15 : 
  ( n0125 ) ? SCON_42 : 
  ( n0127 ) ? SCON_43 : 
  ( n0151 ) ? SCON_52 : 
  ( n0153 ) ? SCON_53 : 
  ( n0177 ) ? SCON_62 : 
  ( n0179 ) ? SCON_63 : 
  ( n1884 ) ? SCON_75 : 
  ( n0211 ) ? SCON_85 : 
  ( n0213 ) ? SCON_86 : 
  ( n0215 ) ? SCON_87 : 
  ( n0217 ) ? SCON_88 : 
  ( n0219 ) ? SCON_89 : 
  ( n0221 ) ? SCON_8a : 
  ( n0223 ) ? SCON_8b : 
  ( n0225 ) ? SCON_8c : 
  ( n0227 ) ? SCON_8d : 
  ( n0229 ) ? SCON_8e : 
  ( n0231 ) ? SCON_8f : 
  ( n0233 ) ? SCON_92 : 
  ( n0283 ) ? SCON_b2 : 
  ( n0309 ) ? SCON_c2 : 
  ( n0311 ) ? SCON_c5 : 
  ( n0333 ) ? SCON_d0 : 
  ( n0335 ) ? SCON_d2 : 
  ( n0337 ) ? SCON_d5 : 
  ( n0379 ) ? SCON_ef : 
  ( SCON );
assign SP_next = 
  ( n0002 ) ? SP_05 : 
  ( n1909 ) ? SP_11 : 
  ( n1911 ) ? SP_12 : 
  ( n0052 ) ? SP_15 : 
  ( n0075 ) ? SP_22 : 
  ( n1915 ) ? SP_31 : 
  ( n0101 ) ? SP_32 : 
  ( n0125 ) ? SP_42 : 
  ( n0127 ) ? SP_43 : 
  ( n1923 ) ? SP_51 : 
  ( n0151 ) ? SP_52 : 
  ( n0153 ) ? SP_53 : 
  ( n0177 ) ? SP_62 : 
  ( n0179 ) ? SP_63 : 
  ( n1931 ) ? SP_71 : 
  ( n1884 ) ? SP_75 : 
  ( n0211 ) ? SP_85 : 
  ( n0213 ) ? SP_86 : 
  ( n0215 ) ? SP_87 : 
  ( n0217 ) ? SP_88 : 
  ( n0219 ) ? SP_89 : 
  ( n0221 ) ? SP_8a : 
  ( n0223 ) ? SP_8b : 
  ( n0225 ) ? SP_8c : 
  ( n0227 ) ? SP_8d : 
  ( n0229 ) ? SP_8e : 
  ( n0231 ) ? SP_8f : 
  ( n1953 ) ? SP_91 : 
  ( n1959 ) ? SP_b1 : 
  ( n0307 ) ? SP_c0 : 
  ( n0311 ) ? SP_c5 : 
  ( n0333 ) ? SP_d0 : 
  ( n1969 ) ? SP_d1 : 
  ( n0337 ) ? SP_d5 : 
  ( n0375 ) ? SP_ed : 
  ( n0379 ) ? SP_ef : 
  ( SP );
assign SBUF_next = 
  ( n0002 ) ? SBUF_05 : 
  ( n0052 ) ? SBUF_15 : 
  ( n0125 ) ? SBUF_42 : 
  ( n0127 ) ? SBUF_43 : 
  ( n0151 ) ? SBUF_52 : 
  ( n0153 ) ? SBUF_53 : 
  ( n0177 ) ? SBUF_62 : 
  ( n0179 ) ? SBUF_63 : 
  ( n1884 ) ? SBUF_75 : 
  ( n0211 ) ? SBUF_85 : 
  ( n0213 ) ? SBUF_86 : 
  ( n0215 ) ? SBUF_87 : 
  ( n0217 ) ? SBUF_88 : 
  ( n0219 ) ? SBUF_89 : 
  ( n0221 ) ? SBUF_8a : 
  ( n0223 ) ? SBUF_8b : 
  ( n0225 ) ? SBUF_8c : 
  ( n0227 ) ? SBUF_8d : 
  ( n0229 ) ? SBUF_8e : 
  ( n0231 ) ? SBUF_8f : 
  ( n0311 ) ? SBUF_c5 : 
  ( n0333 ) ? SBUF_d0 : 
  ( n0337 ) ? SBUF_d5 : 
  ( n0379 ) ? SBUF_ef : 
  ( SBUF );
assign PSW_next = 
  ( n0002 ) ? PSW_05 : 
  ( n0041 ) ? PSW_10 : 
  ( n1864 ) ? PSW_13 : 
  ( n0052 ) ? PSW_15 : 
  ( n1870 ) ? PSW_24 : 
  ( n0077 ) ? PSW_25 : 
  ( n0079 ) ? PSW_26 : 
  ( n0081 ) ? PSW_27 : 
  ( n0083 ) ? PSW_28 : 
  ( n0085 ) ? PSW_29 : 
  ( n0087 ) ? PSW_2a : 
  ( n0089 ) ? PSW_2b : 
  ( n0091 ) ? PSW_2c : 
  ( n0093 ) ? PSW_2d : 
  ( n0095 ) ? PSW_2e : 
  ( n0097 ) ? PSW_2f : 
  ( n1872 ) ? PSW_33 : 
  ( n1874 ) ? PSW_34 : 
  ( n0103 ) ? PSW_35 : 
  ( n0105 ) ? PSW_36 : 
  ( n0107 ) ? PSW_37 : 
  ( n0109 ) ? PSW_38 : 
  ( n0111 ) ? PSW_39 : 
  ( n0113 ) ? PSW_3a : 
  ( n0115 ) ? PSW_3b : 
  ( n0117 ) ? PSW_3c : 
  ( n0119 ) ? PSW_3d : 
  ( n0121 ) ? PSW_3e : 
  ( n0123 ) ? PSW_3f : 
  ( n0125 ) ? PSW_42 : 
  ( n0127 ) ? PSW_43 : 
  ( n0151 ) ? PSW_52 : 
  ( n0153 ) ? PSW_53 : 
  ( n0177 ) ? PSW_62 : 
  ( n0179 ) ? PSW_63 : 
  ( n0203 ) ? PSW_72 : 
  ( n1884 ) ? PSW_75 : 
  ( n0209 ) ? PSW_82 : 
  ( n1887 ) ? PSW_84 : 
  ( n0211 ) ? PSW_85 : 
  ( n0213 ) ? PSW_86 : 
  ( n0215 ) ? PSW_87 : 
  ( n0217 ) ? PSW_88 : 
  ( n0219 ) ? PSW_89 : 
  ( n0221 ) ? PSW_8a : 
  ( n0223 ) ? PSW_8b : 
  ( n0225 ) ? PSW_8c : 
  ( n0227 ) ? PSW_8d : 
  ( n0229 ) ? PSW_8e : 
  ( n0231 ) ? PSW_8f : 
  ( n0233 ) ? PSW_92 : 
  ( n1891 ) ? PSW_94 : 
  ( n0235 ) ? PSW_95 : 
  ( n0237 ) ? PSW_96 : 
  ( n0239 ) ? PSW_97 : 
  ( n0241 ) ? PSW_98 : 
  ( n0243 ) ? PSW_99 : 
  ( n0245 ) ? PSW_9a : 
  ( n0247 ) ? PSW_9b : 
  ( n0249 ) ? PSW_9c : 
  ( n0251 ) ? PSW_9d : 
  ( n0253 ) ? PSW_9e : 
  ( n0255 ) ? PSW_9f : 
  ( n0257 ) ? PSW_a0 : 
  ( n0259 ) ? PSW_a2 : 
  ( n1893 ) ? PSW_a4 : 
  ( n0281 ) ? PSW_b0 : 
  ( n0283 ) ? PSW_b2 : 
  ( n1961 ) ? PSW_b3 : 
  ( n1963 ) ? PSW_b4 : 
  ( n0285 ) ? PSW_b5 : 
  ( n0287 ) ? PSW_b6 : 
  ( n0289 ) ? PSW_b7 : 
  ( n0291 ) ? PSW_b8 : 
  ( n0293 ) ? PSW_b9 : 
  ( n0295 ) ? PSW_ba : 
  ( n0297 ) ? PSW_bb : 
  ( n0299 ) ? PSW_bc : 
  ( n0301 ) ? PSW_bd : 
  ( n0303 ) ? PSW_be : 
  ( n0305 ) ? PSW_bf : 
  ( n0309 ) ? PSW_c2 : 
  ( n1967 ) ? PSW_c3 : 
  ( n0311 ) ? PSW_c5 : 
  ( n0333 ) ? PSW_d0 : 
  ( n0335 ) ? PSW_d2 : 
  ( n1971 ) ? PSW_d3 : 
  ( n1897 ) ? PSW_d4 : 
  ( n0337 ) ? PSW_d5 : 
  ( n0379 ) ? PSW_ef : 
  ( PSW );
assign WR_ADDR_0_IRAM = ((n0002) && (n0999)) ? (n1064) : ((n0004) ? (n1071) : ((n0009) ? (n1071) : ((n0013) ? (n1073) : ((n0015) ? (n1075) : ((n0017) ? (n1076) : ((n0021) ? (n1077) : ((n0025) ? (n1078) : ((n0029) ? (n1079) : ((n0033) ? (n1080) : ((n0037) ? (n1081) : (((n0041) && (n1088)) ? (n1129) : (((n1909) && (((n1137) != (n1140)))) ? (n1137) : (((n1911) && (((n1137) != (n1140)))) ? (n1137) : (((n0052) && (n0999)) ? (n1064) : ((n0054) ? (n1071) : ((n0056) ? (n1071) : ((n0058) ? (n1073) : ((n0060) ? (n1075) : ((n0062) ? (n1076) : ((n0064) ? (n1077) : ((n0066) ? (n1078) : ((n0068) ? (n1079) : ((n0070) ? (n1080) : ((n0072) ? (n1081) : (((n1915) && (((n1137) != (n1140)))) ? (n1137) : (((n0125) && (n0999)) ? (n1064) : (((n0127) && (n0999)) ? (n1064) : (((n1923) && (((n1137) != (n1140)))) ? (n1137) : (((n0151) && (n0999)) ? (n1064) : (((n0153) && (n0999)) ? (n1064) : (((n0177) && (n0999)) ? (n1064) : (((n0179) && (n0999)) ? (n1064) : (((n1931) && (((n1137) != (n1140)))) ? (n1137) : (((n1884) && (n0999)) ? (n1064) : ((n0205) ? (n1071) : ((n0207) ? (n1071) : ((n1935) ? (n1073) : ((n1937) ? (n1075) : ((n1939) ? (n1076) : ((n1941) ? (n1077) : ((n1943) ? (n1078) : ((n1945) ? (n1079) : ((n1947) ? (n1080) : ((n1949) ? (n1081) : (((n0211) && (n0999)) ? (n1064) : (((n0213) && (n0999)) ? (n1064) : (((n0215) && (n0999)) ? (n1064) : (((n0217) && (n0999)) ? (n1064) : (((n0219) && (n0999)) ? (n1064) : (((n0221) && (n0999)) ? (n1064) : (((n0223) && (n0999)) ? (n1064) : (((n0225) && (n0999)) ? (n1064) : (((n0227) && (n0999)) ? (n1064) : (((n0229) && (n0999)) ? (n1064) : (((n0231) && (n0999)) ? (n1064) : (((n1953) && (((n1137) != (n1140)))) ? (n1137) : (((n0233) && (n1088)) ? (n1129) : ((n0261) ? (n1071) : ((n0263) ? (n1071) : ((n0265) ? (n1073) : ((n0267) ? (n1075) : ((n0269) ? (n1076) : ((n0271) ? (n1077) : ((n0273) ? (n1078) : ((n0275) ? (n1079) : ((n0277) ? (n1080) : ((n0279) ? (n1081) : (((n1959) && (((n1137) != (n1140)))) ? (n1137) : (((n0283) && (n1088)) ? (n1129) : ((n0307) ? (n1137) : (((n0309) && (n1088)) ? (n1129) : (((n0311) && (n0999)) ? (n1064) : ((n0313) ? (n1071) : ((n0315) ? (n1071) : ((n0317) ? (n1073) : ((n0319) ? (n1075) : ((n0321) ? (n1076) : ((n0323) ? (n1077) : ((n0325) ? (n1078) : ((n0327) ? (n1079) : ((n0329) ? (n1080) : ((n0331) ? (n1081) : (((n0333) && (n0999)) ? (n1064) : (((n1969) && (((n1137) != (n1140)))) ? (n1137) : (((n0335) && (n1088)) ? (n1129) : (((n0337) && (n0999)) ? (n1064) : ((n0339) ? (n1071) : ((n0341) ? (n1071) : ((n0343) ? (n1073) : ((n0345) ? (n1075) : ((n0347) ? (n1076) : ((n0349) ? (n1077) : ((n0351) ? (n1078) : ((n0353) ? (n1079) : ((n0355) ? (n1080) : ((n0357) ? (n1081) : (((n0375) && (((n1137) != (n1140)))) ? (n1137) : (((n0379) && (n0999)) ? (n1064) : ((n1973) ? (n1071) : ((n1975) ? (n1076) : ((n1977) ? (n1077) : ((n0381) ? (n1078) : ((n1979) ? (n1079) : ((n1981) ? (n1080) : (n1081)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign WR_DATA_0_IRAM = ((n0002) && (n0999)) ? (n1048) : ((n0004) ? (n1072) : ((n0009) ? (n1072) : ((n0013) ? (n1074) : ((n0015) ? (n1074) : ((n0017) ? (n1074) : ((n0021) ? (n1074) : ((n0025) ? (n1074) : ((n0029) ? (n1074) : ((n0033) ? (n1074) : ((n0037) ? (n1074) : (((n0041) && (n1088)) ? (n1114) : (((n1909) && (((n1137) != (n1140)))) ? (n1138) : (((n1911) && (((n1137) != (n1140)))) ? (n1144) : (((n0052) && (n0999)) ? (n1157) : ((n0054) ? (n1179) : ((n0056) ? (n1179) : ((n0058) ? (n1180) : ((n0060) ? (n1180) : ((n0062) ? (n1180) : ((n0064) ? (n1180) : ((n0066) ? (n1180) : ((n0068) ? (n1180) : ((n0070) ? (n1180) : ((n0072) ? (n1180) : (((n1915) && (((n1137) != (n1140)))) ? (n1138) : (((n0125) && (n0999)) ? (n1371) : (((n0127) && (n0999)) ? (n1392) : (((n1923) && (((n1137) != (n1140)))) ? (n1138) : (((n0151) && (n0999)) ? (n1420) : (((n0153) && (n0999)) ? (n1441) : (((n0177) && (n0999)) ? (n1471) : (((n0179) && (n0999)) ? (n1492) : (((n1931) && (((n1137) != (n1140)))) ? (n1138) : (((n1884) && (n0999)) ? (RD_ROM_2) : ((n0205) ? (RD_ROM_1) : ((n0207) ? (RD_ROM_1) : ((n1935) ? (RD_ROM_1) : ((n1937) ? (RD_ROM_1) : ((n1939) ? (RD_ROM_1) : ((n1941) ? (RD_ROM_1) : ((n1943) ? (RD_ROM_1) : ((n1945) ? (RD_ROM_1) : ((n1947) ? (RD_ROM_1) : ((n1949) ? (RD_ROM_1) : (((n0211) && (n0999)) ? (n1600) : (((n0213) && (n0999)) ? (RD_IRAM_1) : (((n0215) && (n0999)) ? (RD_IRAM_1) : (((n0217) && (n0999)) ? (RD_IRAM_0) : (((n0219) && (n0999)) ? (RD_IRAM_0) : (((n0221) && (n0999)) ? (RD_IRAM_0) : (((n0223) && (n0999)) ? (RD_IRAM_0) : (((n0225) && (n0999)) ? (RD_IRAM_0) : (((n0227) && (n0999)) ? (RD_IRAM_0) : (((n0229) && (n0999)) ? (RD_IRAM_0) : (((n0231) && (n0999)) ? (RD_IRAM_0) : (((n1953) && (((n1137) != (n1140)))) ? (n1138) : (((n0233) && (n1088)) ? (n1667) : ((n0261) ? (n1747) : ((n0263) ? (n1747) : ((n0265) ? (n1047) : ((n0267) ? (n1047) : ((n0269) ? (n1047) : ((n0271) ? (n1047) : ((n0273) ? (n1047) : ((n0275) ? (n1047) : ((n0277) ? (n1047) : ((n0279) ? (n1047) : (((n1959) && (((n1137) != (n1140)))) ? (n1138) : (((n0283) && (n1088)) ? (n1753) : ((n0307) ? (n1047) : (((n0309) && (n1088)) ? (n1114) : (((n0311) && (n0999)) ? (ACC) : ((n0313) ? (ACC) : ((n0315) ? (ACC) : ((n0317) ? (ACC) : ((n0319) ? (ACC) : ((n0321) ? (ACC) : ((n0323) ? (ACC) : ((n0325) ? (ACC) : ((n0327) ? (ACC) : ((n0329) ? (ACC) : ((n0331) ? (ACC) : (((n0333) && (n0999)) ? (RD_IRAM_0) : (((n1969) && (((n1137) != (n1140)))) ? (n1138) : (((n0335) && (n1088)) ? (n1816) : (((n0337) && (n0999)) ? (n1157) : ((n0339) ? (n1854) : ((n0341) ? (n1854) : ((n0343) ? (n1180) : ((n0345) ? (n1180) : ((n0347) ? (n1180) : ((n0349) ? (n1180) : ((n0351) ? (n1180) : ((n0353) ? (n1180) : ((n0355) ? (n1180) : ((n0357) ? (n1180) : (((n0375) && (((n1137) != (n1140)))) ? (n1138) : (((n0379) && (n0999)) ? (ACC) : ((n1973) ? (ACC) : ((n1975) ? (ACC) : ((n1977) ? (ACC) : ((n0381) ? (ACC) : ((n1979) ? (ACC) : ((n1981) ? (ACC) : (ACC)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign WR_COND_0_IRAM = ((n0002) && (n0999)) || (n0004) || (n0009) || (n0013) || (n0015) || (n0017) || (n0021) || (n0025) || (n0029) || (n0033) || (n0037) || ((n0041) && (n1088)) || ((n1909) && (((n1137) != (n1140)))) || ((n1911) && (((n1137) != (n1140)))) || ((n0052) && (n0999)) || (n0054) || (n0056) || (n0058) || (n0060) || (n0062) || (n0064) || (n0066) || (n0068) || (n0070) || (n0072) || ((n1915) && (((n1137) != (n1140)))) || ((n0125) && (n0999)) || ((n0127) && (n0999)) || ((n1923) && (((n1137) != (n1140)))) || ((n0151) && (n0999)) || ((n0153) && (n0999)) || ((n0177) && (n0999)) || ((n0179) && (n0999)) || ((n1931) && (((n1137) != (n1140)))) || ((n1884) && (n0999)) || (n0205) || (n0207) || (n1935) || (n1937) || (n1939) || (n1941) || (n1943) || (n1945) || (n1947) || (n1949) || ((n0211) && (n0999)) || ((n0213) && (n0999)) || ((n0215) && (n0999)) || ((n0217) && (n0999)) || ((n0219) && (n0999)) || ((n0221) && (n0999)) || ((n0223) && (n0999)) || ((n0225) && (n0999)) || ((n0227) && (n0999)) || ((n0229) && (n0999)) || ((n0231) && (n0999)) || ((n1953) && (((n1137) != (n1140)))) || ((n0233) && (n1088)) || (n0261) || (n0263) || (n0265) || (n0267) || (n0269) || (n0271) || (n0273) || (n0275) || (n0277) || (n0279) || ((n1959) && (((n1137) != (n1140)))) || ((n0283) && (n1088)) || (n0307) || ((n0309) && (n1088)) || ((n0311) && (n0999)) || (n0313) || (n0315) || (n0317) || (n0319) || (n0321) || (n0323) || (n0325) || (n0327) || (n0329) || (n0331) || ((n0333) && (n0999)) || ((n1969) && (((n1137) != (n1140)))) || ((n0335) && (n1088)) || ((n0337) && (n0999)) || (n0339) || (n0341) || (n0343) || (n0345) || (n0347) || (n0349) || (n0351) || (n0353) || (n0355) || (n0357) || ((n0375) && (((n1137) != (n1140)))) || ((n0379) && (n0999)) || (n1973) || (n1975) || (n1977) || (n0381) || (n1979) || (n1981) || (n1983);
assign WR_ADDR_1_IRAM = (n1909) ? (n1140) : ((n1911) ? (n1140) : ((n1915) ? (n1140) : ((n1923) ? (n1140) : ((n1931) ? (n1140) : ((n1953) ? (n1140) : ((n1959) ? (n1140) : ((n1969) ? (n1140) : (n1140))))))));
assign WR_DATA_1_IRAM = (n1909) ? (n1141) : ((n1911) ? (n1145) : ((n1915) ? (n1141) : ((n1923) ? (n1141) : ((n1931) ? (n1141) : ((n1953) ? (n1141) : ((n1959) ? (n1141) : ((n1969) ? (n1141) : (n1141))))))));
assign WR_COND_1_IRAM = (n1909) || (n1911) || (n1915) || (n1923) || (n1931) || (n1953) || (n1959) || (n1969) || (n0375);

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
      if (WR_COND_0_IRAM) IRAM[WR_ADDR_0_IRAM] <= WR_DATA_0_IRAM;
      if (WR_COND_1_IRAM) IRAM[WR_ADDR_1_IRAM] <= WR_DATA_1_IRAM;
    end
  end
end

endmodule
