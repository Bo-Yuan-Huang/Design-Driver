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
wire [7:0] ACC_bd;
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
wire [7:0] DPH_b7;
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
wire [7:0] IE_7e;
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
wire [7:0] IP_ef;
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
wire [7:0] P2_32;
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
wire [7:0] P3_0a;
wire [7:0] P3_10;
wire [7:0] P3_15;
wire [7:0] P3_42;
wire [7:0] P3_43;
wire [7:0] P3_4d;
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
wire [7:0] PSW_0d;
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
wire [7:0] PSW_46;
wire [7:0] PSW_52;
wire [7:0] PSW_53;
wire [7:0] PSW_62;
wire [7:0] PSW_63;
wire [7:0] PSW_65;
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
wire [7:0] PSW_c0;
wire [7:0] PSW_c2;
wire [7:0] PSW_c3;
wire [7:0] PSW_c5;
wire [7:0] PSW_ce;
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
wire [7:0] SP_25;
wire [7:0] SP_31;
wire [7:0] SP_32;
wire [7:0] SP_42;
wire [7:0] SP_43;
wire [7:0] SP_51;
wire [7:0] SP_52;
wire [7:0] SP_53;
wire [7:0] SP_62;
wire [7:0] SP_63;
wire [7:0] SP_6c;
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
wire [7:0] SP_ba;
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
wire [7:0] TCON_d3;
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
wire [7:0] TMOD_2d;
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
wire [15:0] n0001;
wire [15:0] n0002;
wire [15:0] n0003;
wire [15:0] n0004;
wire [4:0] n0005;
wire [7:0] n0006;
wire [7:0] n0007;
wire [7:0] n0008;
wire [23:0] n0009;
wire [2:0] n0010;
wire [7:0] n0011;
wire [15:0] n0012;
wire [15:0] n0013;
wire [7:0] n0014;
wire [7:0] n0015;
wire [7:0] n0016;
wire [7:0] n0017;
wire n0018;
wire [0:0] n0019;
wire [0:0] n0020;
wire n0021;
wire [7:0] n0022;
wire [7:0] n0023;
wire n0024;
wire [7:0] n0025;
wire n0026;
wire [7:0] n0027;
wire n0028;
wire [7:0] n0029;
wire n0030;
wire [7:0] n0031;
wire n0032;
wire [7:0] n0033;
wire n0034;
wire [7:0] n0035;
wire n0036;
wire [7:0] n0037;
wire n0038;
wire [7:0] n0039;
wire n0040;
wire [7:0] n0041;
wire n0042;
wire [7:0] n0043;
wire n0044;
wire [7:0] n0045;
wire n0046;
wire [7:0] n0047;
wire n0048;
wire [7:0] n0049;
wire n0050;
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
wire [7:0] n0064;
wire [7:0] n0065;
wire [7:0] n0066;
wire [7:0] n0067;
wire [7:0] n0068;
wire [7:0] n0069;
wire [7:0] n0070;
wire [7:0] n0071;
wire [7:0] n0072;
wire [7:0] n0073;
wire [7:0] n0074;
wire [7:0] n0075;
wire [7:0] n0076;
wire [7:0] n0077;
wire [7:0] n0078;
wire [7:0] n0079;
wire [7:0] n0080;
wire [7:0] n0081;
wire [7:0] n0082;
wire [7:0] n0083;
wire [7:0] n0084;
wire [7:0] n0085;
wire [7:0] n0086;
wire [7:0] n0087;
wire [7:0] n0088;
wire [7:0] n0089;
wire [7:0] n0090;
wire [7:0] n0091;
wire [7:0] n0092;
wire [7:0] n0093;
wire [7:0] n0094;
wire [7:0] n0095;
wire [7:0] n0096;
wire [7:0] n0097;
wire [7:0] n0098;
wire [7:0] n0099;
wire [7:0] n0100;
wire [7:0] n0101;
wire [7:0] n0102;
wire [7:0] n0103;
wire [7:0] n0104;
wire [7:0] n0105;
wire [7:0] n0106;
wire [7:0] n0107;
wire [2:0] n0108;
wire [1:0] n0109;
wire [7:0] n0110;
wire [7:0] n0111;
wire [7:0] n0112;
wire [7:0] n0113;
wire [2:0] n0114;
wire [7:0] n0115;
wire [7:0] n0116;
wire [7:0] n0117;
wire [7:0] n0118;
wire [7:0] n0119;
wire [7:0] n0120;
wire [7:0] n0121;
wire [7:0] n0122;
wire [2:0] n0123;
wire [7:0] n0124;
wire [7:0] n0125;
wire [7:0] n0126;
wire [2:0] n0127;
wire [7:0] n0128;
wire [7:0] n0129;
wire [7:0] n0130;
wire [2:0] n0131;
wire [7:0] n0132;
wire [7:0] n0133;
wire [7:0] n0134;
wire [2:0] n0135;
wire [7:0] n0136;
wire [7:0] n0137;
wire [7:0] n0138;
wire [0:0] n0139;
wire [0:0] n0140;
wire [2:0] n0141;
wire [0:0] n0142;
wire [1:0] n0143;
wire [7:0] n0144;
wire [2:0] n0145;
wire [7:0] n0146;
wire [7:0] n0147;
wire [7:0] n0148;
wire [2:0] n0149;
wire [7:0] n0150;
wire [7:0] n0151;
wire [7:0] n0152;
wire [0:0] n0153;
wire n0154;
wire [4:0] n0155;
wire [7:0] n0156;
wire [7:0] n0157;
wire [7:0] n0158;
wire [7:0] n0159;
wire [7:0] n0160;
wire n0161;
wire [2:0] n0162;
wire [7:0] n0163;
wire [7:0] n0164;
wire [7:0] n0165;
wire [0:0] n0166;
wire n0167;
wire [7:0] n0168;
wire n0169;
wire n0170;
wire n0171;
wire n0172;
wire n0173;
wire n0174;
wire n0175;
wire n0176;
wire n0177;
wire n0178;
wire [7:0] n0179;
wire [7:0] n0180;
wire [7:0] n0181;
wire [7:0] n0182;
wire [7:0] n0183;
wire [7:0] n0184;
wire [7:0] n0185;
wire [7:0] n0186;
wire [7:0] n0187;
wire [7:0] n0188;
wire [7:0] n0189;
wire [7:0] n0190;
wire [7:0] n0191;
wire [7:0] n0192;
wire [7:0] n0193;
wire [7:0] n0194;
wire [7:0] n0195;
wire [7:0] n0196;
wire [7:0] n0197;
wire [0:0] n0198;
wire n0199;
wire [15:0] n0200;
wire [15:0] n0201;
wire [15:0] n0202;
wire [15:0] n0203;
wire [15:0] n0204;
wire [7:0] n0205;
wire [7:0] n0206;
wire [7:0] n0207;
wire [7:0] n0208;
wire [7:0] n0209;
wire [7:0] n0210;
wire [7:0] n0211;
wire [7:0] n0212;
wire [2:0] n0213;
wire [15:0] n0214;
wire [7:0] n0215;
wire [7:0] n0216;
wire [7:0] n0217;
wire [7:0] n0218;
wire [7:0] n0219;
wire [7:0] n0220;
wire [7:0] n0221;
wire [7:0] n0222;
wire [8:0] n0223;
wire [8:0] n0224;
wire [7:0] n0225;
wire [0:0] n0226;
wire [7:0] n0227;
wire [7:0] n0228;
wire [7:0] n0229;
wire [7:0] n0230;
wire [7:0] n0231;
wire [7:0] n0232;
wire [7:0] n0233;
wire [7:0] n0234;
wire [7:0] n0235;
wire [7:0] n0236;
wire [7:0] n0237;
wire [7:0] n0238;
wire [7:0] n0239;
wire [7:0] n0240;
wire [7:0] n0241;
wire [7:0] n0242;
wire [7:0] n0243;
wire [7:0] n0244;
wire [7:0] n0245;
wire [7:0] n0246;
wire [7:0] n0247;
wire [7:0] n0248;
wire [7:0] n0249;
wire [7:0] n0250;
wire [7:0] n0251;
wire [7:0] n0252;
wire [7:0] n0253;
wire [7:0] n0254;
wire [7:0] n0255;
wire [7:0] n0256;
wire [7:0] n0257;
wire [7:0] n0258;
wire [7:0] n0259;
wire [7:0] n0260;
wire [7:0] n0261;
wire [7:0] n0262;
wire [7:0] n0263;
wire [15:0] n0264;
wire [7:0] n0265;
wire [7:0] n0266;
wire [7:0] n0267;
wire [8:0] n0268;
wire [8:0] n0269;
wire [8:0] n0270;
wire [8:0] n0271;
wire [8:0] n0272;
wire [0:0] n0273;
wire [3:0] n0274;
wire [4:0] n0275;
wire [3:0] n0276;
wire [4:0] n0277;
wire [4:0] n0278;
wire [4:0] n0279;
wire [4:0] n0280;
wire [0:0] n0281;
wire [8:0] n0282;
wire [8:0] n0283;
wire [8:0] n0284;
wire [8:0] n0285;
wire [0:0] n0286;
wire [0:0] n0287;
wire n0288;
wire n0289;
wire [0:0] n0290;
wire [7:0] n0291;
wire [7:0] n0292;
wire n0293;
wire [0:0] n0294;
wire n0295;
wire [7:0] n0296;
wire n0297;
wire n0298;
wire n0299;
wire n0300;
wire n0301;
wire n0302;
wire n0303;
wire n0304;
wire n0305;
wire n0306;
wire n0307;
wire n0308;
wire n0309;
wire n0310;
wire n0311;
wire n0312;
wire n0313;
wire n0314;
wire n0315;
wire n0316;
wire [7:0] n0317;
wire [7:0] n0318;
wire [7:0] n0319;
wire [7:0] n0320;
wire [7:0] n0321;
wire [7:0] n0322;
wire [7:0] n0323;
wire [7:0] n0324;
wire [7:0] n0325;
wire [7:0] n0326;
wire [7:0] n0327;
wire [7:0] n0328;
wire [7:0] n0329;
wire [7:0] n0330;
wire [7:0] n0331;
wire [7:0] n0332;
wire [7:0] n0333;
wire [7:0] n0334;
wire [7:0] n0335;
wire [7:0] n0336;
wire [7:0] n0337;
wire [7:0] n0338;
wire [7:0] n0339;
wire [7:0] n0340;
wire [8:0] n0341;
wire [8:0] n0342;
wire [8:0] n0343;
wire [0:0] n0344;
wire [3:0] n0345;
wire [4:0] n0346;
wire [4:0] n0347;
wire [4:0] n0348;
wire [4:0] n0349;
wire [0:0] n0350;
wire [8:0] n0351;
wire [8:0] n0352;
wire [8:0] n0353;
wire [0:0] n0354;
wire [0:0] n0355;
wire n0356;
wire n0357;
wire [0:0] n0358;
wire [7:0] n0359;
wire [7:0] n0360;
wire [8:0] n0361;
wire [8:0] n0362;
wire [8:0] n0363;
wire [0:0] n0364;
wire [3:0] n0365;
wire [4:0] n0366;
wire [4:0] n0367;
wire [4:0] n0368;
wire [0:0] n0369;
wire [8:0] n0370;
wire [8:0] n0371;
wire [8:0] n0372;
wire [0:0] n0373;
wire [0:0] n0374;
wire n0375;
wire n0376;
wire [0:0] n0377;
wire [7:0] n0378;
wire [7:0] n0379;
wire [8:0] n0380;
wire [8:0] n0381;
wire [8:0] n0382;
wire [8:0] n0383;
wire [0:0] n0384;
wire [3:0] n0385;
wire [4:0] n0386;
wire [4:0] n0387;
wire [4:0] n0388;
wire [0:0] n0389;
wire [8:0] n0390;
wire [8:0] n0391;
wire [8:0] n0392;
wire [0:0] n0393;
wire [0:0] n0394;
wire n0395;
wire n0396;
wire [0:0] n0397;
wire [7:0] n0398;
wire [7:0] n0399;
wire [8:0] n0400;
wire [8:0] n0401;
wire [8:0] n0402;
wire [0:0] n0403;
wire [3:0] n0404;
wire [4:0] n0405;
wire [4:0] n0406;
wire [4:0] n0407;
wire [0:0] n0408;
wire [8:0] n0409;
wire [8:0] n0410;
wire [8:0] n0411;
wire [0:0] n0412;
wire [0:0] n0413;
wire n0414;
wire n0415;
wire [0:0] n0416;
wire [7:0] n0417;
wire [7:0] n0418;
wire [8:0] n0419;
wire [8:0] n0420;
wire [8:0] n0421;
wire [0:0] n0422;
wire [3:0] n0423;
wire [4:0] n0424;
wire [4:0] n0425;
wire [4:0] n0426;
wire [0:0] n0427;
wire [8:0] n0428;
wire [8:0] n0429;
wire [8:0] n0430;
wire [0:0] n0431;
wire [0:0] n0432;
wire n0433;
wire n0434;
wire [0:0] n0435;
wire [7:0] n0436;
wire [7:0] n0437;
wire [8:0] n0438;
wire [8:0] n0439;
wire [8:0] n0440;
wire [0:0] n0441;
wire [3:0] n0442;
wire [4:0] n0443;
wire [4:0] n0444;
wire [4:0] n0445;
wire [0:0] n0446;
wire [8:0] n0447;
wire [8:0] n0448;
wire [8:0] n0449;
wire [0:0] n0450;
wire [0:0] n0451;
wire n0452;
wire n0453;
wire [0:0] n0454;
wire [7:0] n0455;
wire [7:0] n0456;
wire [8:0] n0457;
wire [8:0] n0458;
wire [8:0] n0459;
wire [0:0] n0460;
wire [3:0] n0461;
wire [4:0] n0462;
wire [4:0] n0463;
wire [4:0] n0464;
wire [0:0] n0465;
wire [8:0] n0466;
wire [8:0] n0467;
wire [8:0] n0468;
wire [0:0] n0469;
wire [0:0] n0470;
wire n0471;
wire n0472;
wire [0:0] n0473;
wire [7:0] n0474;
wire [7:0] n0475;
wire [8:0] n0476;
wire [8:0] n0477;
wire [8:0] n0478;
wire [0:0] n0479;
wire [3:0] n0480;
wire [4:0] n0481;
wire [4:0] n0482;
wire [4:0] n0483;
wire [0:0] n0484;
wire [8:0] n0485;
wire [8:0] n0486;
wire [8:0] n0487;
wire [0:0] n0488;
wire [0:0] n0489;
wire n0490;
wire n0491;
wire [0:0] n0492;
wire [7:0] n0493;
wire [7:0] n0494;
wire [7:0] n0495;
wire [8:0] n0496;
wire [8:0] n0497;
wire [8:0] n0498;
wire [0:0] n0499;
wire [3:0] n0500;
wire [4:0] n0501;
wire [4:0] n0502;
wire [4:0] n0503;
wire [0:0] n0504;
wire [8:0] n0505;
wire [8:0] n0506;
wire [8:0] n0507;
wire [0:0] n0508;
wire [0:0] n0509;
wire n0510;
wire n0511;
wire [0:0] n0512;
wire [7:0] n0513;
wire [7:0] n0514;
wire [8:0] n0515;
wire [8:0] n0516;
wire [8:0] n0517;
wire [0:0] n0518;
wire [3:0] n0519;
wire [4:0] n0520;
wire [4:0] n0521;
wire [4:0] n0522;
wire [0:0] n0523;
wire [8:0] n0524;
wire [8:0] n0525;
wire [8:0] n0526;
wire [0:0] n0527;
wire [0:0] n0528;
wire n0529;
wire n0530;
wire [0:0] n0531;
wire [7:0] n0532;
wire [7:0] n0533;
wire [8:0] n0534;
wire [8:0] n0535;
wire [8:0] n0536;
wire [0:0] n0537;
wire [3:0] n0538;
wire [4:0] n0539;
wire [4:0] n0540;
wire [4:0] n0541;
wire [0:0] n0542;
wire [8:0] n0543;
wire [8:0] n0544;
wire [8:0] n0545;
wire [0:0] n0546;
wire [0:0] n0547;
wire n0548;
wire n0549;
wire [0:0] n0550;
wire [7:0] n0551;
wire n0552;
wire [15:0] n0553;
wire [7:0] n0554;
wire [8:0] n0555;
wire [8:0] n0556;
wire [7:0] n0557;
wire [0:0] n0558;
wire [7:0] n0559;
wire [7:0] n0560;
wire [7:0] n0561;
wire [7:0] n0562;
wire [8:0] n0563;
wire [8:0] n0564;
wire [8:0] n0565;
wire [0:0] n0566;
wire [4:0] n0567;
wire [4:0] n0568;
wire [4:0] n0569;
wire [0:0] n0570;
wire [8:0] n0571;
wire [8:0] n0572;
wire [0:0] n0573;
wire [0:0] n0574;
wire n0575;
wire n0576;
wire [0:0] n0577;
wire [7:0] n0578;
wire [7:0] n0579;
wire [7:0] n0580;
wire [8:0] n0581;
wire [8:0] n0582;
wire [0:0] n0583;
wire [4:0] n0584;
wire [4:0] n0585;
wire [0:0] n0586;
wire [8:0] n0587;
wire [8:0] n0588;
wire [0:0] n0589;
wire [0:0] n0590;
wire n0591;
wire n0592;
wire [0:0] n0593;
wire [7:0] n0594;
wire [7:0] n0595;
wire [7:0] n0596;
wire [8:0] n0597;
wire [8:0] n0598;
wire [0:0] n0599;
wire [4:0] n0600;
wire [4:0] n0601;
wire [0:0] n0602;
wire [8:0] n0603;
wire [8:0] n0604;
wire [0:0] n0605;
wire [0:0] n0606;
wire n0607;
wire n0608;
wire [0:0] n0609;
wire [7:0] n0610;
wire [7:0] n0611;
wire [7:0] n0612;
wire [8:0] n0613;
wire [8:0] n0614;
wire [0:0] n0615;
wire [4:0] n0616;
wire [4:0] n0617;
wire [0:0] n0618;
wire [8:0] n0619;
wire [8:0] n0620;
wire [0:0] n0621;
wire [0:0] n0622;
wire n0623;
wire n0624;
wire [0:0] n0625;
wire [7:0] n0626;
wire [7:0] n0627;
wire [7:0] n0628;
wire [8:0] n0629;
wire [8:0] n0630;
wire [0:0] n0631;
wire [4:0] n0632;
wire [4:0] n0633;
wire [0:0] n0634;
wire [8:0] n0635;
wire [8:0] n0636;
wire [0:0] n0637;
wire [0:0] n0638;
wire n0639;
wire n0640;
wire [0:0] n0641;
wire [7:0] n0642;
wire [7:0] n0643;
wire [7:0] n0644;
wire [8:0] n0645;
wire [8:0] n0646;
wire [0:0] n0647;
wire [4:0] n0648;
wire [4:0] n0649;
wire [0:0] n0650;
wire [8:0] n0651;
wire [8:0] n0652;
wire [0:0] n0653;
wire [0:0] n0654;
wire n0655;
wire n0656;
wire [0:0] n0657;
wire [7:0] n0658;
wire [7:0] n0659;
wire [7:0] n0660;
wire [8:0] n0661;
wire [8:0] n0662;
wire [0:0] n0663;
wire [4:0] n0664;
wire [4:0] n0665;
wire [0:0] n0666;
wire [8:0] n0667;
wire [8:0] n0668;
wire [0:0] n0669;
wire [0:0] n0670;
wire n0671;
wire n0672;
wire [0:0] n0673;
wire [7:0] n0674;
wire [7:0] n0675;
wire [7:0] n0676;
wire [8:0] n0677;
wire [8:0] n0678;
wire [0:0] n0679;
wire [4:0] n0680;
wire [4:0] n0681;
wire [0:0] n0682;
wire [8:0] n0683;
wire [8:0] n0684;
wire [0:0] n0685;
wire [0:0] n0686;
wire n0687;
wire n0688;
wire [0:0] n0689;
wire [7:0] n0690;
wire [7:0] n0691;
wire [7:0] n0692;
wire [8:0] n0693;
wire [8:0] n0694;
wire [0:0] n0695;
wire [4:0] n0696;
wire [4:0] n0697;
wire [0:0] n0698;
wire [8:0] n0699;
wire [8:0] n0700;
wire [0:0] n0701;
wire [0:0] n0702;
wire n0703;
wire n0704;
wire [0:0] n0705;
wire [7:0] n0706;
wire [7:0] n0707;
wire [7:0] n0708;
wire [8:0] n0709;
wire [8:0] n0710;
wire [0:0] n0711;
wire [4:0] n0712;
wire [4:0] n0713;
wire [0:0] n0714;
wire [8:0] n0715;
wire [8:0] n0716;
wire [0:0] n0717;
wire [0:0] n0718;
wire n0719;
wire n0720;
wire [0:0] n0721;
wire [7:0] n0722;
wire [7:0] n0723;
wire [7:0] n0724;
wire [8:0] n0725;
wire [8:0] n0726;
wire [0:0] n0727;
wire [4:0] n0728;
wire [4:0] n0729;
wire [0:0] n0730;
wire [8:0] n0731;
wire [8:0] n0732;
wire [0:0] n0733;
wire [0:0] n0734;
wire n0735;
wire n0736;
wire [0:0] n0737;
wire [7:0] n0738;
wire [7:0] n0739;
wire [7:0] n0740;
wire [8:0] n0741;
wire [8:0] n0742;
wire [0:0] n0743;
wire [4:0] n0744;
wire [4:0] n0745;
wire [0:0] n0746;
wire [8:0] n0747;
wire [8:0] n0748;
wire [0:0] n0749;
wire [0:0] n0750;
wire n0751;
wire n0752;
wire [0:0] n0753;
wire [7:0] n0754;
wire n0755;
wire [15:0] n0756;
wire [15:0] n0757;
wire [15:0] n0758;
wire [7:0] n0759;
wire [7:0] n0760;
wire [7:0] n0761;
wire [7:0] n0762;
wire [7:0] n0763;
wire [7:0] n0764;
wire [7:0] n0765;
wire [7:0] n0766;
wire [7:0] n0767;
wire [7:0] n0768;
wire [7:0] n0769;
wire [7:0] n0770;
wire [7:0] n0771;
wire [7:0] n0772;
wire [7:0] n0773;
wire [7:0] n0774;
wire [7:0] n0775;
wire [7:0] n0776;
wire [7:0] n0777;
wire [7:0] n0778;
wire [7:0] n0779;
wire [7:0] n0780;
wire [7:0] n0781;
wire [7:0] n0782;
wire [7:0] n0783;
wire [7:0] n0784;
wire [7:0] n0785;
wire [7:0] n0786;
wire [7:0] n0787;
wire [7:0] n0788;
wire [7:0] n0789;
wire [7:0] n0790;
wire [7:0] n0791;
wire [7:0] n0792;
wire [7:0] n0793;
wire [7:0] n0794;
wire [7:0] n0795;
wire [7:0] n0796;
wire [7:0] n0797;
wire [7:0] n0798;
wire [7:0] n0799;
wire [7:0] n0800;
wire [7:0] n0801;
wire [7:0] n0802;
wire [7:0] n0803;
wire [7:0] n0804;
wire [7:0] n0805;
wire [7:0] n0806;
wire [7:0] n0807;
wire [7:0] n0808;
wire [7:0] n0809;
wire [7:0] n0810;
wire [7:0] n0811;
wire [7:0] n0812;
wire [7:0] n0813;
wire [7:0] n0814;
wire n0815;
wire [15:0] n0816;
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
wire [7:0] n0857;
wire [7:0] n0858;
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
wire n0872;
wire [15:0] n0873;
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
wire [7:0] n0906;
wire [7:0] n0907;
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
wire n0931;
wire [15:0] n0932;
wire [0:0] n0933;
wire [6:0] n0934;
wire [7:0] n0935;
wire [15:0] n0936;
wire [15:0] n0937;
wire [15:0] n0938;
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
wire [7:0] n0957;
wire [7:0] n0958;
wire [7:0] n0959;
wire [7:0] n0960;
wire [0:0] n0961;
wire [7:0] n0962;
wire [15:0] n0963;
wire [7:0] n0964;
wire n0965;
wire [7:0] n0966;
wire [7:0] n0967;
wire [7:0] n0968;
wire [7:0] n0969;
wire [7:0] n0970;
wire [3:0] n0971;
wire [0:0] n0972;
wire [7:0] n0973;
wire [7:0] n0974;
wire [7:0] n0975;
wire [7:0] n0976;
wire [7:0] n0977;
wire [7:0] n0978;
wire [7:0] n0979;
wire [7:0] n0980;
wire [7:0] n0981;
wire [7:0] n0982;
wire [7:0] n0983;
wire [7:0] n0984;
wire [7:0] n0985;
wire [7:0] n0986;
wire [7:0] n0987;
wire [7:0] n0988;
wire [7:0] n0989;
wire [7:0] n0990;
wire [7:0] n0991;
wire [7:0] n0992;
wire [7:0] n0993;
wire [7:0] n0994;
wire [7:0] n0995;
wire [7:0] n0996;
wire [7:0] n0997;
wire [7:0] n0998;
wire [7:0] n0999;
wire [7:0] n1000;
wire [7:0] n1001;
wire [7:0] n1002;
wire [7:0] n1003;
wire [7:0] n1004;
wire [7:0] n1005;
wire [7:0] n1006;
wire [7:0] n1007;
wire [7:0] n1008;
wire [7:0] n1009;
wire [7:0] n1010;
wire [7:0] n1011;
wire [7:0] n1012;
wire [7:0] n1013;
wire [7:0] n1014;
wire [7:0] n1015;
wire [7:0] n1016;
wire [7:0] n1017;
wire [7:0] n1018;
wire [7:0] n1019;
wire [7:0] n1020;
wire [7:0] n1021;
wire [7:0] n1022;
wire [7:0] n1023;
wire [7:0] n1024;
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
wire [7:0] n1123;
wire [7:0] n1124;
wire [7:0] n1125;
wire [7:0] n1126;
wire [7:0] n1127;
wire [7:0] n1128;
wire [7:0] n1129;
wire [7:0] n1130;
wire [7:0] n1131;
wire [7:0] n1132;
wire [7:0] n1133;
wire [7:0] n1134;
wire [7:0] n1135;
wire [7:0] n1136;
wire [7:0] n1137;
wire [7:0] n1138;
wire [7:0] n1139;
wire [7:0] n1140;
wire [7:0] n1141;
wire [7:0] n1142;
wire [7:0] n1143;
wire [7:0] n1144;
wire [7:0] n1145;
wire [7:0] n1146;
wire [7:0] n1147;
wire [7:0] n1148;
wire [7:0] n1149;
wire [7:0] n1150;
wire [7:0] n1151;
wire [7:0] n1152;
wire [7:0] n1153;
wire [7:0] n1154;
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
wire [7:0] n1181;
wire [7:0] n1182;
wire [7:0] n1183;
wire [7:0] n1184;
wire [7:0] n1185;
wire [7:0] n1186;
wire [7:0] n1187;
wire [7:0] n1188;
wire [7:0] n1189;
wire [7:0] n1190;
wire [7:0] n1191;
wire [7:0] n1192;
wire [7:0] n1193;
wire [7:0] n1194;
wire [7:0] n1195;
wire [7:0] n1196;
wire [7:0] n1197;
wire [7:0] n1198;
wire [7:0] n1199;
wire [7:0] n1200;
wire [7:0] n1201;
wire [7:0] n1202;
wire [7:0] n1203;
wire [7:0] n1204;
wire [7:0] n1205;
wire [7:0] n1206;
wire [7:0] n1207;
wire [7:0] n1208;
wire [7:0] n1209;
wire [7:0] n1210;
wire [7:0] n1211;
wire [7:0] n1212;
wire [7:0] n1213;
wire [7:0] n1214;
wire [7:0] n1215;
wire [7:0] n1216;
wire [7:0] n1217;
wire [7:0] n1218;
wire [7:0] n1219;
wire [15:0] n1220;
wire [7:0] n1221;
wire [7:0] n1222;
wire [7:0] n1223;
wire [7:0] n1224;
wire n1225;
wire [0:0] n1226;
wire n1227;
wire [0:0] n1228;
wire [8:0] n1229;
wire [0:0] n1230;
wire [0:0] n1231;
wire n1232;
wire n1233;
wire [0:0] n1234;
wire [7:0] n1235;
wire [7:0] n1236;
wire [7:0] n1237;
wire n1238;
wire [0:0] n1239;
wire n1240;
wire [0:0] n1241;
wire [8:0] n1242;
wire [0:0] n1243;
wire [0:0] n1244;
wire n1245;
wire n1246;
wire [0:0] n1247;
wire [7:0] n1248;
wire [7:0] n1249;
wire [7:0] n1250;
wire n1251;
wire [0:0] n1252;
wire n1253;
wire [0:0] n1254;
wire [8:0] n1255;
wire [0:0] n1256;
wire [0:0] n1257;
wire n1258;
wire n1259;
wire [0:0] n1260;
wire [7:0] n1261;
wire [7:0] n1262;
wire [7:0] n1263;
wire n1264;
wire [0:0] n1265;
wire n1266;
wire [0:0] n1267;
wire [8:0] n1268;
wire [0:0] n1269;
wire [0:0] n1270;
wire n1271;
wire n1272;
wire [0:0] n1273;
wire [7:0] n1274;
wire [7:0] n1275;
wire [7:0] n1276;
wire n1277;
wire [0:0] n1278;
wire n1279;
wire [0:0] n1280;
wire [8:0] n1281;
wire [0:0] n1282;
wire [0:0] n1283;
wire n1284;
wire n1285;
wire [0:0] n1286;
wire [7:0] n1287;
wire [7:0] n1288;
wire [7:0] n1289;
wire n1290;
wire [0:0] n1291;
wire n1292;
wire [0:0] n1293;
wire [8:0] n1294;
wire [0:0] n1295;
wire [0:0] n1296;
wire n1297;
wire n1298;
wire [0:0] n1299;
wire [7:0] n1300;
wire [7:0] n1301;
wire [7:0] n1302;
wire n1303;
wire [0:0] n1304;
wire n1305;
wire [0:0] n1306;
wire [8:0] n1307;
wire [0:0] n1308;
wire [0:0] n1309;
wire n1310;
wire n1311;
wire [0:0] n1312;
wire [7:0] n1313;
wire [7:0] n1314;
wire [7:0] n1315;
wire n1316;
wire [0:0] n1317;
wire n1318;
wire [0:0] n1319;
wire [8:0] n1320;
wire [0:0] n1321;
wire [0:0] n1322;
wire n1323;
wire n1324;
wire [0:0] n1325;
wire [7:0] n1326;
wire [7:0] n1327;
wire [7:0] n1328;
wire n1329;
wire [0:0] n1330;
wire n1331;
wire [0:0] n1332;
wire [8:0] n1333;
wire [0:0] n1334;
wire [0:0] n1335;
wire n1336;
wire n1337;
wire [0:0] n1338;
wire [7:0] n1339;
wire [7:0] n1340;
wire [7:0] n1341;
wire n1342;
wire [0:0] n1343;
wire n1344;
wire [0:0] n1345;
wire [8:0] n1346;
wire [0:0] n1347;
wire [0:0] n1348;
wire n1349;
wire n1350;
wire [0:0] n1351;
wire [7:0] n1352;
wire [7:0] n1353;
wire [7:0] n1354;
wire n1355;
wire [0:0] n1356;
wire n1357;
wire [0:0] n1358;
wire [8:0] n1359;
wire [0:0] n1360;
wire [0:0] n1361;
wire n1362;
wire n1363;
wire [0:0] n1364;
wire [7:0] n1365;
wire [7:0] n1366;
wire [7:0] n1367;
wire n1368;
wire [0:0] n1369;
wire n1370;
wire [0:0] n1371;
wire [8:0] n1372;
wire [0:0] n1373;
wire [0:0] n1374;
wire n1375;
wire n1376;
wire [0:0] n1377;
wire [7:0] n1378;
wire [0:0] n1379;
wire [0:0] n1380;
wire [7:0] n1381;
wire [7:0] n1382;
wire [15:0] n1383;
wire [7:0] n1384;
wire [7:0] n1385;
wire [15:0] n1386;
wire [15:0] n1387;
wire [7:0] n1388;
wire [7:0] n1389;
wire n1390;
wire n1391;
wire [0:0] n1392;
wire [7:0] n1393;
wire [0:0] n1394;
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
wire [0:0] n1410;
wire [7:0] n1411;
wire n1412;
wire n1413;
wire [15:0] n1414;
wire n1415;
wire [0:0] n1416;
wire [7:0] n1417;
wire n1418;
wire n1419;
wire [15:0] n1420;
wire n1421;
wire [0:0] n1422;
wire [7:0] n1423;
wire n1424;
wire n1425;
wire [15:0] n1426;
wire n1427;
wire [0:0] n1428;
wire [7:0] n1429;
wire [7:0] n1430;
wire n1431;
wire n1432;
wire [15:0] n1433;
wire n1434;
wire [0:0] n1435;
wire [7:0] n1436;
wire n1437;
wire n1438;
wire [15:0] n1439;
wire n1440;
wire [0:0] n1441;
wire [7:0] n1442;
wire n1443;
wire n1444;
wire [15:0] n1445;
wire n1446;
wire [0:0] n1447;
wire [7:0] n1448;
wire n1449;
wire n1450;
wire [15:0] n1451;
wire n1452;
wire [0:0] n1453;
wire [7:0] n1454;
wire n1455;
wire n1456;
wire [15:0] n1457;
wire n1458;
wire [0:0] n1459;
wire [7:0] n1460;
wire n1461;
wire n1462;
wire [15:0] n1463;
wire n1464;
wire [0:0] n1465;
wire [7:0] n1466;
wire [7:0] n1467;
wire n1468;
wire n1469;
wire [15:0] n1470;
wire n1471;
wire [0:0] n1472;
wire [7:0] n1473;
wire n1474;
wire n1475;
wire [15:0] n1476;
wire n1477;
wire [0:0] n1478;
wire [7:0] n1479;
wire n1480;
wire n1481;
wire [15:0] n1482;
wire n1483;
wire [0:0] n1484;
wire [7:0] n1485;
wire [7:0] n1486;
wire [3:0] n1487;
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
wire [7:0] n1518;
wire [7:0] n1519;
wire [7:0] n1520;
wire [7:0] n1521;
wire [7:0] n1522;
wire [7:0] n1523;
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
wire n1545;
wire [3:0] n1546;
wire n1547;
wire n1548;
wire [8:0] n1549;
wire [8:0] n1550;
wire [8:0] n1551;
wire [0:0] n1552;
wire [0:0] n1553;
wire n1554;
wire [3:0] n1555;
wire n1556;
wire n1557;
wire [8:0] n1558;
wire [8:0] n1559;
wire [8:0] n1560;
wire [7:0] n1561;
wire [0:0] n1562;
wire [0:0] n1563;
wire [7:0] n1564;
wire n1565;
wire n1566;
wire [15:0] n1567;
wire [7:0] n1568;
wire [3:0] n1569;
wire [7:0] n1570;
wire [7:0] n1571;
wire [3:0] n1572;
wire [7:0] n1573;
wire n1574;
wire n1575;
wire [15:0] n1576;
wire n1577;
wire n1578;
wire [15:0] n1579;
wire n1580;
wire n1581;
wire [15:0] n1582;
wire n1583;
wire n1584;
wire [15:0] n1585;
wire n1586;
wire n1587;
wire [15:0] n1588;
wire n1589;
wire n1590;
wire [15:0] n1591;
wire n1592;
wire n1593;
wire [15:0] n1594;
wire n1595;
wire n1596;
wire [15:0] n1597;
wire [7:0] n1598;
wire [7:0] n1599;
wire [7:0] n1600;
wire [7:0] n1601;
wire n1602;
wire [7:0] n1603;
wire n1604;
wire [7:0] n1605;
wire n1606;
wire [7:0] n1607;
wire n1608;
wire [7:0] n1609;
wire n1610;
wire [7:0] n1611;
wire n1612;
wire [7:0] n1613;
wire n1614;
wire [7:0] n1615;
wire n1616;
wire [7:0] n1617;
wire n1618;
wire [7:0] n1619;
wire n1620;
wire [7:0] n1621;
wire n1622;
wire [7:0] n1623;
wire n1624;
wire [7:0] n1625;
wire n1626;
wire [7:0] n1627;
wire n1628;
wire [7:0] n1629;
wire n1630;
wire [7:0] n1631;
wire n1632;
wire [7:0] n1633;
wire n1634;
wire [7:0] n1635;
wire n1636;
wire [7:0] n1637;
wire n1638;
wire [7:0] n1639;
wire n1640;
wire [7:0] n1641;
wire n1642;
wire [7:0] n1643;
wire n1644;
wire [7:0] n1645;
wire n1646;
wire [7:0] n1647;
wire n1648;
wire [7:0] n1649;
wire n1650;
wire [7:0] n1651;
wire n1652;
wire [7:0] n1653;
wire n1654;
wire [7:0] n1655;
wire n1656;
wire [7:0] n1657;
wire n1658;
wire [7:0] n1659;
wire n1660;
wire [7:0] n1661;
wire n1662;
wire [7:0] n1663;
wire n1664;
wire [7:0] n1665;
wire n1666;
wire [7:0] n1667;
wire n1668;
wire [7:0] n1669;
wire n1670;
wire [7:0] n1671;
wire n1672;
wire [7:0] n1673;
wire n1674;
wire [7:0] n1675;
wire n1676;
wire [7:0] n1677;
wire n1678;
wire [7:0] n1679;
wire n1680;
wire [7:0] n1681;
wire n1682;
wire [7:0] n1683;
wire n1684;
wire [7:0] n1685;
wire n1686;
wire [7:0] n1687;
wire n1688;
wire [7:0] n1689;
wire n1690;
wire [7:0] n1691;
wire n1692;
wire [7:0] n1693;
wire n1694;
wire [7:0] n1695;
wire n1696;
wire [7:0] n1697;
wire n1698;
wire [7:0] n1699;
wire n1700;
wire [7:0] n1701;
wire n1702;
wire [7:0] n1703;
wire n1704;
wire [7:0] n1705;
wire n1706;
wire [7:0] n1707;
wire n1708;
wire [7:0] n1709;
wire n1710;
wire [7:0] n1711;
wire n1712;
wire [7:0] n1713;
wire n1714;
wire [7:0] n1715;
wire n1716;
wire [7:0] n1717;
wire n1718;
wire [7:0] n1719;
wire n1720;
wire [7:0] n1721;
wire n1722;
wire [7:0] n1723;
wire n1724;
wire [7:0] n1725;
wire n1726;
wire [7:0] n1727;
wire n1728;
wire [7:0] n1729;
wire n1730;
wire [7:0] n1731;
wire n1732;
wire [7:0] n1733;
wire n1734;
wire [7:0] n1735;
wire n1736;
wire [7:0] n1737;
wire n1738;
wire [7:0] n1739;
wire n1740;
wire [7:0] n1741;
wire n1742;
wire [7:0] n1743;
wire n1744;
wire [7:0] n1745;
wire n1746;
wire [7:0] n1747;
wire n1748;
wire [7:0] n1749;
wire n1750;
wire n1751;
wire [7:0] n1752;
wire n1753;
wire [7:0] n1754;
wire n1755;
wire [7:0] n1756;
wire n1757;
wire n1758;
wire n1759;
wire n1760;
wire n1761;
wire n1762;
wire n1763;
wire n1764;
wire [7:0] n1765;
wire n1766;
wire [7:0] n1767;
wire n1768;
wire [7:0] n1769;
wire n1770;
wire [7:0] n1771;
wire n1772;
wire [7:0] n1773;
wire n1774;
wire [7:0] n1775;
wire n1776;
wire [7:0] n1777;
wire n1778;
wire [7:0] n1779;
wire n1780;
wire n1781;
wire n1782;
wire [7:0] n1783;
wire n1784;
wire [7:0] n1785;
wire n1786;
wire [7:0] n1787;
wire n1788;
wire [7:0] n1789;
wire n1790;
wire [7:0] n1791;
wire n1792;
wire [7:0] n1793;
wire n1794;
wire [7:0] n1795;
wire n1796;
wire [7:0] n1797;
wire n1798;
wire [7:0] n1799;
wire n1800;
wire [7:0] n1801;
wire n1802;
wire [7:0] n1803;
wire n1804;
wire [7:0] n1805;
wire n1806;
wire [7:0] n1807;
wire n1808;
wire [7:0] n1809;
wire n1810;
wire [7:0] n1811;
wire n1812;
wire [7:0] n1813;
wire n1814;
wire [7:0] n1815;
wire n1816;
wire [7:0] n1817;
wire n1818;
wire [7:0] n1819;
wire n1820;
wire [7:0] n1821;
wire n1822;
wire [7:0] n1823;
wire n1824;
wire [7:0] n1825;
wire n1826;
wire n1827;
wire [7:0] n1828;
wire n1829;
wire [7:0] n1830;
wire n1831;
wire [7:0] n1832;
wire n1833;
wire [7:0] n1834;
wire n1835;
wire [7:0] n1836;
wire n1837;
wire [7:0] n1838;
wire n1839;
wire [7:0] n1840;
wire n1841;
wire [7:0] n1842;
wire n1843;
wire [7:0] n1844;
wire n1845;
wire [7:0] n1846;
wire n1847;
wire [7:0] n1848;
wire n1849;
wire [7:0] n1850;
wire n1851;
wire [7:0] n1852;
wire n1853;
wire [7:0] n1854;
wire n1855;
wire [7:0] n1856;
wire n1857;
wire [7:0] n1858;
wire n1859;
wire [7:0] n1860;
wire n1861;
wire [7:0] n1862;
wire n1863;
wire [7:0] n1864;
wire n1865;
wire [7:0] n1866;
wire n1867;
wire [7:0] n1868;
wire n1869;
wire n1870;
wire [7:0] n1871;
wire n1872;
wire [7:0] n1873;
wire n1874;
wire [7:0] n1875;
wire n1876;
wire n1877;
wire n1878;
wire n1879;
wire [7:0] n1880;
wire n1881;
wire [7:0] n1882;
wire n1883;
wire [7:0] n1884;
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
wire [7:0] n1902;
wire n1903;
wire [7:0] n1904;
wire n1905;
wire [7:0] n1906;
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
wire n1924;
wire [7:0] n1925;
wire n1926;
wire [7:0] n1927;
wire n1928;
wire [7:0] n1929;
wire n1930;
wire [7:0] n1931;
wire n1932;
wire [7:0] n1933;
wire n1934;
wire [7:0] n1935;
wire n1936;
wire [7:0] n1937;
wire n1938;
wire [7:0] n1939;
wire n1940;
wire [7:0] n1941;
wire n1942;
wire [7:0] n1943;
wire n1944;
wire [7:0] n1945;
wire n1946;
wire [7:0] n1947;
wire n1948;
wire [7:0] n1949;
wire n1950;
wire [7:0] n1951;
wire n1952;
wire [7:0] n1953;
wire n1954;
wire [7:0] n1955;
wire n1956;
wire [7:0] n1957;
wire n1958;
wire [7:0] n1959;
wire n1960;
wire [7:0] n1961;
wire n1962;
wire [7:0] n1963;
wire n1964;
wire [7:0] n1965;
wire n1966;
wire [7:0] n1967;
wire n1968;
wire [7:0] n1969;
wire n1970;
wire [7:0] n1971;
wire n1972;
wire [7:0] n1973;
wire n1974;
wire n1975;
wire n1976;
wire n1977;
wire [7:0] n1978;
wire n1979;
wire n1980;
wire [7:0] n1981;
wire n1982;
wire [7:0] n1983;
wire n1984;
wire [7:0] n1985;
wire n1986;
wire [7:0] n1987;
wire n1988;
wire [7:0] n1989;
wire n1990;
wire n1991;
wire [7:0] n1992;
wire n1993;
wire [7:0] n1994;
wire n1995;
wire [7:0] n1996;
wire n1997;
wire [7:0] n1998;
wire n1999;
wire [7:0] n2000;
wire n2001;
wire [7:0] n2002;
wire n2003;
wire [7:0] n2004;
wire n2005;
wire n2006;
wire [7:0] n2007;
wire n2008;
wire [7:0] n2009;
wire n2010;
wire [7:0] n2011;
wire n2012;
wire [7:0] n2013;
wire n2014;
wire [7:0] n2015;
wire n2016;
wire n2017;
wire [7:0] n2018;
wire n2019;
wire [7:0] n2020;
wire n2021;
wire [7:0] n2022;
wire n2023;
wire [7:0] n2024;
wire n2025;
wire [7:0] n2026;
wire n2027;
wire [7:0] n2028;
wire n2029;
wire [7:0] n2030;
wire n2031;
wire [7:0] n2032;
wire n2033;
wire [7:0] n2034;
wire n2035;
wire [7:0] n2036;
wire n2037;
wire [7:0] n2038;
wire n2039;
wire [7:0] n2040;
wire n2041;
wire [7:0] n2042;
wire n2043;
wire [7:0] n2044;
wire n2045;
wire [7:0] n2046;
wire n2047;
wire [7:0] n2048;
wire n2049;
wire [7:0] n2050;
wire n2051;
wire [7:0] n2052;
wire n2053;
wire [7:0] n2054;
wire n2055;
wire [7:0] n2056;
wire n2057;
wire [7:0] n2058;
wire n2059;
wire [7:0] n2060;
wire n2061;
wire [7:0] n2062;
wire n2063;
wire [7:0] n2064;
wire n2065;
wire [7:0] n2066;
wire n2067;
wire [7:0] n2068;
wire n2069;
wire [7:0] n2070;
wire n2071;
wire [7:0] n2072;
wire n2073;
wire [7:0] n2074;
wire n2075;
wire n2076;

reg [7:0] ROM[65535:0];
reg [7:0] IRAM[255:0];

// 
// Opcode: 00
// 
assign n0001 = 16'h1;
assign n0002 = ( PC + n0001 );
assign PC_00 = n0002;
// 
// Opcode: 01
// 
assign n0003 = 16'h2;
assign n0004 = ( PC + n0003 );
assign n0005 = n0004[15:11];
assign n0006 = ROM[n0004];
assign n0007 = ROM[n0002];
assign n0008 = ROM[PC];
assign n0009 = { ( n0006 ), ( n0007 ), ( n0008 ) };
assign n0010 = n0009[7:5];
assign n0011 = n0009[15:8];
assign n0012 = { ( n0005 ), ( n0010 ), ( n0011 ) };
assign PC_01 = n0012;
// 
// Opcode: 02
// 
assign n0013 = { ( n0007 ), ( n0006 ) };
assign PC_02 = n0013;
// 
// Opcode: 03
// 
assign n0014 = { ACC[0], ACC[7:1] };
assign ACC_03 = n0014;
assign PC_03 = n0002;
// 
// Opcode: 04
// 
assign n0015 = 8'h1;
assign n0016 = ( ACC + n0015 );
assign ACC_04 = n0016;
assign PC_04 = n0002;
// 
// Opcode: 05
// 
assign n0017 = 8'he0;
assign n0018 = ( n0007 == n0017 );
assign n0019 = n0007[7:7];
assign n0020 = 1'h0;
assign n0021 = ( n0019 == n0020 );
assign n0022 = IRAM[n0007];
assign n0023 = 8'h80;
assign n0024 = ( n0007 == n0023 );
assign n0025 = 8'h81;
assign n0026 = ( n0007 == n0025 );
assign n0027 = 8'h82;
assign n0028 = ( n0007 == n0027 );
assign n0029 = 8'h83;
assign n0030 = ( n0007 == n0029 );
assign n0031 = 8'h87;
assign n0032 = ( n0007 == n0031 );
assign n0033 = 8'h88;
assign n0034 = ( n0007 == n0033 );
assign n0035 = 8'h89;
assign n0036 = ( n0007 == n0035 );
assign n0037 = 8'h8a;
assign n0038 = ( n0007 == n0037 );
assign n0039 = 8'h8c;
assign n0040 = ( n0007 == n0039 );
assign n0041 = 8'h8b;
assign n0042 = ( n0007 == n0041 );
assign n0043 = 8'h8d;
assign n0044 = ( n0007 == n0043 );
assign n0045 = 8'h90;
assign n0046 = ( n0007 == n0045 );
assign n0047 = 8'h98;
assign n0048 = ( n0007 == n0047 );
assign n0049 = 8'h99;
assign n0050 = ( n0007 == n0049 );
assign n0051 = 8'ha0;
assign n0052 = ( n0007 == n0051 );
assign n0053 = 8'ha8;
assign n0054 = ( n0007 == n0053 );
assign n0055 = 8'hb0;
assign n0056 = ( n0007 == n0055 );
assign n0057 = 8'hb8;
assign n0058 = ( n0007 == n0057 );
assign n0059 = 8'hd0;
assign n0060 = ( n0007 == n0059 );
assign n0061 = 8'hf0;
assign n0062 = ( n0007 == n0061 );
assign n0063 = 8'h0;
assign n0064 = ( n0062 ) ? ( B ) : ( n0063 );
assign n0065 = ( n0018 ) ? ( ACC ) : ( n0064 );
assign n0066 = ( n0060 ) ? ( PSW ) : ( n0065 );
assign n0067 = ( n0058 ) ? ( IP ) : ( n0066 );
assign n0068 = ( n0056 ) ? ( P3 ) : ( n0067 );
assign n0069 = ( n0054 ) ? ( IE ) : ( n0068 );
assign n0070 = ( n0052 ) ? ( P2 ) : ( n0069 );
assign n0071 = ( n0050 ) ? ( SBUF ) : ( n0070 );
assign n0072 = ( n0048 ) ? ( SCON ) : ( n0071 );
assign n0073 = ( n0046 ) ? ( P1 ) : ( n0072 );
assign n0074 = ( n0044 ) ? ( TH1 ) : ( n0073 );
assign n0075 = ( n0042 ) ? ( TL1 ) : ( n0074 );
assign n0076 = ( n0040 ) ? ( TH0 ) : ( n0075 );
assign n0077 = ( n0038 ) ? ( TL0 ) : ( n0076 );
assign n0078 = ( n0036 ) ? ( TMOD ) : ( n0077 );
assign n0079 = ( n0034 ) ? ( TCON ) : ( n0078 );
assign n0080 = ( n0032 ) ? ( PCON ) : ( n0079 );
assign n0081 = ( n0030 ) ? ( DPH ) : ( n0080 );
assign n0082 = ( n0028 ) ? ( DPL ) : ( n0081 );
assign n0083 = ( n0026 ) ? ( SP ) : ( n0082 );
assign n0084 = ( n0024 ) ? ( P0 ) : ( n0083 );
assign n0085 = ( n0021 ) ? ( n0022 ) : ( n0084 );
assign n0086 = ( n0085 + n0015 );
assign n0087 = ( n0018 ) ? ( n0086 ) : ( ACC );
assign ACC_05 = n0087;
assign n0088 = ( n0032 ) ? ( n0086 ) : ( PCON );
assign PCON_05 = n0088;
assign n0089 = ( n0046 ) ? ( n0086 ) : ( P1 );
assign P1_05 = n0089;
assign n0090 = ( n0036 ) ? ( n0086 ) : ( TMOD );
assign TMOD_05 = n0090;
assign n0091 = ( n0028 ) ? ( n0086 ) : ( DPL );
assign DPL_05 = n0091;
assign n0092 = ( n0030 ) ? ( n0086 ) : ( DPH );
assign DPH_05 = n0092;
assign n0093 = ( n0042 ) ? ( n0086 ) : ( TL1 );
assign TL1_05 = n0093;
assign n0094 = ( n0038 ) ? ( n0086 ) : ( TL0 );
assign TL0_05 = n0094;
assign n0095 = ( n0034 ) ? ( n0086 ) : ( TCON );
assign TCON_05 = n0095;
assign n0096 = ( n0044 ) ? ( n0086 ) : ( TH1 );
assign TH1_05 = n0096;
assign n0097 = ( n0040 ) ? ( n0086 ) : ( TH0 );
assign TH0_05 = n0097;
assign PC_05 = n0004;
assign n0098 = ( n0052 ) ? ( n0086 ) : ( P2 );
assign P2_05 = n0098;
assign n0099 = ( n0056 ) ? ( n0086 ) : ( P3 );
assign P3_05 = n0099;
assign n0100 = ( n0024 ) ? ( n0086 ) : ( P0 );
assign P0_05 = n0100;
assign n0101 = ( n0062 ) ? ( n0086 ) : ( B );
assign B_05 = n0101;
assign n0102 = ( n0058 ) ? ( n0086 ) : ( IP );
assign IP_05 = n0102;
assign n0103 = ( n0054 ) ? ( n0086 ) : ( IE );
assign IE_05 = n0103;
assign n0104 = ( n0048 ) ? ( n0086 ) : ( SCON );
assign SCON_05 = n0104;
assign n0105 = ( n0026 ) ? ( n0086 ) : ( SP );
assign SP_05 = n0105;
assign n0106 = ( n0050 ) ? ( n0086 ) : ( SBUF );
assign SBUF_05 = n0106;
assign n0107 = ( n0060 ) ? ( n0086 ) : ( PSW );
assign PSW_05 = n0107;
// 
// Opcode: 06
// 
assign PC_06 = n0002;
assign n0108 = 3'h0;
assign n0109 = PSW[4:3];
assign n0110 = { ( n0108 ), ( n0109 ), ( n0108 ) };
assign n0111 = IRAM[n0110];
assign n0112 = IRAM[n0111];
assign n0113 = ( n0112 + n0015 );
// 
// Opcode: 07
// 
assign PC_07 = n0002;
assign n0114 = 3'h1;
assign n0115 = { ( n0108 ), ( n0109 ), ( n0114 ) };
assign n0116 = IRAM[n0115];
assign n0117 = IRAM[n0116];
assign n0118 = ( n0117 + n0015 );
// 
// Opcode: 08
// 
assign PC_08 = n0002;
assign n0119 = ( n0111 + n0015 );
// 
// Opcode: 09
// 
assign PC_09 = n0002;
assign n0120 = ( n0116 + n0015 );
// 
// Opcode: 0a
// 
assign PC_0a = n0002;
assign n0121 = ( n0085 | n0085 );
assign n0122 = ( n0056 ) ? ( n0121 ) : ( P3 );
assign P3_0a = n0122;
assign n0123 = 3'h2;
assign n0124 = { ( n0108 ), ( n0109 ), ( n0123 ) };
assign n0125 = IRAM[n0124];
assign n0126 = ( n0125 + n0015 );
// 
// Opcode: 0b
// 
assign PC_0b = n0002;
assign n0127 = 3'h3;
assign n0128 = { ( n0108 ), ( n0109 ), ( n0127 ) };
assign n0129 = IRAM[n0128];
assign n0130 = ( n0129 + n0015 );
// 
// Opcode: 0c
// 
assign PC_0c = n0002;
assign n0131 = 3'h4;
assign n0132 = { ( n0108 ), ( n0109 ), ( n0131 ) };
assign n0133 = IRAM[n0132];
assign n0134 = ( n0133 + n0015 );
// 
// Opcode: 0d
// 
assign PC_0d = n0002;
assign n0135 = 3'h5;
assign n0136 = { ( n0108 ), ( n0109 ), ( n0135 ) };
assign n0137 = IRAM[n0136];
assign n0138 = ( n0137 + n0015 );
assign n0139 = PSW[7:7];
assign n0140 = PSW[6:6];
assign n0141 = PSW[5:3];
assign n0142 = PSW[2:2];
assign n0143 = PSW[1:0];
assign n0144 = { ( n0139 ), ( n0140 ), ( n0141 ), ( n0142 ), ( n0143 ) };
assign PSW_0d = n0144;
// 
// Opcode: 0e
// 
assign PC_0e = n0002;
assign n0145 = 3'h6;
assign n0146 = { ( n0108 ), ( n0109 ), ( n0145 ) };
assign n0147 = IRAM[n0146];
assign n0148 = ( n0147 + n0015 );
// 
// Opcode: 0f
// 
assign PC_0f = n0002;
assign n0149 = 3'h7;
assign n0150 = { ( n0108 ), ( n0109 ), ( n0149 ) };
assign n0151 = IRAM[n0150];
assign n0152 = ( n0151 + n0015 );
// 
// Opcode: 10
// 
assign n0153 = 1'h1;
assign n0154 = ( n0019 == n0153 );
assign n0155 = n0007[7:3];
assign n0156 = { ( n0155 ), ( n0108 ) };
assign n0157 = { 3'b0, n0155 };
assign n0158 = 8'h20;
assign n0159 = ( n0157 + n0158 );
assign n0160 = ( n0154 ) ? ( n0156 ) : ( n0159 );
assign n0161 = ( n0160 == n0017 );
assign n0162 = n0007[2:0];
assign n0163 = { 5'b0, n0162 };
assign n0164 = ( n0015 << n0163 );
assign n0165 = ~( n0164 );
assign n0166 = n0160[7:7];
assign n0167 = ( n0166 == n0020 );
assign n0168 = IRAM[n0160];
assign n0169 = ( n0160 == n0023 );
assign n0170 = ( n0160 == n0033 );
assign n0171 = ( n0160 == n0045 );
assign n0172 = ( n0160 == n0047 );
assign n0173 = ( n0160 == n0051 );
assign n0174 = ( n0160 == n0053 );
assign n0175 = ( n0160 == n0055 );
assign n0176 = ( n0160 == n0057 );
assign n0177 = ( n0160 == n0059 );
assign n0178 = ( n0160 == n0061 );
assign n0179 = ( n0178 ) ? ( B ) : ( n0063 );
assign n0180 = ( n0161 ) ? ( ACC ) : ( n0179 );
assign n0181 = ( n0177 ) ? ( PSW ) : ( n0180 );
assign n0182 = ( n0176 ) ? ( IP ) : ( n0181 );
assign n0183 = ( n0175 ) ? ( P3 ) : ( n0182 );
assign n0184 = ( n0174 ) ? ( IE ) : ( n0183 );
assign n0185 = ( n0173 ) ? ( P2 ) : ( n0184 );
assign n0186 = ( n0172 ) ? ( SCON ) : ( n0185 );
assign n0187 = ( n0171 ) ? ( P1 ) : ( n0186 );
assign n0188 = ( n0170 ) ? ( TCON ) : ( n0187 );
assign n0189 = ( n0169 ) ? ( P0 ) : ( n0188 );
assign n0190 = ( n0167 ) ? ( n0168 ) : ( n0189 );
assign n0191 = ( n0165 & n0190 );
assign n0192 = { 7'b0, n0020 };
assign n0193 = ( n0192 << n0163 );
assign n0194 = ( n0191 | n0193 );
assign n0195 = ( n0161 ) ? ( n0194 ) : ( ACC );
assign ACC_10 = n0195;
assign n0196 = ( n0171 ) ? ( n0194 ) : ( P1 );
assign P1_10 = n0196;
assign n0197 = ( n0174 ) ? ( n0194 ) : ( IE );
assign IE_10 = n0197;
assign n0198 = n0190[n0162];
assign n0199 = ( n0198 == n0153 );
assign n0200 = 16'h3;
assign n0201 = ( PC + n0200 );
assign n0202 = { n0006[7], n0006[7], n0006[7], n0006[7], n0006[7], n0006[7], n0006[7], n0006[7], n0006 };
assign n0203 = ( n0201 + n0202 );
assign n0204 = ( n0199 ) ? ( n0203 ) : ( n0201 );
assign PC_10 = n0204;
assign n0205 = ( n0173 ) ? ( n0194 ) : ( P2 );
assign P2_10 = n0205;
assign n0206 = ( n0175 ) ? ( n0194 ) : ( P3 );
assign P3_10 = n0206;
assign n0207 = ( n0169 ) ? ( n0194 ) : ( P0 );
assign P0_10 = n0207;
assign n0208 = ( n0178 ) ? ( n0194 ) : ( B );
assign B_10 = n0208;
assign n0209 = ( n0176 ) ? ( n0194 ) : ( IP );
assign IP_10 = n0209;
assign n0210 = ( n0170 ) ? ( n0194 ) : ( TCON );
assign TCON_10 = n0210;
assign n0211 = ( n0172 ) ? ( n0194 ) : ( SCON );
assign SCON_10 = n0211;
assign n0212 = ( n0177 ) ? ( n0194 ) : ( PSW );
assign PSW_10 = n0212;
// 
// Opcode: 11
// 
assign n0213 = n0009[3:1];
assign n0214 = { ( n0005 ), ( n0213 ), ( n0011 ) };
assign PC_11 = n0214;
assign n0215 = ( SP + n0015 );
assign n0216 = n0004[7:0];
assign n0217 = ( n0215 + n0015 );
assign n0218 = n0004[15:8];
assign n0219 = 8'h2;
assign n0220 = ( SP + n0219 );
assign SP_11 = n0220;
// 
// Opcode: 12
// 
assign PC_12 = n0013;
assign n0221 = n0201[7:0];
assign n0222 = n0201[15:8];
assign SP_12 = n0220;
// 
// Opcode: 13
// 
assign n0223 = { ( ACC ), ( n0139 ) };
assign n0224 = { n0223[0], n0223[8:1] };
assign n0225 = n0224[8:1];
assign ACC_13 = n0225;
assign PC_13 = n0002;
assign n0226 = ACC[0:0];
assign n0227 = { ( n0226 ), ( n0140 ), ( n0141 ), ( n0142 ), ( n0143 ) };
assign PSW_13 = n0227;
// 
// Opcode: 14
// 
assign n0228 = ( ACC - n0015 );
assign ACC_14 = n0228;
assign PC_14 = n0002;
// 
// Opcode: 15
// 
assign n0229 = ( n0085 - n0015 );
assign n0230 = ( n0018 ) ? ( n0229 ) : ( ACC );
assign ACC_15 = n0230;
assign n0231 = ( n0032 ) ? ( n0229 ) : ( PCON );
assign PCON_15 = n0231;
assign n0232 = ( n0046 ) ? ( n0229 ) : ( P1 );
assign P1_15 = n0232;
assign n0233 = ( n0036 ) ? ( n0229 ) : ( TMOD );
assign TMOD_15 = n0233;
assign n0234 = ( n0028 ) ? ( n0229 ) : ( DPL );
assign DPL_15 = n0234;
assign n0235 = ( n0030 ) ? ( n0229 ) : ( DPH );
assign DPH_15 = n0235;
assign n0236 = ( n0042 ) ? ( n0229 ) : ( TL1 );
assign TL1_15 = n0236;
assign n0237 = ( n0038 ) ? ( n0229 ) : ( TL0 );
assign TL0_15 = n0237;
assign n0238 = ( n0054 ) ? ( n0229 ) : ( IE );
assign IE_15 = n0238;
assign n0239 = ( n0044 ) ? ( n0229 ) : ( TH1 );
assign TH1_15 = n0239;
assign n0240 = ( n0040 ) ? ( n0229 ) : ( TH0 );
assign TH0_15 = n0240;
assign PC_15 = n0004;
assign n0241 = ( n0052 ) ? ( n0229 ) : ( P2 );
assign P2_15 = n0241;
assign n0242 = ( n0056 ) ? ( n0229 ) : ( P3 );
assign P3_15 = n0242;
assign n0243 = ( n0024 ) ? ( n0229 ) : ( P0 );
assign P0_15 = n0243;
assign n0244 = ( n0062 ) ? ( n0229 ) : ( B );
assign B_15 = n0244;
assign n0245 = ( n0058 ) ? ( n0229 ) : ( IP );
assign IP_15 = n0245;
assign n0246 = ( n0034 ) ? ( n0229 ) : ( TCON );
assign TCON_15 = n0246;
assign n0247 = ( n0048 ) ? ( n0229 ) : ( SCON );
assign SCON_15 = n0247;
assign n0248 = ( n0026 ) ? ( n0229 ) : ( SP );
assign SP_15 = n0248;
assign n0249 = ( n0050 ) ? ( n0229 ) : ( SBUF );
assign SBUF_15 = n0249;
assign n0250 = ( n0060 ) ? ( n0229 ) : ( PSW );
assign PSW_15 = n0250;
// 
// Opcode: 16
// 
assign PC_16 = n0002;
assign n0251 = ( n0112 - n0015 );
// 
// Opcode: 17
// 
assign PC_17 = n0002;
assign n0252 = ( n0117 - n0015 );
// 
// Opcode: 18
// 
assign PC_18 = n0002;
assign n0253 = ( n0111 - n0015 );
// 
// Opcode: 19
// 
assign PC_19 = n0002;
assign n0254 = ( n0116 - n0015 );
// 
// Opcode: 1a
// 
assign PC_1a = n0002;
assign n0255 = ( n0125 - n0015 );
// 
// Opcode: 1b
// 
assign PC_1b = n0002;
assign n0256 = ( n0129 - n0015 );
// 
// Opcode: 1c
// 
assign PC_1c = n0002;
assign n0257 = ( n0133 - n0015 );
// 
// Opcode: 1d
// 
assign PC_1d = n0002;
assign n0258 = ( n0137 - n0015 );
// 
// Opcode: 1e
// 
assign PC_1e = n0002;
assign n0259 = ( n0147 - n0015 );
// 
// Opcode: 1f
// 
assign PC_1f = n0002;
assign n0260 = ( n0151 - n0015 );
// 
// Opcode: 20
// 
assign PC_20 = n0204;
// 
// Opcode: 21
// 
assign PC_21 = n0012;
// 
// Opcode: 22
// 
assign n0261 = IRAM[SP];
assign n0262 = ( SP - n0015 );
assign n0263 = IRAM[n0262];
assign n0264 = { ( n0261 ), ( n0263 ) };
assign PC_22 = n0264;
assign n0265 = ( SP - n0219 );
assign SP_22 = n0265;
// 
// Opcode: 23
// 
assign n0266 = { ACC[6:0], ACC[7] };
assign ACC_23 = n0266;
assign PC_23 = n0002;
// 
// Opcode: 24
// 
assign n0267 = ( ACC + n0007 );
assign ACC_24 = n0267;
assign PC_24 = n0004;
assign n0268 = { 1'b0, ACC };
assign n0269 = { 1'b0, n0007 };
assign n0270 = { n0020[0], n0020[0], n0020[0], n0020[0], n0020[0], n0020[0], n0020[0], n0020[0], n0020 };
assign n0271 = ( n0269 + n0270 );
assign n0272 = ( n0268 + n0271 );
assign n0273 = n0272[8:8];
assign n0274 = ACC[3:0];
assign n0275 = { 1'b0, n0274 };
assign n0276 = n0007[3:0];
assign n0277 = { 1'b0, n0276 };
assign n0278 = { 4'b0, n0020 };
assign n0279 = ( n0277 + n0278 );
assign n0280 = ( n0275 + n0279 );
assign n0281 = n0280[4:4];
assign n0282 = { ACC[7], ACC };
assign n0283 = { n0007[7], n0007 };
assign n0284 = ( n0283 + n0270 );
assign n0285 = ( n0282 + n0284 );
assign n0286 = n0285[8:8];
assign n0287 = n0285[7:7];
assign n0288 = ( n0286 == n0287 );
assign n0289 = !( n0288 );
assign n0290 = ( n0289 ) ? ( n0153 ) : ( n0020 );
assign n0291 = { ( n0273 ), ( n0281 ), ( n0141 ), ( n0290 ), ( n0143 ) };
assign PSW_24 = n0291;
// 
// Opcode: 25
// 
assign n0292 = ( ACC + n0085 );
assign ACC_25 = n0292;
assign PC_25 = n0004;
assign n0293 = ( n0006 == n0025 );
assign n0294 = n0006[7:7];
assign n0295 = ( n0294 == n0020 );
assign n0296 = IRAM[n0006];
assign n0297 = ( n0006 == n0023 );
assign n0298 = ( n0006 == n0027 );
assign n0299 = ( n0006 == n0029 );
assign n0300 = ( n0006 == n0031 );
assign n0301 = ( n0006 == n0033 );
assign n0302 = ( n0006 == n0035 );
assign n0303 = ( n0006 == n0037 );
assign n0304 = ( n0006 == n0039 );
assign n0305 = ( n0006 == n0041 );
assign n0306 = ( n0006 == n0043 );
assign n0307 = ( n0006 == n0045 );
assign n0308 = ( n0006 == n0047 );
assign n0309 = ( n0006 == n0049 );
assign n0310 = ( n0006 == n0051 );
assign n0311 = ( n0006 == n0053 );
assign n0312 = ( n0006 == n0055 );
assign n0313 = ( n0006 == n0057 );
assign n0314 = ( n0006 == n0059 );
assign n0315 = ( n0006 == n0017 );
assign n0316 = ( n0006 == n0061 );
assign n0317 = ( n0316 ) ? ( B ) : ( n0063 );
assign n0318 = ( n0315 ) ? ( ACC ) : ( n0317 );
assign n0319 = ( n0314 ) ? ( PSW ) : ( n0318 );
assign n0320 = ( n0313 ) ? ( IP ) : ( n0319 );
assign n0321 = ( n0312 ) ? ( P3 ) : ( n0320 );
assign n0322 = ( n0311 ) ? ( IE ) : ( n0321 );
assign n0323 = ( n0310 ) ? ( P2 ) : ( n0322 );
assign n0324 = ( n0309 ) ? ( SBUF ) : ( n0323 );
assign n0325 = ( n0308 ) ? ( SCON ) : ( n0324 );
assign n0326 = ( n0307 ) ? ( P1 ) : ( n0325 );
assign n0327 = ( n0306 ) ? ( TH1 ) : ( n0326 );
assign n0328 = ( n0305 ) ? ( TL1 ) : ( n0327 );
assign n0329 = ( n0304 ) ? ( TH0 ) : ( n0328 );
assign n0330 = ( n0303 ) ? ( TL0 ) : ( n0329 );
assign n0331 = ( n0302 ) ? ( TMOD ) : ( n0330 );
assign n0332 = ( n0301 ) ? ( TCON ) : ( n0331 );
assign n0333 = ( n0300 ) ? ( PCON ) : ( n0332 );
assign n0334 = ( n0299 ) ? ( DPH ) : ( n0333 );
assign n0335 = ( n0298 ) ? ( DPL ) : ( n0334 );
assign n0336 = ( n0293 ) ? ( SP ) : ( n0335 );
assign n0337 = ( n0297 ) ? ( P0 ) : ( n0336 );
assign n0338 = ( n0295 ) ? ( n0296 ) : ( n0337 );
assign n0339 = ( n0338 | n0338 );
assign n0340 = ( n0293 ) ? ( n0339 ) : ( SP );
assign SP_25 = n0340;
assign n0341 = { 1'b0, n0085 };
assign n0342 = ( n0341 + n0270 );
assign n0343 = ( n0268 + n0342 );
assign n0344 = n0343[8:8];
assign n0345 = n0085[3:0];
assign n0346 = { 1'b0, n0345 };
assign n0347 = { n0020[0], n0020[0], n0020[0], n0020[0], n0020 };
assign n0348 = ( n0346 + n0347 );
assign n0349 = ( n0275 + n0348 );
assign n0350 = n0349[4:4];
assign n0351 = { n0085[7], n0085 };
assign n0352 = ( n0351 + n0270 );
assign n0353 = ( n0282 + n0352 );
assign n0354 = n0353[8:8];
assign n0355 = n0353[7:7];
assign n0356 = ( n0354 == n0355 );
assign n0357 = !( n0356 );
assign n0358 = ( n0357 ) ? ( n0153 ) : ( n0020 );
assign n0359 = { ( n0344 ), ( n0350 ), ( n0141 ), ( n0358 ), ( n0143 ) };
assign PSW_25 = n0359;
// 
// Opcode: 26
// 
assign n0360 = ( ACC + n0112 );
assign ACC_26 = n0360;
assign PC_26 = n0002;
assign n0361 = { 1'b0, n0112 };
assign n0362 = ( n0361 + n0270 );
assign n0363 = ( n0268 + n0362 );
assign n0364 = n0363[8:8];
assign n0365 = n0112[3:0];
assign n0366 = { 1'b0, n0365 };
assign n0367 = ( n0366 + n0347 );
assign n0368 = ( n0275 + n0367 );
assign n0369 = n0368[4:4];
assign n0370 = { n0112[7], n0112 };
assign n0371 = ( n0370 + n0270 );
assign n0372 = ( n0282 + n0371 );
assign n0373 = n0372[8:8];
assign n0374 = n0372[7:7];
assign n0375 = ( n0373 == n0374 );
assign n0376 = !( n0375 );
assign n0377 = ( n0376 ) ? ( n0153 ) : ( n0020 );
assign n0378 = { ( n0364 ), ( n0369 ), ( n0141 ), ( n0377 ), ( n0143 ) };
assign PSW_26 = n0378;
// 
// Opcode: 27
// 
assign n0379 = ( ACC + n0117 );
assign ACC_27 = n0379;
assign PC_27 = n0002;
assign n0380 = { 1'b0, n0117 };
assign n0381 = { 8'b0, n0020 };
assign n0382 = ( n0380 + n0381 );
assign n0383 = ( n0268 + n0382 );
assign n0384 = n0383[8:8];
assign n0385 = n0117[3:0];
assign n0386 = { 1'b0, n0385 };
assign n0387 = ( n0386 + n0347 );
assign n0388 = ( n0275 + n0387 );
assign n0389 = n0388[4:4];
assign n0390 = { n0117[7], n0117 };
assign n0391 = ( n0390 + n0381 );
assign n0392 = ( n0282 + n0391 );
assign n0393 = n0392[8:8];
assign n0394 = n0392[7:7];
assign n0395 = ( n0393 == n0394 );
assign n0396 = !( n0395 );
assign n0397 = ( n0396 ) ? ( n0153 ) : ( n0020 );
assign n0398 = { ( n0384 ), ( n0389 ), ( n0141 ), ( n0397 ), ( n0143 ) };
assign PSW_27 = n0398;
// 
// Opcode: 28
// 
assign n0399 = ( ACC + n0111 );
assign ACC_28 = n0399;
assign PC_28 = n0002;
assign n0400 = { 1'b0, n0111 };
assign n0401 = ( n0400 + n0381 );
assign n0402 = ( n0268 + n0401 );
assign n0403 = n0402[8:8];
assign n0404 = n0111[3:0];
assign n0405 = { 1'b0, n0404 };
assign n0406 = ( n0405 + n0278 );
assign n0407 = ( n0275 + n0406 );
assign n0408 = n0407[4:4];
assign n0409 = { n0111[7], n0111 };
assign n0410 = ( n0409 + n0381 );
assign n0411 = ( n0282 + n0410 );
assign n0412 = n0411[8:8];
assign n0413 = n0411[7:7];
assign n0414 = ( n0412 == n0413 );
assign n0415 = !( n0414 );
assign n0416 = ( n0415 ) ? ( n0153 ) : ( n0020 );
assign n0417 = { ( n0403 ), ( n0408 ), ( n0141 ), ( n0416 ), ( n0143 ) };
assign PSW_28 = n0417;
// 
// Opcode: 29
// 
assign n0418 = ( ACC + n0116 );
assign ACC_29 = n0418;
assign PC_29 = n0002;
assign n0419 = { 1'b0, n0116 };
assign n0420 = ( n0419 + n0381 );
assign n0421 = ( n0268 + n0420 );
assign n0422 = n0421[8:8];
assign n0423 = n0116[3:0];
assign n0424 = { 1'b0, n0423 };
assign n0425 = ( n0424 + n0278 );
assign n0426 = ( n0275 + n0425 );
assign n0427 = n0426[4:4];
assign n0428 = { n0116[7], n0116 };
assign n0429 = ( n0428 + n0381 );
assign n0430 = ( n0282 + n0429 );
assign n0431 = n0430[8:8];
assign n0432 = n0430[7:7];
assign n0433 = ( n0431 == n0432 );
assign n0434 = !( n0433 );
assign n0435 = ( n0434 ) ? ( n0153 ) : ( n0020 );
assign n0436 = { ( n0422 ), ( n0427 ), ( n0141 ), ( n0435 ), ( n0143 ) };
assign PSW_29 = n0436;
// 
// Opcode: 2a
// 
assign n0437 = ( ACC + n0125 );
assign ACC_2a = n0437;
assign PC_2a = n0002;
assign n0438 = { 1'b0, n0125 };
assign n0439 = ( n0438 + n0381 );
assign n0440 = ( n0268 + n0439 );
assign n0441 = n0440[8:8];
assign n0442 = n0125[3:0];
assign n0443 = { 1'b0, n0442 };
assign n0444 = ( n0443 + n0347 );
assign n0445 = ( n0275 + n0444 );
assign n0446 = n0445[4:4];
assign n0447 = { n0125[7], n0125 };
assign n0448 = ( n0447 + n0381 );
assign n0449 = ( n0282 + n0448 );
assign n0450 = n0449[8:8];
assign n0451 = n0449[7:7];
assign n0452 = ( n0450 == n0451 );
assign n0453 = !( n0452 );
assign n0454 = ( n0453 ) ? ( n0153 ) : ( n0020 );
assign n0455 = { ( n0441 ), ( n0446 ), ( n0141 ), ( n0454 ), ( n0143 ) };
assign PSW_2a = n0455;
// 
// Opcode: 2b
// 
assign n0456 = ( ACC + n0129 );
assign ACC_2b = n0456;
assign PC_2b = n0002;
assign n0457 = { 1'b0, n0129 };
assign n0458 = ( n0457 + n0270 );
assign n0459 = ( n0268 + n0458 );
assign n0460 = n0459[8:8];
assign n0461 = n0129[3:0];
assign n0462 = { 1'b0, n0461 };
assign n0463 = ( n0462 + n0347 );
assign n0464 = ( n0275 + n0463 );
assign n0465 = n0464[4:4];
assign n0466 = { n0129[7], n0129 };
assign n0467 = ( n0466 + n0270 );
assign n0468 = ( n0282 + n0467 );
assign n0469 = n0468[8:8];
assign n0470 = n0468[7:7];
assign n0471 = ( n0469 == n0470 );
assign n0472 = !( n0471 );
assign n0473 = ( n0472 ) ? ( n0153 ) : ( n0020 );
assign n0474 = { ( n0460 ), ( n0465 ), ( n0141 ), ( n0473 ), ( n0143 ) };
assign PSW_2b = n0474;
// 
// Opcode: 2c
// 
assign n0475 = ( ACC + n0133 );
assign ACC_2c = n0475;
assign PC_2c = n0002;
assign n0476 = { 1'b0, n0133 };
assign n0477 = ( n0476 + n0270 );
assign n0478 = ( n0268 + n0477 );
assign n0479 = n0478[8:8];
assign n0480 = n0133[3:0];
assign n0481 = { 1'b0, n0480 };
assign n0482 = ( n0481 + n0347 );
assign n0483 = ( n0275 + n0482 );
assign n0484 = n0483[4:4];
assign n0485 = { n0133[7], n0133 };
assign n0486 = ( n0485 + n0270 );
assign n0487 = ( n0282 + n0486 );
assign n0488 = n0487[8:8];
assign n0489 = n0487[7:7];
assign n0490 = ( n0488 == n0489 );
assign n0491 = !( n0490 );
assign n0492 = ( n0491 ) ? ( n0153 ) : ( n0020 );
assign n0493 = { ( n0479 ), ( n0484 ), ( n0141 ), ( n0492 ), ( n0143 ) };
assign PSW_2c = n0493;
// 
// Opcode: 2d
// 
assign n0494 = ( ACC + n0137 );
assign ACC_2d = n0494;
assign n0495 = ( n0036 ) ? ( n0121 ) : ( TMOD );
assign TMOD_2d = n0495;
assign PC_2d = n0002;
assign n0496 = { 1'b0, n0137 };
assign n0497 = ( n0496 + n0381 );
assign n0498 = ( n0268 + n0497 );
assign n0499 = n0498[8:8];
assign n0500 = n0137[3:0];
assign n0501 = { 1'b0, n0500 };
assign n0502 = ( n0501 + n0278 );
assign n0503 = ( n0275 + n0502 );
assign n0504 = n0503[4:4];
assign n0505 = { n0137[7], n0137 };
assign n0506 = ( n0505 + n0381 );
assign n0507 = ( n0282 + n0506 );
assign n0508 = n0507[8:8];
assign n0509 = n0507[7:7];
assign n0510 = ( n0508 == n0509 );
assign n0511 = !( n0510 );
assign n0512 = ( n0511 ) ? ( n0153 ) : ( n0020 );
assign n0513 = { ( n0499 ), ( n0504 ), ( n0141 ), ( n0512 ), ( n0143 ) };
assign PSW_2d = n0513;
// 
// Opcode: 2e
// 
assign n0514 = ( ACC + n0147 );
assign ACC_2e = n0514;
assign PC_2e = n0002;
assign n0515 = { 1'b0, n0147 };
assign n0516 = ( n0515 + n0270 );
assign n0517 = ( n0268 + n0516 );
assign n0518 = n0517[8:8];
assign n0519 = n0147[3:0];
assign n0520 = { 1'b0, n0519 };
assign n0521 = ( n0520 + n0278 );
assign n0522 = ( n0275 + n0521 );
assign n0523 = n0522[4:4];
assign n0524 = { n0147[7], n0147 };
assign n0525 = ( n0524 + n0270 );
assign n0526 = ( n0282 + n0525 );
assign n0527 = n0526[8:8];
assign n0528 = n0526[7:7];
assign n0529 = ( n0527 == n0528 );
assign n0530 = !( n0529 );
assign n0531 = ( n0530 ) ? ( n0153 ) : ( n0020 );
assign n0532 = { ( n0518 ), ( n0523 ), ( n0141 ), ( n0531 ), ( n0143 ) };
assign PSW_2e = n0532;
// 
// Opcode: 2f
// 
assign n0533 = ( ACC + n0151 );
assign ACC_2f = n0533;
assign PC_2f = n0002;
assign n0534 = { 1'b0, n0151 };
assign n0535 = ( n0534 + n0270 );
assign n0536 = ( n0268 + n0535 );
assign n0537 = n0536[8:8];
assign n0538 = n0151[3:0];
assign n0539 = { 1'b0, n0538 };
assign n0540 = ( n0539 + n0278 );
assign n0541 = ( n0275 + n0540 );
assign n0542 = n0541[4:4];
assign n0543 = { n0151[7], n0151 };
assign n0544 = ( n0543 + n0270 );
assign n0545 = ( n0282 + n0544 );
assign n0546 = n0545[8:8];
assign n0547 = n0545[7:7];
assign n0548 = ( n0546 == n0547 );
assign n0549 = !( n0548 );
assign n0550 = ( n0549 ) ? ( n0153 ) : ( n0020 );
assign n0551 = { ( n0537 ), ( n0542 ), ( n0141 ), ( n0550 ), ( n0143 ) };
assign PSW_2f = n0551;
// 
// Opcode: 30
// 
assign n0552 = ( n0198 == n0020 );
assign n0553 = ( n0552 ) ? ( n0203 ) : ( n0201 );
assign PC_30 = n0553;
// 
// Opcode: 31
// 
assign PC_31 = n0012;
assign SP_31 = n0220;
// 
// Opcode: 32
// 
assign PC_32 = n0264;
assign n0554 = ( n0310 ) ? ( n0338 ) : ( P2 );
assign P2_32 = n0554;
assign SP_32 = n0265;
// 
// Opcode: 33
// 
assign n0555 = { ( n0139 ), ( ACC ) };
assign n0556 = { n0555[7:0], n0555[8] };
assign n0557 = n0556[7:0];
assign ACC_33 = n0557;
assign PC_33 = n0002;
assign n0558 = ACC[7:7];
assign n0559 = { ( n0558 ), ( n0140 ), ( n0141 ), ( n0142 ), ( n0143 ) };
assign PSW_33 = n0559;
// 
// Opcode: 34
// 
assign n0560 = { 7'b0, n0139 };
assign n0561 = ( n0007 + n0560 );
assign n0562 = ( ACC + n0561 );
assign ACC_34 = n0562;
assign PC_34 = n0004;
assign n0563 = { 8'b0, n0139 };
assign n0564 = ( n0269 + n0563 );
assign n0565 = ( n0268 + n0564 );
assign n0566 = n0565[8:8];
assign n0567 = { 4'b0, n0139 };
assign n0568 = ( n0277 + n0567 );
assign n0569 = ( n0275 + n0568 );
assign n0570 = n0569[4:4];
assign n0571 = ( n0283 + n0563 );
assign n0572 = ( n0282 + n0571 );
assign n0573 = n0572[8:8];
assign n0574 = n0572[7:7];
assign n0575 = ( n0573 == n0574 );
assign n0576 = !( n0575 );
assign n0577 = ( n0576 ) ? ( n0153 ) : ( n0020 );
assign n0578 = { ( n0566 ), ( n0570 ), ( n0141 ), ( n0577 ), ( n0143 ) };
assign PSW_34 = n0578;
// 
// Opcode: 35
// 
assign n0579 = ( n0085 + n0560 );
assign n0580 = ( ACC + n0579 );
assign ACC_35 = n0580;
assign PC_35 = n0004;
assign n0581 = ( n0341 + n0563 );
assign n0582 = ( n0268 + n0581 );
assign n0583 = n0582[8:8];
assign n0584 = ( n0346 + n0567 );
assign n0585 = ( n0275 + n0584 );
assign n0586 = n0585[4:4];
assign n0587 = ( n0351 + n0563 );
assign n0588 = ( n0282 + n0587 );
assign n0589 = n0588[8:8];
assign n0590 = n0588[7:7];
assign n0591 = ( n0589 == n0590 );
assign n0592 = !( n0591 );
assign n0593 = ( n0592 ) ? ( n0153 ) : ( n0020 );
assign n0594 = { ( n0583 ), ( n0586 ), ( n0141 ), ( n0593 ), ( n0143 ) };
assign PSW_35 = n0594;
// 
// Opcode: 36
// 
assign n0595 = ( n0112 + n0560 );
assign n0596 = ( ACC + n0595 );
assign ACC_36 = n0596;
assign PC_36 = n0002;
assign n0597 = ( n0361 + n0563 );
assign n0598 = ( n0268 + n0597 );
assign n0599 = n0598[8:8];
assign n0600 = ( n0366 + n0567 );
assign n0601 = ( n0275 + n0600 );
assign n0602 = n0601[4:4];
assign n0603 = ( n0370 + n0563 );
assign n0604 = ( n0282 + n0603 );
assign n0605 = n0604[8:8];
assign n0606 = n0604[7:7];
assign n0607 = ( n0605 == n0606 );
assign n0608 = !( n0607 );
assign n0609 = ( n0608 ) ? ( n0153 ) : ( n0020 );
assign n0610 = { ( n0599 ), ( n0602 ), ( n0141 ), ( n0609 ), ( n0143 ) };
assign PSW_36 = n0610;
// 
// Opcode: 37
// 
assign n0611 = ( n0117 + n0560 );
assign n0612 = ( ACC + n0611 );
assign ACC_37 = n0612;
assign PC_37 = n0002;
assign n0613 = ( n0380 + n0563 );
assign n0614 = ( n0268 + n0613 );
assign n0615 = n0614[8:8];
assign n0616 = ( n0386 + n0567 );
assign n0617 = ( n0275 + n0616 );
assign n0618 = n0617[4:4];
assign n0619 = ( n0390 + n0563 );
assign n0620 = ( n0282 + n0619 );
assign n0621 = n0620[8:8];
assign n0622 = n0620[7:7];
assign n0623 = ( n0621 == n0622 );
assign n0624 = !( n0623 );
assign n0625 = ( n0624 ) ? ( n0153 ) : ( n0020 );
assign n0626 = { ( n0615 ), ( n0618 ), ( n0141 ), ( n0625 ), ( n0143 ) };
assign PSW_37 = n0626;
// 
// Opcode: 38
// 
assign n0627 = ( n0111 + n0560 );
assign n0628 = ( ACC + n0627 );
assign ACC_38 = n0628;
assign PC_38 = n0002;
assign n0629 = ( n0400 + n0563 );
assign n0630 = ( n0268 + n0629 );
assign n0631 = n0630[8:8];
assign n0632 = ( n0405 + n0567 );
assign n0633 = ( n0275 + n0632 );
assign n0634 = n0633[4:4];
assign n0635 = ( n0409 + n0563 );
assign n0636 = ( n0282 + n0635 );
assign n0637 = n0636[8:8];
assign n0638 = n0636[7:7];
assign n0639 = ( n0637 == n0638 );
assign n0640 = !( n0639 );
assign n0641 = ( n0640 ) ? ( n0153 ) : ( n0020 );
assign n0642 = { ( n0631 ), ( n0634 ), ( n0141 ), ( n0641 ), ( n0143 ) };
assign PSW_38 = n0642;
// 
// Opcode: 39
// 
assign n0643 = ( n0116 + n0560 );
assign n0644 = ( ACC + n0643 );
assign ACC_39 = n0644;
assign PC_39 = n0002;
assign n0645 = ( n0419 + n0563 );
assign n0646 = ( n0268 + n0645 );
assign n0647 = n0646[8:8];
assign n0648 = ( n0424 + n0567 );
assign n0649 = ( n0275 + n0648 );
assign n0650 = n0649[4:4];
assign n0651 = ( n0428 + n0563 );
assign n0652 = ( n0282 + n0651 );
assign n0653 = n0652[8:8];
assign n0654 = n0652[7:7];
assign n0655 = ( n0653 == n0654 );
assign n0656 = !( n0655 );
assign n0657 = ( n0656 ) ? ( n0153 ) : ( n0020 );
assign n0658 = { ( n0647 ), ( n0650 ), ( n0141 ), ( n0657 ), ( n0143 ) };
assign PSW_39 = n0658;
// 
// Opcode: 3a
// 
assign n0659 = ( n0125 + n0560 );
assign n0660 = ( ACC + n0659 );
assign ACC_3a = n0660;
assign PC_3a = n0002;
assign n0661 = ( n0438 + n0563 );
assign n0662 = ( n0268 + n0661 );
assign n0663 = n0662[8:8];
assign n0664 = ( n0443 + n0567 );
assign n0665 = ( n0275 + n0664 );
assign n0666 = n0665[4:4];
assign n0667 = ( n0447 + n0563 );
assign n0668 = ( n0282 + n0667 );
assign n0669 = n0668[8:8];
assign n0670 = n0668[7:7];
assign n0671 = ( n0669 == n0670 );
assign n0672 = !( n0671 );
assign n0673 = ( n0672 ) ? ( n0153 ) : ( n0020 );
assign n0674 = { ( n0663 ), ( n0666 ), ( n0141 ), ( n0673 ), ( n0143 ) };
assign PSW_3a = n0674;
// 
// Opcode: 3b
// 
assign n0675 = ( n0129 + n0560 );
assign n0676 = ( ACC + n0675 );
assign ACC_3b = n0676;
assign PC_3b = n0002;
assign n0677 = ( n0457 + n0563 );
assign n0678 = ( n0268 + n0677 );
assign n0679 = n0678[8:8];
assign n0680 = ( n0462 + n0567 );
assign n0681 = ( n0275 + n0680 );
assign n0682 = n0681[4:4];
assign n0683 = ( n0466 + n0563 );
assign n0684 = ( n0282 + n0683 );
assign n0685 = n0684[8:8];
assign n0686 = n0684[7:7];
assign n0687 = ( n0685 == n0686 );
assign n0688 = !( n0687 );
assign n0689 = ( n0688 ) ? ( n0153 ) : ( n0020 );
assign n0690 = { ( n0679 ), ( n0682 ), ( n0141 ), ( n0689 ), ( n0143 ) };
assign PSW_3b = n0690;
// 
// Opcode: 3c
// 
assign n0691 = ( n0133 + n0560 );
assign n0692 = ( ACC + n0691 );
assign ACC_3c = n0692;
assign PC_3c = n0002;
assign n0693 = ( n0476 + n0563 );
assign n0694 = ( n0268 + n0693 );
assign n0695 = n0694[8:8];
assign n0696 = ( n0481 + n0567 );
assign n0697 = ( n0275 + n0696 );
assign n0698 = n0697[4:4];
assign n0699 = ( n0485 + n0563 );
assign n0700 = ( n0282 + n0699 );
assign n0701 = n0700[8:8];
assign n0702 = n0700[7:7];
assign n0703 = ( n0701 == n0702 );
assign n0704 = !( n0703 );
assign n0705 = ( n0704 ) ? ( n0153 ) : ( n0020 );
assign n0706 = { ( n0695 ), ( n0698 ), ( n0141 ), ( n0705 ), ( n0143 ) };
assign PSW_3c = n0706;
// 
// Opcode: 3d
// 
assign n0707 = ( n0137 + n0560 );
assign n0708 = ( ACC + n0707 );
assign ACC_3d = n0708;
assign PC_3d = n0002;
assign n0709 = ( n0496 + n0563 );
assign n0710 = ( n0268 + n0709 );
assign n0711 = n0710[8:8];
assign n0712 = ( n0501 + n0567 );
assign n0713 = ( n0275 + n0712 );
assign n0714 = n0713[4:4];
assign n0715 = ( n0505 + n0563 );
assign n0716 = ( n0282 + n0715 );
assign n0717 = n0716[8:8];
assign n0718 = n0716[7:7];
assign n0719 = ( n0717 == n0718 );
assign n0720 = !( n0719 );
assign n0721 = ( n0720 ) ? ( n0153 ) : ( n0020 );
assign n0722 = { ( n0711 ), ( n0714 ), ( n0141 ), ( n0721 ), ( n0143 ) };
assign PSW_3d = n0722;
// 
// Opcode: 3e
// 
assign n0723 = ( n0147 + n0560 );
assign n0724 = ( ACC + n0723 );
assign ACC_3e = n0724;
assign PC_3e = n0002;
assign n0725 = ( n0515 + n0563 );
assign n0726 = ( n0268 + n0725 );
assign n0727 = n0726[8:8];
assign n0728 = ( n0520 + n0567 );
assign n0729 = ( n0275 + n0728 );
assign n0730 = n0729[4:4];
assign n0731 = ( n0524 + n0563 );
assign n0732 = ( n0282 + n0731 );
assign n0733 = n0732[8:8];
assign n0734 = n0732[7:7];
assign n0735 = ( n0733 == n0734 );
assign n0736 = !( n0735 );
assign n0737 = ( n0736 ) ? ( n0153 ) : ( n0020 );
assign n0738 = { ( n0727 ), ( n0730 ), ( n0141 ), ( n0737 ), ( n0143 ) };
assign PSW_3e = n0738;
// 
// Opcode: 3f
// 
assign n0739 = ( n0151 + n0560 );
assign n0740 = ( ACC + n0739 );
assign ACC_3f = n0740;
assign PC_3f = n0002;
assign n0741 = ( n0534 + n0563 );
assign n0742 = ( n0268 + n0741 );
assign n0743 = n0742[8:8];
assign n0744 = ( n0539 + n0567 );
assign n0745 = ( n0275 + n0744 );
assign n0746 = n0745[4:4];
assign n0747 = ( n0543 + n0563 );
assign n0748 = ( n0282 + n0747 );
assign n0749 = n0748[8:8];
assign n0750 = n0748[7:7];
assign n0751 = ( n0749 == n0750 );
assign n0752 = !( n0751 );
assign n0753 = ( n0752 ) ? ( n0153 ) : ( n0020 );
assign n0754 = { ( n0743 ), ( n0746 ), ( n0141 ), ( n0753 ), ( n0143 ) };
assign PSW_3f = n0754;
// 
// Opcode: 40
// 
assign n0755 = ( n0139 == n0153 );
assign n0756 = { n0007[7], n0007[7], n0007[7], n0007[7], n0007[7], n0007[7], n0007[7], n0007[7], n0007 };
assign n0757 = ( n0004 + n0756 );
assign n0758 = ( n0755 ) ? ( n0757 ) : ( n0004 );
assign PC_40 = n0758;
// 
// Opcode: 41
// 
assign PC_41 = n0012;
// 
// Opcode: 42
// 
assign n0759 = ( n0085 | ACC );
assign n0760 = ( n0032 ) ? ( n0759 ) : ( PCON );
assign PCON_42 = n0760;
assign n0761 = ( n0062 ) ? ( n0759 ) : ( B );
assign B_42 = n0761;
assign n0762 = ( n0036 ) ? ( n0759 ) : ( TMOD );
assign TMOD_42 = n0762;
assign n0763 = ( n0028 ) ? ( n0759 ) : ( DPL );
assign DPL_42 = n0763;
assign n0764 = ( n0030 ) ? ( n0759 ) : ( DPH );
assign DPH_42 = n0764;
assign n0765 = ( n0042 ) ? ( n0759 ) : ( TL1 );
assign TL1_42 = n0765;
assign n0766 = ( n0038 ) ? ( n0759 ) : ( TL0 );
assign TL0_42 = n0766;
assign n0767 = ( n0054 ) ? ( n0759 ) : ( IE );
assign IE_42 = n0767;
assign n0768 = ( n0044 ) ? ( n0759 ) : ( TH1 );
assign TH1_42 = n0768;
assign n0769 = ( n0040 ) ? ( n0759 ) : ( TH0 );
assign TH0_42 = n0769;
assign PC_42 = n0004;
assign n0770 = ( n0052 ) ? ( n0759 ) : ( P2 );
assign P2_42 = n0770;
assign n0771 = ( n0056 ) ? ( n0759 ) : ( P3 );
assign P3_42 = n0771;
assign n0772 = ( n0024 ) ? ( n0759 ) : ( P0 );
assign P0_42 = n0772;
assign n0773 = ( n0046 ) ? ( n0759 ) : ( P1 );
assign P1_42 = n0773;
assign n0774 = ( n0058 ) ? ( n0759 ) : ( IP );
assign IP_42 = n0774;
assign n0775 = ( n0034 ) ? ( n0759 ) : ( TCON );
assign TCON_42 = n0775;
assign n0776 = ( n0048 ) ? ( n0759 ) : ( SCON );
assign SCON_42 = n0776;
assign n0777 = ( n0026 ) ? ( n0759 ) : ( SP );
assign SP_42 = n0777;
assign n0778 = ( n0050 ) ? ( n0759 ) : ( SBUF );
assign SBUF_42 = n0778;
assign n0779 = ( n0060 ) ? ( n0759 ) : ( PSW );
assign PSW_42 = n0779;
// 
// Opcode: 43
// 
assign n0780 = ( n0085 | n0006 );
assign n0781 = ( n0018 ) ? ( n0780 ) : ( ACC );
assign ACC_43 = n0781;
assign n0782 = ( n0032 ) ? ( n0780 ) : ( PCON );
assign PCON_43 = n0782;
assign n0783 = ( n0062 ) ? ( n0780 ) : ( B );
assign B_43 = n0783;
assign n0784 = ( n0036 ) ? ( n0780 ) : ( TMOD );
assign TMOD_43 = n0784;
assign n0785 = ( n0028 ) ? ( n0780 ) : ( DPL );
assign DPL_43 = n0785;
assign n0786 = ( n0030 ) ? ( n0780 ) : ( DPH );
assign DPH_43 = n0786;
assign n0787 = ( n0042 ) ? ( n0780 ) : ( TL1 );
assign TL1_43 = n0787;
assign n0788 = ( n0038 ) ? ( n0780 ) : ( TL0 );
assign TL0_43 = n0788;
assign n0789 = ( n0054 ) ? ( n0780 ) : ( IE );
assign IE_43 = n0789;
assign n0790 = ( n0044 ) ? ( n0780 ) : ( TH1 );
assign TH1_43 = n0790;
assign n0791 = ( n0040 ) ? ( n0780 ) : ( TH0 );
assign TH0_43 = n0791;
assign PC_43 = n0201;
assign n0792 = ( n0052 ) ? ( n0780 ) : ( P2 );
assign P2_43 = n0792;
assign n0793 = ( n0056 ) ? ( n0780 ) : ( P3 );
assign P3_43 = n0793;
assign n0794 = ( n0024 ) ? ( n0780 ) : ( P0 );
assign P0_43 = n0794;
assign n0795 = ( n0046 ) ? ( n0780 ) : ( P1 );
assign P1_43 = n0795;
assign n0796 = ( n0058 ) ? ( n0780 ) : ( IP );
assign IP_43 = n0796;
assign n0797 = ( n0034 ) ? ( n0780 ) : ( TCON );
assign TCON_43 = n0797;
assign n0798 = ( n0048 ) ? ( n0780 ) : ( SCON );
assign SCON_43 = n0798;
assign n0799 = ( n0026 ) ? ( n0780 ) : ( SP );
assign SP_43 = n0799;
assign n0800 = ( n0050 ) ? ( n0780 ) : ( SBUF );
assign SBUF_43 = n0800;
assign n0801 = ( n0060 ) ? ( n0780 ) : ( PSW );
assign PSW_43 = n0801;
// 
// Opcode: 44
// 
assign n0802 = ( ACC | n0007 );
assign ACC_44 = n0802;
assign PC_44 = n0004;
// 
// Opcode: 45
// 
assign n0803 = ( ACC | n0085 );
assign ACC_45 = n0803;
assign PC_45 = n0004;
// 
// Opcode: 46
// 
assign n0804 = ( ACC | n0112 );
assign ACC_46 = n0804;
assign PC_46 = n0002;
assign PSW_46 = n0144;
// 
// Opcode: 47
// 
assign n0805 = ( ACC | n0117 );
assign ACC_47 = n0805;
assign PC_47 = n0002;
// 
// Opcode: 48
// 
assign n0806 = ( ACC | n0111 );
assign ACC_48 = n0806;
assign PC_48 = n0002;
// 
// Opcode: 49
// 
assign n0807 = ( ACC | n0116 );
assign ACC_49 = n0807;
assign PC_49 = n0002;
// 
// Opcode: 4a
// 
assign n0808 = ( ACC | n0125 );
assign ACC_4a = n0808;
assign PC_4a = n0002;
// 
// Opcode: 4b
// 
assign n0809 = ( ACC | n0129 );
assign ACC_4b = n0809;
assign PC_4b = n0002;
// 
// Opcode: 4c
// 
assign n0810 = ( ACC | n0133 );
assign ACC_4c = n0810;
assign PC_4c = n0002;
// 
// Opcode: 4d
// 
assign n0811 = ( ACC | n0137 );
assign ACC_4d = n0811;
assign PC_4d = n0002;
assign n0812 = ( n0056 ) ? ( n0085 ) : ( P3 );
assign P3_4d = n0812;
// 
// Opcode: 4e
// 
assign n0813 = ( ACC | n0147 );
assign ACC_4e = n0813;
assign PC_4e = n0002;
// 
// Opcode: 4f
// 
assign n0814 = ( ACC | n0151 );
assign ACC_4f = n0814;
assign PC_4f = n0002;
// 
// Opcode: 50
// 
assign n0815 = ( n0139 == n0020 );
assign n0816 = ( n0815 ) ? ( n0757 ) : ( n0004 );
assign PC_50 = n0816;
// 
// Opcode: 51
// 
assign PC_51 = n0012;
assign SP_51 = n0220;
// 
// Opcode: 52
// 
assign n0817 = ( n0085 & ACC );
assign n0818 = ( n0032 ) ? ( n0817 ) : ( PCON );
assign PCON_52 = n0818;
assign n0819 = ( n0062 ) ? ( n0817 ) : ( B );
assign B_52 = n0819;
assign n0820 = ( n0036 ) ? ( n0817 ) : ( TMOD );
assign TMOD_52 = n0820;
assign n0821 = ( n0028 ) ? ( n0817 ) : ( DPL );
assign DPL_52 = n0821;
assign n0822 = ( n0030 ) ? ( n0817 ) : ( DPH );
assign DPH_52 = n0822;
assign n0823 = ( n0042 ) ? ( n0817 ) : ( TL1 );
assign TL1_52 = n0823;
assign n0824 = ( n0038 ) ? ( n0817 ) : ( TL0 );
assign TL0_52 = n0824;
assign n0825 = ( n0034 ) ? ( n0817 ) : ( TCON );
assign TCON_52 = n0825;
assign n0826 = ( n0044 ) ? ( n0817 ) : ( TH1 );
assign TH1_52 = n0826;
assign n0827 = ( n0040 ) ? ( n0817 ) : ( TH0 );
assign TH0_52 = n0827;
assign PC_52 = n0004;
assign n0828 = ( n0052 ) ? ( n0817 ) : ( P2 );
assign P2_52 = n0828;
assign n0829 = ( n0056 ) ? ( n0817 ) : ( P3 );
assign P3_52 = n0829;
assign n0830 = ( n0024 ) ? ( n0817 ) : ( P0 );
assign P0_52 = n0830;
assign n0831 = ( n0046 ) ? ( n0817 ) : ( P1 );
assign P1_52 = n0831;
assign n0832 = ( n0058 ) ? ( n0817 ) : ( IP );
assign IP_52 = n0832;
assign n0833 = ( n0054 ) ? ( n0817 ) : ( IE );
assign IE_52 = n0833;
assign n0834 = ( n0048 ) ? ( n0817 ) : ( SCON );
assign SCON_52 = n0834;
assign n0835 = ( n0026 ) ? ( n0817 ) : ( SP );
assign SP_52 = n0835;
assign n0836 = ( n0050 ) ? ( n0817 ) : ( SBUF );
assign SBUF_52 = n0836;
assign n0837 = ( n0060 ) ? ( n0817 ) : ( PSW );
assign PSW_52 = n0837;
// 
// Opcode: 53
// 
assign n0838 = ( n0085 & n0006 );
assign n0839 = ( n0018 ) ? ( n0838 ) : ( ACC );
assign ACC_53 = n0839;
assign n0840 = ( n0032 ) ? ( n0838 ) : ( PCON );
assign PCON_53 = n0840;
assign n0841 = ( n0062 ) ? ( n0838 ) : ( B );
assign B_53 = n0841;
assign n0842 = ( n0036 ) ? ( n0838 ) : ( TMOD );
assign TMOD_53 = n0842;
assign n0843 = ( n0028 ) ? ( n0838 ) : ( DPL );
assign DPL_53 = n0843;
assign n0844 = ( n0030 ) ? ( n0838 ) : ( DPH );
assign DPH_53 = n0844;
assign n0845 = ( n0042 ) ? ( n0838 ) : ( TL1 );
assign TL1_53 = n0845;
assign n0846 = ( n0038 ) ? ( n0838 ) : ( TL0 );
assign TL0_53 = n0846;
assign n0847 = ( n0054 ) ? ( n0838 ) : ( IE );
assign IE_53 = n0847;
assign n0848 = ( n0044 ) ? ( n0838 ) : ( TH1 );
assign TH1_53 = n0848;
assign n0849 = ( n0040 ) ? ( n0838 ) : ( TH0 );
assign TH0_53 = n0849;
assign PC_53 = n0201;
assign n0850 = ( n0052 ) ? ( n0838 ) : ( P2 );
assign P2_53 = n0850;
assign n0851 = ( n0056 ) ? ( n0838 ) : ( P3 );
assign P3_53 = n0851;
assign n0852 = ( n0024 ) ? ( n0838 ) : ( P0 );
assign P0_53 = n0852;
assign n0853 = ( n0046 ) ? ( n0838 ) : ( P1 );
assign P1_53 = n0853;
assign n0854 = ( n0058 ) ? ( n0838 ) : ( IP );
assign IP_53 = n0854;
assign n0855 = ( n0034 ) ? ( n0838 ) : ( TCON );
assign TCON_53 = n0855;
assign n0856 = ( n0048 ) ? ( n0838 ) : ( SCON );
assign SCON_53 = n0856;
assign n0857 = ( n0026 ) ? ( n0838 ) : ( SP );
assign SP_53 = n0857;
assign n0858 = ( n0050 ) ? ( n0838 ) : ( SBUF );
assign SBUF_53 = n0858;
assign n0859 = ( n0060 ) ? ( n0838 ) : ( PSW );
assign PSW_53 = n0859;
// 
// Opcode: 54
// 
assign n0860 = ( ACC & n0007 );
assign ACC_54 = n0860;
assign PC_54 = n0004;
// 
// Opcode: 55
// 
assign n0861 = ( ACC & n0085 );
assign ACC_55 = n0861;
assign PC_55 = n0004;
// 
// Opcode: 56
// 
assign n0862 = ( ACC & n0112 );
assign ACC_56 = n0862;
assign PC_56 = n0002;
// 
// Opcode: 57
// 
assign n0863 = ( ACC & n0117 );
assign ACC_57 = n0863;
assign PC_57 = n0002;
// 
// Opcode: 58
// 
assign n0864 = ( ACC & n0111 );
assign ACC_58 = n0864;
assign PC_58 = n0002;
// 
// Opcode: 59
// 
assign n0865 = ( ACC & n0116 );
assign ACC_59 = n0865;
assign PC_59 = n0002;
// 
// Opcode: 5a
// 
assign n0866 = ( ACC & n0125 );
assign ACC_5a = n0866;
assign PC_5a = n0002;
// 
// Opcode: 5b
// 
assign n0867 = ( ACC & n0129 );
assign ACC_5b = n0867;
assign PC_5b = n0002;
// 
// Opcode: 5c
// 
assign n0868 = ( ACC & n0133 );
assign ACC_5c = n0868;
assign PC_5c = n0002;
// 
// Opcode: 5d
// 
assign n0869 = ( ACC & n0137 );
assign ACC_5d = n0869;
assign PC_5d = n0002;
// 
// Opcode: 5e
// 
assign n0870 = ( ACC & n0147 );
assign ACC_5e = n0870;
assign PC_5e = n0002;
// 
// Opcode: 5f
// 
assign n0871 = ( ACC & n0151 );
assign ACC_5f = n0871;
assign PC_5f = n0002;
// 
// Opcode: 60
// 
assign n0872 = ( ACC == n0063 );
assign n0873 = ( n0872 ) ? ( n0757 ) : ( n0004 );
assign PC_60 = n0873;
// 
// Opcode: 61
// 
assign PC_61 = n0012;
// 
// Opcode: 62
// 
assign n0874 = ( n0085 ^ n0085 );
assign n0875 = ( n0018 ) ? ( n0874 ) : ( ACC );
assign ACC_62 = n0875;
assign n0876 = ( n0085 ^ ACC );
assign n0877 = ( n0032 ) ? ( n0876 ) : ( PCON );
assign PCON_62 = n0877;
assign n0878 = ( n0046 ) ? ( n0876 ) : ( P1 );
assign P1_62 = n0878;
assign n0879 = ( n0036 ) ? ( n0876 ) : ( TMOD );
assign TMOD_62 = n0879;
assign n0880 = ( n0028 ) ? ( n0876 ) : ( DPL );
assign DPL_62 = n0880;
assign n0881 = ( n0030 ) ? ( n0876 ) : ( DPH );
assign DPH_62 = n0881;
assign n0882 = ( n0042 ) ? ( n0876 ) : ( TL1 );
assign TL1_62 = n0882;
assign n0883 = ( n0038 ) ? ( n0876 ) : ( TL0 );
assign TL0_62 = n0883;
assign n0884 = ( n0034 ) ? ( n0876 ) : ( TCON );
assign TCON_62 = n0884;
assign n0885 = ( n0044 ) ? ( n0876 ) : ( TH1 );
assign TH1_62 = n0885;
assign n0886 = ( n0040 ) ? ( n0876 ) : ( TH0 );
assign TH0_62 = n0886;
assign PC_62 = n0004;
assign n0887 = ( n0052 ) ? ( n0876 ) : ( P2 );
assign P2_62 = n0887;
assign n0888 = ( n0056 ) ? ( n0876 ) : ( P3 );
assign P3_62 = n0888;
assign n0889 = ( n0024 ) ? ( n0876 ) : ( P0 );
assign P0_62 = n0889;
assign n0890 = ( n0062 ) ? ( n0876 ) : ( B );
assign B_62 = n0890;
assign n0891 = ( n0058 ) ? ( n0876 ) : ( IP );
assign IP_62 = n0891;
assign n0892 = ( n0054 ) ? ( n0876 ) : ( IE );
assign IE_62 = n0892;
assign n0893 = ( n0048 ) ? ( n0876 ) : ( SCON );
assign SCON_62 = n0893;
assign n0894 = ( n0026 ) ? ( n0876 ) : ( SP );
assign SP_62 = n0894;
assign n0895 = ( n0050 ) ? ( n0876 ) : ( SBUF );
assign SBUF_62 = n0895;
assign n0896 = ( n0060 ) ? ( n0876 ) : ( PSW );
assign PSW_62 = n0896;
// 
// Opcode: 63
// 
assign n0897 = ( n0085 ^ n0006 );
assign n0898 = ( n0018 ) ? ( n0897 ) : ( ACC );
assign ACC_63 = n0898;
assign n0899 = ( n0032 ) ? ( n0897 ) : ( PCON );
assign PCON_63 = n0899;
assign n0900 = ( n0046 ) ? ( n0897 ) : ( P1 );
assign P1_63 = n0900;
assign n0901 = ( n0036 ) ? ( n0897 ) : ( TMOD );
assign TMOD_63 = n0901;
assign n0902 = ( n0028 ) ? ( n0897 ) : ( DPL );
assign DPL_63 = n0902;
assign n0903 = ( n0030 ) ? ( n0897 ) : ( DPH );
assign DPH_63 = n0903;
assign n0904 = ( n0042 ) ? ( n0897 ) : ( TL1 );
assign TL1_63 = n0904;
assign n0905 = ( n0038 ) ? ( n0897 ) : ( TL0 );
assign TL0_63 = n0905;
assign n0906 = ( n0054 ) ? ( n0897 ) : ( IE );
assign IE_63 = n0906;
assign n0907 = ( n0044 ) ? ( n0897 ) : ( TH1 );
assign TH1_63 = n0907;
assign n0908 = ( n0040 ) ? ( n0897 ) : ( TH0 );
assign TH0_63 = n0908;
assign PC_63 = n0201;
assign n0909 = ( n0052 ) ? ( n0897 ) : ( P2 );
assign P2_63 = n0909;
assign n0910 = ( n0056 ) ? ( n0897 ) : ( P3 );
assign P3_63 = n0910;
assign n0911 = ( n0024 ) ? ( n0897 ) : ( P0 );
assign P0_63 = n0911;
assign n0912 = ( n0062 ) ? ( n0897 ) : ( B );
assign B_63 = n0912;
assign n0913 = ( n0058 ) ? ( n0897 ) : ( IP );
assign IP_63 = n0913;
assign n0914 = ( n0034 ) ? ( n0897 ) : ( TCON );
assign TCON_63 = n0914;
assign n0915 = ( n0048 ) ? ( n0897 ) : ( SCON );
assign SCON_63 = n0915;
assign n0916 = ( n0026 ) ? ( n0897 ) : ( SP );
assign SP_63 = n0916;
assign n0917 = ( n0050 ) ? ( n0897 ) : ( SBUF );
assign SBUF_63 = n0917;
assign n0918 = ( n0060 ) ? ( n0897 ) : ( PSW );
assign PSW_63 = n0918;
// 
// Opcode: 64
// 
assign n0919 = ( ACC ^ n0007 );
assign ACC_64 = n0919;
assign PC_64 = n0004;
// 
// Opcode: 65
// 
assign n0920 = ( ACC ^ n0085 );
assign ACC_65 = n0920;
assign PC_65 = n0004;
assign PSW_65 = n0144;
// 
// Opcode: 66
// 
assign n0921 = ( ACC ^ n0112 );
assign ACC_66 = n0921;
assign PC_66 = n0002;
// 
// Opcode: 67
// 
assign n0922 = ( ACC ^ n0117 );
assign ACC_67 = n0922;
assign PC_67 = n0002;
// 
// Opcode: 68
// 
assign n0923 = ( ACC ^ n0111 );
assign ACC_68 = n0923;
assign PC_68 = n0002;
// 
// Opcode: 69
// 
assign n0924 = ( ACC ^ n0116 );
assign ACC_69 = n0924;
assign PC_69 = n0002;
// 
// Opcode: 6a
// 
assign n0925 = ( ACC ^ n0125 );
assign ACC_6a = n0925;
assign PC_6a = n0002;
// 
// Opcode: 6b
// 
assign n0926 = ( ACC ^ n0129 );
assign ACC_6b = n0926;
assign PC_6b = n0002;
// 
// Opcode: 6c
// 
assign n0927 = ( ACC ^ n0133 );
assign ACC_6c = n0927;
assign PC_6c = n0002;
assign SP_6c = n0340;
// 
// Opcode: 6d
// 
assign n0928 = ( ACC ^ n0137 );
assign ACC_6d = n0928;
assign PC_6d = n0002;
// 
// Opcode: 6e
// 
assign n0929 = ( ACC ^ n0147 );
assign ACC_6e = n0929;
assign PC_6e = n0002;
// 
// Opcode: 6f
// 
assign n0930 = ( ACC ^ n0151 );
assign ACC_6f = n0930;
assign PC_6f = n0002;
// 
// Opcode: 70
// 
assign n0931 = !( n0872 );
assign n0932 = ( n0931 ) ? ( n0757 ) : ( n0004 );
assign PC_70 = n0932;
// 
// Opcode: 71
// 
assign PC_71 = n0012;
assign SP_71 = n0220;
// 
// Opcode: 72
// 
assign PC_72 = n0004;
assign n0933 = ( n0139 | n0198 );
assign n0934 = PSW[6:0];
assign n0935 = { ( n0933 ), ( n0934 ) };
assign PSW_72 = n0935;
// 
// Opcode: 73
// 
assign n0936 = { ( DPH ), ( DPL ) };
assign n0937 = { 8'b0, ACC };
assign n0938 = ( n0936 + n0937 );
assign PC_73 = n0938;
// 
// Opcode: 74
// 
assign ACC_74 = n0007;
assign PC_74 = n0004;
// 
// Opcode: 75
// 
assign n0939 = ( n0018 ) ? ( n0006 ) : ( ACC );
assign ACC_75 = n0939;
assign n0940 = ( n0032 ) ? ( n0006 ) : ( PCON );
assign PCON_75 = n0940;
assign n0941 = ( n0062 ) ? ( n0006 ) : ( B );
assign B_75 = n0941;
assign n0942 = ( n0036 ) ? ( n0006 ) : ( TMOD );
assign TMOD_75 = n0942;
assign n0943 = ( n0028 ) ? ( n0006 ) : ( DPL );
assign DPL_75 = n0943;
assign n0944 = ( n0030 ) ? ( n0006 ) : ( DPH );
assign DPH_75 = n0944;
assign n0945 = ( n0042 ) ? ( n0006 ) : ( TL1 );
assign TL1_75 = n0945;
assign n0946 = ( n0038 ) ? ( n0006 ) : ( TL0 );
assign TL0_75 = n0946;
assign n0947 = ( n0034 ) ? ( n0006 ) : ( TCON );
assign TCON_75 = n0947;
assign n0948 = ( n0044 ) ? ( n0006 ) : ( TH1 );
assign TH1_75 = n0948;
assign n0949 = ( n0040 ) ? ( n0006 ) : ( TH0 );
assign TH0_75 = n0949;
assign PC_75 = n0201;
assign n0950 = ( n0052 ) ? ( n0006 ) : ( P2 );
assign P2_75 = n0950;
assign n0951 = ( n0056 ) ? ( n0006 ) : ( P3 );
assign P3_75 = n0951;
assign n0952 = ( n0024 ) ? ( n0006 ) : ( P0 );
assign P0_75 = n0952;
assign n0953 = ( n0046 ) ? ( n0006 ) : ( P1 );
assign P1_75 = n0953;
assign n0954 = ( n0058 ) ? ( n0006 ) : ( IP );
assign IP_75 = n0954;
assign n0955 = ( n0054 ) ? ( n0006 ) : ( IE );
assign IE_75 = n0955;
assign n0956 = ( n0048 ) ? ( n0006 ) : ( SCON );
assign SCON_75 = n0956;
assign n0957 = ( n0026 ) ? ( n0006 ) : ( SP );
assign SP_75 = n0957;
assign n0958 = ( n0050 ) ? ( n0006 ) : ( SBUF );
assign SBUF_75 = n0958;
assign n0959 = ( n0060 ) ? ( n0006 ) : ( PSW );
assign PSW_75 = n0959;
// 
// Opcode: 76
// 
assign PC_76 = n0004;
// 
// Opcode: 77
// 
assign PC_77 = n0004;
// 
// Opcode: 78
// 
assign PC_78 = n0004;
// 
// Opcode: 79
// 
assign PC_79 = n0004;
// 
// Opcode: 7a
// 
assign PC_7a = n0004;
// 
// Opcode: 7b
// 
assign PC_7b = n0004;
// 
// Opcode: 7c
// 
assign PC_7c = n0004;
// 
// Opcode: 7d
// 
assign PC_7d = n0004;
// 
// Opcode: 7e
// 
assign PC_7e = n0004;
assign n0960 = ( n0054 ) ? ( n0121 ) : ( IE );
assign IE_7e = n0960;
// 
// Opcode: 7f
// 
assign PC_7f = n0004;
// 
// Opcode: 80
// 
assign PC_80 = n0757;
// 
// Opcode: 81
// 
assign PC_81 = n0012;
// 
// Opcode: 82
// 
assign PC_82 = n0004;
assign n0961 = ( n0139 & n0198 );
assign n0962 = { ( n0961 ), ( n0934 ) };
assign PSW_82 = n0962;
// 
// Opcode: 83
// 
assign n0963 = ( n0937 + n0002 );
assign n0964 = ROM[n0963];
assign ACC_83 = n0964;
assign PC_83 = n0002;
// 
// Opcode: 84
// 
assign n0965 = ( B == n0063 );
assign n0966 = 8'hff;
assign n0967 = ( ACC / B );
assign n0968 = ( n0965 ) ? ( n0966 ) : ( n0967 );
assign ACC_84 = n0968;
assign n0969 = ( ACC % B );
assign n0970 = ( n0965 ) ? ( ACC ) : ( n0969 );
assign B_84 = n0970;
assign PC_84 = n0002;
assign n0971 = PSW[6:3];
assign n0972 = ( n0965 ) ? ( n0153 ) : ( n0020 );
assign n0973 = { ( n0020 ), ( n0971 ), ( n0972 ), ( n0143 ) };
assign PSW_84 = n0973;
// 
// Opcode: 85
// 
assign n0974 = ( n0315 ) ? ( n0085 ) : ( ACC );
assign ACC_85 = n0974;
assign n0975 = ( n0300 ) ? ( n0085 ) : ( PCON );
assign PCON_85 = n0975;
assign n0976 = ( n0316 ) ? ( n0085 ) : ( B );
assign B_85 = n0976;
assign n0977 = ( n0302 ) ? ( n0085 ) : ( TMOD );
assign TMOD_85 = n0977;
assign n0978 = ( n0298 ) ? ( n0085 ) : ( DPL );
assign DPL_85 = n0978;
assign n0979 = ( n0299 ) ? ( n0085 ) : ( DPH );
assign DPH_85 = n0979;
assign n0980 = ( n0305 ) ? ( n0085 ) : ( TL1 );
assign TL1_85 = n0980;
assign n0981 = ( n0303 ) ? ( n0085 ) : ( TL0 );
assign TL0_85 = n0981;
assign n0982 = ( n0301 ) ? ( n0085 ) : ( TCON );
assign TCON_85 = n0982;
assign n0983 = ( n0306 ) ? ( n0085 ) : ( TH1 );
assign TH1_85 = n0983;
assign n0984 = ( n0304 ) ? ( n0085 ) : ( TH0 );
assign TH0_85 = n0984;
assign PC_85 = n0201;
assign n0985 = ( n0310 ) ? ( n0085 ) : ( P2 );
assign P2_85 = n0985;
assign n0986 = ( n0312 ) ? ( n0085 ) : ( P3 );
assign P3_85 = n0986;
assign n0987 = ( n0297 ) ? ( n0085 ) : ( P0 );
assign P0_85 = n0987;
assign n0988 = ( n0307 ) ? ( n0085 ) : ( P1 );
assign P1_85 = n0988;
assign n0989 = ( n0313 ) ? ( n0085 ) : ( IP );
assign IP_85 = n0989;
assign n0990 = ( n0311 ) ? ( n0085 ) : ( IE );
assign IE_85 = n0990;
assign n0991 = ( n0308 ) ? ( n0085 ) : ( SCON );
assign SCON_85 = n0991;
assign n0992 = ( n0293 ) ? ( n0085 ) : ( SP );
assign SP_85 = n0992;
assign n0993 = ( n0309 ) ? ( n0085 ) : ( SBUF );
assign SBUF_85 = n0993;
assign n0994 = ( n0314 ) ? ( n0085 ) : ( PSW );
assign PSW_85 = n0994;
// 
// Opcode: 86
// 
assign n0995 = ( n0018 ) ? ( n0112 ) : ( ACC );
assign ACC_86 = n0995;
assign n0996 = ( n0032 ) ? ( n0112 ) : ( PCON );
assign PCON_86 = n0996;
assign n0997 = ( n0046 ) ? ( n0112 ) : ( P1 );
assign P1_86 = n0997;
assign n0998 = ( n0036 ) ? ( n0112 ) : ( TMOD );
assign TMOD_86 = n0998;
assign n0999 = ( n0028 ) ? ( n0112 ) : ( DPL );
assign DPL_86 = n0999;
assign n1000 = ( n0030 ) ? ( n0112 ) : ( DPH );
assign DPH_86 = n1000;
assign n1001 = ( n0042 ) ? ( n0112 ) : ( TL1 );
assign TL1_86 = n1001;
assign n1002 = ( n0038 ) ? ( n0112 ) : ( TL0 );
assign TL0_86 = n1002;
assign n1003 = ( n0054 ) ? ( n0112 ) : ( IE );
assign IE_86 = n1003;
assign n1004 = ( n0044 ) ? ( n0112 ) : ( TH1 );
assign TH1_86 = n1004;
assign n1005 = ( n0040 ) ? ( n0112 ) : ( TH0 );
assign TH0_86 = n1005;
assign PC_86 = n0004;
assign n1006 = ( n0052 ) ? ( n0112 ) : ( P2 );
assign P2_86 = n1006;
assign n1007 = ( n0056 ) ? ( n0112 ) : ( P3 );
assign P3_86 = n1007;
assign n1008 = ( n0024 ) ? ( n0112 ) : ( P0 );
assign P0_86 = n1008;
assign n1009 = ( n0062 ) ? ( n0112 ) : ( B );
assign B_86 = n1009;
assign n1010 = ( n0058 ) ? ( n0112 ) : ( IP );
assign IP_86 = n1010;
assign n1011 = ( n0034 ) ? ( n0112 ) : ( TCON );
assign TCON_86 = n1011;
assign n1012 = ( n0048 ) ? ( n0112 ) : ( SCON );
assign SCON_86 = n1012;
assign n1013 = ( n0026 ) ? ( n0112 ) : ( SP );
assign SP_86 = n1013;
assign n1014 = ( n0050 ) ? ( n0112 ) : ( SBUF );
assign SBUF_86 = n1014;
assign n1015 = ( n0060 ) ? ( n0112 ) : ( PSW );
assign PSW_86 = n1015;
// 
// Opcode: 87
// 
assign n1016 = ( n0018 ) ? ( n0117 ) : ( ACC );
assign ACC_87 = n1016;
assign n1017 = ( n0032 ) ? ( n0117 ) : ( PCON );
assign PCON_87 = n1017;
assign n1018 = ( n0062 ) ? ( n0117 ) : ( B );
assign B_87 = n1018;
assign n1019 = ( n0036 ) ? ( n0117 ) : ( TMOD );
assign TMOD_87 = n1019;
assign n1020 = ( n0028 ) ? ( n0117 ) : ( DPL );
assign DPL_87 = n1020;
assign n1021 = ( n0030 ) ? ( n0117 ) : ( DPH );
assign DPH_87 = n1021;
assign n1022 = ( n0042 ) ? ( n0117 ) : ( TL1 );
assign TL1_87 = n1022;
assign n1023 = ( n0038 ) ? ( n0117 ) : ( TL0 );
assign TL0_87 = n1023;
assign n1024 = ( n0054 ) ? ( n0117 ) : ( IE );
assign IE_87 = n1024;
assign n1025 = ( n0044 ) ? ( n0117 ) : ( TH1 );
assign TH1_87 = n1025;
assign n1026 = ( n0040 ) ? ( n0117 ) : ( TH0 );
assign TH0_87 = n1026;
assign PC_87 = n0004;
assign n1027 = ( n0052 ) ? ( n0117 ) : ( P2 );
assign P2_87 = n1027;
assign n1028 = ( n0056 ) ? ( n0117 ) : ( P3 );
assign P3_87 = n1028;
assign n1029 = ( n0024 ) ? ( n0117 ) : ( P0 );
assign P0_87 = n1029;
assign n1030 = ( n0046 ) ? ( n0117 ) : ( P1 );
assign P1_87 = n1030;
assign n1031 = ( n0058 ) ? ( n0117 ) : ( IP );
assign IP_87 = n1031;
assign n1032 = ( n0034 ) ? ( n0117 ) : ( TCON );
assign TCON_87 = n1032;
assign n1033 = ( n0048 ) ? ( n0117 ) : ( SCON );
assign SCON_87 = n1033;
assign n1034 = ( n0026 ) ? ( n0117 ) : ( SP );
assign SP_87 = n1034;
assign n1035 = ( n0050 ) ? ( n0117 ) : ( SBUF );
assign SBUF_87 = n1035;
assign n1036 = ( n0060 ) ? ( n0117 ) : ( PSW );
assign PSW_87 = n1036;
// 
// Opcode: 88
// 
assign n1037 = ( n0018 ) ? ( n0111 ) : ( ACC );
assign ACC_88 = n1037;
assign n1038 = ( n0032 ) ? ( n0111 ) : ( PCON );
assign PCON_88 = n1038;
assign n1039 = ( n0062 ) ? ( n0111 ) : ( B );
assign B_88 = n1039;
assign n1040 = ( n0036 ) ? ( n0111 ) : ( TMOD );
assign TMOD_88 = n1040;
assign n1041 = ( n0028 ) ? ( n0111 ) : ( DPL );
assign DPL_88 = n1041;
assign n1042 = ( n0030 ) ? ( n0111 ) : ( DPH );
assign DPH_88 = n1042;
assign n1043 = ( n0042 ) ? ( n0111 ) : ( TL1 );
assign TL1_88 = n1043;
assign n1044 = ( n0038 ) ? ( n0111 ) : ( TL0 );
assign TL0_88 = n1044;
assign n1045 = ( n0054 ) ? ( n0111 ) : ( IE );
assign IE_88 = n1045;
assign n1046 = ( n0044 ) ? ( n0111 ) : ( TH1 );
assign TH1_88 = n1046;
assign n1047 = ( n0040 ) ? ( n0111 ) : ( TH0 );
assign TH0_88 = n1047;
assign PC_88 = n0004;
assign n1048 = ( n0052 ) ? ( n0111 ) : ( P2 );
assign P2_88 = n1048;
assign n1049 = ( n0056 ) ? ( n0111 ) : ( P3 );
assign P3_88 = n1049;
assign n1050 = ( n0024 ) ? ( n0111 ) : ( P0 );
assign P0_88 = n1050;
assign n1051 = ( n0046 ) ? ( n0111 ) : ( P1 );
assign P1_88 = n1051;
assign n1052 = ( n0058 ) ? ( n0111 ) : ( IP );
assign IP_88 = n1052;
assign n1053 = ( n0034 ) ? ( n0111 ) : ( TCON );
assign TCON_88 = n1053;
assign n1054 = ( n0048 ) ? ( n0111 ) : ( SCON );
assign SCON_88 = n1054;
assign n1055 = ( n0026 ) ? ( n0111 ) : ( SP );
assign SP_88 = n1055;
assign n1056 = ( n0050 ) ? ( n0111 ) : ( SBUF );
assign SBUF_88 = n1056;
assign n1057 = ( n0060 ) ? ( n0111 ) : ( PSW );
assign PSW_88 = n1057;
// 
// Opcode: 89
// 
assign n1058 = ( n0018 ) ? ( n0116 ) : ( ACC );
assign ACC_89 = n1058;
assign n1059 = ( n0032 ) ? ( n0116 ) : ( PCON );
assign PCON_89 = n1059;
assign n1060 = ( n0062 ) ? ( n0116 ) : ( B );
assign B_89 = n1060;
assign n1061 = ( n0036 ) ? ( n0116 ) : ( TMOD );
assign TMOD_89 = n1061;
assign n1062 = ( n0028 ) ? ( n0116 ) : ( DPL );
assign DPL_89 = n1062;
assign n1063 = ( n0030 ) ? ( n0116 ) : ( DPH );
assign DPH_89 = n1063;
assign n1064 = ( n0042 ) ? ( n0116 ) : ( TL1 );
assign TL1_89 = n1064;
assign n1065 = ( n0038 ) ? ( n0116 ) : ( TL0 );
assign TL0_89 = n1065;
assign n1066 = ( n0054 ) ? ( n0116 ) : ( IE );
assign IE_89 = n1066;
assign n1067 = ( n0044 ) ? ( n0116 ) : ( TH1 );
assign TH1_89 = n1067;
assign n1068 = ( n0040 ) ? ( n0116 ) : ( TH0 );
assign TH0_89 = n1068;
assign PC_89 = n0004;
assign n1069 = ( n0052 ) ? ( n0116 ) : ( P2 );
assign P2_89 = n1069;
assign n1070 = ( n0056 ) ? ( n0116 ) : ( P3 );
assign P3_89 = n1070;
assign n1071 = ( n0024 ) ? ( n0116 ) : ( P0 );
assign P0_89 = n1071;
assign n1072 = ( n0046 ) ? ( n0116 ) : ( P1 );
assign P1_89 = n1072;
assign n1073 = ( n0058 ) ? ( n0116 ) : ( IP );
assign IP_89 = n1073;
assign n1074 = ( n0034 ) ? ( n0116 ) : ( TCON );
assign TCON_89 = n1074;
assign n1075 = ( n0048 ) ? ( n0116 ) : ( SCON );
assign SCON_89 = n1075;
assign n1076 = ( n0026 ) ? ( n0116 ) : ( SP );
assign SP_89 = n1076;
assign n1077 = ( n0050 ) ? ( n0116 ) : ( SBUF );
assign SBUF_89 = n1077;
assign n1078 = ( n0060 ) ? ( n0116 ) : ( PSW );
assign PSW_89 = n1078;
// 
// Opcode: 8a
// 
assign n1079 = ( n0018 ) ? ( n0125 ) : ( ACC );
assign ACC_8a = n1079;
assign n1080 = ( n0032 ) ? ( n0125 ) : ( PCON );
assign PCON_8a = n1080;
assign n1081 = ( n0046 ) ? ( n0125 ) : ( P1 );
assign P1_8a = n1081;
assign n1082 = ( n0036 ) ? ( n0125 ) : ( TMOD );
assign TMOD_8a = n1082;
assign n1083 = ( n0028 ) ? ( n0125 ) : ( DPL );
assign DPL_8a = n1083;
assign n1084 = ( n0030 ) ? ( n0125 ) : ( DPH );
assign DPH_8a = n1084;
assign n1085 = ( n0042 ) ? ( n0125 ) : ( TL1 );
assign TL1_8a = n1085;
assign n1086 = ( n0038 ) ? ( n0125 ) : ( TL0 );
assign TL0_8a = n1086;
assign n1087 = ( n0034 ) ? ( n0125 ) : ( TCON );
assign TCON_8a = n1087;
assign n1088 = ( n0044 ) ? ( n0125 ) : ( TH1 );
assign TH1_8a = n1088;
assign n1089 = ( n0040 ) ? ( n0125 ) : ( TH0 );
assign TH0_8a = n1089;
assign PC_8a = n0004;
assign n1090 = ( n0052 ) ? ( n0125 ) : ( P2 );
assign P2_8a = n1090;
assign n1091 = ( n0056 ) ? ( n0125 ) : ( P3 );
assign P3_8a = n1091;
assign n1092 = ( n0024 ) ? ( n0125 ) : ( P0 );
assign P0_8a = n1092;
assign n1093 = ( n0062 ) ? ( n0125 ) : ( B );
assign B_8a = n1093;
assign n1094 = ( n0058 ) ? ( n0125 ) : ( IP );
assign IP_8a = n1094;
assign n1095 = ( n0054 ) ? ( n0125 ) : ( IE );
assign IE_8a = n1095;
assign n1096 = ( n0048 ) ? ( n0125 ) : ( SCON );
assign SCON_8a = n1096;
assign n1097 = ( n0026 ) ? ( n0125 ) : ( SP );
assign SP_8a = n1097;
assign n1098 = ( n0050 ) ? ( n0125 ) : ( SBUF );
assign SBUF_8a = n1098;
assign n1099 = ( n0060 ) ? ( n0125 ) : ( PSW );
assign PSW_8a = n1099;
// 
// Opcode: 8b
// 
assign n1100 = ( n0018 ) ? ( n0129 ) : ( ACC );
assign ACC_8b = n1100;
assign n1101 = ( n0032 ) ? ( n0129 ) : ( PCON );
assign PCON_8b = n1101;
assign n1102 = ( n0062 ) ? ( n0129 ) : ( B );
assign B_8b = n1102;
assign n1103 = ( n0036 ) ? ( n0129 ) : ( TMOD );
assign TMOD_8b = n1103;
assign n1104 = ( n0028 ) ? ( n0129 ) : ( DPL );
assign DPL_8b = n1104;
assign n1105 = ( n0030 ) ? ( n0129 ) : ( DPH );
assign DPH_8b = n1105;
assign n1106 = ( n0042 ) ? ( n0129 ) : ( TL1 );
assign TL1_8b = n1106;
assign n1107 = ( n0038 ) ? ( n0129 ) : ( TL0 );
assign TL0_8b = n1107;
assign n1108 = ( n0054 ) ? ( n0129 ) : ( IE );
assign IE_8b = n1108;
assign n1109 = ( n0044 ) ? ( n0129 ) : ( TH1 );
assign TH1_8b = n1109;
assign n1110 = ( n0040 ) ? ( n0129 ) : ( TH0 );
assign TH0_8b = n1110;
assign PC_8b = n0004;
assign n1111 = ( n0052 ) ? ( n0129 ) : ( P2 );
assign P2_8b = n1111;
assign n1112 = ( n0056 ) ? ( n0129 ) : ( P3 );
assign P3_8b = n1112;
assign n1113 = ( n0024 ) ? ( n0129 ) : ( P0 );
assign P0_8b = n1113;
assign n1114 = ( n0046 ) ? ( n0129 ) : ( P1 );
assign P1_8b = n1114;
assign n1115 = ( n0058 ) ? ( n0129 ) : ( IP );
assign IP_8b = n1115;
assign n1116 = ( n0034 ) ? ( n0129 ) : ( TCON );
assign TCON_8b = n1116;
assign n1117 = ( n0048 ) ? ( n0129 ) : ( SCON );
assign SCON_8b = n1117;
assign n1118 = ( n0026 ) ? ( n0129 ) : ( SP );
assign SP_8b = n1118;
assign n1119 = ( n0050 ) ? ( n0129 ) : ( SBUF );
assign SBUF_8b = n1119;
assign n1120 = ( n0060 ) ? ( n0129 ) : ( PSW );
assign PSW_8b = n1120;
// 
// Opcode: 8c
// 
assign n1121 = ( n0018 ) ? ( n0133 ) : ( ACC );
assign ACC_8c = n1121;
assign n1122 = ( n0032 ) ? ( n0133 ) : ( PCON );
assign PCON_8c = n1122;
assign n1123 = ( n0046 ) ? ( n0133 ) : ( P1 );
assign P1_8c = n1123;
assign n1124 = ( n0036 ) ? ( n0133 ) : ( TMOD );
assign TMOD_8c = n1124;
assign n1125 = ( n0028 ) ? ( n0133 ) : ( DPL );
assign DPL_8c = n1125;
assign n1126 = ( n0030 ) ? ( n0133 ) : ( DPH );
assign DPH_8c = n1126;
assign n1127 = ( n0042 ) ? ( n0133 ) : ( TL1 );
assign TL1_8c = n1127;
assign n1128 = ( n0038 ) ? ( n0133 ) : ( TL0 );
assign TL0_8c = n1128;
assign n1129 = ( n0054 ) ? ( n0133 ) : ( IE );
assign IE_8c = n1129;
assign n1130 = ( n0044 ) ? ( n0133 ) : ( TH1 );
assign TH1_8c = n1130;
assign n1131 = ( n0040 ) ? ( n0133 ) : ( TH0 );
assign TH0_8c = n1131;
assign PC_8c = n0004;
assign n1132 = ( n0052 ) ? ( n0133 ) : ( P2 );
assign P2_8c = n1132;
assign n1133 = ( n0056 ) ? ( n0133 ) : ( P3 );
assign P3_8c = n1133;
assign n1134 = ( n0024 ) ? ( n0133 ) : ( P0 );
assign P0_8c = n1134;
assign n1135 = ( n0062 ) ? ( n0133 ) : ( B );
assign B_8c = n1135;
assign n1136 = ( n0058 ) ? ( n0133 ) : ( IP );
assign IP_8c = n1136;
assign n1137 = ( n0034 ) ? ( n0133 ) : ( TCON );
assign TCON_8c = n1137;
assign n1138 = ( n0048 ) ? ( n0133 ) : ( SCON );
assign SCON_8c = n1138;
assign n1139 = ( n0026 ) ? ( n0133 ) : ( SP );
assign SP_8c = n1139;
assign n1140 = ( n0050 ) ? ( n0133 ) : ( SBUF );
assign SBUF_8c = n1140;
assign n1141 = ( n0060 ) ? ( n0133 ) : ( PSW );
assign PSW_8c = n1141;
// 
// Opcode: 8d
// 
assign n1142 = ( n0018 ) ? ( n0137 ) : ( ACC );
assign ACC_8d = n1142;
assign n1143 = ( n0032 ) ? ( n0137 ) : ( PCON );
assign PCON_8d = n1143;
assign n1144 = ( n0062 ) ? ( n0137 ) : ( B );
assign B_8d = n1144;
assign n1145 = ( n0036 ) ? ( n0137 ) : ( TMOD );
assign TMOD_8d = n1145;
assign n1146 = ( n0028 ) ? ( n0137 ) : ( DPL );
assign DPL_8d = n1146;
assign n1147 = ( n0030 ) ? ( n0137 ) : ( DPH );
assign DPH_8d = n1147;
assign n1148 = ( n0042 ) ? ( n0137 ) : ( TL1 );
assign TL1_8d = n1148;
assign n1149 = ( n0038 ) ? ( n0137 ) : ( TL0 );
assign TL0_8d = n1149;
assign n1150 = ( n0054 ) ? ( n0137 ) : ( IE );
assign IE_8d = n1150;
assign n1151 = ( n0044 ) ? ( n0137 ) : ( TH1 );
assign TH1_8d = n1151;
assign n1152 = ( n0040 ) ? ( n0137 ) : ( TH0 );
assign TH0_8d = n1152;
assign PC_8d = n0004;
assign n1153 = ( n0052 ) ? ( n0137 ) : ( P2 );
assign P2_8d = n1153;
assign n1154 = ( n0056 ) ? ( n0137 ) : ( P3 );
assign P3_8d = n1154;
assign n1155 = ( n0024 ) ? ( n0137 ) : ( P0 );
assign P0_8d = n1155;
assign n1156 = ( n0046 ) ? ( n0137 ) : ( P1 );
assign P1_8d = n1156;
assign n1157 = ( n0058 ) ? ( n0137 ) : ( IP );
assign IP_8d = n1157;
assign n1158 = ( n0034 ) ? ( n0137 ) : ( TCON );
assign TCON_8d = n1158;
assign n1159 = ( n0048 ) ? ( n0137 ) : ( SCON );
assign SCON_8d = n1159;
assign n1160 = ( n0026 ) ? ( n0137 ) : ( SP );
assign SP_8d = n1160;
assign n1161 = ( n0050 ) ? ( n0137 ) : ( SBUF );
assign SBUF_8d = n1161;
assign n1162 = ( n0060 ) ? ( n0137 ) : ( PSW );
assign PSW_8d = n1162;
// 
// Opcode: 8e
// 
assign n1163 = ( n0018 ) ? ( n0147 ) : ( ACC );
assign ACC_8e = n1163;
assign n1164 = ( n0032 ) ? ( n0147 ) : ( PCON );
assign PCON_8e = n1164;
assign n1165 = ( n0062 ) ? ( n0147 ) : ( B );
assign B_8e = n1165;
assign n1166 = ( n0036 ) ? ( n0147 ) : ( TMOD );
assign TMOD_8e = n1166;
assign n1167 = ( n0028 ) ? ( n0147 ) : ( DPL );
assign DPL_8e = n1167;
assign n1168 = ( n0030 ) ? ( n0147 ) : ( DPH );
assign DPH_8e = n1168;
assign n1169 = ( n0042 ) ? ( n0147 ) : ( TL1 );
assign TL1_8e = n1169;
assign n1170 = ( n0038 ) ? ( n0147 ) : ( TL0 );
assign TL0_8e = n1170;
assign n1171 = ( n0054 ) ? ( n0147 ) : ( IE );
assign IE_8e = n1171;
assign n1172 = ( n0044 ) ? ( n0147 ) : ( TH1 );
assign TH1_8e = n1172;
assign n1173 = ( n0040 ) ? ( n0147 ) : ( TH0 );
assign TH0_8e = n1173;
assign PC_8e = n0004;
assign n1174 = ( n0052 ) ? ( n0147 ) : ( P2 );
assign P2_8e = n1174;
assign n1175 = ( n0056 ) ? ( n0147 ) : ( P3 );
assign P3_8e = n1175;
assign n1176 = ( n0024 ) ? ( n0147 ) : ( P0 );
assign P0_8e = n1176;
assign n1177 = ( n0046 ) ? ( n0147 ) : ( P1 );
assign P1_8e = n1177;
assign n1178 = ( n0058 ) ? ( n0147 ) : ( IP );
assign IP_8e = n1178;
assign n1179 = ( n0034 ) ? ( n0147 ) : ( TCON );
assign TCON_8e = n1179;
assign n1180 = ( n0048 ) ? ( n0147 ) : ( SCON );
assign SCON_8e = n1180;
assign n1181 = ( n0026 ) ? ( n0147 ) : ( SP );
assign SP_8e = n1181;
assign n1182 = ( n0050 ) ? ( n0147 ) : ( SBUF );
assign SBUF_8e = n1182;
assign n1183 = ( n0060 ) ? ( n0147 ) : ( PSW );
assign PSW_8e = n1183;
// 
// Opcode: 8f
// 
assign n1184 = ( n0018 ) ? ( n0151 ) : ( ACC );
assign ACC_8f = n1184;
assign n1185 = ( n0032 ) ? ( n0151 ) : ( PCON );
assign PCON_8f = n1185;
assign n1186 = ( n0046 ) ? ( n0151 ) : ( P1 );
assign P1_8f = n1186;
assign n1187 = ( n0036 ) ? ( n0151 ) : ( TMOD );
assign TMOD_8f = n1187;
assign n1188 = ( n0028 ) ? ( n0151 ) : ( DPL );
assign DPL_8f = n1188;
assign n1189 = ( n0030 ) ? ( n0151 ) : ( DPH );
assign DPH_8f = n1189;
assign n1190 = ( n0042 ) ? ( n0151 ) : ( TL1 );
assign TL1_8f = n1190;
assign n1191 = ( n0038 ) ? ( n0151 ) : ( TL0 );
assign TL0_8f = n1191;
assign n1192 = ( n0054 ) ? ( n0151 ) : ( IE );
assign IE_8f = n1192;
assign n1193 = ( n0044 ) ? ( n0151 ) : ( TH1 );
assign TH1_8f = n1193;
assign n1194 = ( n0040 ) ? ( n0151 ) : ( TH0 );
assign TH0_8f = n1194;
assign PC_8f = n0004;
assign n1195 = ( n0052 ) ? ( n0151 ) : ( P2 );
assign P2_8f = n1195;
assign n1196 = ( n0056 ) ? ( n0151 ) : ( P3 );
assign P3_8f = n1196;
assign n1197 = ( n0024 ) ? ( n0151 ) : ( P0 );
assign P0_8f = n1197;
assign n1198 = ( n0062 ) ? ( n0151 ) : ( B );
assign B_8f = n1198;
assign n1199 = ( n0058 ) ? ( n0151 ) : ( IP );
assign IP_8f = n1199;
assign n1200 = ( n0034 ) ? ( n0151 ) : ( TCON );
assign TCON_8f = n1200;
assign n1201 = ( n0048 ) ? ( n0151 ) : ( SCON );
assign SCON_8f = n1201;
assign n1202 = ( n0026 ) ? ( n0151 ) : ( SP );
assign SP_8f = n1202;
assign n1203 = ( n0050 ) ? ( n0151 ) : ( SBUF );
assign SBUF_8f = n1203;
assign n1204 = ( n0060 ) ? ( n0151 ) : ( PSW );
assign PSW_8f = n1204;
// 
// Opcode: 90
// 
assign n1205 = n0013[7:0];
assign DPL_90 = n1205;
assign n1206 = n0013[15:8];
assign DPH_90 = n1206;
assign PC_90 = n0201;
// 
// Opcode: 91
// 
assign PC_91 = n0012;
assign SP_91 = n0220;
// 
// Opcode: 92
// 
assign n1207 = ( n0560 << n0163 );
assign n1208 = ( n0191 | n1207 );
assign n1209 = ( n0161 ) ? ( n1208 ) : ( ACC );
assign ACC_92 = n1209;
assign n1210 = ( n0178 ) ? ( n1208 ) : ( B );
assign B_92 = n1210;
assign n1211 = ( n0174 ) ? ( n1208 ) : ( IE );
assign IE_92 = n1211;
assign PC_92 = n0004;
assign n1212 = ( n0173 ) ? ( n1208 ) : ( P2 );
assign P2_92 = n1212;
assign n1213 = ( n0175 ) ? ( n1208 ) : ( P3 );
assign P3_92 = n1213;
assign n1214 = ( n0169 ) ? ( n1208 ) : ( P0 );
assign P0_92 = n1214;
assign n1215 = ( n0171 ) ? ( n1208 ) : ( P1 );
assign P1_92 = n1215;
assign n1216 = ( n0176 ) ? ( n1208 ) : ( IP );
assign IP_92 = n1216;
assign n1217 = ( n0170 ) ? ( n1208 ) : ( TCON );
assign TCON_92 = n1217;
assign n1218 = ( n0172 ) ? ( n1208 ) : ( SCON );
assign SCON_92 = n1218;
assign n1219 = ( n0177 ) ? ( n1208 ) : ( PSW );
assign PSW_92 = n1219;
// 
// Opcode: 93
// 
assign n1220 = ( n0937 + n0936 );
assign n1221 = ROM[n1220];
assign ACC_93 = n1221;
assign PC_93 = n0002;
// 
// Opcode: 94
// 
assign n1222 = ( ACC - n0007 );
assign n1223 = { n0139[0], n0139[0], n0139[0], n0139[0], n0139[0], n0139[0], n0139[0], n0139 };
assign n1224 = ( n1222 + n1223 );
assign ACC_94 = n1224;
assign PC_94 = n0004;
assign n1225 = ( n0268 < n0564 );
assign n1226 = ( n1225 ) ? ( n0153 ) : ( n0020 );
assign n1227 = ( n0275 < n0568 );
assign n1228 = ( n1227 ) ? ( n0153 ) : ( n0020 );
assign n1229 = ( n0282 - n0571 );
assign n1230 = n1229[8:8];
assign n1231 = n1229[7:7];
assign n1232 = ( n1230 == n1231 );
assign n1233 = !( n1232 );
assign n1234 = ( n1233 ) ? ( n0153 ) : ( n0020 );
assign n1235 = { ( n1226 ), ( n1228 ), ( n0141 ), ( n1234 ), ( n0143 ) };
assign PSW_94 = n1235;
// 
// Opcode: 95
// 
assign n1236 = ( ACC - n0085 );
assign n1237 = ( n1236 + n1223 );
assign ACC_95 = n1237;
assign PC_95 = n0004;
assign n1238 = ( n0268 < n0581 );
assign n1239 = ( n1238 ) ? ( n0153 ) : ( n0020 );
assign n1240 = ( n0275 < n0584 );
assign n1241 = ( n1240 ) ? ( n0153 ) : ( n0020 );
assign n1242 = ( n0282 - n0587 );
assign n1243 = n1242[8:8];
assign n1244 = n1242[7:7];
assign n1245 = ( n1243 == n1244 );
assign n1246 = !( n1245 );
assign n1247 = ( n1246 ) ? ( n0153 ) : ( n0020 );
assign n1248 = { ( n1239 ), ( n1241 ), ( n0141 ), ( n1247 ), ( n0143 ) };
assign PSW_95 = n1248;
// 
// Opcode: 96
// 
assign n1249 = ( ACC - n0112 );
assign n1250 = ( n1249 + n1223 );
assign ACC_96 = n1250;
assign PC_96 = n0002;
assign n1251 = ( n0268 < n0597 );
assign n1252 = ( n1251 ) ? ( n0153 ) : ( n0020 );
assign n1253 = ( n0275 < n0600 );
assign n1254 = ( n1253 ) ? ( n0153 ) : ( n0020 );
assign n1255 = ( n0282 - n0603 );
assign n1256 = n1255[8:8];
assign n1257 = n1255[7:7];
assign n1258 = ( n1256 == n1257 );
assign n1259 = !( n1258 );
assign n1260 = ( n1259 ) ? ( n0153 ) : ( n0020 );
assign n1261 = { ( n1252 ), ( n1254 ), ( n0141 ), ( n1260 ), ( n0143 ) };
assign PSW_96 = n1261;
// 
// Opcode: 97
// 
assign n1262 = ( ACC - n0117 );
assign n1263 = ( n1262 + n1223 );
assign ACC_97 = n1263;
assign PC_97 = n0002;
assign n1264 = ( n0268 < n0613 );
assign n1265 = ( n1264 ) ? ( n0153 ) : ( n0020 );
assign n1266 = ( n0275 < n0616 );
assign n1267 = ( n1266 ) ? ( n0153 ) : ( n0020 );
assign n1268 = ( n0282 - n0619 );
assign n1269 = n1268[8:8];
assign n1270 = n1268[7:7];
assign n1271 = ( n1269 == n1270 );
assign n1272 = !( n1271 );
assign n1273 = ( n1272 ) ? ( n0153 ) : ( n0020 );
assign n1274 = { ( n1265 ), ( n1267 ), ( n0141 ), ( n1273 ), ( n0143 ) };
assign PSW_97 = n1274;
// 
// Opcode: 98
// 
assign n1275 = ( ACC - n0111 );
assign n1276 = ( n1275 + n1223 );
assign ACC_98 = n1276;
assign PC_98 = n0002;
assign n1277 = ( n0268 < n0629 );
assign n1278 = ( n1277 ) ? ( n0153 ) : ( n0020 );
assign n1279 = ( n0275 < n0632 );
assign n1280 = ( n1279 ) ? ( n0153 ) : ( n0020 );
assign n1281 = ( n0282 - n0635 );
assign n1282 = n1281[8:8];
assign n1283 = n1281[7:7];
assign n1284 = ( n1282 == n1283 );
assign n1285 = !( n1284 );
assign n1286 = ( n1285 ) ? ( n0153 ) : ( n0020 );
assign n1287 = { ( n1278 ), ( n1280 ), ( n0141 ), ( n1286 ), ( n0143 ) };
assign PSW_98 = n1287;
// 
// Opcode: 99
// 
assign n1288 = ( ACC - n0116 );
assign n1289 = ( n1288 + n1223 );
assign ACC_99 = n1289;
assign PC_99 = n0002;
assign n1290 = ( n0268 < n0645 );
assign n1291 = ( n1290 ) ? ( n0153 ) : ( n0020 );
assign n1292 = ( n0275 < n0648 );
assign n1293 = ( n1292 ) ? ( n0153 ) : ( n0020 );
assign n1294 = ( n0282 - n0651 );
assign n1295 = n1294[8:8];
assign n1296 = n1294[7:7];
assign n1297 = ( n1295 == n1296 );
assign n1298 = !( n1297 );
assign n1299 = ( n1298 ) ? ( n0153 ) : ( n0020 );
assign n1300 = { ( n1291 ), ( n1293 ), ( n0141 ), ( n1299 ), ( n0143 ) };
assign PSW_99 = n1300;
// 
// Opcode: 9a
// 
assign n1301 = ( ACC - n0125 );
assign n1302 = ( n1301 + n1223 );
assign ACC_9a = n1302;
assign PC_9a = n0002;
assign n1303 = ( n0268 < n0661 );
assign n1304 = ( n1303 ) ? ( n0153 ) : ( n0020 );
assign n1305 = ( n0275 < n0664 );
assign n1306 = ( n1305 ) ? ( n0153 ) : ( n0020 );
assign n1307 = ( n0282 - n0667 );
assign n1308 = n1307[8:8];
assign n1309 = n1307[7:7];
assign n1310 = ( n1308 == n1309 );
assign n1311 = !( n1310 );
assign n1312 = ( n1311 ) ? ( n0153 ) : ( n0020 );
assign n1313 = { ( n1304 ), ( n1306 ), ( n0141 ), ( n1312 ), ( n0143 ) };
assign PSW_9a = n1313;
// 
// Opcode: 9b
// 
assign n1314 = ( ACC - n0129 );
assign n1315 = ( n1314 + n1223 );
assign ACC_9b = n1315;
assign PC_9b = n0002;
assign n1316 = ( n0268 < n0677 );
assign n1317 = ( n1316 ) ? ( n0153 ) : ( n0020 );
assign n1318 = ( n0275 < n0680 );
assign n1319 = ( n1318 ) ? ( n0153 ) : ( n0020 );
assign n1320 = ( n0282 - n0683 );
assign n1321 = n1320[8:8];
assign n1322 = n1320[7:7];
assign n1323 = ( n1321 == n1322 );
assign n1324 = !( n1323 );
assign n1325 = ( n1324 ) ? ( n0153 ) : ( n0020 );
assign n1326 = { ( n1317 ), ( n1319 ), ( n0141 ), ( n1325 ), ( n0143 ) };
assign PSW_9b = n1326;
// 
// Opcode: 9c
// 
assign n1327 = ( ACC - n0133 );
assign n1328 = ( n1327 + n1223 );
assign ACC_9c = n1328;
assign PC_9c = n0002;
assign n1329 = ( n0268 < n0693 );
assign n1330 = ( n1329 ) ? ( n0153 ) : ( n0020 );
assign n1331 = ( n0275 < n0696 );
assign n1332 = ( n1331 ) ? ( n0153 ) : ( n0020 );
assign n1333 = ( n0282 - n0699 );
assign n1334 = n1333[8:8];
assign n1335 = n1333[7:7];
assign n1336 = ( n1334 == n1335 );
assign n1337 = !( n1336 );
assign n1338 = ( n1337 ) ? ( n0153 ) : ( n0020 );
assign n1339 = { ( n1330 ), ( n1332 ), ( n0141 ), ( n1338 ), ( n0143 ) };
assign PSW_9c = n1339;
// 
// Opcode: 9d
// 
assign n1340 = ( ACC - n0137 );
assign n1341 = ( n1340 + n1223 );
assign ACC_9d = n1341;
assign PC_9d = n0002;
assign n1342 = ( n0268 < n0709 );
assign n1343 = ( n1342 ) ? ( n0153 ) : ( n0020 );
assign n1344 = ( n0275 < n0712 );
assign n1345 = ( n1344 ) ? ( n0153 ) : ( n0020 );
assign n1346 = ( n0282 - n0715 );
assign n1347 = n1346[8:8];
assign n1348 = n1346[7:7];
assign n1349 = ( n1347 == n1348 );
assign n1350 = !( n1349 );
assign n1351 = ( n1350 ) ? ( n0153 ) : ( n0020 );
assign n1352 = { ( n1343 ), ( n1345 ), ( n0141 ), ( n1351 ), ( n0143 ) };
assign PSW_9d = n1352;
// 
// Opcode: 9e
// 
assign n1353 = ( ACC - n0147 );
assign n1354 = ( n1353 + n1223 );
assign ACC_9e = n1354;
assign PC_9e = n0002;
assign n1355 = ( n0268 < n0725 );
assign n1356 = ( n1355 ) ? ( n0153 ) : ( n0020 );
assign n1357 = ( n0275 < n0728 );
assign n1358 = ( n1357 ) ? ( n0153 ) : ( n0020 );
assign n1359 = ( n0282 - n0731 );
assign n1360 = n1359[8:8];
assign n1361 = n1359[7:7];
assign n1362 = ( n1360 == n1361 );
assign n1363 = !( n1362 );
assign n1364 = ( n1363 ) ? ( n0153 ) : ( n0020 );
assign n1365 = { ( n1356 ), ( n1358 ), ( n0141 ), ( n1364 ), ( n0143 ) };
assign PSW_9e = n1365;
// 
// Opcode: 9f
// 
assign n1366 = ( ACC - n0151 );
assign n1367 = ( n1366 + n1223 );
assign ACC_9f = n1367;
assign PC_9f = n0002;
assign n1368 = ( n0268 < n0741 );
assign n1369 = ( n1368 ) ? ( n0153 ) : ( n0020 );
assign n1370 = ( n0275 < n0744 );
assign n1371 = ( n1370 ) ? ( n0153 ) : ( n0020 );
assign n1372 = ( n0282 - n0747 );
assign n1373 = n1372[8:8];
assign n1374 = n1372[7:7];
assign n1375 = ( n1373 == n1374 );
assign n1376 = !( n1375 );
assign n1377 = ( n1376 ) ? ( n0153 ) : ( n0020 );
assign n1378 = { ( n1369 ), ( n1371 ), ( n0141 ), ( n1377 ), ( n0143 ) };
assign PSW_9f = n1378;
// 
// Opcode: a0
// 
assign PC_a0 = n0004;
assign n1379 = ~( n0198 );
assign n1380 = ( n0139 | n1379 );
assign n1381 = { ( n1380 ), ( n0934 ) };
assign PSW_a0 = n1381;
// 
// Opcode: a1
// 
assign PC_a1 = n0012;
// 
// Opcode: a2
// 
assign PC_a2 = n0004;
assign n1382 = { ( n0198 ), ( n0934 ) };
assign PSW_a2 = n1382;
// 
// Opcode: a3
// 
assign n1383 = ( n0936 + n0001 );
assign n1384 = n1383[7:0];
assign DPL_a3 = n1384;
assign n1385 = n1383[15:8];
assign DPH_a3 = n1385;
assign PC_a3 = n0002;
// 
// Opcode: a4
// 
assign n1386 = { 8'b0, B };
assign n1387 = ( n0937 * n1386 );
assign n1388 = n1387[7:0];
assign ACC_a4 = n1388;
assign n1389 = n1387[15:8];
assign B_a4 = n1389;
assign PC_a4 = n0002;
assign n1390 = ( n1389 == n0063 );
assign n1391 = !( n1390 );
assign n1392 = ( n1391 ) ? ( n0153 ) : ( n0020 );
assign n1393 = { ( n0020 ), ( n0971 ), ( n1392 ), ( n0143 ) };
assign PSW_a4 = n1393;
// 
// Opcode: a5
// 
assign PC_a5 = n0002;
// 
// Opcode: a6
// 
assign PC_a6 = n0004;
// 
// Opcode: a7
// 
assign PC_a7 = n0004;
// 
// Opcode: a8
// 
assign PC_a8 = n0004;
// 
// Opcode: a9
// 
assign PC_a9 = n0004;
// 
// Opcode: aa
// 
assign PC_aa = n0004;
// 
// Opcode: ab
// 
assign PC_ab = n0004;
// 
// Opcode: ac
// 
assign PC_ac = n0004;
// 
// Opcode: ad
// 
assign PC_ad = n0004;
assign P3_ad = n0812;
// 
// Opcode: ae
// 
assign PC_ae = n0004;
// 
// Opcode: af
// 
assign PC_af = n0004;
// 
// Opcode: b0
// 
assign PC_b0 = n0004;
assign n1394 = ( n0139 & n1379 );
assign n1395 = { ( n1394 ), ( n0934 ) };
assign PSW_b0 = n1395;
// 
// Opcode: b1
// 
assign PC_b1 = n0012;
assign SP_b1 = n0220;
// 
// Opcode: b2
// 
assign n1396 = { 7'b0, n1379 };
assign n1397 = ( n1396 << n0163 );
assign n1398 = ( n0191 | n1397 );
assign n1399 = ( n0161 ) ? ( n1398 ) : ( ACC );
assign ACC_b2 = n1399;
assign n1400 = ( n0171 ) ? ( n1398 ) : ( P1 );
assign P1_b2 = n1400;
assign n1401 = ( n0170 ) ? ( n1398 ) : ( TCON );
assign TCON_b2 = n1401;
assign PC_b2 = n0004;
assign n1402 = ( n0173 ) ? ( n1398 ) : ( P2 );
assign P2_b2 = n1402;
assign n1403 = ( n0175 ) ? ( n1398 ) : ( P3 );
assign P3_b2 = n1403;
assign n1404 = ( n0169 ) ? ( n1398 ) : ( P0 );
assign P0_b2 = n1404;
assign n1405 = ( n0178 ) ? ( n1398 ) : ( B );
assign B_b2 = n1405;
assign n1406 = ( n0176 ) ? ( n1398 ) : ( IP );
assign IP_b2 = n1406;
assign n1407 = ( n0174 ) ? ( n1398 ) : ( IE );
assign IE_b2 = n1407;
assign n1408 = ( n0172 ) ? ( n1398 ) : ( SCON );
assign SCON_b2 = n1408;
assign n1409 = ( n0177 ) ? ( n1398 ) : ( PSW );
assign PSW_b2 = n1409;
// 
// Opcode: b3
// 
assign PC_b3 = n0002;
assign n1410 = ~( n0139 );
assign n1411 = { ( n1410 ), ( n0934 ) };
assign PSW_b3 = n1411;
// 
// Opcode: b4
// 
assign n1412 = ( ACC == n0007 );
assign n1413 = !( n1412 );
assign n1414 = ( n1413 ) ? ( n0203 ) : ( n0201 );
assign PC_b4 = n1414;
assign n1415 = ( ACC < n0007 );
assign n1416 = ( n1415 ) ? ( n0153 ) : ( n0020 );
assign n1417 = { ( n1416 ), ( n0934 ) };
assign PSW_b4 = n1417;
// 
// Opcode: b5
// 
assign n1418 = ( ACC == n0085 );
assign n1419 = !( n1418 );
assign n1420 = ( n1419 ) ? ( n0203 ) : ( n0201 );
assign PC_b5 = n1420;
assign n1421 = ( ACC < n0085 );
assign n1422 = ( n1421 ) ? ( n0153 ) : ( n0020 );
assign n1423 = { ( n1422 ), ( n0934 ) };
assign PSW_b5 = n1423;
// 
// Opcode: b6
// 
assign n1424 = ( n0112 == n0007 );
assign n1425 = !( n1424 );
assign n1426 = ( n1425 ) ? ( n0203 ) : ( n0201 );
assign PC_b6 = n1426;
assign n1427 = ( n0112 < n0007 );
assign n1428 = ( n1427 ) ? ( n0153 ) : ( n0020 );
assign n1429 = { ( n1428 ), ( n0934 ) };
assign PSW_b6 = n1429;
// 
// Opcode: b7
// 
assign n1430 = ( n0030 ) ? ( n0085 ) : ( DPH );
assign DPH_b7 = n1430;
assign n1431 = ( n0117 == n0007 );
assign n1432 = !( n1431 );
assign n1433 = ( n1432 ) ? ( n0203 ) : ( n0201 );
assign PC_b7 = n1433;
assign n1434 = ( n0117 < n0007 );
assign n1435 = ( n1434 ) ? ( n0153 ) : ( n0020 );
assign n1436 = { ( n1435 ), ( n0934 ) };
assign PSW_b7 = n1436;
// 
// Opcode: b8
// 
assign n1437 = ( n0111 == n0007 );
assign n1438 = !( n1437 );
assign n1439 = ( n1438 ) ? ( n0203 ) : ( n0201 );
assign PC_b8 = n1439;
assign n1440 = ( n0111 < n0007 );
assign n1441 = ( n1440 ) ? ( n0153 ) : ( n0020 );
assign n1442 = { ( n1441 ), ( n0934 ) };
assign PSW_b8 = n1442;
// 
// Opcode: b9
// 
assign n1443 = ( n0116 == n0007 );
assign n1444 = !( n1443 );
assign n1445 = ( n1444 ) ? ( n0203 ) : ( n0201 );
assign PC_b9 = n1445;
assign n1446 = ( n0116 < n0007 );
assign n1447 = ( n1446 ) ? ( n0153 ) : ( n0020 );
assign n1448 = { ( n1447 ), ( n0934 ) };
assign PSW_b9 = n1448;
// 
// Opcode: ba
// 
assign n1449 = ( n0125 == n0007 );
assign n1450 = !( n1449 );
assign n1451 = ( n1450 ) ? ( n0203 ) : ( n0201 );
assign PC_ba = n1451;
assign SP_ba = n0340;
assign n1452 = ( n0125 < n0007 );
assign n1453 = ( n1452 ) ? ( n0153 ) : ( n0020 );
assign n1454 = { ( n1453 ), ( n0934 ) };
assign PSW_ba = n1454;
// 
// Opcode: bb
// 
assign n1455 = ( n0129 == n0007 );
assign n1456 = !( n1455 );
assign n1457 = ( n1456 ) ? ( n0203 ) : ( n0201 );
assign PC_bb = n1457;
assign n1458 = ( n0129 < n0007 );
assign n1459 = ( n1458 ) ? ( n0153 ) : ( n0020 );
assign n1460 = { ( n1459 ), ( n0934 ) };
assign PSW_bb = n1460;
// 
// Opcode: bc
// 
assign n1461 = ( n0133 == n0007 );
assign n1462 = !( n1461 );
assign n1463 = ( n1462 ) ? ( n0203 ) : ( n0201 );
assign PC_bc = n1463;
assign n1464 = ( n0133 < n0007 );
assign n1465 = ( n1464 ) ? ( n0153 ) : ( n0020 );
assign n1466 = { ( n1465 ), ( n0934 ) };
assign PSW_bc = n1466;
// 
// Opcode: bd
// 
assign n1467 = ( n0315 ) ? ( n0338 ) : ( ACC );
assign ACC_bd = n1467;
assign n1468 = ( n0137 == n0007 );
assign n1469 = !( n1468 );
assign n1470 = ( n1469 ) ? ( n0203 ) : ( n0201 );
assign PC_bd = n1470;
assign n1471 = ( n0137 < n0007 );
assign n1472 = ( n1471 ) ? ( n0153 ) : ( n0020 );
assign n1473 = { ( n1472 ), ( n0934 ) };
assign PSW_bd = n1473;
// 
// Opcode: be
// 
assign n1474 = ( n0147 == n0007 );
assign n1475 = !( n1474 );
assign n1476 = ( n1475 ) ? ( n0203 ) : ( n0201 );
assign PC_be = n1476;
assign n1477 = ( n0147 < n0007 );
assign n1478 = ( n1477 ) ? ( n0153 ) : ( n0020 );
assign n1479 = { ( n1478 ), ( n0934 ) };
assign PSW_be = n1479;
// 
// Opcode: bf
// 
assign n1480 = ( n0151 == n0007 );
assign n1481 = !( n1480 );
assign n1482 = ( n1481 ) ? ( n0203 ) : ( n0201 );
assign PC_bf = n1482;
assign n1483 = ( n0151 < n0007 );
assign n1484 = ( n1483 ) ? ( n0153 ) : ( n0020 );
assign n1485 = { ( n1484 ), ( n0934 ) };
assign PSW_bf = n1485;
// 
// Opcode: c0
// 
assign PC_c0 = n0004;
assign SP_c0 = n0215;
assign PSW_c0 = n0144;
// 
// Opcode: c1
// 
assign PC_c1 = n0012;
// 
// Opcode: c2
// 
assign ACC_c2 = n0195;
assign P1_c2 = n0196;
assign IE_c2 = n0197;
assign PC_c2 = n0004;
assign P2_c2 = n0205;
assign P3_c2 = n0206;
assign P0_c2 = n0207;
assign B_c2 = n0208;
assign IP_c2 = n0209;
assign TCON_c2 = n0210;
assign SCON_c2 = n0211;
assign PSW_c2 = n0212;
// 
// Opcode: c3
// 
assign PC_c3 = n0002;
assign n1486 = { ( n0020 ), ( n0934 ) };
assign PSW_c3 = n1486;
// 
// Opcode: c4
// 
assign n1487 = ACC[7:4];
assign n1488 = { ( n0274 ), ( n1487 ) };
assign ACC_c4 = n1488;
assign PC_c4 = n0002;
// 
// Opcode: c5
// 
assign ACC_c5 = n0085;
assign n1489 = ( n0032 ) ? ( ACC ) : ( PCON );
assign PCON_c5 = n1489;
assign n1490 = ( n0046 ) ? ( ACC ) : ( P1 );
assign P1_c5 = n1490;
assign n1491 = ( n0036 ) ? ( ACC ) : ( TMOD );
assign TMOD_c5 = n1491;
assign n1492 = ( n0028 ) ? ( ACC ) : ( DPL );
assign DPL_c5 = n1492;
assign n1493 = ( n0030 ) ? ( ACC ) : ( DPH );
assign DPH_c5 = n1493;
assign n1494 = ( n0042 ) ? ( ACC ) : ( TL1 );
assign TL1_c5 = n1494;
assign n1495 = ( n0038 ) ? ( ACC ) : ( TL0 );
assign TL0_c5 = n1495;
assign n1496 = ( n0034 ) ? ( ACC ) : ( TCON );
assign TCON_c5 = n1496;
assign n1497 = ( n0044 ) ? ( ACC ) : ( TH1 );
assign TH1_c5 = n1497;
assign n1498 = ( n0040 ) ? ( ACC ) : ( TH0 );
assign TH0_c5 = n1498;
assign PC_c5 = n0004;
assign n1499 = ( n0052 ) ? ( ACC ) : ( P2 );
assign P2_c5 = n1499;
assign n1500 = ( n0056 ) ? ( ACC ) : ( P3 );
assign P3_c5 = n1500;
assign n1501 = ( n0024 ) ? ( ACC ) : ( P0 );
assign P0_c5 = n1501;
assign n1502 = ( n0062 ) ? ( ACC ) : ( B );
assign B_c5 = n1502;
assign n1503 = ( n0058 ) ? ( ACC ) : ( IP );
assign IP_c5 = n1503;
assign n1504 = ( n0054 ) ? ( ACC ) : ( IE );
assign IE_c5 = n1504;
assign n1505 = ( n0048 ) ? ( ACC ) : ( SCON );
assign SCON_c5 = n1505;
assign n1506 = ( n0026 ) ? ( ACC ) : ( SP );
assign SP_c5 = n1506;
assign n1507 = ( n0050 ) ? ( ACC ) : ( SBUF );
assign SBUF_c5 = n1507;
assign n1508 = ( n0060 ) ? ( ACC ) : ( PSW );
assign PSW_c5 = n1508;
// 
// Opcode: c6
// 
assign ACC_c6 = n0112;
assign PC_c6 = n0002;
// 
// Opcode: c7
// 
assign ACC_c7 = n0117;
assign PC_c7 = n0002;
// 
// Opcode: c8
// 
assign ACC_c8 = n0111;
assign PC_c8 = n0002;
// 
// Opcode: c9
// 
assign ACC_c9 = n0116;
assign PC_c9 = n0002;
// 
// Opcode: ca
// 
assign ACC_ca = n0125;
assign PC_ca = n0002;
// 
// Opcode: cb
// 
assign ACC_cb = n0129;
assign PC_cb = n0002;
// 
// Opcode: cc
// 
assign ACC_cc = n0133;
assign PC_cc = n0002;
// 
// Opcode: cd
// 
assign ACC_cd = n0137;
assign PC_cd = n0002;
// 
// Opcode: ce
// 
assign ACC_ce = n0147;
assign PC_ce = n0002;
assign PSW_ce = n0144;
// 
// Opcode: cf
// 
assign ACC_cf = n0151;
assign PC_cf = n0002;
// 
// Opcode: d0
// 
assign n1509 = ( n0018 ) ? ( n0261 ) : ( ACC );
assign ACC_d0 = n1509;
assign n1510 = ( n0032 ) ? ( n0261 ) : ( PCON );
assign PCON_d0 = n1510;
assign n1511 = ( n0062 ) ? ( n0261 ) : ( B );
assign B_d0 = n1511;
assign n1512 = ( n0036 ) ? ( n0261 ) : ( TMOD );
assign TMOD_d0 = n1512;
assign n1513 = ( n0028 ) ? ( n0261 ) : ( DPL );
assign DPL_d0 = n1513;
assign n1514 = ( n0030 ) ? ( n0261 ) : ( DPH );
assign DPH_d0 = n1514;
assign n1515 = ( n0042 ) ? ( n0261 ) : ( TL1 );
assign TL1_d0 = n1515;
assign n1516 = ( n0038 ) ? ( n0261 ) : ( TL0 );
assign TL0_d0 = n1516;
assign n1517 = ( n0054 ) ? ( n0261 ) : ( IE );
assign IE_d0 = n1517;
assign n1518 = ( n0044 ) ? ( n0261 ) : ( TH1 );
assign TH1_d0 = n1518;
assign n1519 = ( n0040 ) ? ( n0261 ) : ( TH0 );
assign TH0_d0 = n1519;
assign PC_d0 = n0004;
assign n1520 = ( n0052 ) ? ( n0261 ) : ( P2 );
assign P2_d0 = n1520;
assign n1521 = ( n0056 ) ? ( n0261 ) : ( P3 );
assign P3_d0 = n1521;
assign n1522 = ( n0024 ) ? ( n0261 ) : ( P0 );
assign P0_d0 = n1522;
assign n1523 = ( n0046 ) ? ( n0261 ) : ( P1 );
assign P1_d0 = n1523;
assign n1524 = ( n0058 ) ? ( n0261 ) : ( IP );
assign IP_d0 = n1524;
assign n1525 = ( n0034 ) ? ( n0261 ) : ( TCON );
assign TCON_d0 = n1525;
assign n1526 = ( n0048 ) ? ( n0261 ) : ( SCON );
assign SCON_d0 = n1526;
assign SP_d0 = n0262;
assign n1527 = ( n0050 ) ? ( n0261 ) : ( SBUF );
assign SBUF_d0 = n1527;
assign n1528 = ( n0060 ) ? ( n0261 ) : ( PSW );
assign PSW_d0 = n1528;
// 
// Opcode: d1
// 
assign PC_d1 = n0012;
assign SP_d1 = n0220;
// 
// Opcode: d2
// 
assign n1529 = { 7'b0, n0153 };
assign n1530 = ( n1529 << n0163 );
assign n1531 = ( n0191 | n1530 );
assign n1532 = ( n0161 ) ? ( n1531 ) : ( ACC );
assign ACC_d2 = n1532;
assign n1533 = ( n0178 ) ? ( n1531 ) : ( B );
assign B_d2 = n1533;
assign n1534 = ( n0170 ) ? ( n1531 ) : ( TCON );
assign TCON_d2 = n1534;
assign PC_d2 = n0004;
assign n1535 = ( n0173 ) ? ( n1531 ) : ( P2 );
assign P2_d2 = n1535;
assign n1536 = ( n0175 ) ? ( n1531 ) : ( P3 );
assign P3_d2 = n1536;
assign n1537 = ( n0169 ) ? ( n1531 ) : ( P0 );
assign P0_d2 = n1537;
assign n1538 = ( n0171 ) ? ( n1531 ) : ( P1 );
assign P1_d2 = n1538;
assign n1539 = ( n0176 ) ? ( n1531 ) : ( IP );
assign IP_d2 = n1539;
assign n1540 = ( n0174 ) ? ( n1531 ) : ( IE );
assign IE_d2 = n1540;
assign n1541 = ( n0172 ) ? ( n1531 ) : ( SCON );
assign SCON_d2 = n1541;
assign n1542 = ( n0177 ) ? ( n1531 ) : ( PSW );
assign PSW_d2 = n1542;
// 
// Opcode: d3
// 
assign PC_d3 = n0002;
assign n1543 = ( n0301 ) ? ( n0338 ) : ( TCON );
assign TCON_d3 = n1543;
assign n1544 = { ( n0153 ), ( n0934 ) };
assign PSW_d3 = n1544;
// 
// Opcode: d4
// 
assign n1545 = ( n0140 == n0153 );
assign n1546 = 4'h9;
assign n1547 = ( n0274 > n1546 );
assign n1548 = ( n1545 || n1547 );
assign n1549 = 9'h6;
assign n1550 = ( n0268 + n1549 );
assign n1551 = ( n1548 ) ? ( n1550 ) : ( n0268 );
assign n1552 = n1551[8:8];
assign n1553 = ( n1552 | n0139 );
assign n1554 = ( n1553 == n0153 );
assign n1555 = n1551[7:4];
assign n1556 = ( n1555 > n1546 );
assign n1557 = ( n1554 || n1556 );
assign n1558 = 9'h60;
assign n1559 = ( n1551 + n1558 );
assign n1560 = ( n1557 ) ? ( n1559 ) : ( n1551 );
assign n1561 = n1560[7:0];
assign ACC_d4 = n1561;
assign PC_d4 = n0002;
assign n1562 = n1560[8:8];
assign n1563 = ( n1562 | n1553 );
assign n1564 = { ( n1563 ), ( n0934 ) };
assign PSW_d4 = n1564;
// 
// Opcode: d5
// 
assign ACC_d5 = n0230;
assign PCON_d5 = n0231;
assign B_d5 = n0244;
assign TMOD_d5 = n0233;
assign DPL_d5 = n0234;
assign DPH_d5 = n0235;
assign TL1_d5 = n0236;
assign TL0_d5 = n0237;
assign TCON_d5 = n0246;
assign TH1_d5 = n0239;
assign TH0_d5 = n0240;
assign n1565 = ( n0085 == n0015 );
assign n1566 = !( n1565 );
assign n1567 = ( n1566 ) ? ( n0203 ) : ( n0201 );
assign PC_d5 = n1567;
assign P2_d5 = n0241;
assign P3_d5 = n0242;
assign P0_d5 = n0243;
assign P1_d5 = n0232;
assign IP_d5 = n0245;
assign IE_d5 = n0238;
assign SCON_d5 = n0247;
assign SP_d5 = n0248;
assign SBUF_d5 = n0249;
assign PSW_d5 = n0250;
// 
// Opcode: d6
// 
assign n1568 = { ( n1487 ), ( n0365 ) };
assign ACC_d6 = n1568;
assign PC_d6 = n0002;
assign n1569 = n0112[7:4];
assign n1570 = { ( n1569 ), ( n0274 ) };
// 
// Opcode: d7
// 
assign n1571 = { ( n1487 ), ( n0385 ) };
assign ACC_d7 = n1571;
assign PC_d7 = n0002;
assign n1572 = n0117[7:4];
assign n1573 = { ( n1572 ), ( n0274 ) };
// 
// Opcode: d8
// 
assign n1574 = ( n0111 == n0015 );
assign n1575 = !( n1574 );
assign n1576 = ( n1575 ) ? ( n0757 ) : ( n0004 );
assign PC_d8 = n1576;
// 
// Opcode: d9
// 
assign n1577 = ( n0116 == n0015 );
assign n1578 = !( n1577 );
assign n1579 = ( n1578 ) ? ( n0757 ) : ( n0004 );
assign PC_d9 = n1579;
// 
// Opcode: da
// 
assign n1580 = ( n0125 == n0015 );
assign n1581 = !( n1580 );
assign n1582 = ( n1581 ) ? ( n0757 ) : ( n0004 );
assign PC_da = n1582;
// 
// Opcode: db
// 
assign n1583 = ( n0129 == n0015 );
assign n1584 = !( n1583 );
assign n1585 = ( n1584 ) ? ( n0757 ) : ( n0004 );
assign PC_db = n1585;
// 
// Opcode: dc
// 
assign n1586 = ( n0133 == n0015 );
assign n1587 = !( n1586 );
assign n1588 = ( n1587 ) ? ( n0757 ) : ( n0004 );
assign PC_dc = n1588;
// 
// Opcode: dd
// 
assign n1589 = ( n0137 == n0015 );
assign n1590 = !( n1589 );
assign n1591 = ( n1590 ) ? ( n0757 ) : ( n0004 );
assign PC_dd = n1591;
// 
// Opcode: de
// 
assign n1592 = ( n0147 == n0015 );
assign n1593 = !( n1592 );
assign n1594 = ( n1593 ) ? ( n0757 ) : ( n0004 );
assign PC_de = n1594;
// 
// Opcode: df
// 
assign n1595 = ( n0151 == n0015 );
assign n1596 = !( n1595 );
assign n1597 = ( n1596 ) ? ( n0757 ) : ( n0004 );
assign PC_df = n1597;
// 
// Opcode: e1
// 
assign PC_e1 = n0012;
// 
// Opcode: e4
// 
assign ACC_e4 = n0063;
assign PC_e4 = n0002;
// 
// Opcode: e5
// 
assign ACC_e5 = n0085;
assign PC_e5 = n0004;
// 
// Opcode: e6
// 
assign ACC_e6 = n0112;
assign PC_e6 = n0002;
// 
// Opcode: e7
// 
assign ACC_e7 = n0117;
assign PC_e7 = n0002;
// 
// Opcode: e8
// 
assign ACC_e8 = n0111;
assign PC_e8 = n0002;
// 
// Opcode: e9
// 
assign ACC_e9 = n0116;
assign PC_e9 = n0002;
// 
// Opcode: ea
// 
assign ACC_ea = n0125;
assign PC_ea = n0002;
// 
// Opcode: eb
// 
assign ACC_eb = n0129;
assign PC_eb = n0002;
// 
// Opcode: ec
// 
assign ACC_ec = n0133;
assign PC_ec = n0002;
// 
// Opcode: ed
// 
assign ACC_ed = n0137;
assign PC_ed = n0002;
// 
// Opcode: ee
// 
assign ACC_ee = n0147;
assign PC_ee = n0002;
// 
// Opcode: ef
// 
assign ACC_ef = n0151;
assign PC_ef = n0002;
assign n1598 = ( n0338 & n0338 );
assign n1599 = ( n0313 ) ? ( n1598 ) : ( IP );
assign IP_ef = n1599;
// 
// Opcode: f1
// 
assign PC_f1 = n0012;
assign SP_f1 = n0220;
// 
// Opcode: f4
// 
assign n1600 = ~( ACC );
assign ACC_f4 = n1600;
assign PC_f4 = n0002;
// 
// Opcode: f5
// 
assign PCON_f5 = n1489;
assign P1_f5 = n1490;
assign TMOD_f5 = n1491;
assign DPL_f5 = n1492;
assign DPH_f5 = n1493;
assign TL1_f5 = n1494;
assign TL0_f5 = n1495;
assign TCON_f5 = n1496;
assign TH1_f5 = n1497;
assign TH0_f5 = n1498;
assign PC_f5 = n0004;
assign P2_f5 = n1499;
assign P3_f5 = n1500;
assign P0_f5 = n1501;
assign B_f5 = n1502;
assign IP_f5 = n1503;
assign IE_f5 = n1504;
assign SCON_f5 = n1505;
assign SP_f5 = n1506;
assign SBUF_f5 = n1507;
assign PSW_f5 = n1508;
// 
// Opcode: f6
// 
assign PC_f6 = n0002;
// 
// Opcode: f7
// 
assign PC_f7 = n0002;
// 
// Opcode: f8
// 
assign PC_f8 = n0002;
// 
// Opcode: f9
// 
assign PC_f9 = n0002;
// 
// Opcode: fa
// 
assign PC_fa = n0002;
// 
// Opcode: fb
// 
assign PC_fb = n0002;
// 
// Opcode: fc
// 
assign PC_fc = n0002;
// 
// Opcode: fd
// 
assign PC_fd = n0002;
// 
// Opcode: fe
// 
assign PC_fe = n0002;
// 
// Opcode: ff
// 
assign PC_ff = n0002;
assign n1601 = 8'h3;
assign n1602 = ( n0008 == n1601 );
assign n1603 = 8'h4;
assign n1604 = ( n0008 == n1603 );
assign n1605 = 8'h5;
assign n1606 = ( n0008 == n1605 );
assign n1607 = 8'h10;
assign n1608 = ( n0008 == n1607 );
assign n1609 = 8'h13;
assign n1610 = ( n0008 == n1609 );
assign n1611 = 8'h14;
assign n1612 = ( n0008 == n1611 );
assign n1613 = 8'h15;
assign n1614 = ( n0008 == n1613 );
assign n1615 = 8'h23;
assign n1616 = ( n0008 == n1615 );
assign n1617 = 8'h24;
assign n1618 = ( n0008 == n1617 );
assign n1619 = 8'h25;
assign n1620 = ( n0008 == n1619 );
assign n1621 = 8'h26;
assign n1622 = ( n0008 == n1621 );
assign n1623 = 8'h27;
assign n1624 = ( n0008 == n1623 );
assign n1625 = 8'h28;
assign n1626 = ( n0008 == n1625 );
assign n1627 = 8'h29;
assign n1628 = ( n0008 == n1627 );
assign n1629 = 8'h2a;
assign n1630 = ( n0008 == n1629 );
assign n1631 = 8'h2b;
assign n1632 = ( n0008 == n1631 );
assign n1633 = 8'h2c;
assign n1634 = ( n0008 == n1633 );
assign n1635 = 8'h2d;
assign n1636 = ( n0008 == n1635 );
assign n1637 = 8'h2e;
assign n1638 = ( n0008 == n1637 );
assign n1639 = 8'h2f;
assign n1640 = ( n0008 == n1639 );
assign n1641 = 8'h33;
assign n1642 = ( n0008 == n1641 );
assign n1643 = 8'h34;
assign n1644 = ( n0008 == n1643 );
assign n1645 = 8'h35;
assign n1646 = ( n0008 == n1645 );
assign n1647 = 8'h36;
assign n1648 = ( n0008 == n1647 );
assign n1649 = 8'h37;
assign n1650 = ( n0008 == n1649 );
assign n1651 = 8'h38;
assign n1652 = ( n0008 == n1651 );
assign n1653 = 8'h39;
assign n1654 = ( n0008 == n1653 );
assign n1655 = 8'h3a;
assign n1656 = ( n0008 == n1655 );
assign n1657 = 8'h3b;
assign n1658 = ( n0008 == n1657 );
assign n1659 = 8'h3c;
assign n1660 = ( n0008 == n1659 );
assign n1661 = 8'h3d;
assign n1662 = ( n0008 == n1661 );
assign n1663 = 8'h3e;
assign n1664 = ( n0008 == n1663 );
assign n1665 = 8'h3f;
assign n1666 = ( n0008 == n1665 );
assign n1667 = 8'h43;
assign n1668 = ( n0008 == n1667 );
assign n1669 = 8'h44;
assign n1670 = ( n0008 == n1669 );
assign n1671 = 8'h45;
assign n1672 = ( n0008 == n1671 );
assign n1673 = 8'h46;
assign n1674 = ( n0008 == n1673 );
assign n1675 = 8'h47;
assign n1676 = ( n0008 == n1675 );
assign n1677 = 8'h48;
assign n1678 = ( n0008 == n1677 );
assign n1679 = 8'h49;
assign n1680 = ( n0008 == n1679 );
assign n1681 = 8'h4a;
assign n1682 = ( n0008 == n1681 );
assign n1683 = 8'h4b;
assign n1684 = ( n0008 == n1683 );
assign n1685 = 8'h4c;
assign n1686 = ( n0008 == n1685 );
assign n1687 = 8'h4d;
assign n1688 = ( n0008 == n1687 );
assign n1689 = 8'h4e;
assign n1690 = ( n0008 == n1689 );
assign n1691 = 8'h4f;
assign n1692 = ( n0008 == n1691 );
assign n1693 = 8'h53;
assign n1694 = ( n0008 == n1693 );
assign n1695 = 8'h54;
assign n1696 = ( n0008 == n1695 );
assign n1697 = 8'h55;
assign n1698 = ( n0008 == n1697 );
assign n1699 = 8'h56;
assign n1700 = ( n0008 == n1699 );
assign n1701 = 8'h57;
assign n1702 = ( n0008 == n1701 );
assign n1703 = 8'h58;
assign n1704 = ( n0008 == n1703 );
assign n1705 = 8'h59;
assign n1706 = ( n0008 == n1705 );
assign n1707 = 8'h5a;
assign n1708 = ( n0008 == n1707 );
assign n1709 = 8'h5b;
assign n1710 = ( n0008 == n1709 );
assign n1711 = 8'h5c;
assign n1712 = ( n0008 == n1711 );
assign n1713 = 8'h5d;
assign n1714 = ( n0008 == n1713 );
assign n1715 = 8'h5e;
assign n1716 = ( n0008 == n1715 );
assign n1717 = 8'h5f;
assign n1718 = ( n0008 == n1717 );
assign n1719 = 8'h62;
assign n1720 = ( n0008 == n1719 );
assign n1721 = 8'h63;
assign n1722 = ( n0008 == n1721 );
assign n1723 = 8'h64;
assign n1724 = ( n0008 == n1723 );
assign n1725 = 8'h65;
assign n1726 = ( n0008 == n1725 );
assign n1727 = 8'h66;
assign n1728 = ( n0008 == n1727 );
assign n1729 = 8'h67;
assign n1730 = ( n0008 == n1729 );
assign n1731 = 8'h68;
assign n1732 = ( n0008 == n1731 );
assign n1733 = 8'h69;
assign n1734 = ( n0008 == n1733 );
assign n1735 = 8'h6a;
assign n1736 = ( n0008 == n1735 );
assign n1737 = 8'h6b;
assign n1738 = ( n0008 == n1737 );
assign n1739 = 8'h6c;
assign n1740 = ( n0008 == n1739 );
assign n1741 = 8'h6d;
assign n1742 = ( n0008 == n1741 );
assign n1743 = 8'h6e;
assign n1744 = ( n0008 == n1743 );
assign n1745 = 8'h6f;
assign n1746 = ( n0008 == n1745 );
assign n1747 = 8'h74;
assign n1748 = ( n0008 == n1747 );
assign n1749 = 8'h75;
assign n1750 = ( n0008 == n1749 );
assign n1751 = ( n0008 == n0029 );
assign n1752 = 8'h84;
assign n1753 = ( n0008 == n1752 );
assign n1754 = 8'h85;
assign n1755 = ( n0008 == n1754 );
assign n1756 = 8'h86;
assign n1757 = ( n0008 == n1756 );
assign n1758 = ( n0008 == n0031 );
assign n1759 = ( n0008 == n0033 );
assign n1760 = ( n0008 == n0035 );
assign n1761 = ( n0008 == n0037 );
assign n1762 = ( n0008 == n0041 );
assign n1763 = ( n0008 == n0039 );
assign n1764 = ( n0008 == n0043 );
assign n1765 = 8'h8e;
assign n1766 = ( n0008 == n1765 );
assign n1767 = 8'h8f;
assign n1768 = ( n0008 == n1767 );
assign n1769 = 8'h92;
assign n1770 = ( n0008 == n1769 );
assign n1771 = 8'h93;
assign n1772 = ( n0008 == n1771 );
assign n1773 = 8'h94;
assign n1774 = ( n0008 == n1773 );
assign n1775 = 8'h95;
assign n1776 = ( n0008 == n1775 );
assign n1777 = 8'h96;
assign n1778 = ( n0008 == n1777 );
assign n1779 = 8'h97;
assign n1780 = ( n0008 == n1779 );
assign n1781 = ( n0008 == n0047 );
assign n1782 = ( n0008 == n0049 );
assign n1783 = 8'h9a;
assign n1784 = ( n0008 == n1783 );
assign n1785 = 8'h9b;
assign n1786 = ( n0008 == n1785 );
assign n1787 = 8'h9c;
assign n1788 = ( n0008 == n1787 );
assign n1789 = 8'h9d;
assign n1790 = ( n0008 == n1789 );
assign n1791 = 8'h9e;
assign n1792 = ( n0008 == n1791 );
assign n1793 = 8'h9f;
assign n1794 = ( n0008 == n1793 );
assign n1795 = 8'ha4;
assign n1796 = ( n0008 == n1795 );
assign n1797 = 8'hb2;
assign n1798 = ( n0008 == n1797 );
assign n1799 = 8'hbd;
assign n1800 = ( n0008 == n1799 );
assign n1801 = 8'hc2;
assign n1802 = ( n0008 == n1801 );
assign n1803 = 8'hc4;
assign n1804 = ( n0008 == n1803 );
assign n1805 = 8'hc5;
assign n1806 = ( n0008 == n1805 );
assign n1807 = 8'hc6;
assign n1808 = ( n0008 == n1807 );
assign n1809 = 8'hc7;
assign n1810 = ( n0008 == n1809 );
assign n1811 = 8'hc8;
assign n1812 = ( n0008 == n1811 );
assign n1813 = 8'hc9;
assign n1814 = ( n0008 == n1813 );
assign n1815 = 8'hca;
assign n1816 = ( n0008 == n1815 );
assign n1817 = 8'hcb;
assign n1818 = ( n0008 == n1817 );
assign n1819 = 8'hcc;
assign n1820 = ( n0008 == n1819 );
assign n1821 = 8'hcd;
assign n1822 = ( n0008 == n1821 );
assign n1823 = 8'hce;
assign n1824 = ( n0008 == n1823 );
assign n1825 = 8'hcf;
assign n1826 = ( n0008 == n1825 );
assign n1827 = ( n0008 == n0059 );
assign n1828 = 8'hd2;
assign n1829 = ( n0008 == n1828 );
assign n1830 = 8'hd4;
assign n1831 = ( n0008 == n1830 );
assign n1832 = 8'hd5;
assign n1833 = ( n0008 == n1832 );
assign n1834 = 8'hd6;
assign n1835 = ( n0008 == n1834 );
assign n1836 = 8'hd7;
assign n1837 = ( n0008 == n1836 );
assign n1838 = 8'he4;
assign n1839 = ( n0008 == n1838 );
assign n1840 = 8'he5;
assign n1841 = ( n0008 == n1840 );
assign n1842 = 8'he6;
assign n1843 = ( n0008 == n1842 );
assign n1844 = 8'he7;
assign n1845 = ( n0008 == n1844 );
assign n1846 = 8'he8;
assign n1847 = ( n0008 == n1846 );
assign n1848 = 8'he9;
assign n1849 = ( n0008 == n1848 );
assign n1850 = 8'hea;
assign n1851 = ( n0008 == n1850 );
assign n1852 = 8'heb;
assign n1853 = ( n0008 == n1852 );
assign n1854 = 8'hec;
assign n1855 = ( n0008 == n1854 );
assign n1856 = 8'hed;
assign n1857 = ( n0008 == n1856 );
assign n1858 = 8'hee;
assign n1859 = ( n0008 == n1858 );
assign n1860 = 8'hef;
assign n1861 = ( n0008 == n1860 );
assign n1862 = 8'hf4;
assign n1863 = ( n0008 == n1862 );
assign ACC_next = 
  ( n1602 ) ? ACC_03 : 
  ( n1604 ) ? ACC_04 : 
  ( n1606 ) ? ACC_05 : 
  ( n1608 ) ? ACC_10 : 
  ( n1610 ) ? ACC_13 : 
  ( n1612 ) ? ACC_14 : 
  ( n1614 ) ? ACC_15 : 
  ( n1616 ) ? ACC_23 : 
  ( n1618 ) ? ACC_24 : 
  ( n1620 ) ? ACC_25 : 
  ( n1622 ) ? ACC_26 : 
  ( n1624 ) ? ACC_27 : 
  ( n1626 ) ? ACC_28 : 
  ( n1628 ) ? ACC_29 : 
  ( n1630 ) ? ACC_2a : 
  ( n1632 ) ? ACC_2b : 
  ( n1634 ) ? ACC_2c : 
  ( n1636 ) ? ACC_2d : 
  ( n1638 ) ? ACC_2e : 
  ( n1640 ) ? ACC_2f : 
  ( n1642 ) ? ACC_33 : 
  ( n1644 ) ? ACC_34 : 
  ( n1646 ) ? ACC_35 : 
  ( n1648 ) ? ACC_36 : 
  ( n1650 ) ? ACC_37 : 
  ( n1652 ) ? ACC_38 : 
  ( n1654 ) ? ACC_39 : 
  ( n1656 ) ? ACC_3a : 
  ( n1658 ) ? ACC_3b : 
  ( n1660 ) ? ACC_3c : 
  ( n1662 ) ? ACC_3d : 
  ( n1664 ) ? ACC_3e : 
  ( n1666 ) ? ACC_3f : 
  ( n1668 ) ? ACC_43 : 
  ( n1670 ) ? ACC_44 : 
  ( n1672 ) ? ACC_45 : 
  ( n1674 ) ? ACC_46 : 
  ( n1676 ) ? ACC_47 : 
  ( n1678 ) ? ACC_48 : 
  ( n1680 ) ? ACC_49 : 
  ( n1682 ) ? ACC_4a : 
  ( n1684 ) ? ACC_4b : 
  ( n1686 ) ? ACC_4c : 
  ( n1688 ) ? ACC_4d : 
  ( n1690 ) ? ACC_4e : 
  ( n1692 ) ? ACC_4f : 
  ( n1694 ) ? ACC_53 : 
  ( n1696 ) ? ACC_54 : 
  ( n1698 ) ? ACC_55 : 
  ( n1700 ) ? ACC_56 : 
  ( n1702 ) ? ACC_57 : 
  ( n1704 ) ? ACC_58 : 
  ( n1706 ) ? ACC_59 : 
  ( n1708 ) ? ACC_5a : 
  ( n1710 ) ? ACC_5b : 
  ( n1712 ) ? ACC_5c : 
  ( n1714 ) ? ACC_5d : 
  ( n1716 ) ? ACC_5e : 
  ( n1718 ) ? ACC_5f : 
  ( n1720 ) ? ACC_62 : 
  ( n1722 ) ? ACC_63 : 
  ( n1724 ) ? ACC_64 : 
  ( n1726 ) ? ACC_65 : 
  ( n1728 ) ? ACC_66 : 
  ( n1730 ) ? ACC_67 : 
  ( n1732 ) ? ACC_68 : 
  ( n1734 ) ? ACC_69 : 
  ( n1736 ) ? ACC_6a : 
  ( n1738 ) ? ACC_6b : 
  ( n1740 ) ? ACC_6c : 
  ( n1742 ) ? ACC_6d : 
  ( n1744 ) ? ACC_6e : 
  ( n1746 ) ? ACC_6f : 
  ( n1748 ) ? ACC_74 : 
  ( n1750 ) ? ACC_75 : 
  ( n1751 ) ? ACC_83 : 
  ( n1753 ) ? ACC_84 : 
  ( n1755 ) ? ACC_85 : 
  ( n1757 ) ? ACC_86 : 
  ( n1758 ) ? ACC_87 : 
  ( n1759 ) ? ACC_88 : 
  ( n1760 ) ? ACC_89 : 
  ( n1761 ) ? ACC_8a : 
  ( n1762 ) ? ACC_8b : 
  ( n1763 ) ? ACC_8c : 
  ( n1764 ) ? ACC_8d : 
  ( n1766 ) ? ACC_8e : 
  ( n1768 ) ? ACC_8f : 
  ( n1770 ) ? ACC_92 : 
  ( n1772 ) ? ACC_93 : 
  ( n1774 ) ? ACC_94 : 
  ( n1776 ) ? ACC_95 : 
  ( n1778 ) ? ACC_96 : 
  ( n1780 ) ? ACC_97 : 
  ( n1781 ) ? ACC_98 : 
  ( n1782 ) ? ACC_99 : 
  ( n1784 ) ? ACC_9a : 
  ( n1786 ) ? ACC_9b : 
  ( n1788 ) ? ACC_9c : 
  ( n1790 ) ? ACC_9d : 
  ( n1792 ) ? ACC_9e : 
  ( n1794 ) ? ACC_9f : 
  ( n1796 ) ? ACC_a4 : 
  ( n1798 ) ? ACC_b2 : 
  ( n1800 ) ? ACC_bd : 
  ( n1802 ) ? ACC_c2 : 
  ( n1804 ) ? ACC_c4 : 
  ( n1806 ) ? ACC_c5 : 
  ( n1808 ) ? ACC_c6 : 
  ( n1810 ) ? ACC_c7 : 
  ( n1812 ) ? ACC_c8 : 
  ( n1814 ) ? ACC_c9 : 
  ( n1816 ) ? ACC_ca : 
  ( n1818 ) ? ACC_cb : 
  ( n1820 ) ? ACC_cc : 
  ( n1822 ) ? ACC_cd : 
  ( n1824 ) ? ACC_ce : 
  ( n1826 ) ? ACC_cf : 
  ( n1827 ) ? ACC_d0 : 
  ( n1829 ) ? ACC_d2 : 
  ( n1831 ) ? ACC_d4 : 
  ( n1833 ) ? ACC_d5 : 
  ( n1835 ) ? ACC_d6 : 
  ( n1837 ) ? ACC_d7 : 
  ( n1839 ) ? ACC_e4 : 
  ( n1841 ) ? ACC_e5 : 
  ( n1843 ) ? ACC_e6 : 
  ( n1845 ) ? ACC_e7 : 
  ( n1847 ) ? ACC_e8 : 
  ( n1849 ) ? ACC_e9 : 
  ( n1851 ) ? ACC_ea : 
  ( n1853 ) ? ACC_eb : 
  ( n1855 ) ? ACC_ec : 
  ( n1857 ) ? ACC_ed : 
  ( n1859 ) ? ACC_ee : 
  ( n1861 ) ? ACC_ef : 
  ( n1863 ) ? ACC_f4 : 
  ( ACC );
assign n1864 = 8'h42;
assign n1865 = ( n0008 == n1864 );
assign n1866 = 8'h52;
assign n1867 = ( n0008 == n1866 );
assign n1868 = 8'hf5;
assign n1869 = ( n0008 == n1868 );
assign PCON_next = 
  ( n1606 ) ? PCON_05 : 
  ( n1614 ) ? PCON_15 : 
  ( n1865 ) ? PCON_42 : 
  ( n1668 ) ? PCON_43 : 
  ( n1867 ) ? PCON_52 : 
  ( n1694 ) ? PCON_53 : 
  ( n1720 ) ? PCON_62 : 
  ( n1722 ) ? PCON_63 : 
  ( n1750 ) ? PCON_75 : 
  ( n1755 ) ? PCON_85 : 
  ( n1757 ) ? PCON_86 : 
  ( n1758 ) ? PCON_87 : 
  ( n1759 ) ? PCON_88 : 
  ( n1760 ) ? PCON_89 : 
  ( n1761 ) ? PCON_8a : 
  ( n1762 ) ? PCON_8b : 
  ( n1763 ) ? PCON_8c : 
  ( n1764 ) ? PCON_8d : 
  ( n1766 ) ? PCON_8e : 
  ( n1768 ) ? PCON_8f : 
  ( n1806 ) ? PCON_c5 : 
  ( n1827 ) ? PCON_d0 : 
  ( n1833 ) ? PCON_d5 : 
  ( n1869 ) ? PCON_f5 : 
  ( PCON );
assign B_next = 
  ( n1606 ) ? B_05 : 
  ( n1608 ) ? B_10 : 
  ( n1614 ) ? B_15 : 
  ( n1865 ) ? B_42 : 
  ( n1668 ) ? B_43 : 
  ( n1867 ) ? B_52 : 
  ( n1694 ) ? B_53 : 
  ( n1720 ) ? B_62 : 
  ( n1722 ) ? B_63 : 
  ( n1750 ) ? B_75 : 
  ( n1753 ) ? B_84 : 
  ( n1755 ) ? B_85 : 
  ( n1757 ) ? B_86 : 
  ( n1758 ) ? B_87 : 
  ( n1759 ) ? B_88 : 
  ( n1760 ) ? B_89 : 
  ( n1761 ) ? B_8a : 
  ( n1762 ) ? B_8b : 
  ( n1763 ) ? B_8c : 
  ( n1764 ) ? B_8d : 
  ( n1766 ) ? B_8e : 
  ( n1768 ) ? B_8f : 
  ( n1770 ) ? B_92 : 
  ( n1796 ) ? B_a4 : 
  ( n1798 ) ? B_b2 : 
  ( n1802 ) ? B_c2 : 
  ( n1806 ) ? B_c5 : 
  ( n1827 ) ? B_d0 : 
  ( n1829 ) ? B_d2 : 
  ( n1833 ) ? B_d5 : 
  ( n1869 ) ? B_f5 : 
  ( B );
assign TMOD_next = 
  ( n1606 ) ? TMOD_05 : 
  ( n1614 ) ? TMOD_15 : 
  ( n1636 ) ? TMOD_2d : 
  ( n1865 ) ? TMOD_42 : 
  ( n1668 ) ? TMOD_43 : 
  ( n1867 ) ? TMOD_52 : 
  ( n1694 ) ? TMOD_53 : 
  ( n1720 ) ? TMOD_62 : 
  ( n1722 ) ? TMOD_63 : 
  ( n1750 ) ? TMOD_75 : 
  ( n1755 ) ? TMOD_85 : 
  ( n1757 ) ? TMOD_86 : 
  ( n1758 ) ? TMOD_87 : 
  ( n1759 ) ? TMOD_88 : 
  ( n1760 ) ? TMOD_89 : 
  ( n1761 ) ? TMOD_8a : 
  ( n1762 ) ? TMOD_8b : 
  ( n1763 ) ? TMOD_8c : 
  ( n1764 ) ? TMOD_8d : 
  ( n1766 ) ? TMOD_8e : 
  ( n1768 ) ? TMOD_8f : 
  ( n1806 ) ? TMOD_c5 : 
  ( n1827 ) ? TMOD_d0 : 
  ( n1833 ) ? TMOD_d5 : 
  ( n1869 ) ? TMOD_f5 : 
  ( TMOD );
assign n1870 = ( n0008 == n0045 );
assign n1871 = 8'ha3;
assign n1872 = ( n0008 == n1871 );
assign DPL_next = 
  ( n1606 ) ? DPL_05 : 
  ( n1614 ) ? DPL_15 : 
  ( n1865 ) ? DPL_42 : 
  ( n1668 ) ? DPL_43 : 
  ( n1867 ) ? DPL_52 : 
  ( n1694 ) ? DPL_53 : 
  ( n1720 ) ? DPL_62 : 
  ( n1722 ) ? DPL_63 : 
  ( n1750 ) ? DPL_75 : 
  ( n1755 ) ? DPL_85 : 
  ( n1757 ) ? DPL_86 : 
  ( n1758 ) ? DPL_87 : 
  ( n1759 ) ? DPL_88 : 
  ( n1760 ) ? DPL_89 : 
  ( n1761 ) ? DPL_8a : 
  ( n1762 ) ? DPL_8b : 
  ( n1763 ) ? DPL_8c : 
  ( n1764 ) ? DPL_8d : 
  ( n1766 ) ? DPL_8e : 
  ( n1768 ) ? DPL_8f : 
  ( n1870 ) ? DPL_90 : 
  ( n1872 ) ? DPL_a3 : 
  ( n1806 ) ? DPL_c5 : 
  ( n1827 ) ? DPL_d0 : 
  ( n1833 ) ? DPL_d5 : 
  ( n1869 ) ? DPL_f5 : 
  ( DPL );
assign n1873 = 8'hb7;
assign n1874 = ( n0008 == n1873 );
assign DPH_next = 
  ( n1606 ) ? DPH_05 : 
  ( n1614 ) ? DPH_15 : 
  ( n1865 ) ? DPH_42 : 
  ( n1668 ) ? DPH_43 : 
  ( n1867 ) ? DPH_52 : 
  ( n1694 ) ? DPH_53 : 
  ( n1720 ) ? DPH_62 : 
  ( n1722 ) ? DPH_63 : 
  ( n1750 ) ? DPH_75 : 
  ( n1755 ) ? DPH_85 : 
  ( n1757 ) ? DPH_86 : 
  ( n1758 ) ? DPH_87 : 
  ( n1759 ) ? DPH_88 : 
  ( n1760 ) ? DPH_89 : 
  ( n1761 ) ? DPH_8a : 
  ( n1762 ) ? DPH_8b : 
  ( n1763 ) ? DPH_8c : 
  ( n1764 ) ? DPH_8d : 
  ( n1766 ) ? DPH_8e : 
  ( n1768 ) ? DPH_8f : 
  ( n1870 ) ? DPH_90 : 
  ( n1872 ) ? DPH_a3 : 
  ( n1874 ) ? DPH_b7 : 
  ( n1806 ) ? DPH_c5 : 
  ( n1827 ) ? DPH_d0 : 
  ( n1833 ) ? DPH_d5 : 
  ( n1869 ) ? DPH_f5 : 
  ( DPH );
assign TL1_next = 
  ( n1606 ) ? TL1_05 : 
  ( n1614 ) ? TL1_15 : 
  ( n1865 ) ? TL1_42 : 
  ( n1668 ) ? TL1_43 : 
  ( n1867 ) ? TL1_52 : 
  ( n1694 ) ? TL1_53 : 
  ( n1720 ) ? TL1_62 : 
  ( n1722 ) ? TL1_63 : 
  ( n1750 ) ? TL1_75 : 
  ( n1755 ) ? TL1_85 : 
  ( n1757 ) ? TL1_86 : 
  ( n1758 ) ? TL1_87 : 
  ( n1759 ) ? TL1_88 : 
  ( n1760 ) ? TL1_89 : 
  ( n1761 ) ? TL1_8a : 
  ( n1762 ) ? TL1_8b : 
  ( n1763 ) ? TL1_8c : 
  ( n1764 ) ? TL1_8d : 
  ( n1766 ) ? TL1_8e : 
  ( n1768 ) ? TL1_8f : 
  ( n1806 ) ? TL1_c5 : 
  ( n1827 ) ? TL1_d0 : 
  ( n1833 ) ? TL1_d5 : 
  ( n1869 ) ? TL1_f5 : 
  ( TL1 );
assign TL0_next = 
  ( n1606 ) ? TL0_05 : 
  ( n1614 ) ? TL0_15 : 
  ( n1865 ) ? TL0_42 : 
  ( n1668 ) ? TL0_43 : 
  ( n1867 ) ? TL0_52 : 
  ( n1694 ) ? TL0_53 : 
  ( n1720 ) ? TL0_62 : 
  ( n1722 ) ? TL0_63 : 
  ( n1750 ) ? TL0_75 : 
  ( n1755 ) ? TL0_85 : 
  ( n1757 ) ? TL0_86 : 
  ( n1758 ) ? TL0_87 : 
  ( n1759 ) ? TL0_88 : 
  ( n1760 ) ? TL0_89 : 
  ( n1761 ) ? TL0_8a : 
  ( n1762 ) ? TL0_8b : 
  ( n1763 ) ? TL0_8c : 
  ( n1764 ) ? TL0_8d : 
  ( n1766 ) ? TL0_8e : 
  ( n1768 ) ? TL0_8f : 
  ( n1806 ) ? TL0_c5 : 
  ( n1827 ) ? TL0_d0 : 
  ( n1833 ) ? TL0_d5 : 
  ( n1869 ) ? TL0_f5 : 
  ( TL0 );
assign n1875 = 8'hd3;
assign n1876 = ( n0008 == n1875 );
assign TCON_next = 
  ( n1606 ) ? TCON_05 : 
  ( n1608 ) ? TCON_10 : 
  ( n1614 ) ? TCON_15 : 
  ( n1865 ) ? TCON_42 : 
  ( n1668 ) ? TCON_43 : 
  ( n1867 ) ? TCON_52 : 
  ( n1694 ) ? TCON_53 : 
  ( n1720 ) ? TCON_62 : 
  ( n1722 ) ? TCON_63 : 
  ( n1750 ) ? TCON_75 : 
  ( n1755 ) ? TCON_85 : 
  ( n1757 ) ? TCON_86 : 
  ( n1758 ) ? TCON_87 : 
  ( n1759 ) ? TCON_88 : 
  ( n1760 ) ? TCON_89 : 
  ( n1761 ) ? TCON_8a : 
  ( n1762 ) ? TCON_8b : 
  ( n1763 ) ? TCON_8c : 
  ( n1764 ) ? TCON_8d : 
  ( n1766 ) ? TCON_8e : 
  ( n1768 ) ? TCON_8f : 
  ( n1770 ) ? TCON_92 : 
  ( n1798 ) ? TCON_b2 : 
  ( n1802 ) ? TCON_c2 : 
  ( n1806 ) ? TCON_c5 : 
  ( n1827 ) ? TCON_d0 : 
  ( n1829 ) ? TCON_d2 : 
  ( n1876 ) ? TCON_d3 : 
  ( n1833 ) ? TCON_d5 : 
  ( n1869 ) ? TCON_f5 : 
  ( TCON );
assign TH1_next = 
  ( n1606 ) ? TH1_05 : 
  ( n1614 ) ? TH1_15 : 
  ( n1865 ) ? TH1_42 : 
  ( n1668 ) ? TH1_43 : 
  ( n1867 ) ? TH1_52 : 
  ( n1694 ) ? TH1_53 : 
  ( n1720 ) ? TH1_62 : 
  ( n1722 ) ? TH1_63 : 
  ( n1750 ) ? TH1_75 : 
  ( n1755 ) ? TH1_85 : 
  ( n1757 ) ? TH1_86 : 
  ( n1758 ) ? TH1_87 : 
  ( n1759 ) ? TH1_88 : 
  ( n1760 ) ? TH1_89 : 
  ( n1761 ) ? TH1_8a : 
  ( n1762 ) ? TH1_8b : 
  ( n1763 ) ? TH1_8c : 
  ( n1764 ) ? TH1_8d : 
  ( n1766 ) ? TH1_8e : 
  ( n1768 ) ? TH1_8f : 
  ( n1806 ) ? TH1_c5 : 
  ( n1827 ) ? TH1_d0 : 
  ( n1833 ) ? TH1_d5 : 
  ( n1869 ) ? TH1_f5 : 
  ( TH1 );
assign TH0_next = 
  ( n1606 ) ? TH0_05 : 
  ( n1614 ) ? TH0_15 : 
  ( n1865 ) ? TH0_42 : 
  ( n1668 ) ? TH0_43 : 
  ( n1867 ) ? TH0_52 : 
  ( n1694 ) ? TH0_53 : 
  ( n1720 ) ? TH0_62 : 
  ( n1722 ) ? TH0_63 : 
  ( n1750 ) ? TH0_75 : 
  ( n1755 ) ? TH0_85 : 
  ( n1757 ) ? TH0_86 : 
  ( n1758 ) ? TH0_87 : 
  ( n1759 ) ? TH0_88 : 
  ( n1760 ) ? TH0_89 : 
  ( n1761 ) ? TH0_8a : 
  ( n1762 ) ? TH0_8b : 
  ( n1763 ) ? TH0_8c : 
  ( n1764 ) ? TH0_8d : 
  ( n1766 ) ? TH0_8e : 
  ( n1768 ) ? TH0_8f : 
  ( n1806 ) ? TH0_c5 : 
  ( n1827 ) ? TH0_d0 : 
  ( n1833 ) ? TH0_d5 : 
  ( n1869 ) ? TH0_f5 : 
  ( TH0 );
assign n1877 = ( n0008 == n0063 );
assign n1878 = ( n0008 == n0015 );
assign n1879 = ( n0008 == n0219 );
assign n1880 = 8'h6;
assign n1881 = ( n0008 == n1880 );
assign n1882 = 8'h7;
assign n1883 = ( n0008 == n1882 );
assign n1884 = 8'h8;
assign n1885 = ( n0008 == n1884 );
assign n1886 = 8'h9;
assign n1887 = ( n0008 == n1886 );
assign n1888 = 8'ha;
assign n1889 = ( n0008 == n1888 );
assign n1890 = 8'hb;
assign n1891 = ( n0008 == n1890 );
assign n1892 = 8'hc;
assign n1893 = ( n0008 == n1892 );
assign n1894 = 8'hd;
assign n1895 = ( n0008 == n1894 );
assign n1896 = 8'he;
assign n1897 = ( n0008 == n1896 );
assign n1898 = 8'hf;
assign n1899 = ( n0008 == n1898 );
assign n1900 = 8'h11;
assign n1901 = ( n0008 == n1900 );
assign n1902 = 8'h12;
assign n1903 = ( n0008 == n1902 );
assign n1904 = 8'h16;
assign n1905 = ( n0008 == n1904 );
assign n1906 = 8'h17;
assign n1907 = ( n0008 == n1906 );
assign n1908 = 8'h18;
assign n1909 = ( n0008 == n1908 );
assign n1910 = 8'h19;
assign n1911 = ( n0008 == n1910 );
assign n1912 = 8'h1a;
assign n1913 = ( n0008 == n1912 );
assign n1914 = 8'h1b;
assign n1915 = ( n0008 == n1914 );
assign n1916 = 8'h1c;
assign n1917 = ( n0008 == n1916 );
assign n1918 = 8'h1d;
assign n1919 = ( n0008 == n1918 );
assign n1920 = 8'h1e;
assign n1921 = ( n0008 == n1920 );
assign n1922 = 8'h1f;
assign n1923 = ( n0008 == n1922 );
assign n1924 = ( n0008 == n0158 );
assign n1925 = 8'h21;
assign n1926 = ( n0008 == n1925 );
assign n1927 = 8'h22;
assign n1928 = ( n0008 == n1927 );
assign n1929 = 8'h30;
assign n1930 = ( n0008 == n1929 );
assign n1931 = 8'h31;
assign n1932 = ( n0008 == n1931 );
assign n1933 = 8'h32;
assign n1934 = ( n0008 == n1933 );
assign n1935 = 8'h40;
assign n1936 = ( n0008 == n1935 );
assign n1937 = 8'h41;
assign n1938 = ( n0008 == n1937 );
assign n1939 = 8'h50;
assign n1940 = ( n0008 == n1939 );
assign n1941 = 8'h51;
assign n1942 = ( n0008 == n1941 );
assign n1943 = 8'h60;
assign n1944 = ( n0008 == n1943 );
assign n1945 = 8'h61;
assign n1946 = ( n0008 == n1945 );
assign n1947 = 8'h70;
assign n1948 = ( n0008 == n1947 );
assign n1949 = 8'h71;
assign n1950 = ( n0008 == n1949 );
assign n1951 = 8'h72;
assign n1952 = ( n0008 == n1951 );
assign n1953 = 8'h73;
assign n1954 = ( n0008 == n1953 );
assign n1955 = 8'h76;
assign n1956 = ( n0008 == n1955 );
assign n1957 = 8'h77;
assign n1958 = ( n0008 == n1957 );
assign n1959 = 8'h78;
assign n1960 = ( n0008 == n1959 );
assign n1961 = 8'h79;
assign n1962 = ( n0008 == n1961 );
assign n1963 = 8'h7a;
assign n1964 = ( n0008 == n1963 );
assign n1965 = 8'h7b;
assign n1966 = ( n0008 == n1965 );
assign n1967 = 8'h7c;
assign n1968 = ( n0008 == n1967 );
assign n1969 = 8'h7d;
assign n1970 = ( n0008 == n1969 );
assign n1971 = 8'h7e;
assign n1972 = ( n0008 == n1971 );
assign n1973 = 8'h7f;
assign n1974 = ( n0008 == n1973 );
assign n1975 = ( n0008 == n0023 );
assign n1976 = ( n0008 == n0025 );
assign n1977 = ( n0008 == n0027 );
assign n1978 = 8'h91;
assign n1979 = ( n0008 == n1978 );
assign n1980 = ( n0008 == n0051 );
assign n1981 = 8'ha1;
assign n1982 = ( n0008 == n1981 );
assign n1983 = 8'ha2;
assign n1984 = ( n0008 == n1983 );
assign n1985 = 8'ha5;
assign n1986 = ( n0008 == n1985 );
assign n1987 = 8'ha6;
assign n1988 = ( n0008 == n1987 );
assign n1989 = 8'ha7;
assign n1990 = ( n0008 == n1989 );
assign n1991 = ( n0008 == n0053 );
assign n1992 = 8'ha9;
assign n1993 = ( n0008 == n1992 );
assign n1994 = 8'haa;
assign n1995 = ( n0008 == n1994 );
assign n1996 = 8'hab;
assign n1997 = ( n0008 == n1996 );
assign n1998 = 8'hac;
assign n1999 = ( n0008 == n1998 );
assign n2000 = 8'had;
assign n2001 = ( n0008 == n2000 );
assign n2002 = 8'hae;
assign n2003 = ( n0008 == n2002 );
assign n2004 = 8'haf;
assign n2005 = ( n0008 == n2004 );
assign n2006 = ( n0008 == n0055 );
assign n2007 = 8'hb1;
assign n2008 = ( n0008 == n2007 );
assign n2009 = 8'hb3;
assign n2010 = ( n0008 == n2009 );
assign n2011 = 8'hb4;
assign n2012 = ( n0008 == n2011 );
assign n2013 = 8'hb5;
assign n2014 = ( n0008 == n2013 );
assign n2015 = 8'hb6;
assign n2016 = ( n0008 == n2015 );
assign n2017 = ( n0008 == n0057 );
assign n2018 = 8'hb9;
assign n2019 = ( n0008 == n2018 );
assign n2020 = 8'hba;
assign n2021 = ( n0008 == n2020 );
assign n2022 = 8'hbb;
assign n2023 = ( n0008 == n2022 );
assign n2024 = 8'hbc;
assign n2025 = ( n0008 == n2024 );
assign n2026 = 8'hbe;
assign n2027 = ( n0008 == n2026 );
assign n2028 = 8'hbf;
assign n2029 = ( n0008 == n2028 );
assign n2030 = 8'hc0;
assign n2031 = ( n0008 == n2030 );
assign n2032 = 8'hc1;
assign n2033 = ( n0008 == n2032 );
assign n2034 = 8'hc3;
assign n2035 = ( n0008 == n2034 );
assign n2036 = 8'hd1;
assign n2037 = ( n0008 == n2036 );
assign n2038 = 8'hd8;
assign n2039 = ( n0008 == n2038 );
assign n2040 = 8'hd9;
assign n2041 = ( n0008 == n2040 );
assign n2042 = 8'hda;
assign n2043 = ( n0008 == n2042 );
assign n2044 = 8'hdb;
assign n2045 = ( n0008 == n2044 );
assign n2046 = 8'hdc;
assign n2047 = ( n0008 == n2046 );
assign n2048 = 8'hdd;
assign n2049 = ( n0008 == n2048 );
assign n2050 = 8'hde;
assign n2051 = ( n0008 == n2050 );
assign n2052 = 8'hdf;
assign n2053 = ( n0008 == n2052 );
assign n2054 = 8'he1;
assign n2055 = ( n0008 == n2054 );
assign n2056 = 8'hf1;
assign n2057 = ( n0008 == n2056 );
assign n2058 = 8'hf6;
assign n2059 = ( n0008 == n2058 );
assign n2060 = 8'hf7;
assign n2061 = ( n0008 == n2060 );
assign n2062 = 8'hf8;
assign n2063 = ( n0008 == n2062 );
assign n2064 = 8'hf9;
assign n2065 = ( n0008 == n2064 );
assign n2066 = 8'hfa;
assign n2067 = ( n0008 == n2066 );
assign n2068 = 8'hfb;
assign n2069 = ( n0008 == n2068 );
assign n2070 = 8'hfc;
assign n2071 = ( n0008 == n2070 );
assign n2072 = 8'hfd;
assign n2073 = ( n0008 == n2072 );
assign n2074 = 8'hfe;
assign n2075 = ( n0008 == n2074 );
assign n2076 = ( n0008 == n0966 );
assign PC_next = 
  ( n1877 ) ? PC_00 : 
  ( n1878 ) ? PC_01 : 
  ( n1879 ) ? PC_02 : 
  ( n1602 ) ? PC_03 : 
  ( n1604 ) ? PC_04 : 
  ( n1606 ) ? PC_05 : 
  ( n1881 ) ? PC_06 : 
  ( n1883 ) ? PC_07 : 
  ( n1885 ) ? PC_08 : 
  ( n1887 ) ? PC_09 : 
  ( n1889 ) ? PC_0a : 
  ( n1891 ) ? PC_0b : 
  ( n1893 ) ? PC_0c : 
  ( n1895 ) ? PC_0d : 
  ( n1897 ) ? PC_0e : 
  ( n1899 ) ? PC_0f : 
  ( n1608 ) ? PC_10 : 
  ( n1901 ) ? PC_11 : 
  ( n1903 ) ? PC_12 : 
  ( n1610 ) ? PC_13 : 
  ( n1612 ) ? PC_14 : 
  ( n1614 ) ? PC_15 : 
  ( n1905 ) ? PC_16 : 
  ( n1907 ) ? PC_17 : 
  ( n1909 ) ? PC_18 : 
  ( n1911 ) ? PC_19 : 
  ( n1913 ) ? PC_1a : 
  ( n1915 ) ? PC_1b : 
  ( n1917 ) ? PC_1c : 
  ( n1919 ) ? PC_1d : 
  ( n1921 ) ? PC_1e : 
  ( n1923 ) ? PC_1f : 
  ( n1924 ) ? PC_20 : 
  ( n1926 ) ? PC_21 : 
  ( n1928 ) ? PC_22 : 
  ( n1616 ) ? PC_23 : 
  ( n1618 ) ? PC_24 : 
  ( n1620 ) ? PC_25 : 
  ( n1622 ) ? PC_26 : 
  ( n1624 ) ? PC_27 : 
  ( n1626 ) ? PC_28 : 
  ( n1628 ) ? PC_29 : 
  ( n1630 ) ? PC_2a : 
  ( n1632 ) ? PC_2b : 
  ( n1634 ) ? PC_2c : 
  ( n1636 ) ? PC_2d : 
  ( n1638 ) ? PC_2e : 
  ( n1640 ) ? PC_2f : 
  ( n1930 ) ? PC_30 : 
  ( n1932 ) ? PC_31 : 
  ( n1934 ) ? PC_32 : 
  ( n1642 ) ? PC_33 : 
  ( n1644 ) ? PC_34 : 
  ( n1646 ) ? PC_35 : 
  ( n1648 ) ? PC_36 : 
  ( n1650 ) ? PC_37 : 
  ( n1652 ) ? PC_38 : 
  ( n1654 ) ? PC_39 : 
  ( n1656 ) ? PC_3a : 
  ( n1658 ) ? PC_3b : 
  ( n1660 ) ? PC_3c : 
  ( n1662 ) ? PC_3d : 
  ( n1664 ) ? PC_3e : 
  ( n1666 ) ? PC_3f : 
  ( n1936 ) ? PC_40 : 
  ( n1938 ) ? PC_41 : 
  ( n1865 ) ? PC_42 : 
  ( n1668 ) ? PC_43 : 
  ( n1670 ) ? PC_44 : 
  ( n1672 ) ? PC_45 : 
  ( n1674 ) ? PC_46 : 
  ( n1676 ) ? PC_47 : 
  ( n1678 ) ? PC_48 : 
  ( n1680 ) ? PC_49 : 
  ( n1682 ) ? PC_4a : 
  ( n1684 ) ? PC_4b : 
  ( n1686 ) ? PC_4c : 
  ( n1688 ) ? PC_4d : 
  ( n1690 ) ? PC_4e : 
  ( n1692 ) ? PC_4f : 
  ( n1940 ) ? PC_50 : 
  ( n1942 ) ? PC_51 : 
  ( n1867 ) ? PC_52 : 
  ( n1694 ) ? PC_53 : 
  ( n1696 ) ? PC_54 : 
  ( n1698 ) ? PC_55 : 
  ( n1700 ) ? PC_56 : 
  ( n1702 ) ? PC_57 : 
  ( n1704 ) ? PC_58 : 
  ( n1706 ) ? PC_59 : 
  ( n1708 ) ? PC_5a : 
  ( n1710 ) ? PC_5b : 
  ( n1712 ) ? PC_5c : 
  ( n1714 ) ? PC_5d : 
  ( n1716 ) ? PC_5e : 
  ( n1718 ) ? PC_5f : 
  ( n1944 ) ? PC_60 : 
  ( n1946 ) ? PC_61 : 
  ( n1720 ) ? PC_62 : 
  ( n1722 ) ? PC_63 : 
  ( n1724 ) ? PC_64 : 
  ( n1726 ) ? PC_65 : 
  ( n1728 ) ? PC_66 : 
  ( n1730 ) ? PC_67 : 
  ( n1732 ) ? PC_68 : 
  ( n1734 ) ? PC_69 : 
  ( n1736 ) ? PC_6a : 
  ( n1738 ) ? PC_6b : 
  ( n1740 ) ? PC_6c : 
  ( n1742 ) ? PC_6d : 
  ( n1744 ) ? PC_6e : 
  ( n1746 ) ? PC_6f : 
  ( n1948 ) ? PC_70 : 
  ( n1950 ) ? PC_71 : 
  ( n1952 ) ? PC_72 : 
  ( n1954 ) ? PC_73 : 
  ( n1748 ) ? PC_74 : 
  ( n1750 ) ? PC_75 : 
  ( n1956 ) ? PC_76 : 
  ( n1958 ) ? PC_77 : 
  ( n1960 ) ? PC_78 : 
  ( n1962 ) ? PC_79 : 
  ( n1964 ) ? PC_7a : 
  ( n1966 ) ? PC_7b : 
  ( n1968 ) ? PC_7c : 
  ( n1970 ) ? PC_7d : 
  ( n1972 ) ? PC_7e : 
  ( n1974 ) ? PC_7f : 
  ( n1975 ) ? PC_80 : 
  ( n1976 ) ? PC_81 : 
  ( n1977 ) ? PC_82 : 
  ( n1751 ) ? PC_83 : 
  ( n1753 ) ? PC_84 : 
  ( n1755 ) ? PC_85 : 
  ( n1757 ) ? PC_86 : 
  ( n1758 ) ? PC_87 : 
  ( n1759 ) ? PC_88 : 
  ( n1760 ) ? PC_89 : 
  ( n1761 ) ? PC_8a : 
  ( n1762 ) ? PC_8b : 
  ( n1763 ) ? PC_8c : 
  ( n1764 ) ? PC_8d : 
  ( n1766 ) ? PC_8e : 
  ( n1768 ) ? PC_8f : 
  ( n1870 ) ? PC_90 : 
  ( n1979 ) ? PC_91 : 
  ( n1770 ) ? PC_92 : 
  ( n1772 ) ? PC_93 : 
  ( n1774 ) ? PC_94 : 
  ( n1776 ) ? PC_95 : 
  ( n1778 ) ? PC_96 : 
  ( n1780 ) ? PC_97 : 
  ( n1781 ) ? PC_98 : 
  ( n1782 ) ? PC_99 : 
  ( n1784 ) ? PC_9a : 
  ( n1786 ) ? PC_9b : 
  ( n1788 ) ? PC_9c : 
  ( n1790 ) ? PC_9d : 
  ( n1792 ) ? PC_9e : 
  ( n1794 ) ? PC_9f : 
  ( n1980 ) ? PC_a0 : 
  ( n1982 ) ? PC_a1 : 
  ( n1984 ) ? PC_a2 : 
  ( n1872 ) ? PC_a3 : 
  ( n1796 ) ? PC_a4 : 
  ( n1986 ) ? PC_a5 : 
  ( n1988 ) ? PC_a6 : 
  ( n1990 ) ? PC_a7 : 
  ( n1991 ) ? PC_a8 : 
  ( n1993 ) ? PC_a9 : 
  ( n1995 ) ? PC_aa : 
  ( n1997 ) ? PC_ab : 
  ( n1999 ) ? PC_ac : 
  ( n2001 ) ? PC_ad : 
  ( n2003 ) ? PC_ae : 
  ( n2005 ) ? PC_af : 
  ( n2006 ) ? PC_b0 : 
  ( n2008 ) ? PC_b1 : 
  ( n1798 ) ? PC_b2 : 
  ( n2010 ) ? PC_b3 : 
  ( n2012 ) ? PC_b4 : 
  ( n2014 ) ? PC_b5 : 
  ( n2016 ) ? PC_b6 : 
  ( n1874 ) ? PC_b7 : 
  ( n2017 ) ? PC_b8 : 
  ( n2019 ) ? PC_b9 : 
  ( n2021 ) ? PC_ba : 
  ( n2023 ) ? PC_bb : 
  ( n2025 ) ? PC_bc : 
  ( n1800 ) ? PC_bd : 
  ( n2027 ) ? PC_be : 
  ( n2029 ) ? PC_bf : 
  ( n2031 ) ? PC_c0 : 
  ( n2033 ) ? PC_c1 : 
  ( n1802 ) ? PC_c2 : 
  ( n2035 ) ? PC_c3 : 
  ( n1804 ) ? PC_c4 : 
  ( n1806 ) ? PC_c5 : 
  ( n1808 ) ? PC_c6 : 
  ( n1810 ) ? PC_c7 : 
  ( n1812 ) ? PC_c8 : 
  ( n1814 ) ? PC_c9 : 
  ( n1816 ) ? PC_ca : 
  ( n1818 ) ? PC_cb : 
  ( n1820 ) ? PC_cc : 
  ( n1822 ) ? PC_cd : 
  ( n1824 ) ? PC_ce : 
  ( n1826 ) ? PC_cf : 
  ( n1827 ) ? PC_d0 : 
  ( n2037 ) ? PC_d1 : 
  ( n1829 ) ? PC_d2 : 
  ( n1876 ) ? PC_d3 : 
  ( n1831 ) ? PC_d4 : 
  ( n1833 ) ? PC_d5 : 
  ( n1835 ) ? PC_d6 : 
  ( n1837 ) ? PC_d7 : 
  ( n2039 ) ? PC_d8 : 
  ( n2041 ) ? PC_d9 : 
  ( n2043 ) ? PC_da : 
  ( n2045 ) ? PC_db : 
  ( n2047 ) ? PC_dc : 
  ( n2049 ) ? PC_dd : 
  ( n2051 ) ? PC_de : 
  ( n2053 ) ? PC_df : 
  ( n2055 ) ? PC_e1 : 
  ( n1839 ) ? PC_e4 : 
  ( n1841 ) ? PC_e5 : 
  ( n1843 ) ? PC_e6 : 
  ( n1845 ) ? PC_e7 : 
  ( n1847 ) ? PC_e8 : 
  ( n1849 ) ? PC_e9 : 
  ( n1851 ) ? PC_ea : 
  ( n1853 ) ? PC_eb : 
  ( n1855 ) ? PC_ec : 
  ( n1857 ) ? PC_ed : 
  ( n1859 ) ? PC_ee : 
  ( n1861 ) ? PC_ef : 
  ( n2057 ) ? PC_f1 : 
  ( n1863 ) ? PC_f4 : 
  ( n1869 ) ? PC_f5 : 
  ( n2059 ) ? PC_f6 : 
  ( n2061 ) ? PC_f7 : 
  ( n2063 ) ? PC_f8 : 
  ( n2065 ) ? PC_f9 : 
  ( n2067 ) ? PC_fa : 
  ( n2069 ) ? PC_fb : 
  ( n2071 ) ? PC_fc : 
  ( n2073 ) ? PC_fd : 
  ( n2075 ) ? PC_fe : 
  ( n2076 ) ? PC_ff : 
  ( PC );
assign P2_next = 
  ( n1606 ) ? P2_05 : 
  ( n1608 ) ? P2_10 : 
  ( n1614 ) ? P2_15 : 
  ( n1934 ) ? P2_32 : 
  ( n1865 ) ? P2_42 : 
  ( n1668 ) ? P2_43 : 
  ( n1867 ) ? P2_52 : 
  ( n1694 ) ? P2_53 : 
  ( n1720 ) ? P2_62 : 
  ( n1722 ) ? P2_63 : 
  ( n1750 ) ? P2_75 : 
  ( n1755 ) ? P2_85 : 
  ( n1757 ) ? P2_86 : 
  ( n1758 ) ? P2_87 : 
  ( n1759 ) ? P2_88 : 
  ( n1760 ) ? P2_89 : 
  ( n1761 ) ? P2_8a : 
  ( n1762 ) ? P2_8b : 
  ( n1763 ) ? P2_8c : 
  ( n1764 ) ? P2_8d : 
  ( n1766 ) ? P2_8e : 
  ( n1768 ) ? P2_8f : 
  ( n1770 ) ? P2_92 : 
  ( n1798 ) ? P2_b2 : 
  ( n1802 ) ? P2_c2 : 
  ( n1806 ) ? P2_c5 : 
  ( n1827 ) ? P2_d0 : 
  ( n1829 ) ? P2_d2 : 
  ( n1833 ) ? P2_d5 : 
  ( n1869 ) ? P2_f5 : 
  ( P2 );
assign P3_next = 
  ( n1606 ) ? P3_05 : 
  ( n1889 ) ? P3_0a : 
  ( n1608 ) ? P3_10 : 
  ( n1614 ) ? P3_15 : 
  ( n1865 ) ? P3_42 : 
  ( n1668 ) ? P3_43 : 
  ( n1688 ) ? P3_4d : 
  ( n1867 ) ? P3_52 : 
  ( n1694 ) ? P3_53 : 
  ( n1720 ) ? P3_62 : 
  ( n1722 ) ? P3_63 : 
  ( n1750 ) ? P3_75 : 
  ( n1755 ) ? P3_85 : 
  ( n1757 ) ? P3_86 : 
  ( n1758 ) ? P3_87 : 
  ( n1759 ) ? P3_88 : 
  ( n1760 ) ? P3_89 : 
  ( n1761 ) ? P3_8a : 
  ( n1762 ) ? P3_8b : 
  ( n1763 ) ? P3_8c : 
  ( n1764 ) ? P3_8d : 
  ( n1766 ) ? P3_8e : 
  ( n1768 ) ? P3_8f : 
  ( n1770 ) ? P3_92 : 
  ( n2001 ) ? P3_ad : 
  ( n1798 ) ? P3_b2 : 
  ( n1802 ) ? P3_c2 : 
  ( n1806 ) ? P3_c5 : 
  ( n1827 ) ? P3_d0 : 
  ( n1829 ) ? P3_d2 : 
  ( n1833 ) ? P3_d5 : 
  ( n1869 ) ? P3_f5 : 
  ( P3 );
assign P0_next = 
  ( n1606 ) ? P0_05 : 
  ( n1608 ) ? P0_10 : 
  ( n1614 ) ? P0_15 : 
  ( n1865 ) ? P0_42 : 
  ( n1668 ) ? P0_43 : 
  ( n1867 ) ? P0_52 : 
  ( n1694 ) ? P0_53 : 
  ( n1720 ) ? P0_62 : 
  ( n1722 ) ? P0_63 : 
  ( n1750 ) ? P0_75 : 
  ( n1755 ) ? P0_85 : 
  ( n1757 ) ? P0_86 : 
  ( n1758 ) ? P0_87 : 
  ( n1759 ) ? P0_88 : 
  ( n1760 ) ? P0_89 : 
  ( n1761 ) ? P0_8a : 
  ( n1762 ) ? P0_8b : 
  ( n1763 ) ? P0_8c : 
  ( n1764 ) ? P0_8d : 
  ( n1766 ) ? P0_8e : 
  ( n1768 ) ? P0_8f : 
  ( n1770 ) ? P0_92 : 
  ( n1798 ) ? P0_b2 : 
  ( n1802 ) ? P0_c2 : 
  ( n1806 ) ? P0_c5 : 
  ( n1827 ) ? P0_d0 : 
  ( n1829 ) ? P0_d2 : 
  ( n1833 ) ? P0_d5 : 
  ( n1869 ) ? P0_f5 : 
  ( P0 );
assign P1_next = 
  ( n1606 ) ? P1_05 : 
  ( n1608 ) ? P1_10 : 
  ( n1614 ) ? P1_15 : 
  ( n1865 ) ? P1_42 : 
  ( n1668 ) ? P1_43 : 
  ( n1867 ) ? P1_52 : 
  ( n1694 ) ? P1_53 : 
  ( n1720 ) ? P1_62 : 
  ( n1722 ) ? P1_63 : 
  ( n1750 ) ? P1_75 : 
  ( n1755 ) ? P1_85 : 
  ( n1757 ) ? P1_86 : 
  ( n1758 ) ? P1_87 : 
  ( n1759 ) ? P1_88 : 
  ( n1760 ) ? P1_89 : 
  ( n1761 ) ? P1_8a : 
  ( n1762 ) ? P1_8b : 
  ( n1763 ) ? P1_8c : 
  ( n1764 ) ? P1_8d : 
  ( n1766 ) ? P1_8e : 
  ( n1768 ) ? P1_8f : 
  ( n1770 ) ? P1_92 : 
  ( n1798 ) ? P1_b2 : 
  ( n1802 ) ? P1_c2 : 
  ( n1806 ) ? P1_c5 : 
  ( n1827 ) ? P1_d0 : 
  ( n1829 ) ? P1_d2 : 
  ( n1833 ) ? P1_d5 : 
  ( n1869 ) ? P1_f5 : 
  ( P1 );
assign IP_next = 
  ( n1606 ) ? IP_05 : 
  ( n1608 ) ? IP_10 : 
  ( n1614 ) ? IP_15 : 
  ( n1865 ) ? IP_42 : 
  ( n1668 ) ? IP_43 : 
  ( n1867 ) ? IP_52 : 
  ( n1694 ) ? IP_53 : 
  ( n1720 ) ? IP_62 : 
  ( n1722 ) ? IP_63 : 
  ( n1750 ) ? IP_75 : 
  ( n1755 ) ? IP_85 : 
  ( n1757 ) ? IP_86 : 
  ( n1758 ) ? IP_87 : 
  ( n1759 ) ? IP_88 : 
  ( n1760 ) ? IP_89 : 
  ( n1761 ) ? IP_8a : 
  ( n1762 ) ? IP_8b : 
  ( n1763 ) ? IP_8c : 
  ( n1764 ) ? IP_8d : 
  ( n1766 ) ? IP_8e : 
  ( n1768 ) ? IP_8f : 
  ( n1770 ) ? IP_92 : 
  ( n1798 ) ? IP_b2 : 
  ( n1802 ) ? IP_c2 : 
  ( n1806 ) ? IP_c5 : 
  ( n1827 ) ? IP_d0 : 
  ( n1829 ) ? IP_d2 : 
  ( n1833 ) ? IP_d5 : 
  ( n1861 ) ? IP_ef : 
  ( n1869 ) ? IP_f5 : 
  ( IP );
assign IE_next = 
  ( n1606 ) ? IE_05 : 
  ( n1608 ) ? IE_10 : 
  ( n1614 ) ? IE_15 : 
  ( n1865 ) ? IE_42 : 
  ( n1668 ) ? IE_43 : 
  ( n1867 ) ? IE_52 : 
  ( n1694 ) ? IE_53 : 
  ( n1720 ) ? IE_62 : 
  ( n1722 ) ? IE_63 : 
  ( n1750 ) ? IE_75 : 
  ( n1972 ) ? IE_7e : 
  ( n1755 ) ? IE_85 : 
  ( n1757 ) ? IE_86 : 
  ( n1758 ) ? IE_87 : 
  ( n1759 ) ? IE_88 : 
  ( n1760 ) ? IE_89 : 
  ( n1761 ) ? IE_8a : 
  ( n1762 ) ? IE_8b : 
  ( n1763 ) ? IE_8c : 
  ( n1764 ) ? IE_8d : 
  ( n1766 ) ? IE_8e : 
  ( n1768 ) ? IE_8f : 
  ( n1770 ) ? IE_92 : 
  ( n1798 ) ? IE_b2 : 
  ( n1802 ) ? IE_c2 : 
  ( n1806 ) ? IE_c5 : 
  ( n1827 ) ? IE_d0 : 
  ( n1829 ) ? IE_d2 : 
  ( n1833 ) ? IE_d5 : 
  ( n1869 ) ? IE_f5 : 
  ( IE );
assign SCON_next = 
  ( n1606 ) ? SCON_05 : 
  ( n1608 ) ? SCON_10 : 
  ( n1614 ) ? SCON_15 : 
  ( n1865 ) ? SCON_42 : 
  ( n1668 ) ? SCON_43 : 
  ( n1867 ) ? SCON_52 : 
  ( n1694 ) ? SCON_53 : 
  ( n1720 ) ? SCON_62 : 
  ( n1722 ) ? SCON_63 : 
  ( n1750 ) ? SCON_75 : 
  ( n1755 ) ? SCON_85 : 
  ( n1757 ) ? SCON_86 : 
  ( n1758 ) ? SCON_87 : 
  ( n1759 ) ? SCON_88 : 
  ( n1760 ) ? SCON_89 : 
  ( n1761 ) ? SCON_8a : 
  ( n1762 ) ? SCON_8b : 
  ( n1763 ) ? SCON_8c : 
  ( n1764 ) ? SCON_8d : 
  ( n1766 ) ? SCON_8e : 
  ( n1768 ) ? SCON_8f : 
  ( n1770 ) ? SCON_92 : 
  ( n1798 ) ? SCON_b2 : 
  ( n1802 ) ? SCON_c2 : 
  ( n1806 ) ? SCON_c5 : 
  ( n1827 ) ? SCON_d0 : 
  ( n1829 ) ? SCON_d2 : 
  ( n1833 ) ? SCON_d5 : 
  ( n1869 ) ? SCON_f5 : 
  ( SCON );
assign SP_next = 
  ( n1606 ) ? SP_05 : 
  ( n1901 ) ? SP_11 : 
  ( n1903 ) ? SP_12 : 
  ( n1614 ) ? SP_15 : 
  ( n1928 ) ? SP_22 : 
  ( n1620 ) ? SP_25 : 
  ( n1932 ) ? SP_31 : 
  ( n1934 ) ? SP_32 : 
  ( n1865 ) ? SP_42 : 
  ( n1668 ) ? SP_43 : 
  ( n1942 ) ? SP_51 : 
  ( n1867 ) ? SP_52 : 
  ( n1694 ) ? SP_53 : 
  ( n1720 ) ? SP_62 : 
  ( n1722 ) ? SP_63 : 
  ( n1740 ) ? SP_6c : 
  ( n1950 ) ? SP_71 : 
  ( n1750 ) ? SP_75 : 
  ( n1755 ) ? SP_85 : 
  ( n1757 ) ? SP_86 : 
  ( n1758 ) ? SP_87 : 
  ( n1759 ) ? SP_88 : 
  ( n1760 ) ? SP_89 : 
  ( n1761 ) ? SP_8a : 
  ( n1762 ) ? SP_8b : 
  ( n1763 ) ? SP_8c : 
  ( n1764 ) ? SP_8d : 
  ( n1766 ) ? SP_8e : 
  ( n1768 ) ? SP_8f : 
  ( n1979 ) ? SP_91 : 
  ( n2008 ) ? SP_b1 : 
  ( n2021 ) ? SP_ba : 
  ( n2031 ) ? SP_c0 : 
  ( n1806 ) ? SP_c5 : 
  ( n1827 ) ? SP_d0 : 
  ( n2037 ) ? SP_d1 : 
  ( n1833 ) ? SP_d5 : 
  ( n2057 ) ? SP_f1 : 
  ( n1869 ) ? SP_f5 : 
  ( SP );
assign SBUF_next = 
  ( n1606 ) ? SBUF_05 : 
  ( n1614 ) ? SBUF_15 : 
  ( n1865 ) ? SBUF_42 : 
  ( n1668 ) ? SBUF_43 : 
  ( n1867 ) ? SBUF_52 : 
  ( n1694 ) ? SBUF_53 : 
  ( n1720 ) ? SBUF_62 : 
  ( n1722 ) ? SBUF_63 : 
  ( n1750 ) ? SBUF_75 : 
  ( n1755 ) ? SBUF_85 : 
  ( n1757 ) ? SBUF_86 : 
  ( n1758 ) ? SBUF_87 : 
  ( n1759 ) ? SBUF_88 : 
  ( n1760 ) ? SBUF_89 : 
  ( n1761 ) ? SBUF_8a : 
  ( n1762 ) ? SBUF_8b : 
  ( n1763 ) ? SBUF_8c : 
  ( n1764 ) ? SBUF_8d : 
  ( n1766 ) ? SBUF_8e : 
  ( n1768 ) ? SBUF_8f : 
  ( n1806 ) ? SBUF_c5 : 
  ( n1827 ) ? SBUF_d0 : 
  ( n1833 ) ? SBUF_d5 : 
  ( n1869 ) ? SBUF_f5 : 
  ( SBUF );
assign PSW_next = 
  ( n1606 ) ? PSW_05 : 
  ( n1895 ) ? PSW_0d : 
  ( n1608 ) ? PSW_10 : 
  ( n1610 ) ? PSW_13 : 
  ( n1614 ) ? PSW_15 : 
  ( n1618 ) ? PSW_24 : 
  ( n1620 ) ? PSW_25 : 
  ( n1622 ) ? PSW_26 : 
  ( n1624 ) ? PSW_27 : 
  ( n1626 ) ? PSW_28 : 
  ( n1628 ) ? PSW_29 : 
  ( n1630 ) ? PSW_2a : 
  ( n1632 ) ? PSW_2b : 
  ( n1634 ) ? PSW_2c : 
  ( n1636 ) ? PSW_2d : 
  ( n1638 ) ? PSW_2e : 
  ( n1640 ) ? PSW_2f : 
  ( n1642 ) ? PSW_33 : 
  ( n1644 ) ? PSW_34 : 
  ( n1646 ) ? PSW_35 : 
  ( n1648 ) ? PSW_36 : 
  ( n1650 ) ? PSW_37 : 
  ( n1652 ) ? PSW_38 : 
  ( n1654 ) ? PSW_39 : 
  ( n1656 ) ? PSW_3a : 
  ( n1658 ) ? PSW_3b : 
  ( n1660 ) ? PSW_3c : 
  ( n1662 ) ? PSW_3d : 
  ( n1664 ) ? PSW_3e : 
  ( n1666 ) ? PSW_3f : 
  ( n1865 ) ? PSW_42 : 
  ( n1668 ) ? PSW_43 : 
  ( n1674 ) ? PSW_46 : 
  ( n1867 ) ? PSW_52 : 
  ( n1694 ) ? PSW_53 : 
  ( n1720 ) ? PSW_62 : 
  ( n1722 ) ? PSW_63 : 
  ( n1726 ) ? PSW_65 : 
  ( n1952 ) ? PSW_72 : 
  ( n1750 ) ? PSW_75 : 
  ( n1977 ) ? PSW_82 : 
  ( n1753 ) ? PSW_84 : 
  ( n1755 ) ? PSW_85 : 
  ( n1757 ) ? PSW_86 : 
  ( n1758 ) ? PSW_87 : 
  ( n1759 ) ? PSW_88 : 
  ( n1760 ) ? PSW_89 : 
  ( n1761 ) ? PSW_8a : 
  ( n1762 ) ? PSW_8b : 
  ( n1763 ) ? PSW_8c : 
  ( n1764 ) ? PSW_8d : 
  ( n1766 ) ? PSW_8e : 
  ( n1768 ) ? PSW_8f : 
  ( n1770 ) ? PSW_92 : 
  ( n1774 ) ? PSW_94 : 
  ( n1776 ) ? PSW_95 : 
  ( n1778 ) ? PSW_96 : 
  ( n1780 ) ? PSW_97 : 
  ( n1781 ) ? PSW_98 : 
  ( n1782 ) ? PSW_99 : 
  ( n1784 ) ? PSW_9a : 
  ( n1786 ) ? PSW_9b : 
  ( n1788 ) ? PSW_9c : 
  ( n1790 ) ? PSW_9d : 
  ( n1792 ) ? PSW_9e : 
  ( n1794 ) ? PSW_9f : 
  ( n1980 ) ? PSW_a0 : 
  ( n1984 ) ? PSW_a2 : 
  ( n1796 ) ? PSW_a4 : 
  ( n2006 ) ? PSW_b0 : 
  ( n1798 ) ? PSW_b2 : 
  ( n2010 ) ? PSW_b3 : 
  ( n2012 ) ? PSW_b4 : 
  ( n2014 ) ? PSW_b5 : 
  ( n2016 ) ? PSW_b6 : 
  ( n1874 ) ? PSW_b7 : 
  ( n2017 ) ? PSW_b8 : 
  ( n2019 ) ? PSW_b9 : 
  ( n2021 ) ? PSW_ba : 
  ( n2023 ) ? PSW_bb : 
  ( n2025 ) ? PSW_bc : 
  ( n1800 ) ? PSW_bd : 
  ( n2027 ) ? PSW_be : 
  ( n2029 ) ? PSW_bf : 
  ( n2031 ) ? PSW_c0 : 
  ( n1802 ) ? PSW_c2 : 
  ( n2035 ) ? PSW_c3 : 
  ( n1806 ) ? PSW_c5 : 
  ( n1824 ) ? PSW_ce : 
  ( n1827 ) ? PSW_d0 : 
  ( n1829 ) ? PSW_d2 : 
  ( n1876 ) ? PSW_d3 : 
  ( n1831 ) ? PSW_d4 : 
  ( n1833 ) ? PSW_d5 : 
  ( n1869 ) ? PSW_f5 : 
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
      if ( n1606 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0086;
        end
      end
      if ( n1881 ) begin
        IRAM[n0111] <= n0113;
      end
      if ( n1883 ) begin
        IRAM[n0116] <= n0118;
      end
      if ( n1885 ) begin
        IRAM[n0110] <= n0119;
      end
      if ( n1887 ) begin
        IRAM[n0115] <= n0120;
      end
      if ( n1889 ) begin
        IRAM[n0124] <= n0126;
      end
      if ( n1891 ) begin
        IRAM[n0128] <= n0130;
      end
      if ( n1893 ) begin
        IRAM[n0132] <= n0134;
      end
      if ( n1895 ) begin
        IRAM[n0136] <= n0138;
      end
      if ( n1897 ) begin
        IRAM[n0146] <= n0148;
      end
      if ( n1899 ) begin
        IRAM[n0150] <= n0152;
      end
      if ( n1608 ) begin
        if(n0167) begin
          IRAM[n0160] <= n0194;
        end
      end
      if ( n1901 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1903 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0221;
        IRAM[n0217] <= n0222;
      end
      if ( n1614 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0229;
        end
      end
      if ( n1905 ) begin
        IRAM[n0111] <= n0251;
      end
      if ( n1907 ) begin
        IRAM[n0116] <= n0252;
      end
      if ( n1909 ) begin
        IRAM[n0110] <= n0253;
      end
      if ( n1911 ) begin
        IRAM[n0115] <= n0254;
      end
      if ( n1913 ) begin
        IRAM[n0124] <= n0255;
      end
      if ( n1915 ) begin
        IRAM[n0128] <= n0256;
      end
      if ( n1917 ) begin
        IRAM[n0132] <= n0257;
      end
      if ( n1919 ) begin
        IRAM[n0136] <= n0258;
      end
      if ( n1921 ) begin
        IRAM[n0146] <= n0259;
      end
      if ( n1923 ) begin
        IRAM[n0150] <= n0260;
      end
      if ( n1932 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1865 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0759;
        end
      end
      if ( n1668 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0780;
        end
      end
      if ( n1942 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1867 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0817;
        end
      end
      if ( n1694 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0838;
        end
      end
      if ( n1720 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0876;
        end
      end
      if ( n1722 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0897;
        end
      end
      if ( n1950 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1750 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0006;
        end
      end
      if ( n1956 ) begin
        IRAM[n0111] <= n0007;
      end
      if ( n1958 ) begin
        IRAM[n0116] <= n0007;
      end
      if ( n1960 ) begin
        IRAM[n0110] <= n0007;
      end
      if ( n1962 ) begin
        IRAM[n0115] <= n0007;
      end
      if ( n1964 ) begin
        IRAM[n0124] <= n0007;
      end
      if ( n1966 ) begin
        IRAM[n0128] <= n0007;
      end
      if ( n1968 ) begin
        IRAM[n0132] <= n0007;
      end
      if ( n1970 ) begin
        IRAM[n0136] <= n0007;
      end
      if ( n1972 ) begin
        IRAM[n0146] <= n0007;
      end
      if ( n1974 ) begin
        IRAM[n0150] <= n0007;
      end
      if ( n1755 ) begin
        if(n0295) begin
          IRAM[n0006] <= n0085;
        end
      end
      if ( n1757 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0112;
        end
      end
      if ( n1758 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0117;
        end
      end
      if ( n1759 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0111;
        end
      end
      if ( n1760 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0116;
        end
      end
      if ( n1761 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0125;
        end
      end
      if ( n1762 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0129;
        end
      end
      if ( n1763 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0133;
        end
      end
      if ( n1764 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0137;
        end
      end
      if ( n1766 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0147;
        end
      end
      if ( n1768 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0151;
        end
      end
      if ( n1979 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1770 ) begin
        if(n0167) begin
          IRAM[n0160] <= n1208;
        end
      end
      if ( n1988 ) begin
        IRAM[n0111] <= n0085;
      end
      if ( n1990 ) begin
        IRAM[n0116] <= n0085;
      end
      if ( n1991 ) begin
        IRAM[n0110] <= n0085;
      end
      if ( n1993 ) begin
        IRAM[n0115] <= n0085;
      end
      if ( n1995 ) begin
        IRAM[n0124] <= n0085;
      end
      if ( n1997 ) begin
        IRAM[n0128] <= n0085;
      end
      if ( n1999 ) begin
        IRAM[n0132] <= n0085;
      end
      if ( n2001 ) begin
        IRAM[n0136] <= n0085;
      end
      if ( n2003 ) begin
        IRAM[n0146] <= n0085;
      end
      if ( n2005 ) begin
        IRAM[n0150] <= n0085;
      end
      if ( n2008 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1798 ) begin
        if(n0167) begin
          IRAM[n0160] <= n1398;
        end
      end
      if ( n2031 ) begin
        IRAM[n0215] <= n0085;
      end
      if ( n1802 ) begin
        if(n0167) begin
          IRAM[n0160] <= n0194;
        end
      end
      if ( n1806 ) begin
        if(n0021) begin
          IRAM[n0007] <= ACC;
        end
      end
      if ( n1808 ) begin
        IRAM[n0111] <= ACC;
      end
      if ( n1810 ) begin
        IRAM[n0116] <= ACC;
      end
      if ( n1812 ) begin
        IRAM[n0110] <= ACC;
      end
      if ( n1814 ) begin
        IRAM[n0115] <= ACC;
      end
      if ( n1816 ) begin
        IRAM[n0124] <= ACC;
      end
      if ( n1818 ) begin
        IRAM[n0128] <= ACC;
      end
      if ( n1820 ) begin
        IRAM[n0132] <= ACC;
      end
      if ( n1822 ) begin
        IRAM[n0136] <= ACC;
      end
      if ( n1824 ) begin
        IRAM[n0146] <= ACC;
      end
      if ( n1826 ) begin
        IRAM[n0150] <= ACC;
      end
      if ( n1827 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0261;
        end
      end
      if ( n2037 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1829 ) begin
        if(n0167) begin
          IRAM[n0160] <= n1531;
        end
      end
      if ( n1833 ) begin
        if(n0021) begin
          IRAM[n0007] <= n0229;
        end
      end
      if ( n1835 ) begin
        IRAM[n0111] <= n1570;
      end
      if ( n1837 ) begin
        IRAM[n0116] <= n1573;
      end
      if ( n2039 ) begin
        IRAM[n0110] <= n0253;
      end
      if ( n2041 ) begin
        IRAM[n0115] <= n0254;
      end
      if ( n2043 ) begin
        IRAM[n0124] <= n0255;
      end
      if ( n2045 ) begin
        IRAM[n0128] <= n0256;
      end
      if ( n2047 ) begin
        IRAM[n0132] <= n0257;
      end
      if ( n2049 ) begin
        IRAM[n0136] <= n0258;
      end
      if ( n2051 ) begin
        IRAM[n0146] <= n0259;
      end
      if ( n2053 ) begin
        IRAM[n0150] <= n0260;
      end
      if ( n2057 ) begin
        if (((n0215) != (n0217))) IRAM[n0215] <= n0216;
        IRAM[n0217] <= n0218;
      end
      if ( n1869 ) begin
        if(n0021) begin
          IRAM[n0007] <= ACC;
        end
      end
      if ( n2059 ) begin
        IRAM[n0111] <= ACC;
      end
      if ( n2061 ) begin
        IRAM[n0116] <= ACC;
      end
      if ( n2063 ) begin
        IRAM[n0110] <= ACC;
      end
      if ( n2065 ) begin
        IRAM[n0115] <= ACC;
      end
      if ( n2067 ) begin
        IRAM[n0124] <= ACC;
      end
      if ( n2069 ) begin
        IRAM[n0128] <= ACC;
      end
      if ( n2071 ) begin
        IRAM[n0132] <= ACC;
      end
      if ( n2073 ) begin
        IRAM[n0136] <= ACC;
      end
      if ( n2075 ) begin
        IRAM[n0146] <= ACC;
      end
      if ( n2076 ) begin
        IRAM[n0150] <= ACC;
      end
    end
  end
end

endmodule
