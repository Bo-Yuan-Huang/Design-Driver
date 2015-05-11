module oc8051_golden_model(
  clk,
  rst,
  step,
  RD_ROM_0_ADDR,
  RD_ROM_1_ADDR,
  RD_ROM_2_ADDR,
  ACC,
  ACC_next,
  P2,
  P2_next,
  P0,
  P0_next,
  P1,
  P1_next,
  XRAM_ADDR,
  XRAM_ADDR_next,
  P3,
  P3_next,
  SP,
  SP_next,
  PC,
  PC_next,
  B,
  B_next,
  XRAM_DATA_OUT,
  XRAM_DATA_OUT_next,
  DPL,
  DPL_next,
  PSW,
  PSW_next,
  DPH,
  DPH_next,
  IRAM_full,
  SBUF,
  SBUF_next,
  SCON,
  SCON_next,
  PCON,
  PCON_next,
  TCON,
  TCON_next,
  TL0,
  TL0_next,
  TL1,
  TL1_next,
  TH0,
  TH0_next,
  TH1,
  TH1_next,
  TMOD,
  TMOD_next,
  IE,
  IE_next,
  IP,
  IP_next,
  XRAM_DATA_IN,
  P0IN,
  P1IN,
  P2IN,
  P3IN,
  RD_ROM_0,
  RD_ROM_1,
  RD_ROM_2,
  RD_IRAM_0_ABSTR_ADDR,
  RD_IRAM_1_ABSTR_ADDR,
  RD_ROM_1_ABSTR_ADDR,
  RD_ROM_2_ABSTR_ADDR,
  ACC_abstr,
  P2_abstr,
  P0_abstr,
  P1_abstr,
  XRAM_ADDR_abstr,
  P3_abstr,
  SP_abstr,
  PC_abstr,
  B_abstr,
  XRAM_DATA_OUT_abstr,
  DPL_abstr,
  PSW_abstr,
  DPH_abstr,
  WR_COND_ABSTR_IRAM_0,
  WR_ADDR_ABSTR_IRAM_0,
  WR_DATA_ABSTR_IRAM_0,
  WR_COND_ABSTR_IRAM_1,
  WR_ADDR_ABSTR_IRAM_1,
  WR_DATA_ABSTR_IRAM_1
);
output [15:0] RD_ROM_0_ADDR;
output [15:0] RD_ROM_1_ADDR;
output [15:0] RD_ROM_2_ADDR;
output [7:0] ACC;
output [7:0] ACC_next;
output [7:0] P2;
output [7:0] P2_next;
output [7:0] P0;
output [7:0] P0_next;
output [7:0] P1;
output [7:0] P1_next;
output [15:0] XRAM_ADDR;
output [15:0] XRAM_ADDR_next;
output [7:0] P3;
output [7:0] P3_next;
output [7:0] SP;
output [7:0] SP_next;
output [15:0] PC;
output [15:0] PC_next;
output [7:0] B;
output [7:0] B_next;
output [7:0] XRAM_DATA_OUT;
output [7:0] XRAM_DATA_OUT_next;
output [7:0] DPL;
output [7:0] DPL_next;
output [7:0] PSW;
output [7:0] PSW_next;
output [7:0] DPH;
output [7:0] DPH_next;
output [127:0] IRAM_full;
output [7:0] SBUF;
output [7:0] SBUF_next;
output [7:0] SCON;
output [7:0] SCON_next;
output [7:0] PCON;
output [7:0] PCON_next;
output [7:0] TCON;
output [7:0] TCON_next;
output [7:0] TL0;
output [7:0] TL0_next;
output [7:0] TL1;
output [7:0] TL1_next;
output [7:0] TH0;
output [7:0] TH0_next;
output [7:0] TH1;
output [7:0] TH1_next;
output [7:0] TMOD;
output [7:0] TMOD_next;
output [7:0] IE;
output [7:0] IE_next;
output [7:0] IP;
output [7:0] IP_next;

input clk, rst, step;
input [7:0] XRAM_DATA_IN;
input [7:0] P0IN;
input [7:0] P1IN;
input [7:0] P2IN;
input [7:0] P3IN;
input [7:0] RD_ROM_0;
input [7:0] RD_ROM_1;
input [7:0] RD_ROM_2;
input [7:0] RD_IRAM_0_ABSTR_ADDR;
input [7:0] RD_IRAM_1_ABSTR_ADDR;
input [15:0] RD_ROM_1_ABSTR_ADDR;
input [15:0] RD_ROM_2_ABSTR_ADDR;
input [7:0] ACC_abstr;
input [7:0] P2_abstr;
input [7:0] P0_abstr;
input [7:0] P1_abstr;
input [15:0] XRAM_ADDR_abstr;
input [7:0] P3_abstr;
input [7:0] SP_abstr;
input [15:0] PC_abstr;
input [7:0] B_abstr;
input [7:0] XRAM_DATA_OUT_abstr;
input [7:0] DPL_abstr;
input [7:0] PSW_abstr;
input [7:0] DPH_abstr;
input WR_COND_ABSTR_IRAM_0;
input [3:0] WR_ADDR_ABSTR_IRAM_0;
input [7:0] WR_DATA_ABSTR_IRAM_0;
input WR_COND_ABSTR_IRAM_1;
input [3:0] WR_ADDR_ABSTR_IRAM_1;
input [7:0] WR_DATA_ABSTR_IRAM_1;

reg [7:0] ACC;
reg [7:0] B;
reg [7:0] DPH;
reg [7:0] DPL;
reg [7:0] IE;
reg [7:0] IP;
reg [7:0] P0;
reg [7:0] P0INREG;
reg [7:0] P1;
reg [7:0] P1INREG;
reg [7:0] P2;
reg [7:0] P2INREG;
reg [7:0] P3;
reg [7:0] P3INREG;
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
reg [15:0] XRAM_ADDR;
reg [7:0] XRAM_DATA_OUT;

wire [7:0] ACC_a5;
wire [7:0] ACC_next;
wire [7:0] B_a5;
wire [7:0] B_next;
wire [7:0] DPH_a5;
wire [7:0] DPH_next;
wire [7:0] DPL_a5;
wire [7:0] DPL_next;
wire [7:0] IE_next;
wire [7:0] IP_next;
wire [7:0] P0_a5;
wire [7:0] P0_next;
wire [7:0] P1_a5;
wire [7:0] P1_next;
wire [7:0] P2_a5;
wire [7:0] P2_next;
wire [7:0] P3_a5;
wire [7:0] P3_next;
wire [7:0] PCON_next;
wire [15:0] PC_a5;
wire [15:0] PC_next;
wire [7:0] PSW_a5;
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
wire [7:0] SBUF_next;
wire [7:0] SCON_next;
wire [7:0] SP_a5;
wire [7:0] SP_next;
wire [7:0] TCON_next;
wire [7:0] TH0_next;
wire [7:0] TH1_next;
wire [7:0] TL0_next;
wire [7:0] TL1_next;
wire [7:0] TMOD_next;
wire [3:0] WR_ADDR_0_IRAM;
wire [3:0] WR_ADDR_1_IRAM;
wire WR_COND_0_IRAM;
wire WR_COND_1_IRAM;
wire [7:0] WR_DATA_0_IRAM;
wire [7:0] WR_DATA_1_IRAM;
wire [15:0] XRAM_ADDR_a5;
wire [15:0] XRAM_ADDR_next;
wire [7:0] XRAM_DATA_OUT_a5;
wire [7:0] XRAM_DATA_OUT_next;
wire [3:0] n0001;
wire [7:0] n0002;
wire [3:0] n0003;
wire [7:0] n0004;
wire [0:0] n0005;
wire [0:0] n0006;
wire n0007;
wire [3:0] n0008;
wire [7:0] n0009;
wire n0010;
wire [7:0] n0011;
wire n0012;
wire [7:0] n0013;
wire n0014;
wire [7:0] n0015;
wire n0016;
wire [7:0] n0017;
wire n0018;
wire [7:0] n0019;
wire n0020;
wire [7:0] n0021;
wire n0022;
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
wire [7:0] n0052;
wire [7:0] n0053;
wire [7:0] n0054;
wire [7:0] n0055;
wire [7:0] n0056;
wire [7:0] n0057;
wire [7:0] n0058;
wire [7:0] n0059;
wire [7:0] n0060;
wire [7:0] n0061;
wire [7:0] n0062;
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
wire [3:0] n0076;
wire [7:0] n0077;
wire [2:0] n0078;
wire [1:0] n0079;
wire [7:0] n0080;
wire [3:0] n0081;
wire [7:0] n0082;
wire [2:0] n0083;
wire [7:0] n0084;
wire [3:0] n0085;
wire [2:0] n0086;
wire [7:0] n0087;
wire [3:0] n0088;
wire [2:0] n0089;
wire [7:0] n0090;
wire [3:0] n0091;
wire [2:0] n0092;
wire [7:0] n0093;
wire [3:0] n0094;
wire [2:0] n0095;
wire [7:0] n0096;
wire [3:0] n0097;
wire [2:0] n0098;
wire [7:0] n0099;
wire [3:0] n0100;
wire [2:0] n0101;
wire [7:0] n0102;
wire [3:0] n0103;
wire [0:0] n0104;
wire n0105;
wire [4:0] n0106;
wire [7:0] n0107;
wire [7:0] n0108;
wire [7:0] n0109;
wire [7:0] n0110;
wire [7:0] n0111;
wire [0:0] n0112;
wire n0113;
wire [3:0] n0114;
wire [2:0] n0115;
wire [7:0] n0116;
wire [7:0] n0117;
wire [7:0] n0118;
wire n0119;
wire n0120;
wire n0121;
wire n0122;
wire n0123;
wire n0124;
wire n0125;
wire n0126;
wire n0127;
wire n0128;
wire n0129;
wire [7:0] n0130;
wire [7:0] n0131;
wire [7:0] n0132;
wire [7:0] n0133;
wire [7:0] n0134;
wire [7:0] n0135;
wire [7:0] n0136;
wire [7:0] n0137;
wire [7:0] n0138;
wire [7:0] n0139;
wire [7:0] n0140;
wire [7:0] n0141;
wire [7:0] n0142;
wire [7:0] n0143;
wire [7:0] n0144;
wire [7:0] n0145;
wire [7:0] n0146;
wire [3:0] n0147;
wire [15:0] n0148;
wire [15:0] n0149;
wire [7:0] n0150;
wire [7:0] n0151;
wire [3:0] n0152;
wire [7:0] n0153;
wire [15:0] n0154;
wire [15:0] n0155;
wire [7:0] n0156;
wire [7:0] n0157;
wire [7:0] n0158;
wire [7:0] n0159;
wire [7:0] n0160;
wire [7:0] n0161;
wire [7:0] n0162;
wire [7:0] n0163;
wire [7:0] n0164;
wire [7:0] n0165;
wire [7:0] n0166;
wire [0:0] n0167;
wire n0168;
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
wire n0179;
wire n0180;
wire n0181;
wire n0182;
wire n0183;
wire n0184;
wire n0185;
wire n0186;
wire n0187;
wire n0188;
wire n0189;
wire [7:0] n0190;
wire [7:0] n0191;
wire [7:0] n0192;
wire [7:0] n0193;
wire [7:0] n0194;
wire [7:0] n0195;
wire [7:0] n0196;
wire [7:0] n0197;
wire [7:0] n0198;
wire [7:0] n0199;
wire [7:0] n0200;
wire [7:0] n0201;
wire [7:0] n0202;
wire [7:0] n0203;
wire [7:0] n0204;
wire [7:0] n0205;
wire [7:0] n0206;
wire [7:0] n0207;
wire [7:0] n0208;
wire [7:0] n0209;
wire [7:0] n0210;
wire [7:0] n0211;
wire [0:0] n0212;
wire [7:0] n0213;
wire [7:0] n0214;
wire [7:0] n0215;
wire [15:0] n0216;
wire [15:0] n0217;
wire [15:0] n0218;
wire [6:0] n0219;
wire [0:0] n0220;
wire [0:0] n0221;
wire [0:0] n0222;
wire [0:0] n0223;
wire [0:0] n0224;
wire [0:0] n0225;
wire [0:0] n0226;
wire [0:0] n0227;
wire [0:0] n0228;
wire [0:0] n0229;
wire [0:0] n0230;
wire [0:0] n0231;
wire [0:0] n0232;
wire [0:0] n0233;
wire [0:0] n0234;
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
wire [0:0] n0264;
wire [0:0] n0265;
wire [7:0] n0266;
wire [7:0] n0267;
wire [7:0] n0268;
wire [7:0] n0269;
wire [7:0] n0270;
wire [7:0] n0271;
wire [7:0] n0272;
wire [3:0] n0273;
wire [3:0] n0274;
wire [7:0] n0275;
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
wire n0372;
wire n0373;
wire n0374;
wire n0375;
wire n0376;
wire n0377;
wire n0378;
wire [7:0] n0379;
wire n0380;
wire [7:0] n0381;
wire n0382;
wire [7:0] n0383;
wire n0384;
wire [7:0] n0385;
wire n0386;
wire [7:0] n0387;
wire n0388;
wire [7:0] n0389;
wire n0390;
wire n0391;
wire [7:0] n0392;
wire n0393;
wire [7:0] n0394;
wire n0395;
wire [7:0] n0396;
wire n0397;
wire [7:0] n0398;
wire n0399;
wire [7:0] n0400;
wire n0401;
wire [7:0] n0402;
wire n0403;
wire [7:0] n0404;
wire n0405;
wire [7:0] n0406;
wire n0407;
wire [7:0] n0408;
wire n0409;
wire [7:0] n0410;
wire n0411;
wire [7:0] n0412;
wire n0413;
wire [7:0] n0414;
wire n0415;
wire [7:0] n0416;
wire n0417;
wire [7:0] n0418;
wire n0419;
wire [7:0] n0420;
wire n0421;
wire [7:0] n0422;
wire n0423;
wire [7:0] n0424;
wire n0425;
wire [7:0] n0426;
wire n0427;
wire [7:0] n0428;
wire n0429;
wire [7:0] n0430;
wire n0431;
wire [7:0] n0432;
wire n0433;
wire [7:0] n0434;
wire n0435;
wire n0436;
wire [7:0] n0437;
wire n0438;
wire [7:0] n0439;
wire n0440;
wire [7:0] n0441;
wire n0442;
wire [7:0] n0443;
wire n0444;
wire [7:0] n0445;
wire n0446;
wire [7:0] n0447;
wire n0448;
wire [7:0] n0449;
wire n0450;
wire [7:0] n0451;
wire n0452;
wire [7:0] n0453;
wire n0454;
wire [7:0] n0455;
wire n0456;
wire [7:0] n0457;
wire n0458;
wire [7:0] n0459;
wire n0460;
wire [7:0] n0461;
wire n0462;
wire [7:0] n0463;
wire n0464;
wire [7:0] n0465;
wire n0466;
wire [7:0] n0467;
wire n0468;
wire [7:0] n0469;
wire n0470;
wire [7:0] n0471;
wire n0472;
wire [7:0] n0473;
wire n0474;
wire [7:0] n0475;
wire n0476;
wire [7:0] n0477;
wire n0478;
wire [7:0] n0479;
wire n0480;
wire [7:0] n0481;
wire n0482;
wire [7:0] n0483;
wire n0484;
wire [7:0] n0485;
wire n0486;

reg [7:0] IRAM[15:0];

// port: IRAM->RD_IRAM_0
// port: IRAM->RD_IRAM_1
// port: ROM->RD_ROM_0
// port: ROM->RD_ROM_1
// port: ROM->RD_ROM_2
// RD_IRAM_0_ADDR=RD_IRAM_0_ABSTR_ADDR
assign RD_IRAM_0_ADDR = RD_IRAM_0_ABSTR_ADDR;
assign n0001 = RD_IRAM_0_ABSTR_ADDR[3:0];
assign n0002 = IRAM[n0001];
assign RD_IRAM_0 = n0002;
// RD_IRAM_1_ADDR=RD_IRAM_1_ABSTR_ADDR
assign RD_IRAM_1_ADDR = RD_IRAM_1_ABSTR_ADDR;
assign n0003 = RD_IRAM_1_ABSTR_ADDR[3:0];
assign n0004 = IRAM[n0003];
assign RD_IRAM_1 = n0004;
// RD_ROM_0_ADDR=PC
assign RD_ROM_0_ADDR = PC;
// RD_ROM_1_ADDR=RD_ROM_1_ABSTR_ADDR
assign RD_ROM_1_ADDR = RD_ROM_1_ABSTR_ADDR;
// RD_ROM_2_ADDR=RD_ROM_2_ABSTR_ADDR
assign RD_ROM_2_ADDR = RD_ROM_2_ABSTR_ADDR;
// 
// ACC_00
// 
// 
// B_00
// 
// 
// DPL_00
// 
// 
// DPH_00
// 
// 
// XRAM_ADDR_00
// 
// 
// PC_00
// 
// 
// P2_00
// 
// 
// P3_00
// 
// 
// P0_00
// 
// 
// P1_00
// 
// 
// XRAM_DATA_OUT_00
// 
// 
// SP_00
// 
// 
// PSW_00
// 
// 
// ACC_01
// 
// 
// B_01
// 
// 
// DPL_01
// 
// 
// DPH_01
// 
// 
// XRAM_ADDR_01
// 
// 
// PC_01
// 
// 
// P2_01
// 
// 
// P3_01
// 
// 
// P0_01
// 
// 
// P1_01
// 
// 
// XRAM_DATA_OUT_01
// 
// 
// SP_01
// 
// 
// PSW_01
// 
// 
// ACC_02
// 
// 
// B_02
// 
// 
// DPL_02
// 
// 
// DPH_02
// 
// 
// XRAM_ADDR_02
// 
// 
// PC_02
// 
// 
// P2_02
// 
// 
// P3_02
// 
// 
// P0_02
// 
// 
// P1_02
// 
// 
// XRAM_DATA_OUT_02
// 
// 
// SP_02
// 
// 
// PSW_02
// 
// 
// ACC_03
// 
// 
// P1_03
// 
// 
// DPL_03
// 
// 
// DPH_03
// 
// 
// XRAM_ADDR_03
// 
// 
// PC_03
// 
// 
// P2_03
// 
// 
// P3_03
// 
// 
// P0_03
// 
// 
// B_03
// 
// 
// XRAM_DATA_OUT_03
// 
// 
// SP_03
// 
// 
// PSW_03
// 
// 
// ACC_04
// 
// 
// B_04
// 
// 
// DPL_04
// 
// 
// DPH_04
// 
// 
// XRAM_ADDR_04
// 
// 
// PC_04
// 
// 
// P2_04
// 
// 
// P3_04
// 
// 
// P0_04
// 
// 
// P1_04
// 
// 
// XRAM_DATA_OUT_04
// 
// 
// SP_04
// 
// 
// PSW_04
// 
// 
// ACC_05
// 
// 
// B_05
// 
// 
// DPL_05
// 
// 
// DPH_05
// 
// 
// XRAM_ADDR_05
// 
// 
// PC_05
// 
// 
// P2_05
// 
// 
// P3_05
// 
// 
// P0_05
// 
// 
// P1_05
// 
// 
// IRAM_05
// 
assign n0005 = RD_ROM_1[7:7];
assign n0006 = 1'h0;
assign n0007 = ( n0005 == n0006 );
assign n0008 = RD_ROM_1[3:0];
assign n0009 = 8'h80;
assign n0010 = ( RD_ROM_1 == n0009 );
assign n0011 = 8'h81;
assign n0012 = ( RD_ROM_1 == n0011 );
assign n0013 = 8'h82;
assign n0014 = ( RD_ROM_1 == n0013 );
assign n0015 = 8'h83;
assign n0016 = ( RD_ROM_1 == n0015 );
assign n0017 = 8'h87;
assign n0018 = ( RD_ROM_1 == n0017 );
assign n0019 = 8'h88;
assign n0020 = ( RD_ROM_1 == n0019 );
assign n0021 = 8'h89;
assign n0022 = ( RD_ROM_1 == n0021 );
assign n0023 = 8'h8a;
assign n0024 = ( RD_ROM_1 == n0023 );
assign n0025 = 8'h8c;
assign n0026 = ( RD_ROM_1 == n0025 );
assign n0027 = 8'h8b;
assign n0028 = ( RD_ROM_1 == n0027 );
assign n0029 = 8'h8d;
assign n0030 = ( RD_ROM_1 == n0029 );
assign n0031 = 8'h90;
assign n0032 = ( RD_ROM_1 == n0031 );
assign n0033 = 8'h98;
assign n0034 = ( RD_ROM_1 == n0033 );
assign n0035 = 8'h99;
assign n0036 = ( RD_ROM_1 == n0035 );
assign n0037 = 8'ha0;
assign n0038 = ( RD_ROM_1 == n0037 );
assign n0039 = 8'ha8;
assign n0040 = ( RD_ROM_1 == n0039 );
assign n0041 = 8'hb0;
assign n0042 = ( RD_ROM_1 == n0041 );
assign n0043 = 8'hb8;
assign n0044 = ( RD_ROM_1 == n0043 );
assign n0045 = 8'hd0;
assign n0046 = ( RD_ROM_1 == n0045 );
assign n0047 = 8'he0;
assign n0048 = ( RD_ROM_1 == n0047 );
assign n0049 = 8'hf0;
assign n0050 = ( RD_ROM_1 == n0049 );
assign n0051 = 8'h0;
assign n0052 = ( n0050 ) ? ( B ) : ( n0051 );
assign n0053 = ( n0048 ) ? ( ACC ) : ( n0052 );
assign n0054 = ( n0046 ) ? ( PSW ) : ( n0053 );
assign n0055 = ( n0044 ) ? ( IP ) : ( n0054 );
assign n0056 = ( n0042 ) ? ( P3 ) : ( n0055 );
assign n0057 = ( n0040 ) ? ( IE ) : ( n0056 );
assign n0058 = ( n0038 ) ? ( P2 ) : ( n0057 );
assign n0059 = ( n0036 ) ? ( SBUF ) : ( n0058 );
assign n0060 = ( n0034 ) ? ( SCON ) : ( n0059 );
assign n0061 = ( n0032 ) ? ( P1 ) : ( n0060 );
assign n0062 = ( n0030 ) ? ( TH1 ) : ( n0061 );
assign n0063 = ( n0028 ) ? ( TL1 ) : ( n0062 );
assign n0064 = ( n0026 ) ? ( TH0 ) : ( n0063 );
assign n0065 = ( n0024 ) ? ( TL0 ) : ( n0064 );
assign n0066 = ( n0022 ) ? ( TMOD ) : ( n0065 );
assign n0067 = ( n0020 ) ? ( TCON ) : ( n0066 );
assign n0068 = ( n0018 ) ? ( PCON ) : ( n0067 );
assign n0069 = ( n0016 ) ? ( DPH ) : ( n0068 );
assign n0070 = ( n0014 ) ? ( DPL ) : ( n0069 );
assign n0071 = ( n0012 ) ? ( SP ) : ( n0070 );
assign n0072 = ( n0010 ) ? ( P0 ) : ( n0071 );
assign n0073 = ( n0007 ) ? ( RD_IRAM_0 ) : ( n0072 );
assign n0074 = 8'h1;
assign n0075 = ( n0073 + n0074 );
// 
// XRAM_DATA_OUT_05
// 
// 
// SP_05
// 
// 
// PSW_05
// 
// 
// ACC_06
// 
// 
// B_06
// 
// 
// DPL_06
// 
// 
// DPH_06
// 
// 
// XRAM_ADDR_06
// 
// 
// PC_06
// 
// 
// P2_06
// 
// 
// P3_06
// 
// 
// P0_06
// 
// 
// P1_06
// 
// 
// IRAM_06
// 
assign n0076 = RD_IRAM_0[3:0];
assign n0077 = ( RD_IRAM_1 + n0074 );
// 
// XRAM_DATA_OUT_06
// 
// 
// SP_06
// 
// 
// PSW_06
// 
// 
// ACC_07
// 
// 
// B_07
// 
// 
// DPL_07
// 
// 
// DPH_07
// 
// 
// XRAM_ADDR_07
// 
// 
// PC_07
// 
// 
// P2_07
// 
// 
// P3_07
// 
// 
// P0_07
// 
// 
// P1_07
// 
// 
// IRAM_07
// 
// 
// XRAM_DATA_OUT_07
// 
// 
// SP_07
// 
// 
// PSW_07
// 
// 
// ACC_08
// 
// 
// P1_08
// 
// 
// DPL_08
// 
// 
// DPH_08
// 
// 
// XRAM_ADDR_08
// 
// 
// PC_08
// 
// 
// P2_08
// 
// 
// P3_08
// 
// 
// P0_08
// 
// 
// B_08
// 
// 
// IRAM_08
// 
assign n0078 = 3'h0;
assign n0079 = PSW[4:3];
assign n0080 = { ( n0078 ), ( n0079 ), ( n0078 ) };
assign n0081 = n0080[3:0];
assign n0082 = ( RD_IRAM_0 + n0074 );
// 
// XRAM_DATA_OUT_08
// 
// 
// SP_08
// 
// 
// PSW_08
// 
// 
// ACC_09
// 
// 
// B_09
// 
// 
// DPL_09
// 
// 
// DPH_09
// 
// 
// XRAM_ADDR_09
// 
// 
// PC_09
// 
// 
// P2_09
// 
// 
// P3_09
// 
// 
// P0_09
// 
// 
// P1_09
// 
// 
// IRAM_09
// 
assign n0083 = 3'h1;
assign n0084 = { ( n0078 ), ( n0079 ), ( n0083 ) };
assign n0085 = n0084[3:0];
// 
// XRAM_DATA_OUT_09
// 
// 
// SP_09
// 
// 
// PSW_09
// 
// 
// ACC_0a
// 
// 
// B_0a
// 
// 
// DPL_0a
// 
// 
// DPH_0a
// 
// 
// XRAM_ADDR_0a
// 
// 
// PC_0a
// 
// 
// P2_0a
// 
// 
// P3_0a
// 
// 
// P0_0a
// 
// 
// P1_0a
// 
// 
// IRAM_0a
// 
assign n0086 = 3'h2;
assign n0087 = { ( n0078 ), ( n0079 ), ( n0086 ) };
assign n0088 = n0087[3:0];
// 
// XRAM_DATA_OUT_0a
// 
// 
// SP_0a
// 
// 
// PSW_0a
// 
// 
// ACC_0b
// 
// 
// P1_0b
// 
// 
// DPL_0b
// 
// 
// DPH_0b
// 
// 
// XRAM_ADDR_0b
// 
// 
// PC_0b
// 
// 
// P2_0b
// 
// 
// P3_0b
// 
// 
// P0_0b
// 
// 
// B_0b
// 
// 
// IRAM_0b
// 
assign n0089 = 3'h3;
assign n0090 = { ( n0078 ), ( n0079 ), ( n0089 ) };
assign n0091 = n0090[3:0];
// 
// XRAM_DATA_OUT_0b
// 
// 
// SP_0b
// 
// 
// PSW_0b
// 
// 
// ACC_0c
// 
// 
// P1_0c
// 
// 
// DPL_0c
// 
// 
// DPH_0c
// 
// 
// XRAM_ADDR_0c
// 
// 
// PC_0c
// 
// 
// P2_0c
// 
// 
// P3_0c
// 
// 
// P0_0c
// 
// 
// B_0c
// 
// 
// IRAM_0c
// 
assign n0092 = 3'h4;
assign n0093 = { ( n0078 ), ( n0079 ), ( n0092 ) };
assign n0094 = n0093[3:0];
// 
// XRAM_DATA_OUT_0c
// 
// 
// SP_0c
// 
// 
// PSW_0c
// 
// 
// ACC_0d
// 
// 
// P1_0d
// 
// 
// DPL_0d
// 
// 
// DPH_0d
// 
// 
// XRAM_ADDR_0d
// 
// 
// PC_0d
// 
// 
// P2_0d
// 
// 
// P3_0d
// 
// 
// P0_0d
// 
// 
// B_0d
// 
// 
// IRAM_0d
// 
assign n0095 = 3'h5;
assign n0096 = { ( n0078 ), ( n0079 ), ( n0095 ) };
assign n0097 = n0096[3:0];
// 
// XRAM_DATA_OUT_0d
// 
// 
// SP_0d
// 
// 
// PSW_0d
// 
// 
// ACC_0e
// 
// 
// P1_0e
// 
// 
// DPL_0e
// 
// 
// DPH_0e
// 
// 
// XRAM_ADDR_0e
// 
// 
// PC_0e
// 
// 
// P2_0e
// 
// 
// P3_0e
// 
// 
// P0_0e
// 
// 
// B_0e
// 
// 
// IRAM_0e
// 
assign n0098 = 3'h6;
assign n0099 = { ( n0078 ), ( n0079 ), ( n0098 ) };
assign n0100 = n0099[3:0];
// 
// XRAM_DATA_OUT_0e
// 
// 
// SP_0e
// 
// 
// PSW_0e
// 
// 
// ACC_0f
// 
// 
// B_0f
// 
// 
// DPL_0f
// 
// 
// DPH_0f
// 
// 
// XRAM_ADDR_0f
// 
// 
// PC_0f
// 
// 
// P2_0f
// 
// 
// P3_0f
// 
// 
// P0_0f
// 
// 
// P1_0f
// 
// 
// IRAM_0f
// 
assign n0101 = 3'h7;
assign n0102 = { ( n0078 ), ( n0079 ), ( n0101 ) };
assign n0103 = n0102[3:0];
// 
// XRAM_DATA_OUT_0f
// 
// 
// SP_0f
// 
// 
// PSW_0f
// 
// 
// ACC_10
// 
// 
// P1_10
// 
// 
// DPL_10
// 
// 
// DPH_10
// 
// 
// XRAM_ADDR_10
// 
// 
// PC_10
// 
// 
// P2_10
// 
// 
// P3_10
// 
// 
// P0_10
// 
// 
// B_10
// 
// 
// IRAM_10
// 
assign n0104 = 1'h1;
assign n0105 = ( n0005 == n0104 );
assign n0106 = RD_ROM_1[7:3];
assign n0107 = { ( n0106 ), ( n0078 ) };
assign n0108 = { 3'b0, n0106 };
assign n0109 = 8'h20;
assign n0110 = ( n0108 + n0109 );
assign n0111 = ( n0105 ) ? ( n0107 ) : ( n0110 );
assign n0112 = n0111[7:7];
assign n0113 = ( n0112 == n0006 );
assign n0114 = n0111[3:0];
assign n0115 = RD_ROM_1[2:0];
assign n0116 = { 5'b0, n0115 };
assign n0117 = ( n0074 << n0116 );
assign n0118 = ~( n0117 );
assign n0119 = ( n0111 == n0009 );
assign n0120 = ( n0111 == n0019 );
assign n0121 = ( n0111 == n0031 );
assign n0122 = ( n0111 == n0033 );
assign n0123 = ( n0111 == n0037 );
assign n0124 = ( n0111 == n0039 );
assign n0125 = ( n0111 == n0041 );
assign n0126 = ( n0111 == n0043 );
assign n0127 = ( n0111 == n0045 );
assign n0128 = ( n0111 == n0047 );
assign n0129 = ( n0111 == n0049 );
assign n0130 = ( n0129 ) ? ( B ) : ( n0051 );
assign n0131 = ( n0128 ) ? ( ACC ) : ( n0130 );
assign n0132 = ( n0127 ) ? ( PSW ) : ( n0131 );
assign n0133 = ( n0126 ) ? ( IP ) : ( n0132 );
assign n0134 = ( n0125 ) ? ( P3INREG ) : ( n0133 );
assign n0135 = ( n0124 ) ? ( IE ) : ( n0134 );
assign n0136 = ( n0123 ) ? ( P2INREG ) : ( n0135 );
assign n0137 = ( n0122 ) ? ( SCON ) : ( n0136 );
assign n0138 = ( n0121 ) ? ( P1INREG ) : ( n0137 );
assign n0139 = ( n0120 ) ? ( TCON ) : ( n0138 );
assign n0140 = ( n0119 ) ? ( P0INREG ) : ( n0139 );
assign n0141 = ( n0113 ) ? ( RD_IRAM_0 ) : ( n0140 );
assign n0142 = ( n0118 & n0141 );
assign n0143 = { 7'b0, n0006 };
assign n0144 = ( n0143 << n0116 );
assign n0145 = ( n0142 | n0144 );
// 
// XRAM_DATA_OUT_10
// 
// 
// SP_10
// 
// 
// PSW_10
// 
// 
// ACC_11
// 
// 
// B_11
// 
// 
// DPL_11
// 
// 
// DPH_11
// 
// 
// XRAM_ADDR_11
// 
// 
// PC_11
// 
// 
// P2_11
// 
// 
// P3_11
// 
// 
// P0_11
// 
// 
// P1_11
// 
// 
// IRAM_11
// 
assign n0146 = ( SP + n0074 );
assign n0147 = n0146[3:0];
assign n0148 = 16'h2;
assign n0149 = ( PC + n0148 );
assign n0150 = n0149[7:0];
assign n0151 = ( n0146 + n0074 );
assign n0152 = n0151[3:0];
assign n0153 = n0149[15:8];
// 
// XRAM_DATA_OUT_11
// 
// 
// SP_11
// 
// 
// PSW_11
// 
// 
// ACC_12
// 
// 
// P1_12
// 
// 
// DPL_12
// 
// 
// DPH_12
// 
// 
// XRAM_ADDR_12
// 
// 
// PC_12
// 
// 
// P2_12
// 
// 
// P3_12
// 
// 
// P0_12
// 
// 
// B_12
// 
// 
// IRAM_12
// 
assign n0154 = 16'h3;
assign n0155 = ( PC + n0154 );
assign n0156 = n0155[7:0];
assign n0157 = n0155[15:8];
// 
// XRAM_DATA_OUT_12
// 
// 
// SP_12
// 
// 
// PSW_12
// 
// 
// ACC_13
// 
// 
// B_13
// 
// 
// DPL_13
// 
// 
// DPH_13
// 
// 
// XRAM_ADDR_13
// 
// 
// PC_13
// 
// 
// P2_13
// 
// 
// P3_13
// 
// 
// P0_13
// 
// 
// P1_13
// 
// 
// XRAM_DATA_OUT_13
// 
// 
// SP_13
// 
// 
// PSW_13
// 
// 
// ACC_14
// 
// 
// B_14
// 
// 
// DPL_14
// 
// 
// DPH_14
// 
// 
// XRAM_ADDR_14
// 
// 
// PC_14
// 
// 
// P2_14
// 
// 
// P3_14
// 
// 
// P0_14
// 
// 
// P1_14
// 
// 
// XRAM_DATA_OUT_14
// 
// 
// SP_14
// 
// 
// PSW_14
// 
// 
// ACC_15
// 
// 
// P1_15
// 
// 
// DPL_15
// 
// 
// DPH_15
// 
// 
// XRAM_ADDR_15
// 
// 
// PC_15
// 
// 
// P2_15
// 
// 
// P3_15
// 
// 
// P0_15
// 
// 
// B_15
// 
// 
// IRAM_15
// 
assign n0158 = ( n0073 - n0074 );
// 
// XRAM_DATA_OUT_15
// 
// 
// SP_15
// 
// 
// PSW_15
// 
// 
// ACC_16
// 
// 
// B_16
// 
// 
// DPL_16
// 
// 
// DPH_16
// 
// 
// XRAM_ADDR_16
// 
// 
// PC_16
// 
// 
// P2_16
// 
// 
// P3_16
// 
// 
// P0_16
// 
// 
// P1_16
// 
// 
// IRAM_16
// 
assign n0159 = ( RD_IRAM_1 - n0074 );
// 
// XRAM_DATA_OUT_16
// 
// 
// SP_16
// 
// 
// PSW_16
// 
// 
// ACC_17
// 
// 
// B_17
// 
// 
// DPL_17
// 
// 
// DPH_17
// 
// 
// XRAM_ADDR_17
// 
// 
// PC_17
// 
// 
// P2_17
// 
// 
// P3_17
// 
// 
// P0_17
// 
// 
// P1_17
// 
// 
// IRAM_17
// 
// 
// XRAM_DATA_OUT_17
// 
// 
// SP_17
// 
// 
// PSW_17
// 
// 
// ACC_18
// 
// 
// B_18
// 
// 
// DPL_18
// 
// 
// DPH_18
// 
// 
// XRAM_ADDR_18
// 
// 
// PC_18
// 
// 
// P2_18
// 
// 
// P3_18
// 
// 
// P0_18
// 
// 
// P1_18
// 
// 
// IRAM_18
// 
assign n0160 = ( RD_IRAM_0 - n0074 );
// 
// XRAM_DATA_OUT_18
// 
// 
// SP_18
// 
// 
// PSW_18
// 
// 
// ACC_19
// 
// 
// P1_19
// 
// 
// DPL_19
// 
// 
// DPH_19
// 
// 
// XRAM_ADDR_19
// 
// 
// PC_19
// 
// 
// P2_19
// 
// 
// P3_19
// 
// 
// P0_19
// 
// 
// B_19
// 
// 
// IRAM_19
// 
// 
// XRAM_DATA_OUT_19
// 
// 
// SP_19
// 
// 
// PSW_19
// 
// 
// ACC_1a
// 
// 
// P1_1a
// 
// 
// DPL_1a
// 
// 
// DPH_1a
// 
// 
// XRAM_ADDR_1a
// 
// 
// PC_1a
// 
// 
// P2_1a
// 
// 
// P3_1a
// 
// 
// P0_1a
// 
// 
// B_1a
// 
// 
// IRAM_1a
// 
// 
// XRAM_DATA_OUT_1a
// 
// 
// SP_1a
// 
// 
// PSW_1a
// 
// 
// ACC_1b
// 
// 
// B_1b
// 
// 
// DPL_1b
// 
// 
// DPH_1b
// 
// 
// XRAM_ADDR_1b
// 
// 
// PC_1b
// 
// 
// P2_1b
// 
// 
// P3_1b
// 
// 
// P0_1b
// 
// 
// P1_1b
// 
// 
// IRAM_1b
// 
// 
// XRAM_DATA_OUT_1b
// 
// 
// SP_1b
// 
// 
// PSW_1b
// 
// 
// ACC_1c
// 
// 
// P1_1c
// 
// 
// DPL_1c
// 
// 
// DPH_1c
// 
// 
// XRAM_ADDR_1c
// 
// 
// PC_1c
// 
// 
// P2_1c
// 
// 
// P3_1c
// 
// 
// P0_1c
// 
// 
// B_1c
// 
// 
// IRAM_1c
// 
// 
// XRAM_DATA_OUT_1c
// 
// 
// SP_1c
// 
// 
// PSW_1c
// 
// 
// ACC_1d
// 
// 
// B_1d
// 
// 
// DPL_1d
// 
// 
// DPH_1d
// 
// 
// XRAM_ADDR_1d
// 
// 
// PC_1d
// 
// 
// P2_1d
// 
// 
// P3_1d
// 
// 
// P0_1d
// 
// 
// P1_1d
// 
// 
// IRAM_1d
// 
// 
// XRAM_DATA_OUT_1d
// 
// 
// SP_1d
// 
// 
// PSW_1d
// 
// 
// ACC_1e
// 
// 
// B_1e
// 
// 
// DPL_1e
// 
// 
// DPH_1e
// 
// 
// XRAM_ADDR_1e
// 
// 
// PC_1e
// 
// 
// P2_1e
// 
// 
// P3_1e
// 
// 
// P0_1e
// 
// 
// P1_1e
// 
// 
// IRAM_1e
// 
// 
// XRAM_DATA_OUT_1e
// 
// 
// SP_1e
// 
// 
// PSW_1e
// 
// 
// ACC_1f
// 
// 
// B_1f
// 
// 
// DPL_1f
// 
// 
// DPH_1f
// 
// 
// XRAM_ADDR_1f
// 
// 
// PC_1f
// 
// 
// P2_1f
// 
// 
// P3_1f
// 
// 
// P0_1f
// 
// 
// P1_1f
// 
// 
// IRAM_1f
// 
// 
// XRAM_DATA_OUT_1f
// 
// 
// SP_1f
// 
// 
// PSW_1f
// 
// 
// ACC_20
// 
// 
// P1_20
// 
// 
// DPL_20
// 
// 
// DPH_20
// 
// 
// XRAM_ADDR_20
// 
// 
// PC_20
// 
// 
// P2_20
// 
// 
// P3_20
// 
// 
// P0_20
// 
// 
// B_20
// 
// 
// XRAM_DATA_OUT_20
// 
// 
// SP_20
// 
// 
// PSW_20
// 
// 
// ACC_21
// 
// 
// B_21
// 
// 
// DPL_21
// 
// 
// DPH_21
// 
// 
// XRAM_ADDR_21
// 
// 
// PC_21
// 
// 
// P2_21
// 
// 
// P3_21
// 
// 
// P0_21
// 
// 
// P1_21
// 
// 
// XRAM_DATA_OUT_21
// 
// 
// SP_21
// 
// 
// PSW_21
// 
// 
// ACC_22
// 
// 
// P1_22
// 
// 
// DPL_22
// 
// 
// DPH_22
// 
// 
// XRAM_ADDR_22
// 
// 
// PC_22
// 
// 
// P2_22
// 
// 
// P3_22
// 
// 
// P0_22
// 
// 
// B_22
// 
// 
// XRAM_DATA_OUT_22
// 
// 
// SP_22
// 
// 
// PSW_22
// 
// 
// ACC_23
// 
// 
// P1_23
// 
// 
// DPL_23
// 
// 
// DPH_23
// 
// 
// XRAM_ADDR_23
// 
// 
// PC_23
// 
// 
// P2_23
// 
// 
// P3_23
// 
// 
// P0_23
// 
// 
// B_23
// 
// 
// XRAM_DATA_OUT_23
// 
// 
// SP_23
// 
// 
// PSW_23
// 
// 
// ACC_24
// 
// 
// P1_24
// 
// 
// DPL_24
// 
// 
// DPH_24
// 
// 
// XRAM_ADDR_24
// 
// 
// PC_24
// 
// 
// P2_24
// 
// 
// P3_24
// 
// 
// P0_24
// 
// 
// B_24
// 
// 
// XRAM_DATA_OUT_24
// 
// 
// SP_24
// 
// 
// PSW_24
// 
// 
// ACC_25
// 
// 
// B_25
// 
// 
// DPL_25
// 
// 
// DPH_25
// 
// 
// XRAM_ADDR_25
// 
// 
// PC_25
// 
// 
// P2_25
// 
// 
// P3_25
// 
// 
// P0_25
// 
// 
// P1_25
// 
// 
// XRAM_DATA_OUT_25
// 
// 
// SP_25
// 
// 
// PSW_25
// 
// 
// ACC_26
// 
// 
// B_26
// 
// 
// DPL_26
// 
// 
// DPH_26
// 
// 
// XRAM_ADDR_26
// 
// 
// PC_26
// 
// 
// P2_26
// 
// 
// P3_26
// 
// 
// P0_26
// 
// 
// P1_26
// 
// 
// XRAM_DATA_OUT_26
// 
// 
// SP_26
// 
// 
// PSW_26
// 
// 
// ACC_27
// 
// 
// B_27
// 
// 
// DPL_27
// 
// 
// DPH_27
// 
// 
// XRAM_ADDR_27
// 
// 
// PC_27
// 
// 
// P2_27
// 
// 
// P3_27
// 
// 
// P0_27
// 
// 
// P1_27
// 
// 
// XRAM_DATA_OUT_27
// 
// 
// SP_27
// 
// 
// PSW_27
// 
// 
// ACC_28
// 
// 
// B_28
// 
// 
// DPL_28
// 
// 
// DPH_28
// 
// 
// XRAM_ADDR_28
// 
// 
// PC_28
// 
// 
// P2_28
// 
// 
// P3_28
// 
// 
// P0_28
// 
// 
// P1_28
// 
// 
// XRAM_DATA_OUT_28
// 
// 
// SP_28
// 
// 
// PSW_28
// 
// 
// ACC_29
// 
// 
// B_29
// 
// 
// DPL_29
// 
// 
// DPH_29
// 
// 
// XRAM_ADDR_29
// 
// 
// PC_29
// 
// 
// P2_29
// 
// 
// P3_29
// 
// 
// P0_29
// 
// 
// P1_29
// 
// 
// XRAM_DATA_OUT_29
// 
// 
// SP_29
// 
// 
// PSW_29
// 
// 
// ACC_2a
// 
// 
// B_2a
// 
// 
// DPL_2a
// 
// 
// DPH_2a
// 
// 
// XRAM_ADDR_2a
// 
// 
// PC_2a
// 
// 
// P2_2a
// 
// 
// P3_2a
// 
// 
// P0_2a
// 
// 
// P1_2a
// 
// 
// XRAM_DATA_OUT_2a
// 
// 
// SP_2a
// 
// 
// PSW_2a
// 
// 
// ACC_2b
// 
// 
// B_2b
// 
// 
// DPL_2b
// 
// 
// DPH_2b
// 
// 
// XRAM_ADDR_2b
// 
// 
// PC_2b
// 
// 
// P2_2b
// 
// 
// P3_2b
// 
// 
// P0_2b
// 
// 
// P1_2b
// 
// 
// XRAM_DATA_OUT_2b
// 
// 
// SP_2b
// 
// 
// PSW_2b
// 
// 
// ACC_2c
// 
// 
// B_2c
// 
// 
// DPL_2c
// 
// 
// DPH_2c
// 
// 
// XRAM_ADDR_2c
// 
// 
// PC_2c
// 
// 
// P2_2c
// 
// 
// P3_2c
// 
// 
// P0_2c
// 
// 
// P1_2c
// 
// 
// XRAM_DATA_OUT_2c
// 
// 
// SP_2c
// 
// 
// PSW_2c
// 
// 
// ACC_2d
// 
// 
// B_2d
// 
// 
// DPL_2d
// 
// 
// DPH_2d
// 
// 
// XRAM_ADDR_2d
// 
// 
// PC_2d
// 
// 
// P2_2d
// 
// 
// P3_2d
// 
// 
// P0_2d
// 
// 
// P1_2d
// 
// 
// XRAM_DATA_OUT_2d
// 
// 
// SP_2d
// 
// 
// PSW_2d
// 
// 
// ACC_2e
// 
// 
// B_2e
// 
// 
// DPL_2e
// 
// 
// DPH_2e
// 
// 
// XRAM_ADDR_2e
// 
// 
// PC_2e
// 
// 
// P2_2e
// 
// 
// P3_2e
// 
// 
// P0_2e
// 
// 
// P1_2e
// 
// 
// XRAM_DATA_OUT_2e
// 
// 
// SP_2e
// 
// 
// PSW_2e
// 
// 
// ACC_2f
// 
// 
// B_2f
// 
// 
// DPL_2f
// 
// 
// DPH_2f
// 
// 
// XRAM_ADDR_2f
// 
// 
// PC_2f
// 
// 
// P2_2f
// 
// 
// P3_2f
// 
// 
// P0_2f
// 
// 
// P1_2f
// 
// 
// XRAM_DATA_OUT_2f
// 
// 
// SP_2f
// 
// 
// PSW_2f
// 
// 
// ACC_30
// 
// 
// B_30
// 
// 
// DPL_30
// 
// 
// DPH_30
// 
// 
// XRAM_ADDR_30
// 
// 
// PC_30
// 
// 
// P2_30
// 
// 
// P3_30
// 
// 
// P0_30
// 
// 
// P1_30
// 
// 
// XRAM_DATA_OUT_30
// 
// 
// SP_30
// 
// 
// PSW_30
// 
// 
// ACC_31
// 
// 
// B_31
// 
// 
// DPL_31
// 
// 
// DPH_31
// 
// 
// XRAM_ADDR_31
// 
// 
// PC_31
// 
// 
// P2_31
// 
// 
// P3_31
// 
// 
// P0_31
// 
// 
// P1_31
// 
// 
// IRAM_31
// 
// 
// XRAM_DATA_OUT_31
// 
// 
// SP_31
// 
// 
// PSW_31
// 
// 
// ACC_32
// 
// 
// B_32
// 
// 
// DPL_32
// 
// 
// DPH_32
// 
// 
// XRAM_ADDR_32
// 
// 
// PC_32
// 
// 
// P2_32
// 
// 
// P3_32
// 
// 
// P0_32
// 
// 
// P1_32
// 
// 
// XRAM_DATA_OUT_32
// 
// 
// SP_32
// 
// 
// PSW_32
// 
// 
// ACC_33
// 
// 
// B_33
// 
// 
// DPL_33
// 
// 
// DPH_33
// 
// 
// XRAM_ADDR_33
// 
// 
// PC_33
// 
// 
// P2_33
// 
// 
// P3_33
// 
// 
// P0_33
// 
// 
// P1_33
// 
// 
// XRAM_DATA_OUT_33
// 
// 
// SP_33
// 
// 
// PSW_33
// 
// 
// ACC_34
// 
// 
// B_34
// 
// 
// DPL_34
// 
// 
// DPH_34
// 
// 
// XRAM_ADDR_34
// 
// 
// PC_34
// 
// 
// P2_34
// 
// 
// P3_34
// 
// 
// P0_34
// 
// 
// P1_34
// 
// 
// XRAM_DATA_OUT_34
// 
// 
// SP_34
// 
// 
// PSW_34
// 
// 
// ACC_35
// 
// 
// B_35
// 
// 
// DPL_35
// 
// 
// DPH_35
// 
// 
// XRAM_ADDR_35
// 
// 
// PC_35
// 
// 
// P2_35
// 
// 
// P3_35
// 
// 
// P0_35
// 
// 
// P1_35
// 
// 
// XRAM_DATA_OUT_35
// 
// 
// SP_35
// 
// 
// PSW_35
// 
// 
// ACC_36
// 
// 
// P1_36
// 
// 
// DPL_36
// 
// 
// DPH_36
// 
// 
// XRAM_ADDR_36
// 
// 
// PC_36
// 
// 
// P2_36
// 
// 
// P3_36
// 
// 
// P0_36
// 
// 
// B_36
// 
// 
// XRAM_DATA_OUT_36
// 
// 
// SP_36
// 
// 
// PSW_36
// 
// 
// ACC_37
// 
// 
// B_37
// 
// 
// DPL_37
// 
// 
// DPH_37
// 
// 
// XRAM_ADDR_37
// 
// 
// PC_37
// 
// 
// P2_37
// 
// 
// P3_37
// 
// 
// P0_37
// 
// 
// P1_37
// 
// 
// XRAM_DATA_OUT_37
// 
// 
// SP_37
// 
// 
// PSW_37
// 
// 
// ACC_38
// 
// 
// B_38
// 
// 
// DPL_38
// 
// 
// DPH_38
// 
// 
// XRAM_ADDR_38
// 
// 
// PC_38
// 
// 
// P2_38
// 
// 
// P3_38
// 
// 
// P0_38
// 
// 
// P1_38
// 
// 
// XRAM_DATA_OUT_38
// 
// 
// SP_38
// 
// 
// PSW_38
// 
// 
// ACC_39
// 
// 
// P1_39
// 
// 
// DPL_39
// 
// 
// DPH_39
// 
// 
// XRAM_ADDR_39
// 
// 
// PC_39
// 
// 
// P2_39
// 
// 
// P3_39
// 
// 
// P0_39
// 
// 
// B_39
// 
// 
// XRAM_DATA_OUT_39
// 
// 
// SP_39
// 
// 
// PSW_39
// 
// 
// ACC_3a
// 
// 
// P1_3a
// 
// 
// DPL_3a
// 
// 
// DPH_3a
// 
// 
// XRAM_ADDR_3a
// 
// 
// PC_3a
// 
// 
// P2_3a
// 
// 
// P3_3a
// 
// 
// P0_3a
// 
// 
// B_3a
// 
// 
// XRAM_DATA_OUT_3a
// 
// 
// SP_3a
// 
// 
// PSW_3a
// 
// 
// ACC_3b
// 
// 
// B_3b
// 
// 
// DPL_3b
// 
// 
// DPH_3b
// 
// 
// XRAM_ADDR_3b
// 
// 
// PC_3b
// 
// 
// P2_3b
// 
// 
// P3_3b
// 
// 
// P0_3b
// 
// 
// P1_3b
// 
// 
// XRAM_DATA_OUT_3b
// 
// 
// SP_3b
// 
// 
// PSW_3b
// 
// 
// ACC_3c
// 
// 
// B_3c
// 
// 
// DPL_3c
// 
// 
// DPH_3c
// 
// 
// XRAM_ADDR_3c
// 
// 
// PC_3c
// 
// 
// P2_3c
// 
// 
// P3_3c
// 
// 
// P0_3c
// 
// 
// P1_3c
// 
// 
// XRAM_DATA_OUT_3c
// 
// 
// SP_3c
// 
// 
// PSW_3c
// 
// 
// ACC_3d
// 
// 
// B_3d
// 
// 
// DPL_3d
// 
// 
// DPH_3d
// 
// 
// XRAM_ADDR_3d
// 
// 
// PC_3d
// 
// 
// P2_3d
// 
// 
// P3_3d
// 
// 
// P0_3d
// 
// 
// P1_3d
// 
// 
// XRAM_DATA_OUT_3d
// 
// 
// SP_3d
// 
// 
// PSW_3d
// 
// 
// ACC_3e
// 
// 
// B_3e
// 
// 
// DPL_3e
// 
// 
// DPH_3e
// 
// 
// XRAM_ADDR_3e
// 
// 
// PC_3e
// 
// 
// P2_3e
// 
// 
// P3_3e
// 
// 
// P0_3e
// 
// 
// P1_3e
// 
// 
// XRAM_DATA_OUT_3e
// 
// 
// SP_3e
// 
// 
// PSW_3e
// 
// 
// ACC_3f
// 
// 
// B_3f
// 
// 
// DPL_3f
// 
// 
// DPH_3f
// 
// 
// XRAM_ADDR_3f
// 
// 
// PC_3f
// 
// 
// P2_3f
// 
// 
// P3_3f
// 
// 
// P0_3f
// 
// 
// P1_3f
// 
// 
// XRAM_DATA_OUT_3f
// 
// 
// SP_3f
// 
// 
// PSW_3f
// 
// 
// ACC_40
// 
// 
// B_40
// 
// 
// DPL_40
// 
// 
// DPH_40
// 
// 
// XRAM_ADDR_40
// 
// 
// PC_40
// 
// 
// P2_40
// 
// 
// P3_40
// 
// 
// P0_40
// 
// 
// P1_40
// 
// 
// XRAM_DATA_OUT_40
// 
// 
// SP_40
// 
// 
// PSW_40
// 
// 
// ACC_41
// 
// 
// P1_41
// 
// 
// DPL_41
// 
// 
// DPH_41
// 
// 
// XRAM_ADDR_41
// 
// 
// PC_41
// 
// 
// P2_41
// 
// 
// P3_41
// 
// 
// P0_41
// 
// 
// B_41
// 
// 
// XRAM_DATA_OUT_41
// 
// 
// SP_41
// 
// 
// PSW_41
// 
// 
// ACC_42
// 
// 
// B_42
// 
// 
// DPL_42
// 
// 
// DPH_42
// 
// 
// XRAM_ADDR_42
// 
// 
// PC_42
// 
// 
// P2_42
// 
// 
// P3_42
// 
// 
// P0_42
// 
// 
// P1_42
// 
// 
// IRAM_42
// 
assign n0161 = ( n0073 | ACC );
// 
// XRAM_DATA_OUT_42
// 
// 
// SP_42
// 
// 
// PSW_42
// 
// 
// ACC_43
// 
// 
// B_43
// 
// 
// DPL_43
// 
// 
// DPH_43
// 
// 
// XRAM_ADDR_43
// 
// 
// PC_43
// 
// 
// P2_43
// 
// 
// P3_43
// 
// 
// P0_43
// 
// 
// P1_43
// 
// 
// IRAM_43
// 
assign n0162 = ( n0073 | RD_ROM_2 );
// 
// XRAM_DATA_OUT_43
// 
// 
// SP_43
// 
// 
// PSW_43
// 
// 
// ACC_44
// 
// 
// B_44
// 
// 
// DPL_44
// 
// 
// DPH_44
// 
// 
// XRAM_ADDR_44
// 
// 
// PC_44
// 
// 
// P2_44
// 
// 
// P3_44
// 
// 
// P0_44
// 
// 
// P1_44
// 
// 
// XRAM_DATA_OUT_44
// 
// 
// SP_44
// 
// 
// PSW_44
// 
// 
// ACC_45
// 
// 
// B_45
// 
// 
// DPL_45
// 
// 
// DPH_45
// 
// 
// XRAM_ADDR_45
// 
// 
// PC_45
// 
// 
// P2_45
// 
// 
// P3_45
// 
// 
// P0_45
// 
// 
// P1_45
// 
// 
// XRAM_DATA_OUT_45
// 
// 
// SP_45
// 
// 
// PSW_45
// 
// 
// ACC_46
// 
// 
// B_46
// 
// 
// DPL_46
// 
// 
// DPH_46
// 
// 
// XRAM_ADDR_46
// 
// 
// PC_46
// 
// 
// P2_46
// 
// 
// P3_46
// 
// 
// P0_46
// 
// 
// P1_46
// 
// 
// XRAM_DATA_OUT_46
// 
// 
// SP_46
// 
// 
// PSW_46
// 
// 
// ACC_47
// 
// 
// P1_47
// 
// 
// DPL_47
// 
// 
// DPH_47
// 
// 
// XRAM_ADDR_47
// 
// 
// PC_47
// 
// 
// P2_47
// 
// 
// P3_47
// 
// 
// P0_47
// 
// 
// B_47
// 
// 
// XRAM_DATA_OUT_47
// 
// 
// SP_47
// 
// 
// PSW_47
// 
// 
// ACC_48
// 
// 
// P1_48
// 
// 
// DPL_48
// 
// 
// DPH_48
// 
// 
// XRAM_ADDR_48
// 
// 
// PC_48
// 
// 
// P2_48
// 
// 
// P3_48
// 
// 
// P0_48
// 
// 
// B_48
// 
// 
// XRAM_DATA_OUT_48
// 
// 
// SP_48
// 
// 
// PSW_48
// 
// 
// ACC_49
// 
// 
// B_49
// 
// 
// DPL_49
// 
// 
// DPH_49
// 
// 
// XRAM_ADDR_49
// 
// 
// PC_49
// 
// 
// P2_49
// 
// 
// P3_49
// 
// 
// P0_49
// 
// 
// P1_49
// 
// 
// XRAM_DATA_OUT_49
// 
// 
// SP_49
// 
// 
// PSW_49
// 
// 
// ACC_4a
// 
// 
// B_4a
// 
// 
// DPL_4a
// 
// 
// DPH_4a
// 
// 
// XRAM_ADDR_4a
// 
// 
// PC_4a
// 
// 
// P2_4a
// 
// 
// P3_4a
// 
// 
// P0_4a
// 
// 
// P1_4a
// 
// 
// XRAM_DATA_OUT_4a
// 
// 
// SP_4a
// 
// 
// PSW_4a
// 
// 
// ACC_4b
// 
// 
// P1_4b
// 
// 
// DPL_4b
// 
// 
// DPH_4b
// 
// 
// XRAM_ADDR_4b
// 
// 
// PC_4b
// 
// 
// P2_4b
// 
// 
// P3_4b
// 
// 
// P0_4b
// 
// 
// B_4b
// 
// 
// XRAM_DATA_OUT_4b
// 
// 
// SP_4b
// 
// 
// PSW_4b
// 
// 
// ACC_4c
// 
// 
// P1_4c
// 
// 
// DPL_4c
// 
// 
// DPH_4c
// 
// 
// XRAM_ADDR_4c
// 
// 
// PC_4c
// 
// 
// P2_4c
// 
// 
// P3_4c
// 
// 
// P0_4c
// 
// 
// B_4c
// 
// 
// XRAM_DATA_OUT_4c
// 
// 
// SP_4c
// 
// 
// PSW_4c
// 
// 
// ACC_4d
// 
// 
// P1_4d
// 
// 
// DPL_4d
// 
// 
// DPH_4d
// 
// 
// XRAM_ADDR_4d
// 
// 
// PC_4d
// 
// 
// P2_4d
// 
// 
// P3_4d
// 
// 
// P0_4d
// 
// 
// B_4d
// 
// 
// XRAM_DATA_OUT_4d
// 
// 
// SP_4d
// 
// 
// PSW_4d
// 
// 
// ACC_4e
// 
// 
// B_4e
// 
// 
// DPL_4e
// 
// 
// DPH_4e
// 
// 
// XRAM_ADDR_4e
// 
// 
// PC_4e
// 
// 
// P2_4e
// 
// 
// P3_4e
// 
// 
// P0_4e
// 
// 
// P1_4e
// 
// 
// XRAM_DATA_OUT_4e
// 
// 
// SP_4e
// 
// 
// PSW_4e
// 
// 
// ACC_4f
// 
// 
// P1_4f
// 
// 
// DPL_4f
// 
// 
// DPH_4f
// 
// 
// XRAM_ADDR_4f
// 
// 
// PC_4f
// 
// 
// P2_4f
// 
// 
// P3_4f
// 
// 
// P0_4f
// 
// 
// B_4f
// 
// 
// XRAM_DATA_OUT_4f
// 
// 
// SP_4f
// 
// 
// PSW_4f
// 
// 
// ACC_50
// 
// 
// P1_50
// 
// 
// DPL_50
// 
// 
// DPH_50
// 
// 
// XRAM_ADDR_50
// 
// 
// PC_50
// 
// 
// P2_50
// 
// 
// P3_50
// 
// 
// P0_50
// 
// 
// B_50
// 
// 
// XRAM_DATA_OUT_50
// 
// 
// SP_50
// 
// 
// PSW_50
// 
// 
// ACC_51
// 
// 
// B_51
// 
// 
// DPL_51
// 
// 
// DPH_51
// 
// 
// XRAM_ADDR_51
// 
// 
// PC_51
// 
// 
// P2_51
// 
// 
// P3_51
// 
// 
// P0_51
// 
// 
// P1_51
// 
// 
// IRAM_51
// 
// 
// XRAM_DATA_OUT_51
// 
// 
// SP_51
// 
// 
// PSW_51
// 
// 
// ACC_52
// 
// 
// P1_52
// 
// 
// DPL_52
// 
// 
// DPH_52
// 
// 
// XRAM_ADDR_52
// 
// 
// PC_52
// 
// 
// P2_52
// 
// 
// P3_52
// 
// 
// P0_52
// 
// 
// B_52
// 
// 
// IRAM_52
// 
assign n0163 = ( n0073 & ACC );
// 
// XRAM_DATA_OUT_52
// 
// 
// SP_52
// 
// 
// PSW_52
// 
// 
// ACC_53
// 
// 
// B_53
// 
// 
// DPL_53
// 
// 
// DPH_53
// 
// 
// XRAM_ADDR_53
// 
// 
// PC_53
// 
// 
// P2_53
// 
// 
// P3_53
// 
// 
// P0_53
// 
// 
// P1_53
// 
// 
// IRAM_53
// 
assign n0164 = ( n0073 & RD_ROM_2 );
// 
// XRAM_DATA_OUT_53
// 
// 
// SP_53
// 
// 
// PSW_53
// 
// 
// ACC_54
// 
// 
// B_54
// 
// 
// DPL_54
// 
// 
// DPH_54
// 
// 
// XRAM_ADDR_54
// 
// 
// PC_54
// 
// 
// P2_54
// 
// 
// P3_54
// 
// 
// P0_54
// 
// 
// P1_54
// 
// 
// XRAM_DATA_OUT_54
// 
// 
// SP_54
// 
// 
// PSW_54
// 
// 
// ACC_55
// 
// 
// B_55
// 
// 
// DPL_55
// 
// 
// DPH_55
// 
// 
// XRAM_ADDR_55
// 
// 
// PC_55
// 
// 
// P2_55
// 
// 
// P3_55
// 
// 
// P0_55
// 
// 
// P1_55
// 
// 
// XRAM_DATA_OUT_55
// 
// 
// SP_55
// 
// 
// PSW_55
// 
// 
// ACC_56
// 
// 
// B_56
// 
// 
// DPL_56
// 
// 
// DPH_56
// 
// 
// XRAM_ADDR_56
// 
// 
// PC_56
// 
// 
// P2_56
// 
// 
// P3_56
// 
// 
// P0_56
// 
// 
// P1_56
// 
// 
// XRAM_DATA_OUT_56
// 
// 
// SP_56
// 
// 
// PSW_56
// 
// 
// ACC_57
// 
// 
// B_57
// 
// 
// DPL_57
// 
// 
// DPH_57
// 
// 
// XRAM_ADDR_57
// 
// 
// PC_57
// 
// 
// P2_57
// 
// 
// P3_57
// 
// 
// P0_57
// 
// 
// P1_57
// 
// 
// XRAM_DATA_OUT_57
// 
// 
// SP_57
// 
// 
// PSW_57
// 
// 
// ACC_58
// 
// 
// B_58
// 
// 
// DPL_58
// 
// 
// DPH_58
// 
// 
// XRAM_ADDR_58
// 
// 
// PC_58
// 
// 
// P2_58
// 
// 
// P3_58
// 
// 
// P0_58
// 
// 
// P1_58
// 
// 
// XRAM_DATA_OUT_58
// 
// 
// SP_58
// 
// 
// PSW_58
// 
// 
// ACC_59
// 
// 
// P1_59
// 
// 
// DPL_59
// 
// 
// DPH_59
// 
// 
// XRAM_ADDR_59
// 
// 
// PC_59
// 
// 
// P2_59
// 
// 
// P3_59
// 
// 
// P0_59
// 
// 
// B_59
// 
// 
// XRAM_DATA_OUT_59
// 
// 
// SP_59
// 
// 
// PSW_59
// 
// 
// ACC_5a
// 
// 
// B_5a
// 
// 
// DPL_5a
// 
// 
// DPH_5a
// 
// 
// XRAM_ADDR_5a
// 
// 
// PC_5a
// 
// 
// P2_5a
// 
// 
// P3_5a
// 
// 
// P0_5a
// 
// 
// P1_5a
// 
// 
// XRAM_DATA_OUT_5a
// 
// 
// SP_5a
// 
// 
// PSW_5a
// 
// 
// ACC_5b
// 
// 
// P1_5b
// 
// 
// DPL_5b
// 
// 
// DPH_5b
// 
// 
// XRAM_ADDR_5b
// 
// 
// PC_5b
// 
// 
// P2_5b
// 
// 
// P3_5b
// 
// 
// P0_5b
// 
// 
// B_5b
// 
// 
// XRAM_DATA_OUT_5b
// 
// 
// SP_5b
// 
// 
// PSW_5b
// 
// 
// ACC_5c
// 
// 
// P1_5c
// 
// 
// DPL_5c
// 
// 
// DPH_5c
// 
// 
// XRAM_ADDR_5c
// 
// 
// PC_5c
// 
// 
// P2_5c
// 
// 
// P3_5c
// 
// 
// P0_5c
// 
// 
// B_5c
// 
// 
// XRAM_DATA_OUT_5c
// 
// 
// SP_5c
// 
// 
// PSW_5c
// 
// 
// ACC_5d
// 
// 
// P1_5d
// 
// 
// DPL_5d
// 
// 
// DPH_5d
// 
// 
// XRAM_ADDR_5d
// 
// 
// PC_5d
// 
// 
// P2_5d
// 
// 
// P3_5d
// 
// 
// P0_5d
// 
// 
// B_5d
// 
// 
// XRAM_DATA_OUT_5d
// 
// 
// SP_5d
// 
// 
// PSW_5d
// 
// 
// ACC_5e
// 
// 
// B_5e
// 
// 
// DPL_5e
// 
// 
// DPH_5e
// 
// 
// XRAM_ADDR_5e
// 
// 
// PC_5e
// 
// 
// P2_5e
// 
// 
// P3_5e
// 
// 
// P0_5e
// 
// 
// P1_5e
// 
// 
// XRAM_DATA_OUT_5e
// 
// 
// SP_5e
// 
// 
// PSW_5e
// 
// 
// ACC_5f
// 
// 
// B_5f
// 
// 
// DPL_5f
// 
// 
// DPH_5f
// 
// 
// XRAM_ADDR_5f
// 
// 
// PC_5f
// 
// 
// P2_5f
// 
// 
// P3_5f
// 
// 
// P0_5f
// 
// 
// P1_5f
// 
// 
// XRAM_DATA_OUT_5f
// 
// 
// SP_5f
// 
// 
// PSW_5f
// 
// 
// ACC_60
// 
// 
// B_60
// 
// 
// DPL_60
// 
// 
// DPH_60
// 
// 
// XRAM_ADDR_60
// 
// 
// PC_60
// 
// 
// P2_60
// 
// 
// P3_60
// 
// 
// P0_60
// 
// 
// P1_60
// 
// 
// XRAM_DATA_OUT_60
// 
// 
// SP_60
// 
// 
// PSW_60
// 
// 
// ACC_61
// 
// 
// B_61
// 
// 
// DPL_61
// 
// 
// DPH_61
// 
// 
// XRAM_ADDR_61
// 
// 
// PC_61
// 
// 
// P2_61
// 
// 
// P3_61
// 
// 
// P0_61
// 
// 
// P1_61
// 
// 
// XRAM_DATA_OUT_61
// 
// 
// SP_61
// 
// 
// PSW_61
// 
// 
// ACC_62
// 
// 
// B_62
// 
// 
// DPL_62
// 
// 
// DPH_62
// 
// 
// XRAM_ADDR_62
// 
// 
// PC_62
// 
// 
// P2_62
// 
// 
// P3_62
// 
// 
// P0_62
// 
// 
// P1_62
// 
// 
// IRAM_62
// 
assign n0165 = ( n0073 ^ ACC );
// 
// XRAM_DATA_OUT_62
// 
// 
// SP_62
// 
// 
// PSW_62
// 
// 
// ACC_63
// 
// 
// B_63
// 
// 
// DPL_63
// 
// 
// DPH_63
// 
// 
// XRAM_ADDR_63
// 
// 
// PC_63
// 
// 
// P2_63
// 
// 
// P3_63
// 
// 
// P0_63
// 
// 
// P1_63
// 
// 
// IRAM_63
// 
assign n0166 = ( n0073 ^ RD_ROM_2 );
// 
// XRAM_DATA_OUT_63
// 
// 
// SP_63
// 
// 
// PSW_63
// 
// 
// ACC_64
// 
// 
// P1_64
// 
// 
// DPL_64
// 
// 
// DPH_64
// 
// 
// XRAM_ADDR_64
// 
// 
// PC_64
// 
// 
// P2_64
// 
// 
// P3_64
// 
// 
// P0_64
// 
// 
// B_64
// 
// 
// XRAM_DATA_OUT_64
// 
// 
// SP_64
// 
// 
// PSW_64
// 
// 
// ACC_65
// 
// 
// P1_65
// 
// 
// DPL_65
// 
// 
// DPH_65
// 
// 
// XRAM_ADDR_65
// 
// 
// PC_65
// 
// 
// P2_65
// 
// 
// P3_65
// 
// 
// P0_65
// 
// 
// B_65
// 
// 
// XRAM_DATA_OUT_65
// 
// 
// SP_65
// 
// 
// PSW_65
// 
// 
// ACC_66
// 
// 
// B_66
// 
// 
// DPL_66
// 
// 
// DPH_66
// 
// 
// XRAM_ADDR_66
// 
// 
// PC_66
// 
// 
// P2_66
// 
// 
// P3_66
// 
// 
// P0_66
// 
// 
// P1_66
// 
// 
// XRAM_DATA_OUT_66
// 
// 
// SP_66
// 
// 
// PSW_66
// 
// 
// ACC_67
// 
// 
// P1_67
// 
// 
// DPL_67
// 
// 
// DPH_67
// 
// 
// XRAM_ADDR_67
// 
// 
// PC_67
// 
// 
// P2_67
// 
// 
// P3_67
// 
// 
// P0_67
// 
// 
// B_67
// 
// 
// XRAM_DATA_OUT_67
// 
// 
// SP_67
// 
// 
// PSW_67
// 
// 
// ACC_68
// 
// 
// P1_68
// 
// 
// DPL_68
// 
// 
// DPH_68
// 
// 
// XRAM_ADDR_68
// 
// 
// PC_68
// 
// 
// P2_68
// 
// 
// P3_68
// 
// 
// P0_68
// 
// 
// B_68
// 
// 
// XRAM_DATA_OUT_68
// 
// 
// SP_68
// 
// 
// PSW_68
// 
// 
// ACC_69
// 
// 
// B_69
// 
// 
// DPL_69
// 
// 
// DPH_69
// 
// 
// XRAM_ADDR_69
// 
// 
// PC_69
// 
// 
// P2_69
// 
// 
// P3_69
// 
// 
// P0_69
// 
// 
// P1_69
// 
// 
// XRAM_DATA_OUT_69
// 
// 
// SP_69
// 
// 
// PSW_69
// 
// 
// ACC_6a
// 
// 
// B_6a
// 
// 
// DPL_6a
// 
// 
// DPH_6a
// 
// 
// XRAM_ADDR_6a
// 
// 
// PC_6a
// 
// 
// P2_6a
// 
// 
// P3_6a
// 
// 
// P0_6a
// 
// 
// P1_6a
// 
// 
// XRAM_DATA_OUT_6a
// 
// 
// SP_6a
// 
// 
// PSW_6a
// 
// 
// ACC_6b
// 
// 
// P1_6b
// 
// 
// DPL_6b
// 
// 
// DPH_6b
// 
// 
// XRAM_ADDR_6b
// 
// 
// PC_6b
// 
// 
// P2_6b
// 
// 
// P3_6b
// 
// 
// P0_6b
// 
// 
// B_6b
// 
// 
// XRAM_DATA_OUT_6b
// 
// 
// SP_6b
// 
// 
// PSW_6b
// 
// 
// ACC_6c
// 
// 
// B_6c
// 
// 
// DPL_6c
// 
// 
// DPH_6c
// 
// 
// XRAM_ADDR_6c
// 
// 
// PC_6c
// 
// 
// P2_6c
// 
// 
// P3_6c
// 
// 
// P0_6c
// 
// 
// P1_6c
// 
// 
// XRAM_DATA_OUT_6c
// 
// 
// SP_6c
// 
// 
// PSW_6c
// 
// 
// ACC_6d
// 
// 
// B_6d
// 
// 
// DPL_6d
// 
// 
// DPH_6d
// 
// 
// XRAM_ADDR_6d
// 
// 
// PC_6d
// 
// 
// P2_6d
// 
// 
// P3_6d
// 
// 
// P0_6d
// 
// 
// P1_6d
// 
// 
// XRAM_DATA_OUT_6d
// 
// 
// SP_6d
// 
// 
// PSW_6d
// 
// 
// ACC_6e
// 
// 
// P1_6e
// 
// 
// DPL_6e
// 
// 
// DPH_6e
// 
// 
// XRAM_ADDR_6e
// 
// 
// PC_6e
// 
// 
// P2_6e
// 
// 
// P3_6e
// 
// 
// P0_6e
// 
// 
// B_6e
// 
// 
// XRAM_DATA_OUT_6e
// 
// 
// SP_6e
// 
// 
// PSW_6e
// 
// 
// ACC_6f
// 
// 
// P1_6f
// 
// 
// DPL_6f
// 
// 
// DPH_6f
// 
// 
// XRAM_ADDR_6f
// 
// 
// PC_6f
// 
// 
// P2_6f
// 
// 
// P3_6f
// 
// 
// P0_6f
// 
// 
// B_6f
// 
// 
// XRAM_DATA_OUT_6f
// 
// 
// SP_6f
// 
// 
// PSW_6f
// 
// 
// ACC_70
// 
// 
// B_70
// 
// 
// DPL_70
// 
// 
// DPH_70
// 
// 
// XRAM_ADDR_70
// 
// 
// PC_70
// 
// 
// P2_70
// 
// 
// P3_70
// 
// 
// P0_70
// 
// 
// P1_70
// 
// 
// XRAM_DATA_OUT_70
// 
// 
// SP_70
// 
// 
// PSW_70
// 
// 
// ACC_71
// 
// 
// B_71
// 
// 
// DPL_71
// 
// 
// DPH_71
// 
// 
// XRAM_ADDR_71
// 
// 
// PC_71
// 
// 
// P2_71
// 
// 
// P3_71
// 
// 
// P0_71
// 
// 
// P1_71
// 
// 
// IRAM_71
// 
// 
// XRAM_DATA_OUT_71
// 
// 
// SP_71
// 
// 
// PSW_71
// 
// 
// ACC_72
// 
// 
// P1_72
// 
// 
// DPL_72
// 
// 
// DPH_72
// 
// 
// XRAM_ADDR_72
// 
// 
// PC_72
// 
// 
// P2_72
// 
// 
// P3_72
// 
// 
// P0_72
// 
// 
// B_72
// 
// 
// XRAM_DATA_OUT_72
// 
// 
// SP_72
// 
// 
// PSW_72
// 
// 
// ACC_73
// 
// 
// P1_73
// 
// 
// DPL_73
// 
// 
// DPH_73
// 
// 
// XRAM_ADDR_73
// 
// 
// PC_73
// 
// 
// P2_73
// 
// 
// P3_73
// 
// 
// P0_73
// 
// 
// B_73
// 
// 
// XRAM_DATA_OUT_73
// 
// 
// SP_73
// 
// 
// PSW_73
// 
// 
// ACC_74
// 
// 
// B_74
// 
// 
// DPL_74
// 
// 
// DPH_74
// 
// 
// XRAM_ADDR_74
// 
// 
// PC_74
// 
// 
// P2_74
// 
// 
// P3_74
// 
// 
// P0_74
// 
// 
// P1_74
// 
// 
// XRAM_DATA_OUT_74
// 
// 
// SP_74
// 
// 
// PSW_74
// 
// 
// ACC_75
// 
// 
// P1_75
// 
// 
// DPL_75
// 
// 
// DPH_75
// 
// 
// XRAM_ADDR_75
// 
// 
// PC_75
// 
// 
// P2_75
// 
// 
// P3_75
// 
// 
// P0_75
// 
// 
// B_75
// 
// 
// IRAM_75
// 
// 
// XRAM_DATA_OUT_75
// 
// 
// SP_75
// 
// 
// PSW_75
// 
// 
// ACC_76
// 
// 
// B_76
// 
// 
// DPL_76
// 
// 
// DPH_76
// 
// 
// XRAM_ADDR_76
// 
// 
// PC_76
// 
// 
// P2_76
// 
// 
// P3_76
// 
// 
// P0_76
// 
// 
// P1_76
// 
// 
// IRAM_76
// 
// 
// XRAM_DATA_OUT_76
// 
// 
// SP_76
// 
// 
// PSW_76
// 
// 
// ACC_77
// 
// 
// B_77
// 
// 
// DPL_77
// 
// 
// DPH_77
// 
// 
// XRAM_ADDR_77
// 
// 
// PC_77
// 
// 
// P2_77
// 
// 
// P3_77
// 
// 
// P0_77
// 
// 
// P1_77
// 
// 
// IRAM_77
// 
// 
// XRAM_DATA_OUT_77
// 
// 
// SP_77
// 
// 
// PSW_77
// 
// 
// ACC_78
// 
// 
// P1_78
// 
// 
// DPL_78
// 
// 
// DPH_78
// 
// 
// XRAM_ADDR_78
// 
// 
// PC_78
// 
// 
// P2_78
// 
// 
// P3_78
// 
// 
// P0_78
// 
// 
// B_78
// 
// 
// IRAM_78
// 
// 
// XRAM_DATA_OUT_78
// 
// 
// SP_78
// 
// 
// PSW_78
// 
// 
// ACC_79
// 
// 
// B_79
// 
// 
// DPL_79
// 
// 
// DPH_79
// 
// 
// XRAM_ADDR_79
// 
// 
// PC_79
// 
// 
// P2_79
// 
// 
// P3_79
// 
// 
// P0_79
// 
// 
// P1_79
// 
// 
// IRAM_79
// 
// 
// XRAM_DATA_OUT_79
// 
// 
// SP_79
// 
// 
// PSW_79
// 
// 
// ACC_7a
// 
// 
// P1_7a
// 
// 
// DPL_7a
// 
// 
// DPH_7a
// 
// 
// XRAM_ADDR_7a
// 
// 
// PC_7a
// 
// 
// P2_7a
// 
// 
// P3_7a
// 
// 
// P0_7a
// 
// 
// B_7a
// 
// 
// IRAM_7a
// 
// 
// XRAM_DATA_OUT_7a
// 
// 
// SP_7a
// 
// 
// PSW_7a
// 
// 
// ACC_7b
// 
// 
// P1_7b
// 
// 
// DPL_7b
// 
// 
// DPH_7b
// 
// 
// XRAM_ADDR_7b
// 
// 
// PC_7b
// 
// 
// P2_7b
// 
// 
// P3_7b
// 
// 
// P0_7b
// 
// 
// B_7b
// 
// 
// IRAM_7b
// 
// 
// XRAM_DATA_OUT_7b
// 
// 
// SP_7b
// 
// 
// PSW_7b
// 
// 
// ACC_7c
// 
// 
// B_7c
// 
// 
// DPL_7c
// 
// 
// DPH_7c
// 
// 
// XRAM_ADDR_7c
// 
// 
// PC_7c
// 
// 
// P2_7c
// 
// 
// P3_7c
// 
// 
// P0_7c
// 
// 
// P1_7c
// 
// 
// IRAM_7c
// 
// 
// XRAM_DATA_OUT_7c
// 
// 
// SP_7c
// 
// 
// PSW_7c
// 
// 
// ACC_7d
// 
// 
// P1_7d
// 
// 
// DPL_7d
// 
// 
// DPH_7d
// 
// 
// XRAM_ADDR_7d
// 
// 
// PC_7d
// 
// 
// P2_7d
// 
// 
// P3_7d
// 
// 
// P0_7d
// 
// 
// B_7d
// 
// 
// IRAM_7d
// 
// 
// XRAM_DATA_OUT_7d
// 
// 
// SP_7d
// 
// 
// PSW_7d
// 
// 
// ACC_7e
// 
// 
// P1_7e
// 
// 
// DPL_7e
// 
// 
// DPH_7e
// 
// 
// XRAM_ADDR_7e
// 
// 
// PC_7e
// 
// 
// P2_7e
// 
// 
// P3_7e
// 
// 
// P0_7e
// 
// 
// B_7e
// 
// 
// IRAM_7e
// 
// 
// XRAM_DATA_OUT_7e
// 
// 
// SP_7e
// 
// 
// PSW_7e
// 
// 
// ACC_7f
// 
// 
// P1_7f
// 
// 
// DPL_7f
// 
// 
// DPH_7f
// 
// 
// XRAM_ADDR_7f
// 
// 
// PC_7f
// 
// 
// P2_7f
// 
// 
// P3_7f
// 
// 
// P0_7f
// 
// 
// B_7f
// 
// 
// IRAM_7f
// 
// 
// XRAM_DATA_OUT_7f
// 
// 
// SP_7f
// 
// 
// PSW_7f
// 
// 
// ACC_80
// 
// 
// B_80
// 
// 
// DPL_80
// 
// 
// DPH_80
// 
// 
// XRAM_ADDR_80
// 
// 
// PC_80
// 
// 
// P2_80
// 
// 
// P3_80
// 
// 
// P0_80
// 
// 
// P1_80
// 
// 
// XRAM_DATA_OUT_80
// 
// 
// SP_80
// 
// 
// PSW_80
// 
// 
// ACC_81
// 
// 
// B_81
// 
// 
// DPL_81
// 
// 
// DPH_81
// 
// 
// XRAM_ADDR_81
// 
// 
// PC_81
// 
// 
// P2_81
// 
// 
// P3_81
// 
// 
// P0_81
// 
// 
// P1_81
// 
// 
// XRAM_DATA_OUT_81
// 
// 
// SP_81
// 
// 
// PSW_81
// 
// 
// ACC_82
// 
// 
// P1_82
// 
// 
// DPL_82
// 
// 
// DPH_82
// 
// 
// XRAM_ADDR_82
// 
// 
// PC_82
// 
// 
// P2_82
// 
// 
// P3_82
// 
// 
// P0_82
// 
// 
// B_82
// 
// 
// XRAM_DATA_OUT_82
// 
// 
// SP_82
// 
// 
// PSW_82
// 
// 
// ACC_83
// 
// 
// B_83
// 
// 
// DPL_83
// 
// 
// DPH_83
// 
// 
// XRAM_ADDR_83
// 
// 
// PC_83
// 
// 
// P2_83
// 
// 
// P3_83
// 
// 
// P0_83
// 
// 
// P1_83
// 
// 
// XRAM_DATA_OUT_83
// 
// 
// SP_83
// 
// 
// PSW_83
// 
// 
// ACC_84
// 
// 
// B_84
// 
// 
// DPL_84
// 
// 
// DPH_84
// 
// 
// XRAM_ADDR_84
// 
// 
// PC_84
// 
// 
// P2_84
// 
// 
// P3_84
// 
// 
// P0_84
// 
// 
// P1_84
// 
// 
// XRAM_DATA_OUT_84
// 
// 
// SP_84
// 
// 
// PSW_84
// 
// 
// ACC_85
// 
// 
// P1_85
// 
// 
// DPL_85
// 
// 
// DPH_85
// 
// 
// XRAM_ADDR_85
// 
// 
// PC_85
// 
// 
// P2_85
// 
// 
// P3_85
// 
// 
// P0_85
// 
// 
// B_85
// 
// 
// IRAM_85
// 
assign n0167 = RD_ROM_2[7:7];
assign n0168 = ( n0167 == n0006 );
assign n0169 = ( RD_ROM_2 == n0009 );
assign n0170 = ( RD_ROM_2 == n0011 );
assign n0171 = ( RD_ROM_2 == n0013 );
assign n0172 = ( RD_ROM_2 == n0015 );
assign n0173 = ( RD_ROM_2 == n0017 );
assign n0174 = ( RD_ROM_2 == n0019 );
assign n0175 = ( RD_ROM_2 == n0021 );
assign n0176 = ( RD_ROM_2 == n0023 );
assign n0177 = ( RD_ROM_2 == n0025 );
assign n0178 = ( RD_ROM_2 == n0027 );
assign n0179 = ( RD_ROM_2 == n0029 );
assign n0180 = ( RD_ROM_2 == n0031 );
assign n0181 = ( RD_ROM_2 == n0033 );
assign n0182 = ( RD_ROM_2 == n0035 );
assign n0183 = ( RD_ROM_2 == n0037 );
assign n0184 = ( RD_ROM_2 == n0039 );
assign n0185 = ( RD_ROM_2 == n0041 );
assign n0186 = ( RD_ROM_2 == n0043 );
assign n0187 = ( RD_ROM_2 == n0045 );
assign n0188 = ( RD_ROM_2 == n0047 );
assign n0189 = ( RD_ROM_2 == n0049 );
assign n0190 = ( n0189 ) ? ( B ) : ( n0051 );
assign n0191 = ( n0188 ) ? ( ACC ) : ( n0190 );
assign n0192 = ( n0187 ) ? ( PSW ) : ( n0191 );
assign n0193 = ( n0186 ) ? ( IP ) : ( n0192 );
assign n0194 = ( n0185 ) ? ( P3INREG ) : ( n0193 );
assign n0195 = ( n0184 ) ? ( IE ) : ( n0194 );
assign n0196 = ( n0183 ) ? ( P2INREG ) : ( n0195 );
assign n0197 = ( n0182 ) ? ( SBUF ) : ( n0196 );
assign n0198 = ( n0181 ) ? ( SCON ) : ( n0197 );
assign n0199 = ( n0180 ) ? ( P1INREG ) : ( n0198 );
assign n0200 = ( n0179 ) ? ( TH1 ) : ( n0199 );
assign n0201 = ( n0178 ) ? ( TL1 ) : ( n0200 );
assign n0202 = ( n0177 ) ? ( TH0 ) : ( n0201 );
assign n0203 = ( n0176 ) ? ( TL0 ) : ( n0202 );
assign n0204 = ( n0175 ) ? ( TMOD ) : ( n0203 );
assign n0205 = ( n0174 ) ? ( TCON ) : ( n0204 );
assign n0206 = ( n0173 ) ? ( PCON ) : ( n0205 );
assign n0207 = ( n0172 ) ? ( DPH ) : ( n0206 );
assign n0208 = ( n0171 ) ? ( DPL ) : ( n0207 );
assign n0209 = ( n0170 ) ? ( SP ) : ( n0208 );
assign n0210 = ( n0169 ) ? ( P0INREG ) : ( n0209 );
assign n0211 = ( n0168 ) ? ( RD_IRAM_0 ) : ( n0210 );
// 
// XRAM_DATA_OUT_85
// 
// 
// SP_85
// 
// 
// PSW_85
// 
// 
// ACC_86
// 
// 
// P1_86
// 
// 
// DPL_86
// 
// 
// DPH_86
// 
// 
// XRAM_ADDR_86
// 
// 
// PC_86
// 
// 
// P2_86
// 
// 
// P3_86
// 
// 
// P0_86
// 
// 
// B_86
// 
// 
// IRAM_86
// 
// 
// XRAM_DATA_OUT_86
// 
// 
// SP_86
// 
// 
// PSW_86
// 
// 
// ACC_87
// 
// 
// B_87
// 
// 
// DPL_87
// 
// 
// DPH_87
// 
// 
// XRAM_ADDR_87
// 
// 
// PC_87
// 
// 
// P2_87
// 
// 
// P3_87
// 
// 
// P0_87
// 
// 
// P1_87
// 
// 
// IRAM_87
// 
// 
// XRAM_DATA_OUT_87
// 
// 
// SP_87
// 
// 
// PSW_87
// 
// 
// ACC_88
// 
// 
// B_88
// 
// 
// DPL_88
// 
// 
// DPH_88
// 
// 
// XRAM_ADDR_88
// 
// 
// PC_88
// 
// 
// P2_88
// 
// 
// P3_88
// 
// 
// P0_88
// 
// 
// P1_88
// 
// 
// IRAM_88
// 
// 
// XRAM_DATA_OUT_88
// 
// 
// SP_88
// 
// 
// PSW_88
// 
// 
// ACC_89
// 
// 
// B_89
// 
// 
// DPL_89
// 
// 
// DPH_89
// 
// 
// XRAM_ADDR_89
// 
// 
// PC_89
// 
// 
// P2_89
// 
// 
// P3_89
// 
// 
// P0_89
// 
// 
// P1_89
// 
// 
// IRAM_89
// 
// 
// XRAM_DATA_OUT_89
// 
// 
// SP_89
// 
// 
// PSW_89
// 
// 
// ACC_8a
// 
// 
// P1_8a
// 
// 
// DPL_8a
// 
// 
// DPH_8a
// 
// 
// XRAM_ADDR_8a
// 
// 
// PC_8a
// 
// 
// P2_8a
// 
// 
// P3_8a
// 
// 
// P0_8a
// 
// 
// B_8a
// 
// 
// IRAM_8a
// 
// 
// XRAM_DATA_OUT_8a
// 
// 
// SP_8a
// 
// 
// PSW_8a
// 
// 
// ACC_8b
// 
// 
// B_8b
// 
// 
// DPL_8b
// 
// 
// DPH_8b
// 
// 
// XRAM_ADDR_8b
// 
// 
// PC_8b
// 
// 
// P2_8b
// 
// 
// P3_8b
// 
// 
// P0_8b
// 
// 
// P1_8b
// 
// 
// IRAM_8b
// 
// 
// XRAM_DATA_OUT_8b
// 
// 
// SP_8b
// 
// 
// PSW_8b
// 
// 
// ACC_8c
// 
// 
// B_8c
// 
// 
// DPL_8c
// 
// 
// DPH_8c
// 
// 
// XRAM_ADDR_8c
// 
// 
// PC_8c
// 
// 
// P2_8c
// 
// 
// P3_8c
// 
// 
// P0_8c
// 
// 
// P1_8c
// 
// 
// IRAM_8c
// 
// 
// XRAM_DATA_OUT_8c
// 
// 
// SP_8c
// 
// 
// PSW_8c
// 
// 
// ACC_8d
// 
// 
// B_8d
// 
// 
// DPL_8d
// 
// 
// DPH_8d
// 
// 
// XRAM_ADDR_8d
// 
// 
// PC_8d
// 
// 
// P2_8d
// 
// 
// P3_8d
// 
// 
// P0_8d
// 
// 
// P1_8d
// 
// 
// IRAM_8d
// 
// 
// XRAM_DATA_OUT_8d
// 
// 
// SP_8d
// 
// 
// PSW_8d
// 
// 
// ACC_8e
// 
// 
// B_8e
// 
// 
// DPL_8e
// 
// 
// DPH_8e
// 
// 
// XRAM_ADDR_8e
// 
// 
// PC_8e
// 
// 
// P2_8e
// 
// 
// P3_8e
// 
// 
// P0_8e
// 
// 
// P1_8e
// 
// 
// IRAM_8e
// 
// 
// XRAM_DATA_OUT_8e
// 
// 
// SP_8e
// 
// 
// PSW_8e
// 
// 
// ACC_8f
// 
// 
// B_8f
// 
// 
// DPL_8f
// 
// 
// DPH_8f
// 
// 
// XRAM_ADDR_8f
// 
// 
// PC_8f
// 
// 
// P2_8f
// 
// 
// P3_8f
// 
// 
// P0_8f
// 
// 
// P1_8f
// 
// 
// IRAM_8f
// 
// 
// XRAM_DATA_OUT_8f
// 
// 
// SP_8f
// 
// 
// PSW_8f
// 
// 
// ACC_90
// 
// 
// P1_90
// 
// 
// DPL_90
// 
// 
// DPH_90
// 
// 
// XRAM_ADDR_90
// 
// 
// PC_90
// 
// 
// P2_90
// 
// 
// P3_90
// 
// 
// P0_90
// 
// 
// B_90
// 
// 
// XRAM_DATA_OUT_90
// 
// 
// SP_90
// 
// 
// PSW_90
// 
// 
// ACC_91
// 
// 
// P1_91
// 
// 
// DPL_91
// 
// 
// DPH_91
// 
// 
// XRAM_ADDR_91
// 
// 
// PC_91
// 
// 
// P2_91
// 
// 
// P3_91
// 
// 
// P0_91
// 
// 
// B_91
// 
// 
// IRAM_91
// 
// 
// XRAM_DATA_OUT_91
// 
// 
// SP_91
// 
// 
// PSW_91
// 
// 
// ACC_92
// 
// 
// P1_92
// 
// 
// DPL_92
// 
// 
// DPH_92
// 
// 
// XRAM_ADDR_92
// 
// 
// PC_92
// 
// 
// P2_92
// 
// 
// P3_92
// 
// 
// P0_92
// 
// 
// B_92
// 
// 
// IRAM_92
// 
assign n0212 = PSW[7:7];
assign n0213 = { 7'b0, n0212 };
assign n0214 = ( n0213 << n0116 );
assign n0215 = ( n0142 | n0214 );
// 
// XRAM_DATA_OUT_92
// 
// 
// SP_92
// 
// 
// PSW_92
// 
// 
// ACC_93
// 
// 
// B_93
// 
// 
// DPL_93
// 
// 
// DPH_93
// 
// 
// XRAM_ADDR_93
// 
// 
// PC_93
// 
// 
// P2_93
// 
// 
// P3_93
// 
// 
// P0_93
// 
// 
// P1_93
// 
// 
// XRAM_DATA_OUT_93
// 
// 
// SP_93
// 
// 
// PSW_93
// 
// 
// ACC_94
// 
// 
// B_94
// 
// 
// DPL_94
// 
// 
// DPH_94
// 
// 
// XRAM_ADDR_94
// 
// 
// PC_94
// 
// 
// P2_94
// 
// 
// P3_94
// 
// 
// P0_94
// 
// 
// P1_94
// 
// 
// XRAM_DATA_OUT_94
// 
// 
// SP_94
// 
// 
// PSW_94
// 
// 
// ACC_95
// 
// 
// B_95
// 
// 
// DPL_95
// 
// 
// DPH_95
// 
// 
// XRAM_ADDR_95
// 
// 
// PC_95
// 
// 
// P2_95
// 
// 
// P3_95
// 
// 
// P0_95
// 
// 
// P1_95
// 
// 
// XRAM_DATA_OUT_95
// 
// 
// SP_95
// 
// 
// PSW_95
// 
// 
// ACC_96
// 
// 
// B_96
// 
// 
// DPL_96
// 
// 
// DPH_96
// 
// 
// XRAM_ADDR_96
// 
// 
// PC_96
// 
// 
// P2_96
// 
// 
// P3_96
// 
// 
// P0_96
// 
// 
// P1_96
// 
// 
// XRAM_DATA_OUT_96
// 
// 
// SP_96
// 
// 
// PSW_96
// 
// 
// ACC_97
// 
// 
// B_97
// 
// 
// DPL_97
// 
// 
// DPH_97
// 
// 
// XRAM_ADDR_97
// 
// 
// PC_97
// 
// 
// P2_97
// 
// 
// P3_97
// 
// 
// P0_97
// 
// 
// P1_97
// 
// 
// XRAM_DATA_OUT_97
// 
// 
// SP_97
// 
// 
// PSW_97
// 
// 
// ACC_98
// 
// 
// B_98
// 
// 
// DPL_98
// 
// 
// DPH_98
// 
// 
// XRAM_ADDR_98
// 
// 
// PC_98
// 
// 
// P2_98
// 
// 
// P3_98
// 
// 
// P0_98
// 
// 
// P1_98
// 
// 
// XRAM_DATA_OUT_98
// 
// 
// SP_98
// 
// 
// PSW_98
// 
// 
// ACC_99
// 
// 
// P1_99
// 
// 
// DPL_99
// 
// 
// DPH_99
// 
// 
// XRAM_ADDR_99
// 
// 
// PC_99
// 
// 
// P2_99
// 
// 
// P3_99
// 
// 
// P0_99
// 
// 
// B_99
// 
// 
// XRAM_DATA_OUT_99
// 
// 
// SP_99
// 
// 
// PSW_99
// 
// 
// ACC_9a
// 
// 
// B_9a
// 
// 
// DPL_9a
// 
// 
// DPH_9a
// 
// 
// XRAM_ADDR_9a
// 
// 
// PC_9a
// 
// 
// P2_9a
// 
// 
// P3_9a
// 
// 
// P0_9a
// 
// 
// P1_9a
// 
// 
// XRAM_DATA_OUT_9a
// 
// 
// SP_9a
// 
// 
// PSW_9a
// 
// 
// ACC_9b
// 
// 
// B_9b
// 
// 
// DPL_9b
// 
// 
// DPH_9b
// 
// 
// XRAM_ADDR_9b
// 
// 
// PC_9b
// 
// 
// P2_9b
// 
// 
// P3_9b
// 
// 
// P0_9b
// 
// 
// P1_9b
// 
// 
// XRAM_DATA_OUT_9b
// 
// 
// SP_9b
// 
// 
// PSW_9b
// 
// 
// ACC_9c
// 
// 
// B_9c
// 
// 
// DPL_9c
// 
// 
// DPH_9c
// 
// 
// XRAM_ADDR_9c
// 
// 
// PC_9c
// 
// 
// P2_9c
// 
// 
// P3_9c
// 
// 
// P0_9c
// 
// 
// P1_9c
// 
// 
// XRAM_DATA_OUT_9c
// 
// 
// SP_9c
// 
// 
// PSW_9c
// 
// 
// ACC_9d
// 
// 
// P1_9d
// 
// 
// DPL_9d
// 
// 
// DPH_9d
// 
// 
// XRAM_ADDR_9d
// 
// 
// PC_9d
// 
// 
// P2_9d
// 
// 
// P3_9d
// 
// 
// P0_9d
// 
// 
// B_9d
// 
// 
// XRAM_DATA_OUT_9d
// 
// 
// SP_9d
// 
// 
// PSW_9d
// 
// 
// ACC_9e
// 
// 
// B_9e
// 
// 
// DPL_9e
// 
// 
// DPH_9e
// 
// 
// XRAM_ADDR_9e
// 
// 
// PC_9e
// 
// 
// P2_9e
// 
// 
// P3_9e
// 
// 
// P0_9e
// 
// 
// P1_9e
// 
// 
// XRAM_DATA_OUT_9e
// 
// 
// SP_9e
// 
// 
// PSW_9e
// 
// 
// ACC_9f
// 
// 
// B_9f
// 
// 
// DPL_9f
// 
// 
// DPH_9f
// 
// 
// XRAM_ADDR_9f
// 
// 
// PC_9f
// 
// 
// P2_9f
// 
// 
// P3_9f
// 
// 
// P0_9f
// 
// 
// P1_9f
// 
// 
// XRAM_DATA_OUT_9f
// 
// 
// SP_9f
// 
// 
// PSW_9f
// 
// 
// ACC_a0
// 
// 
// P1_a0
// 
// 
// DPL_a0
// 
// 
// DPH_a0
// 
// 
// XRAM_ADDR_a0
// 
// 
// PC_a0
// 
// 
// P2_a0
// 
// 
// P3_a0
// 
// 
// P0_a0
// 
// 
// B_a0
// 
// 
// XRAM_DATA_OUT_a0
// 
// 
// SP_a0
// 
// 
// PSW_a0
// 
// 
// ACC_a1
// 
// 
// P1_a1
// 
// 
// DPL_a1
// 
// 
// DPH_a1
// 
// 
// XRAM_ADDR_a1
// 
// 
// PC_a1
// 
// 
// P2_a1
// 
// 
// P3_a1
// 
// 
// P0_a1
// 
// 
// B_a1
// 
// 
// XRAM_DATA_OUT_a1
// 
// 
// SP_a1
// 
// 
// PSW_a1
// 
// 
// ACC_a2
// 
// 
// P1_a2
// 
// 
// DPL_a2
// 
// 
// DPH_a2
// 
// 
// XRAM_ADDR_a2
// 
// 
// PC_a2
// 
// 
// P2_a2
// 
// 
// P3_a2
// 
// 
// P0_a2
// 
// 
// B_a2
// 
// 
// XRAM_DATA_OUT_a2
// 
// 
// SP_a2
// 
// 
// PSW_a2
// 
// 
// ACC_a3
// 
// 
// P1_a3
// 
// 
// DPL_a3
// 
// 
// DPH_a3
// 
// 
// XRAM_ADDR_a3
// 
// 
// PC_a3
// 
// 
// P2_a3
// 
// 
// P3_a3
// 
// 
// P0_a3
// 
// 
// B_a3
// 
// 
// XRAM_DATA_OUT_a3
// 
// 
// SP_a3
// 
// 
// PSW_a3
// 
// 
// ACC_a4
// 
// 
// P1_a4
// 
// 
// DPL_a4
// 
// 
// DPH_a4
// 
// 
// XRAM_ADDR_a4
// 
// 
// PC_a4
// 
// 
// P2_a4
// 
// 
// P3_a4
// 
// 
// P0_a4
// 
// 
// B_a4
// 
// 
// XRAM_DATA_OUT_a4
// 
// 
// SP_a4
// 
// 
// PSW_a4
// 
// 
// ACC_a5
// 
assign ACC_a5 = ACC;
// 
// P1_a5
// 
assign P1_a5 = P1;
// 
// DPL_a5
// 
assign DPL_a5 = DPL;
// 
// DPH_a5
// 
assign DPH_a5 = DPH;
// 
// XRAM_ADDR_a5
// 
assign n0216 = 16'h0;
assign XRAM_ADDR_a5 = n0216;
// 
// PC_a5
// 
assign n0217 = 16'h1;
assign n0218 = ( PC + n0217 );
assign PC_a5 = n0218;
// 
// P2_a5
// 
assign P2_a5 = P2;
// 
// P3_a5
// 
assign P3_a5 = P3;
// 
// P0_a5
// 
assign P0_a5 = P0;
// 
// B_a5
// 
assign B_a5 = B;
// 
// XRAM_DATA_OUT_a5
// 
assign XRAM_DATA_OUT_a5 = n0051;
// 
// SP_a5
// 
assign SP_a5 = SP;
// 
// PSW_a5
// 
assign n0219 = PSW[7:1];
assign n0220 = ACC[7:7];
assign n0221 = ACC[6:6];
assign n0222 = ACC[5:5];
assign n0223 = ACC[4:4];
assign n0224 = ACC[3:3];
assign n0225 = ACC[2:2];
assign n0226 = ACC[1:1];
assign n0227 = ACC[0:0];
assign n0228 = ( n0226 ^ n0227 );
assign n0229 = ( n0225 ^ n0228 );
assign n0230 = ( n0224 ^ n0229 );
assign n0231 = ( n0223 ^ n0230 );
assign n0232 = ( n0222 ^ n0231 );
assign n0233 = ( n0221 ^ n0232 );
assign n0234 = ( n0220 ^ n0233 );
assign n0235 = { ( n0219 ), ( n0234 ) };
assign PSW_a5 = n0235;
// 
// ACC_a6
// 
// 
// B_a6
// 
// 
// DPL_a6
// 
// 
// DPH_a6
// 
// 
// XRAM_ADDR_a6
// 
// 
// PC_a6
// 
// 
// P2_a6
// 
// 
// P3_a6
// 
// 
// P0_a6
// 
// 
// P1_a6
// 
// 
// IRAM_a6
// 
assign n0236 = ( n0042 ) ? ( P3INREG ) : ( n0055 );
assign n0237 = ( n0040 ) ? ( IE ) : ( n0236 );
assign n0238 = ( n0038 ) ? ( P2INREG ) : ( n0237 );
assign n0239 = ( n0036 ) ? ( SBUF ) : ( n0238 );
assign n0240 = ( n0034 ) ? ( SCON ) : ( n0239 );
assign n0241 = ( n0032 ) ? ( P1INREG ) : ( n0240 );
assign n0242 = ( n0030 ) ? ( TH1 ) : ( n0241 );
assign n0243 = ( n0028 ) ? ( TL1 ) : ( n0242 );
assign n0244 = ( n0026 ) ? ( TH0 ) : ( n0243 );
assign n0245 = ( n0024 ) ? ( TL0 ) : ( n0244 );
assign n0246 = ( n0022 ) ? ( TMOD ) : ( n0245 );
assign n0247 = ( n0020 ) ? ( TCON ) : ( n0246 );
assign n0248 = ( n0018 ) ? ( PCON ) : ( n0247 );
assign n0249 = ( n0016 ) ? ( DPH ) : ( n0248 );
assign n0250 = ( n0014 ) ? ( DPL ) : ( n0249 );
assign n0251 = ( n0012 ) ? ( SP ) : ( n0250 );
assign n0252 = ( n0010 ) ? ( P0INREG ) : ( n0251 );
assign n0253 = ( n0007 ) ? ( RD_IRAM_1 ) : ( n0252 );
// 
// XRAM_DATA_OUT_a6
// 
// 
// SP_a6
// 
// 
// PSW_a6
// 
// 
// ACC_a7
// 
// 
// B_a7
// 
// 
// DPL_a7
// 
// 
// DPH_a7
// 
// 
// XRAM_ADDR_a7
// 
// 
// PC_a7
// 
// 
// P2_a7
// 
// 
// P3_a7
// 
// 
// P0_a7
// 
// 
// P1_a7
// 
// 
// IRAM_a7
// 
// 
// XRAM_DATA_OUT_a7
// 
// 
// SP_a7
// 
// 
// PSW_a7
// 
// 
// ACC_a8
// 
// 
// P1_a8
// 
// 
// DPL_a8
// 
// 
// DPH_a8
// 
// 
// XRAM_ADDR_a8
// 
// 
// PC_a8
// 
// 
// P2_a8
// 
// 
// P3_a8
// 
// 
// P0_a8
// 
// 
// B_a8
// 
// 
// IRAM_a8
// 
assign n0254 = ( n0007 ) ? ( RD_IRAM_0 ) : ( n0252 );
// 
// XRAM_DATA_OUT_a8
// 
// 
// SP_a8
// 
// 
// PSW_a8
// 
// 
// ACC_a9
// 
// 
// B_a9
// 
// 
// DPL_a9
// 
// 
// DPH_a9
// 
// 
// XRAM_ADDR_a9
// 
// 
// PC_a9
// 
// 
// P2_a9
// 
// 
// P3_a9
// 
// 
// P0_a9
// 
// 
// P1_a9
// 
// 
// IRAM_a9
// 
// 
// XRAM_DATA_OUT_a9
// 
// 
// SP_a9
// 
// 
// PSW_a9
// 
// 
// ACC_aa
// 
// 
// B_aa
// 
// 
// DPL_aa
// 
// 
// DPH_aa
// 
// 
// XRAM_ADDR_aa
// 
// 
// PC_aa
// 
// 
// P2_aa
// 
// 
// P3_aa
// 
// 
// P0_aa
// 
// 
// P1_aa
// 
// 
// IRAM_aa
// 
// 
// XRAM_DATA_OUT_aa
// 
// 
// SP_aa
// 
// 
// PSW_aa
// 
// 
// ACC_ab
// 
// 
// B_ab
// 
// 
// DPL_ab
// 
// 
// DPH_ab
// 
// 
// XRAM_ADDR_ab
// 
// 
// PC_ab
// 
// 
// P2_ab
// 
// 
// P3_ab
// 
// 
// P0_ab
// 
// 
// P1_ab
// 
// 
// IRAM_ab
// 
// 
// XRAM_DATA_OUT_ab
// 
// 
// SP_ab
// 
// 
// PSW_ab
// 
// 
// ACC_ac
// 
// 
// B_ac
// 
// 
// DPL_ac
// 
// 
// DPH_ac
// 
// 
// XRAM_ADDR_ac
// 
// 
// PC_ac
// 
// 
// P2_ac
// 
// 
// P3_ac
// 
// 
// P0_ac
// 
// 
// P1_ac
// 
// 
// IRAM_ac
// 
// 
// XRAM_DATA_OUT_ac
// 
// 
// SP_ac
// 
// 
// PSW_ac
// 
// 
// ACC_ad
// 
// 
// B_ad
// 
// 
// DPL_ad
// 
// 
// DPH_ad
// 
// 
// XRAM_ADDR_ad
// 
// 
// PC_ad
// 
// 
// P2_ad
// 
// 
// P3_ad
// 
// 
// P0_ad
// 
// 
// P1_ad
// 
// 
// IRAM_ad
// 
// 
// XRAM_DATA_OUT_ad
// 
// 
// SP_ad
// 
// 
// PSW_ad
// 
// 
// ACC_ae
// 
// 
// B_ae
// 
// 
// DPL_ae
// 
// 
// DPH_ae
// 
// 
// XRAM_ADDR_ae
// 
// 
// PC_ae
// 
// 
// P2_ae
// 
// 
// P3_ae
// 
// 
// P0_ae
// 
// 
// P1_ae
// 
// 
// IRAM_ae
// 
// 
// XRAM_DATA_OUT_ae
// 
// 
// SP_ae
// 
// 
// PSW_ae
// 
// 
// ACC_af
// 
// 
// P1_af
// 
// 
// DPL_af
// 
// 
// DPH_af
// 
// 
// XRAM_ADDR_af
// 
// 
// PC_af
// 
// 
// P2_af
// 
// 
// P3_af
// 
// 
// P0_af
// 
// 
// B_af
// 
// 
// IRAM_af
// 
// 
// XRAM_DATA_OUT_af
// 
// 
// SP_af
// 
// 
// PSW_af
// 
// 
// ACC_b0
// 
// 
// B_b0
// 
// 
// DPL_b0
// 
// 
// DPH_b0
// 
// 
// XRAM_ADDR_b0
// 
// 
// PC_b0
// 
// 
// P2_b0
// 
// 
// P3_b0
// 
// 
// P0_b0
// 
// 
// P1_b0
// 
// 
// XRAM_DATA_OUT_b0
// 
// 
// SP_b0
// 
// 
// PSW_b0
// 
// 
// ACC_b1
// 
// 
// P1_b1
// 
// 
// DPL_b1
// 
// 
// DPH_b1
// 
// 
// XRAM_ADDR_b1
// 
// 
// PC_b1
// 
// 
// P2_b1
// 
// 
// P3_b1
// 
// 
// P0_b1
// 
// 
// B_b1
// 
// 
// IRAM_b1
// 
// 
// XRAM_DATA_OUT_b1
// 
// 
// SP_b1
// 
// 
// PSW_b1
// 
// 
// ACC_b2
// 
// 
// B_b2
// 
// 
// DPL_b2
// 
// 
// DPH_b2
// 
// 
// XRAM_ADDR_b2
// 
// 
// PC_b2
// 
// 
// P2_b2
// 
// 
// P3_b2
// 
// 
// P0_b2
// 
// 
// P1_b2
// 
// 
// IRAM_b2
// 
assign n0255 = ( n0125 ) ? ( P3 ) : ( n0133 );
assign n0256 = ( n0124 ) ? ( IE ) : ( n0255 );
assign n0257 = ( n0123 ) ? ( P2 ) : ( n0256 );
assign n0258 = ( n0122 ) ? ( SCON ) : ( n0257 );
assign n0259 = ( n0121 ) ? ( P1 ) : ( n0258 );
assign n0260 = ( n0120 ) ? ( TCON ) : ( n0259 );
assign n0261 = ( n0119 ) ? ( P0 ) : ( n0260 );
assign n0262 = ( n0113 ) ? ( RD_IRAM_0 ) : ( n0261 );
assign n0263 = ( n0118 & n0262 );
assign n0264 = n0262[n0115];
assign n0265 = ~( n0264 );
assign n0266 = { 7'b0, n0265 };
assign n0267 = ( n0266 << n0116 );
assign n0268 = ( n0263 | n0267 );
// 
// XRAM_DATA_OUT_b2
// 
// 
// SP_b2
// 
// 
// PSW_b2
// 
// 
// ACC_b3
// 
// 
// B_b3
// 
// 
// DPL_b3
// 
// 
// DPH_b3
// 
// 
// XRAM_ADDR_b3
// 
// 
// PC_b3
// 
// 
// P2_b3
// 
// 
// P3_b3
// 
// 
// P0_b3
// 
// 
// P1_b3
// 
// 
// XRAM_DATA_OUT_b3
// 
// 
// SP_b3
// 
// 
// PSW_b3
// 
// 
// ACC_b4
// 
// 
// P1_b4
// 
// 
// DPL_b4
// 
// 
// DPH_b4
// 
// 
// XRAM_ADDR_b4
// 
// 
// PC_b4
// 
// 
// P2_b4
// 
// 
// P3_b4
// 
// 
// P0_b4
// 
// 
// B_b4
// 
// 
// XRAM_DATA_OUT_b4
// 
// 
// SP_b4
// 
// 
// PSW_b4
// 
// 
// ACC_b5
// 
// 
// B_b5
// 
// 
// DPL_b5
// 
// 
// DPH_b5
// 
// 
// XRAM_ADDR_b5
// 
// 
// PC_b5
// 
// 
// P2_b5
// 
// 
// P3_b5
// 
// 
// P0_b5
// 
// 
// P1_b5
// 
// 
// XRAM_DATA_OUT_b5
// 
// 
// SP_b5
// 
// 
// PSW_b5
// 
// 
// ACC_b6
// 
// 
// P1_b6
// 
// 
// DPL_b6
// 
// 
// DPH_b6
// 
// 
// XRAM_ADDR_b6
// 
// 
// PC_b6
// 
// 
// P2_b6
// 
// 
// P3_b6
// 
// 
// P0_b6
// 
// 
// B_b6
// 
// 
// XRAM_DATA_OUT_b6
// 
// 
// SP_b6
// 
// 
// PSW_b6
// 
// 
// ACC_b7
// 
// 
// P1_b7
// 
// 
// DPL_b7
// 
// 
// DPH_b7
// 
// 
// XRAM_ADDR_b7
// 
// 
// PC_b7
// 
// 
// P2_b7
// 
// 
// P3_b7
// 
// 
// P0_b7
// 
// 
// B_b7
// 
// 
// XRAM_DATA_OUT_b7
// 
// 
// SP_b7
// 
// 
// PSW_b7
// 
// 
// ACC_b8
// 
// 
// P1_b8
// 
// 
// DPL_b8
// 
// 
// DPH_b8
// 
// 
// XRAM_ADDR_b8
// 
// 
// PC_b8
// 
// 
// P2_b8
// 
// 
// P3_b8
// 
// 
// P0_b8
// 
// 
// B_b8
// 
// 
// XRAM_DATA_OUT_b8
// 
// 
// SP_b8
// 
// 
// PSW_b8
// 
// 
// ACC_b9
// 
// 
// P1_b9
// 
// 
// DPL_b9
// 
// 
// DPH_b9
// 
// 
// XRAM_ADDR_b9
// 
// 
// PC_b9
// 
// 
// P2_b9
// 
// 
// P3_b9
// 
// 
// P0_b9
// 
// 
// B_b9
// 
// 
// XRAM_DATA_OUT_b9
// 
// 
// SP_b9
// 
// 
// PSW_b9
// 
// 
// ACC_ba
// 
// 
// B_ba
// 
// 
// DPL_ba
// 
// 
// DPH_ba
// 
// 
// XRAM_ADDR_ba
// 
// 
// PC_ba
// 
// 
// P2_ba
// 
// 
// P3_ba
// 
// 
// P0_ba
// 
// 
// P1_ba
// 
// 
// XRAM_DATA_OUT_ba
// 
// 
// SP_ba
// 
// 
// PSW_ba
// 
// 
// ACC_bb
// 
// 
// B_bb
// 
// 
// DPL_bb
// 
// 
// DPH_bb
// 
// 
// XRAM_ADDR_bb
// 
// 
// PC_bb
// 
// 
// P2_bb
// 
// 
// P3_bb
// 
// 
// P0_bb
// 
// 
// P1_bb
// 
// 
// XRAM_DATA_OUT_bb
// 
// 
// SP_bb
// 
// 
// PSW_bb
// 
// 
// ACC_bc
// 
// 
// B_bc
// 
// 
// DPL_bc
// 
// 
// DPH_bc
// 
// 
// XRAM_ADDR_bc
// 
// 
// PC_bc
// 
// 
// P2_bc
// 
// 
// P3_bc
// 
// 
// P0_bc
// 
// 
// P1_bc
// 
// 
// XRAM_DATA_OUT_bc
// 
// 
// SP_bc
// 
// 
// PSW_bc
// 
// 
// ACC_bd
// 
// 
// B_bd
// 
// 
// DPL_bd
// 
// 
// DPH_bd
// 
// 
// XRAM_ADDR_bd
// 
// 
// PC_bd
// 
// 
// P2_bd
// 
// 
// P3_bd
// 
// 
// P0_bd
// 
// 
// P1_bd
// 
// 
// XRAM_DATA_OUT_bd
// 
// 
// SP_bd
// 
// 
// PSW_bd
// 
// 
// ACC_be
// 
// 
// B_be
// 
// 
// DPL_be
// 
// 
// DPH_be
// 
// 
// XRAM_ADDR_be
// 
// 
// PC_be
// 
// 
// P2_be
// 
// 
// P3_be
// 
// 
// P0_be
// 
// 
// P1_be
// 
// 
// XRAM_DATA_OUT_be
// 
// 
// SP_be
// 
// 
// PSW_be
// 
// 
// ACC_bf
// 
// 
// B_bf
// 
// 
// DPL_bf
// 
// 
// DPH_bf
// 
// 
// XRAM_ADDR_bf
// 
// 
// PC_bf
// 
// 
// P2_bf
// 
// 
// P3_bf
// 
// 
// P0_bf
// 
// 
// P1_bf
// 
// 
// XRAM_DATA_OUT_bf
// 
// 
// SP_bf
// 
// 
// PSW_bf
// 
// 
// ACC_c0
// 
// 
// P1_c0
// 
// 
// DPL_c0
// 
// 
// DPH_c0
// 
// 
// XRAM_ADDR_c0
// 
// 
// PC_c0
// 
// 
// P2_c0
// 
// 
// P3_c0
// 
// 
// P0_c0
// 
// 
// B_c0
// 
// 
// IRAM_c0
// 
// 
// XRAM_DATA_OUT_c0
// 
// 
// SP_c0
// 
// 
// PSW_c0
// 
// 
// ACC_c1
// 
// 
// B_c1
// 
// 
// DPL_c1
// 
// 
// DPH_c1
// 
// 
// XRAM_ADDR_c1
// 
// 
// PC_c1
// 
// 
// P2_c1
// 
// 
// P3_c1
// 
// 
// P0_c1
// 
// 
// P1_c1
// 
// 
// XRAM_DATA_OUT_c1
// 
// 
// SP_c1
// 
// 
// PSW_c1
// 
// 
// ACC_c2
// 
// 
// P1_c2
// 
// 
// DPL_c2
// 
// 
// DPH_c2
// 
// 
// XRAM_ADDR_c2
// 
// 
// PC_c2
// 
// 
// P2_c2
// 
// 
// P3_c2
// 
// 
// P0_c2
// 
// 
// B_c2
// 
// 
// IRAM_c2
// 
assign n0269 = ( n0263 | n0144 );
// 
// XRAM_DATA_OUT_c2
// 
// 
// SP_c2
// 
// 
// PSW_c2
// 
// 
// ACC_c3
// 
// 
// B_c3
// 
// 
// DPL_c3
// 
// 
// DPH_c3
// 
// 
// XRAM_ADDR_c3
// 
// 
// PC_c3
// 
// 
// P2_c3
// 
// 
// P3_c3
// 
// 
// P0_c3
// 
// 
// P1_c3
// 
// 
// XRAM_DATA_OUT_c3
// 
// 
// SP_c3
// 
// 
// PSW_c3
// 
// 
// ACC_c4
// 
// 
// B_c4
// 
// 
// DPL_c4
// 
// 
// DPH_c4
// 
// 
// XRAM_ADDR_c4
// 
// 
// PC_c4
// 
// 
// P2_c4
// 
// 
// P3_c4
// 
// 
// P0_c4
// 
// 
// P1_c4
// 
// 
// XRAM_DATA_OUT_c4
// 
// 
// SP_c4
// 
// 
// PSW_c4
// 
// 
// ACC_c5
// 
// 
// B_c5
// 
// 
// DPL_c5
// 
// 
// DPH_c5
// 
// 
// XRAM_ADDR_c5
// 
// 
// PC_c5
// 
// 
// P2_c5
// 
// 
// P3_c5
// 
// 
// P0_c5
// 
// 
// P1_c5
// 
// 
// IRAM_c5
// 
// 
// XRAM_DATA_OUT_c5
// 
// 
// SP_c5
// 
// 
// PSW_c5
// 
// 
// ACC_c6
// 
// 
// P1_c6
// 
// 
// DPL_c6
// 
// 
// DPH_c6
// 
// 
// XRAM_ADDR_c6
// 
// 
// PC_c6
// 
// 
// P2_c6
// 
// 
// P3_c6
// 
// 
// P0_c6
// 
// 
// B_c6
// 
// 
// IRAM_c6
// 
// 
// XRAM_DATA_OUT_c6
// 
// 
// SP_c6
// 
// 
// PSW_c6
// 
// 
// ACC_c7
// 
// 
// P1_c7
// 
// 
// DPL_c7
// 
// 
// DPH_c7
// 
// 
// XRAM_ADDR_c7
// 
// 
// PC_c7
// 
// 
// P2_c7
// 
// 
// P3_c7
// 
// 
// P0_c7
// 
// 
// B_c7
// 
// 
// IRAM_c7
// 
// 
// XRAM_DATA_OUT_c7
// 
// 
// SP_c7
// 
// 
// PSW_c7
// 
// 
// ACC_c8
// 
// 
// B_c8
// 
// 
// DPL_c8
// 
// 
// DPH_c8
// 
// 
// XRAM_ADDR_c8
// 
// 
// PC_c8
// 
// 
// P2_c8
// 
// 
// P3_c8
// 
// 
// P0_c8
// 
// 
// P1_c8
// 
// 
// IRAM_c8
// 
// 
// XRAM_DATA_OUT_c8
// 
// 
// SP_c8
// 
// 
// PSW_c8
// 
// 
// ACC_c9
// 
// 
// B_c9
// 
// 
// DPL_c9
// 
// 
// DPH_c9
// 
// 
// XRAM_ADDR_c9
// 
// 
// PC_c9
// 
// 
// P2_c9
// 
// 
// P3_c9
// 
// 
// P0_c9
// 
// 
// P1_c9
// 
// 
// IRAM_c9
// 
// 
// XRAM_DATA_OUT_c9
// 
// 
// SP_c9
// 
// 
// PSW_c9
// 
// 
// ACC_ca
// 
// 
// B_ca
// 
// 
// DPL_ca
// 
// 
// DPH_ca
// 
// 
// XRAM_ADDR_ca
// 
// 
// PC_ca
// 
// 
// P2_ca
// 
// 
// P3_ca
// 
// 
// P0_ca
// 
// 
// P1_ca
// 
// 
// IRAM_ca
// 
// 
// XRAM_DATA_OUT_ca
// 
// 
// SP_ca
// 
// 
// PSW_ca
// 
// 
// ACC_cb
// 
// 
// B_cb
// 
// 
// DPL_cb
// 
// 
// DPH_cb
// 
// 
// XRAM_ADDR_cb
// 
// 
// PC_cb
// 
// 
// P2_cb
// 
// 
// P3_cb
// 
// 
// P0_cb
// 
// 
// P1_cb
// 
// 
// IRAM_cb
// 
// 
// XRAM_DATA_OUT_cb
// 
// 
// SP_cb
// 
// 
// PSW_cb
// 
// 
// ACC_cc
// 
// 
// B_cc
// 
// 
// DPL_cc
// 
// 
// DPH_cc
// 
// 
// XRAM_ADDR_cc
// 
// 
// PC_cc
// 
// 
// P2_cc
// 
// 
// P3_cc
// 
// 
// P0_cc
// 
// 
// P1_cc
// 
// 
// IRAM_cc
// 
// 
// XRAM_DATA_OUT_cc
// 
// 
// SP_cc
// 
// 
// PSW_cc
// 
// 
// ACC_cd
// 
// 
// B_cd
// 
// 
// DPL_cd
// 
// 
// DPH_cd
// 
// 
// XRAM_ADDR_cd
// 
// 
// PC_cd
// 
// 
// P2_cd
// 
// 
// P3_cd
// 
// 
// P0_cd
// 
// 
// P1_cd
// 
// 
// IRAM_cd
// 
// 
// XRAM_DATA_OUT_cd
// 
// 
// SP_cd
// 
// 
// PSW_cd
// 
// 
// ACC_ce
// 
// 
// B_ce
// 
// 
// DPL_ce
// 
// 
// DPH_ce
// 
// 
// XRAM_ADDR_ce
// 
// 
// PC_ce
// 
// 
// P2_ce
// 
// 
// P3_ce
// 
// 
// P0_ce
// 
// 
// P1_ce
// 
// 
// IRAM_ce
// 
// 
// XRAM_DATA_OUT_ce
// 
// 
// SP_ce
// 
// 
// PSW_ce
// 
// 
// ACC_cf
// 
// 
// B_cf
// 
// 
// DPL_cf
// 
// 
// DPH_cf
// 
// 
// XRAM_ADDR_cf
// 
// 
// PC_cf
// 
// 
// P2_cf
// 
// 
// P3_cf
// 
// 
// P0_cf
// 
// 
// P1_cf
// 
// 
// IRAM_cf
// 
// 
// XRAM_DATA_OUT_cf
// 
// 
// SP_cf
// 
// 
// PSW_cf
// 
// 
// ACC_d0
// 
// 
// P1_d0
// 
// 
// DPL_d0
// 
// 
// DPH_d0
// 
// 
// XRAM_ADDR_d0
// 
// 
// PC_d0
// 
// 
// P2_d0
// 
// 
// P3_d0
// 
// 
// P0_d0
// 
// 
// B_d0
// 
// 
// IRAM_d0
// 
// 
// XRAM_DATA_OUT_d0
// 
// 
// SP_d0
// 
// 
// PSW_d0
// 
// 
// ACC_d1
// 
// 
// B_d1
// 
// 
// DPL_d1
// 
// 
// DPH_d1
// 
// 
// XRAM_ADDR_d1
// 
// 
// PC_d1
// 
// 
// P2_d1
// 
// 
// P3_d1
// 
// 
// P0_d1
// 
// 
// P1_d1
// 
// 
// IRAM_d1
// 
// 
// XRAM_DATA_OUT_d1
// 
// 
// SP_d1
// 
// 
// PSW_d1
// 
// 
// ACC_d2
// 
// 
// B_d2
// 
// 
// DPL_d2
// 
// 
// DPH_d2
// 
// 
// XRAM_ADDR_d2
// 
// 
// PC_d2
// 
// 
// P2_d2
// 
// 
// P3_d2
// 
// 
// P0_d2
// 
// 
// P1_d2
// 
// 
// IRAM_d2
// 
assign n0270 = { 7'b0, n0104 };
assign n0271 = ( n0270 << n0116 );
assign n0272 = ( n0263 | n0271 );
// 
// XRAM_DATA_OUT_d2
// 
// 
// SP_d2
// 
// 
// PSW_d2
// 
// 
// ACC_d3
// 
// 
// B_d3
// 
// 
// DPL_d3
// 
// 
// DPH_d3
// 
// 
// XRAM_ADDR_d3
// 
// 
// PC_d3
// 
// 
// P2_d3
// 
// 
// P3_d3
// 
// 
// P0_d3
// 
// 
// P1_d3
// 
// 
// XRAM_DATA_OUT_d3
// 
// 
// SP_d3
// 
// 
// PSW_d3
// 
// 
// ACC_d4
// 
// 
// B_d4
// 
// 
// DPL_d4
// 
// 
// DPH_d4
// 
// 
// XRAM_ADDR_d4
// 
// 
// PC_d4
// 
// 
// P2_d4
// 
// 
// P3_d4
// 
// 
// P0_d4
// 
// 
// P1_d4
// 
// 
// XRAM_DATA_OUT_d4
// 
// 
// SP_d4
// 
// 
// PSW_d4
// 
// 
// ACC_d5
// 
// 
// B_d5
// 
// 
// DPL_d5
// 
// 
// DPH_d5
// 
// 
// XRAM_ADDR_d5
// 
// 
// PC_d5
// 
// 
// P2_d5
// 
// 
// P3_d5
// 
// 
// P0_d5
// 
// 
// P1_d5
// 
// 
// IRAM_d5
// 
// 
// XRAM_DATA_OUT_d5
// 
// 
// SP_d5
// 
// 
// PSW_d5
// 
// 
// ACC_d6
// 
// 
// B_d6
// 
// 
// DPL_d6
// 
// 
// DPH_d6
// 
// 
// XRAM_ADDR_d6
// 
// 
// PC_d6
// 
// 
// P2_d6
// 
// 
// P3_d6
// 
// 
// P0_d6
// 
// 
// P1_d6
// 
// 
// IRAM_d6
// 
assign n0273 = RD_IRAM_1[7:4];
assign n0274 = ACC[3:0];
assign n0275 = { ( n0273 ), ( n0274 ) };
// 
// XRAM_DATA_OUT_d6
// 
// 
// SP_d6
// 
// 
// PSW_d6
// 
// 
// ACC_d7
// 
// 
// P1_d7
// 
// 
// DPL_d7
// 
// 
// DPH_d7
// 
// 
// XRAM_ADDR_d7
// 
// 
// PC_d7
// 
// 
// P2_d7
// 
// 
// P3_d7
// 
// 
// P0_d7
// 
// 
// B_d7
// 
// 
// IRAM_d7
// 
// 
// XRAM_DATA_OUT_d7
// 
// 
// SP_d7
// 
// 
// PSW_d7
// 
// 
// ACC_d8
// 
// 
// B_d8
// 
// 
// DPL_d8
// 
// 
// DPH_d8
// 
// 
// XRAM_ADDR_d8
// 
// 
// PC_d8
// 
// 
// P2_d8
// 
// 
// P3_d8
// 
// 
// P0_d8
// 
// 
// P1_d8
// 
// 
// IRAM_d8
// 
// 
// XRAM_DATA_OUT_d8
// 
// 
// SP_d8
// 
// 
// PSW_d8
// 
// 
// ACC_d9
// 
// 
// B_d9
// 
// 
// DPL_d9
// 
// 
// DPH_d9
// 
// 
// XRAM_ADDR_d9
// 
// 
// PC_d9
// 
// 
// P2_d9
// 
// 
// P3_d9
// 
// 
// P0_d9
// 
// 
// P1_d9
// 
// 
// IRAM_d9
// 
// 
// XRAM_DATA_OUT_d9
// 
// 
// SP_d9
// 
// 
// PSW_d9
// 
// 
// ACC_da
// 
// 
// B_da
// 
// 
// DPL_da
// 
// 
// DPH_da
// 
// 
// XRAM_ADDR_da
// 
// 
// PC_da
// 
// 
// P2_da
// 
// 
// P3_da
// 
// 
// P0_da
// 
// 
// P1_da
// 
// 
// IRAM_da
// 
// 
// XRAM_DATA_OUT_da
// 
// 
// SP_da
// 
// 
// PSW_da
// 
// 
// ACC_db
// 
// 
// B_db
// 
// 
// DPL_db
// 
// 
// DPH_db
// 
// 
// XRAM_ADDR_db
// 
// 
// PC_db
// 
// 
// P2_db
// 
// 
// P3_db
// 
// 
// P0_db
// 
// 
// P1_db
// 
// 
// IRAM_db
// 
// 
// XRAM_DATA_OUT_db
// 
// 
// SP_db
// 
// 
// PSW_db
// 
// 
// ACC_dc
// 
// 
// B_dc
// 
// 
// DPL_dc
// 
// 
// DPH_dc
// 
// 
// XRAM_ADDR_dc
// 
// 
// PC_dc
// 
// 
// P2_dc
// 
// 
// P3_dc
// 
// 
// P0_dc
// 
// 
// P1_dc
// 
// 
// IRAM_dc
// 
// 
// XRAM_DATA_OUT_dc
// 
// 
// SP_dc
// 
// 
// PSW_dc
// 
// 
// ACC_dd
// 
// 
// B_dd
// 
// 
// DPL_dd
// 
// 
// DPH_dd
// 
// 
// XRAM_ADDR_dd
// 
// 
// PC_dd
// 
// 
// P2_dd
// 
// 
// P3_dd
// 
// 
// P0_dd
// 
// 
// P1_dd
// 
// 
// IRAM_dd
// 
// 
// XRAM_DATA_OUT_dd
// 
// 
// SP_dd
// 
// 
// PSW_dd
// 
// 
// ACC_de
// 
// 
// P1_de
// 
// 
// DPL_de
// 
// 
// DPH_de
// 
// 
// XRAM_ADDR_de
// 
// 
// PC_de
// 
// 
// P2_de
// 
// 
// P3_de
// 
// 
// P0_de
// 
// 
// B_de
// 
// 
// IRAM_de
// 
// 
// XRAM_DATA_OUT_de
// 
// 
// SP_de
// 
// 
// PSW_de
// 
// 
// ACC_df
// 
// 
// B_df
// 
// 
// DPL_df
// 
// 
// DPH_df
// 
// 
// XRAM_ADDR_df
// 
// 
// PC_df
// 
// 
// P2_df
// 
// 
// P3_df
// 
// 
// P0_df
// 
// 
// P1_df
// 
// 
// IRAM_df
// 
// 
// XRAM_DATA_OUT_df
// 
// 
// SP_df
// 
// 
// PSW_df
// 
// 
// ACC_e0
// 
// 
// B_e0
// 
// 
// DPL_e0
// 
// 
// DPH_e0
// 
// 
// XRAM_ADDR_e0
// 
// 
// PC_e0
// 
// 
// P2_e0
// 
// 
// P3_e0
// 
// 
// P0_e0
// 
// 
// P1_e0
// 
// 
// XRAM_DATA_OUT_e0
// 
// 
// SP_e0
// 
// 
// PSW_e0
// 
// 
// ACC_e1
// 
// 
// P1_e1
// 
// 
// DPL_e1
// 
// 
// DPH_e1
// 
// 
// XRAM_ADDR_e1
// 
// 
// PC_e1
// 
// 
// P2_e1
// 
// 
// P3_e1
// 
// 
// P0_e1
// 
// 
// B_e1
// 
// 
// XRAM_DATA_OUT_e1
// 
// 
// SP_e1
// 
// 
// PSW_e1
// 
// 
// ACC_e2
// 
// 
// P1_e2
// 
// 
// DPL_e2
// 
// 
// DPH_e2
// 
// 
// XRAM_ADDR_e2
// 
// 
// PC_e2
// 
// 
// P2_e2
// 
// 
// P3_e2
// 
// 
// P0_e2
// 
// 
// B_e2
// 
// 
// XRAM_DATA_OUT_e2
// 
// 
// SP_e2
// 
// 
// PSW_e2
// 
// 
// ACC_e3
// 
// 
// B_e3
// 
// 
// DPL_e3
// 
// 
// DPH_e3
// 
// 
// XRAM_ADDR_e3
// 
// 
// PC_e3
// 
// 
// P2_e3
// 
// 
// P3_e3
// 
// 
// P0_e3
// 
// 
// P1_e3
// 
// 
// XRAM_DATA_OUT_e3
// 
// 
// SP_e3
// 
// 
// PSW_e3
// 
// 
// ACC_e4
// 
// 
// P1_e4
// 
// 
// DPL_e4
// 
// 
// DPH_e4
// 
// 
// XRAM_ADDR_e4
// 
// 
// PC_e4
// 
// 
// P2_e4
// 
// 
// P3_e4
// 
// 
// P0_e4
// 
// 
// B_e4
// 
// 
// XRAM_DATA_OUT_e4
// 
// 
// SP_e4
// 
// 
// PSW_e4
// 
// 
// ACC_e5
// 
// 
// P1_e5
// 
// 
// DPL_e5
// 
// 
// DPH_e5
// 
// 
// XRAM_ADDR_e5
// 
// 
// PC_e5
// 
// 
// P2_e5
// 
// 
// P3_e5
// 
// 
// P0_e5
// 
// 
// B_e5
// 
// 
// XRAM_DATA_OUT_e5
// 
// 
// SP_e5
// 
// 
// PSW_e5
// 
// 
// ACC_e6
// 
// 
// B_e6
// 
// 
// DPL_e6
// 
// 
// DPH_e6
// 
// 
// XRAM_ADDR_e6
// 
// 
// PC_e6
// 
// 
// P2_e6
// 
// 
// P3_e6
// 
// 
// P0_e6
// 
// 
// P1_e6
// 
// 
// XRAM_DATA_OUT_e6
// 
// 
// SP_e6
// 
// 
// PSW_e6
// 
// 
// ACC_e7
// 
// 
// B_e7
// 
// 
// DPL_e7
// 
// 
// DPH_e7
// 
// 
// XRAM_ADDR_e7
// 
// 
// PC_e7
// 
// 
// P2_e7
// 
// 
// P3_e7
// 
// 
// P0_e7
// 
// 
// P1_e7
// 
// 
// XRAM_DATA_OUT_e7
// 
// 
// SP_e7
// 
// 
// PSW_e7
// 
// 
// ACC_e8
// 
// 
// P1_e8
// 
// 
// DPL_e8
// 
// 
// DPH_e8
// 
// 
// XRAM_ADDR_e8
// 
// 
// PC_e8
// 
// 
// P2_e8
// 
// 
// P3_e8
// 
// 
// P0_e8
// 
// 
// B_e8
// 
// 
// XRAM_DATA_OUT_e8
// 
// 
// SP_e8
// 
// 
// PSW_e8
// 
// 
// ACC_e9
// 
// 
// P1_e9
// 
// 
// DPL_e9
// 
// 
// DPH_e9
// 
// 
// XRAM_ADDR_e9
// 
// 
// PC_e9
// 
// 
// P2_e9
// 
// 
// P3_e9
// 
// 
// P0_e9
// 
// 
// B_e9
// 
// 
// XRAM_DATA_OUT_e9
// 
// 
// SP_e9
// 
// 
// PSW_e9
// 
// 
// ACC_ea
// 
// 
// B_ea
// 
// 
// DPL_ea
// 
// 
// DPH_ea
// 
// 
// XRAM_ADDR_ea
// 
// 
// PC_ea
// 
// 
// P2_ea
// 
// 
// P3_ea
// 
// 
// P0_ea
// 
// 
// P1_ea
// 
// 
// XRAM_DATA_OUT_ea
// 
// 
// SP_ea
// 
// 
// PSW_ea
// 
// 
// ACC_eb
// 
// 
// P1_eb
// 
// 
// DPL_eb
// 
// 
// DPH_eb
// 
// 
// XRAM_ADDR_eb
// 
// 
// PC_eb
// 
// 
// P2_eb
// 
// 
// P3_eb
// 
// 
// P0_eb
// 
// 
// B_eb
// 
// 
// XRAM_DATA_OUT_eb
// 
// 
// SP_eb
// 
// 
// PSW_eb
// 
// 
// ACC_ec
// 
// 
// P1_ec
// 
// 
// DPL_ec
// 
// 
// DPH_ec
// 
// 
// XRAM_ADDR_ec
// 
// 
// PC_ec
// 
// 
// P2_ec
// 
// 
// P3_ec
// 
// 
// P0_ec
// 
// 
// B_ec
// 
// 
// XRAM_DATA_OUT_ec
// 
// 
// SP_ec
// 
// 
// PSW_ec
// 
// 
// ACC_ed
// 
// 
// B_ed
// 
// 
// DPL_ed
// 
// 
// DPH_ed
// 
// 
// XRAM_ADDR_ed
// 
// 
// PC_ed
// 
// 
// P2_ed
// 
// 
// P3_ed
// 
// 
// P0_ed
// 
// 
// P1_ed
// 
// 
// XRAM_DATA_OUT_ed
// 
// 
// SP_ed
// 
// 
// PSW_ed
// 
// 
// ACC_ee
// 
// 
// B_ee
// 
// 
// DPL_ee
// 
// 
// DPH_ee
// 
// 
// XRAM_ADDR_ee
// 
// 
// PC_ee
// 
// 
// P2_ee
// 
// 
// P3_ee
// 
// 
// P0_ee
// 
// 
// P1_ee
// 
// 
// XRAM_DATA_OUT_ee
// 
// 
// SP_ee
// 
// 
// PSW_ee
// 
// 
// ACC_ef
// 
// 
// B_ef
// 
// 
// DPL_ef
// 
// 
// DPH_ef
// 
// 
// XRAM_ADDR_ef
// 
// 
// PC_ef
// 
// 
// P2_ef
// 
// 
// P3_ef
// 
// 
// P0_ef
// 
// 
// P1_ef
// 
// 
// XRAM_DATA_OUT_ef
// 
// 
// SP_ef
// 
// 
// PSW_ef
// 
// 
// ACC_f0
// 
// 
// B_f0
// 
// 
// DPL_f0
// 
// 
// DPH_f0
// 
// 
// XRAM_ADDR_f0
// 
// 
// PC_f0
// 
// 
// P2_f0
// 
// 
// P3_f0
// 
// 
// P0_f0
// 
// 
// P1_f0
// 
// 
// XRAM_DATA_OUT_f0
// 
// 
// SP_f0
// 
// 
// PSW_f0
// 
// 
// ACC_f1
// 
// 
// P1_f1
// 
// 
// DPL_f1
// 
// 
// DPH_f1
// 
// 
// XRAM_ADDR_f1
// 
// 
// PC_f1
// 
// 
// P2_f1
// 
// 
// P3_f1
// 
// 
// P0_f1
// 
// 
// B_f1
// 
// 
// IRAM_f1
// 
// 
// XRAM_DATA_OUT_f1
// 
// 
// SP_f1
// 
// 
// PSW_f1
// 
// 
// ACC_f2
// 
// 
// B_f2
// 
// 
// DPL_f2
// 
// 
// DPH_f2
// 
// 
// XRAM_ADDR_f2
// 
// 
// PC_f2
// 
// 
// P2_f2
// 
// 
// P3_f2
// 
// 
// P0_f2
// 
// 
// P1_f2
// 
// 
// XRAM_DATA_OUT_f2
// 
// 
// SP_f2
// 
// 
// PSW_f2
// 
// 
// ACC_f3
// 
// 
// P1_f3
// 
// 
// DPL_f3
// 
// 
// DPH_f3
// 
// 
// XRAM_ADDR_f3
// 
// 
// PC_f3
// 
// 
// P2_f3
// 
// 
// P3_f3
// 
// 
// P0_f3
// 
// 
// B_f3
// 
// 
// XRAM_DATA_OUT_f3
// 
// 
// SP_f3
// 
// 
// PSW_f3
// 
// 
// ACC_f4
// 
// 
// B_f4
// 
// 
// DPL_f4
// 
// 
// DPH_f4
// 
// 
// XRAM_ADDR_f4
// 
// 
// PC_f4
// 
// 
// P2_f4
// 
// 
// P3_f4
// 
// 
// P0_f4
// 
// 
// P1_f4
// 
// 
// XRAM_DATA_OUT_f4
// 
// 
// SP_f4
// 
// 
// PSW_f4
// 
// 
// ACC_f5
// 
// 
// B_f5
// 
// 
// DPL_f5
// 
// 
// DPH_f5
// 
// 
// XRAM_ADDR_f5
// 
// 
// PC_f5
// 
// 
// P2_f5
// 
// 
// P3_f5
// 
// 
// P0_f5
// 
// 
// P1_f5
// 
// 
// IRAM_f5
// 
// 
// XRAM_DATA_OUT_f5
// 
// 
// SP_f5
// 
// 
// PSW_f5
// 
// 
// ACC_f6
// 
// 
// P1_f6
// 
// 
// DPL_f6
// 
// 
// DPH_f6
// 
// 
// XRAM_ADDR_f6
// 
// 
// PC_f6
// 
// 
// P2_f6
// 
// 
// P3_f6
// 
// 
// P0_f6
// 
// 
// B_f6
// 
// 
// IRAM_f6
// 
// 
// XRAM_DATA_OUT_f6
// 
// 
// SP_f6
// 
// 
// PSW_f6
// 
// 
// ACC_f7
// 
// 
// B_f7
// 
// 
// DPL_f7
// 
// 
// DPH_f7
// 
// 
// XRAM_ADDR_f7
// 
// 
// PC_f7
// 
// 
// P2_f7
// 
// 
// P3_f7
// 
// 
// P0_f7
// 
// 
// P1_f7
// 
// 
// IRAM_f7
// 
// 
// XRAM_DATA_OUT_f7
// 
// 
// SP_f7
// 
// 
// PSW_f7
// 
// 
// ACC_f8
// 
// 
// P1_f8
// 
// 
// DPL_f8
// 
// 
// DPH_f8
// 
// 
// XRAM_ADDR_f8
// 
// 
// PC_f8
// 
// 
// P2_f8
// 
// 
// P3_f8
// 
// 
// P0_f8
// 
// 
// B_f8
// 
// 
// IRAM_f8
// 
// 
// XRAM_DATA_OUT_f8
// 
// 
// SP_f8
// 
// 
// PSW_f8
// 
// 
// ACC_f9
// 
// 
// B_f9
// 
// 
// DPL_f9
// 
// 
// DPH_f9
// 
// 
// XRAM_ADDR_f9
// 
// 
// PC_f9
// 
// 
// P2_f9
// 
// 
// P3_f9
// 
// 
// P0_f9
// 
// 
// P1_f9
// 
// 
// IRAM_f9
// 
// 
// XRAM_DATA_OUT_f9
// 
// 
// SP_f9
// 
// 
// PSW_f9
// 
// 
// ACC_fa
// 
// 
// B_fa
// 
// 
// DPL_fa
// 
// 
// DPH_fa
// 
// 
// XRAM_ADDR_fa
// 
// 
// PC_fa
// 
// 
// P2_fa
// 
// 
// P3_fa
// 
// 
// P0_fa
// 
// 
// P1_fa
// 
// 
// IRAM_fa
// 
// 
// XRAM_DATA_OUT_fa
// 
// 
// SP_fa
// 
// 
// PSW_fa
// 
// 
// ACC_fb
// 
// 
// P1_fb
// 
// 
// DPL_fb
// 
// 
// DPH_fb
// 
// 
// XRAM_ADDR_fb
// 
// 
// PC_fb
// 
// 
// P2_fb
// 
// 
// P3_fb
// 
// 
// P0_fb
// 
// 
// B_fb
// 
// 
// IRAM_fb
// 
// 
// XRAM_DATA_OUT_fb
// 
// 
// SP_fb
// 
// 
// PSW_fb
// 
// 
// ACC_fc
// 
// 
// P1_fc
// 
// 
// DPL_fc
// 
// 
// DPH_fc
// 
// 
// XRAM_ADDR_fc
// 
// 
// PC_fc
// 
// 
// P2_fc
// 
// 
// P3_fc
// 
// 
// P0_fc
// 
// 
// B_fc
// 
// 
// IRAM_fc
// 
// 
// XRAM_DATA_OUT_fc
// 
// 
// SP_fc
// 
// 
// PSW_fc
// 
// 
// ACC_fd
// 
// 
// B_fd
// 
// 
// DPL_fd
// 
// 
// DPH_fd
// 
// 
// XRAM_ADDR_fd
// 
// 
// PC_fd
// 
// 
// P2_fd
// 
// 
// P3_fd
// 
// 
// P0_fd
// 
// 
// P1_fd
// 
// 
// IRAM_fd
// 
// 
// XRAM_DATA_OUT_fd
// 
// 
// SP_fd
// 
// 
// PSW_fd
// 
// 
// ACC_fe
// 
// 
// B_fe
// 
// 
// DPL_fe
// 
// 
// DPH_fe
// 
// 
// XRAM_ADDR_fe
// 
// 
// PC_fe
// 
// 
// P2_fe
// 
// 
// P3_fe
// 
// 
// P0_fe
// 
// 
// P1_fe
// 
// 
// IRAM_fe
// 
// 
// XRAM_DATA_OUT_fe
// 
// 
// SP_fe
// 
// 
// PSW_fe
// 
// 
// ACC_ff
// 
// 
// B_ff
// 
// 
// DPL_ff
// 
// 
// DPH_ff
// 
// 
// XRAM_ADDR_ff
// 
// 
// PC_ff
// 
// 
// P2_ff
// 
// 
// P3_ff
// 
// 
// P0_ff
// 
// 
// P1_ff
// 
// 
// IRAM_ff
// 
// 
// XRAM_DATA_OUT_ff
// 
// 
// SP_ff
// 
// 
// PSW_ff
// 
assign n0276 = 8'ha5;
assign n0277 = ( RD_ROM_0 == n0276 );
assign ACC_next =   ( n0277 ) ? ( ACC_a5 ) :  ( ACC_abstr );
assign P2_next =   ( n0277 ) ? ( P2_a5 ) :  ( P2_abstr );
assign P0_next =   ( n0277 ) ? ( P0_a5 ) :  ( P0_abstr );
assign P1_next =   ( n0277 ) ? ( P1_a5 ) :  ( P1_abstr );
assign XRAM_ADDR_next =   ( n0277 ) ? ( XRAM_ADDR_a5 ) :  ( XRAM_ADDR_abstr );
assign P3_next =   ( n0277 ) ? ( P3_a5 ) :  ( P3_abstr );
assign SP_next =   ( n0277 ) ? ( SP_a5 ) :  ( SP_abstr );
assign PC_next =   ( n0277 ) ? ( PC_a5 ) :  ( PC_abstr );
assign B_next =   ( n0277 ) ? ( B_a5 ) :  ( B_abstr );
assign XRAM_DATA_OUT_next =   ( n0277 ) ? ( XRAM_DATA_OUT_a5 ) :  ( XRAM_DATA_OUT_abstr );
assign DPL_next =   ( n0277 ) ? ( DPL_a5 ) :  ( DPL_abstr );
assign PSW_next =   ( n0277 ) ? ( PSW_a5 ) :  ( PSW_abstr );
assign DPH_next =   ( n0277 ) ? ( DPH_a5 ) :  ( DPH_abstr );
assign n0278 = 8'h5;
assign n0279 = ( RD_ROM_0 == n0278 );
assign n0280 = 8'h6;
assign n0281 = ( RD_ROM_0 == n0280 );
assign n0282 = 8'h7;
assign n0283 = ( RD_ROM_0 == n0282 );
assign n0284 = 8'h8;
assign n0285 = ( RD_ROM_0 == n0284 );
assign n0286 = 8'h9;
assign n0287 = ( RD_ROM_0 == n0286 );
assign n0288 = 8'ha;
assign n0289 = ( RD_ROM_0 == n0288 );
assign n0290 = 8'hb;
assign n0291 = ( RD_ROM_0 == n0290 );
assign n0292 = 8'hc;
assign n0293 = ( RD_ROM_0 == n0292 );
assign n0294 = 8'hd;
assign n0295 = ( RD_ROM_0 == n0294 );
assign n0296 = 8'he;
assign n0297 = ( RD_ROM_0 == n0296 );
assign n0298 = 8'hf;
assign n0299 = ( RD_ROM_0 == n0298 );
assign n0300 = 8'h10;
assign n0301 = ( RD_ROM_0 == n0300 );
assign n0302 = 8'h11;
assign n0303 = ( RD_ROM_0 == n0302 );
assign n0304 = 8'h12;
assign n0305 = ( RD_ROM_0 == n0304 );
assign n0306 = 8'h15;
assign n0307 = ( RD_ROM_0 == n0306 );
assign n0308 = 8'h16;
assign n0309 = ( RD_ROM_0 == n0308 );
assign n0310 = 8'h17;
assign n0311 = ( RD_ROM_0 == n0310 );
assign n0312 = 8'h18;
assign n0313 = ( RD_ROM_0 == n0312 );
assign n0314 = 8'h19;
assign n0315 = ( RD_ROM_0 == n0314 );
assign n0316 = 8'h1a;
assign n0317 = ( RD_ROM_0 == n0316 );
assign n0318 = 8'h1b;
assign n0319 = ( RD_ROM_0 == n0318 );
assign n0320 = 8'h1c;
assign n0321 = ( RD_ROM_0 == n0320 );
assign n0322 = 8'h1d;
assign n0323 = ( RD_ROM_0 == n0322 );
assign n0324 = 8'h1e;
assign n0325 = ( RD_ROM_0 == n0324 );
assign n0326 = 8'h1f;
assign n0327 = ( RD_ROM_0 == n0326 );
assign n0328 = 8'h31;
assign n0329 = ( RD_ROM_0 == n0328 );
assign n0330 = 8'h42;
assign n0331 = ( RD_ROM_0 == n0330 );
assign n0332 = 8'h43;
assign n0333 = ( RD_ROM_0 == n0332 );
assign n0334 = 8'h51;
assign n0335 = ( RD_ROM_0 == n0334 );
assign n0336 = 8'h52;
assign n0337 = ( RD_ROM_0 == n0336 );
assign n0338 = 8'h53;
assign n0339 = ( RD_ROM_0 == n0338 );
assign n0340 = 8'h62;
assign n0341 = ( RD_ROM_0 == n0340 );
assign n0342 = 8'h63;
assign n0343 = ( RD_ROM_0 == n0342 );
assign n0344 = 8'h71;
assign n0345 = ( RD_ROM_0 == n0344 );
assign n0346 = 8'h75;
assign n0347 = ( RD_ROM_0 == n0346 );
assign n0348 = 8'h76;
assign n0349 = ( RD_ROM_0 == n0348 );
assign n0350 = 8'h77;
assign n0351 = ( RD_ROM_0 == n0350 );
assign n0352 = 8'h78;
assign n0353 = ( RD_ROM_0 == n0352 );
assign n0354 = 8'h79;
assign n0355 = ( RD_ROM_0 == n0354 );
assign n0356 = 8'h7a;
assign n0357 = ( RD_ROM_0 == n0356 );
assign n0358 = 8'h7b;
assign n0359 = ( RD_ROM_0 == n0358 );
assign n0360 = 8'h7c;
assign n0361 = ( RD_ROM_0 == n0360 );
assign n0362 = 8'h7d;
assign n0363 = ( RD_ROM_0 == n0362 );
assign n0364 = 8'h7e;
assign n0365 = ( RD_ROM_0 == n0364 );
assign n0366 = 8'h7f;
assign n0367 = ( RD_ROM_0 == n0366 );
assign n0368 = 8'h85;
assign n0369 = ( RD_ROM_0 == n0368 );
assign n0370 = 8'h86;
assign n0371 = ( RD_ROM_0 == n0370 );
assign n0372 = ( RD_ROM_0 == n0017 );
assign n0373 = ( RD_ROM_0 == n0019 );
assign n0374 = ( RD_ROM_0 == n0021 );
assign n0375 = ( RD_ROM_0 == n0023 );
assign n0376 = ( RD_ROM_0 == n0027 );
assign n0377 = ( RD_ROM_0 == n0025 );
assign n0378 = ( RD_ROM_0 == n0029 );
assign n0379 = 8'h8e;
assign n0380 = ( RD_ROM_0 == n0379 );
assign n0381 = 8'h8f;
assign n0382 = ( RD_ROM_0 == n0381 );
assign n0383 = 8'h91;
assign n0384 = ( RD_ROM_0 == n0383 );
assign n0385 = 8'h92;
assign n0386 = ( RD_ROM_0 == n0385 );
assign n0387 = 8'ha6;
assign n0388 = ( RD_ROM_0 == n0387 );
assign n0389 = 8'ha7;
assign n0390 = ( RD_ROM_0 == n0389 );
assign n0391 = ( RD_ROM_0 == n0039 );
assign n0392 = 8'ha9;
assign n0393 = ( RD_ROM_0 == n0392 );
assign n0394 = 8'haa;
assign n0395 = ( RD_ROM_0 == n0394 );
assign n0396 = 8'hab;
assign n0397 = ( RD_ROM_0 == n0396 );
assign n0398 = 8'hac;
assign n0399 = ( RD_ROM_0 == n0398 );
assign n0400 = 8'had;
assign n0401 = ( RD_ROM_0 == n0400 );
assign n0402 = 8'hae;
assign n0403 = ( RD_ROM_0 == n0402 );
assign n0404 = 8'haf;
assign n0405 = ( RD_ROM_0 == n0404 );
assign n0406 = 8'hb1;
assign n0407 = ( RD_ROM_0 == n0406 );
assign n0408 = 8'hb2;
assign n0409 = ( RD_ROM_0 == n0408 );
assign n0410 = 8'hc0;
assign n0411 = ( RD_ROM_0 == n0410 );
assign n0412 = 8'hc2;
assign n0413 = ( RD_ROM_0 == n0412 );
assign n0414 = 8'hc5;
assign n0415 = ( RD_ROM_0 == n0414 );
assign n0416 = 8'hc6;
assign n0417 = ( RD_ROM_0 == n0416 );
assign n0418 = 8'hc7;
assign n0419 = ( RD_ROM_0 == n0418 );
assign n0420 = 8'hc8;
assign n0421 = ( RD_ROM_0 == n0420 );
assign n0422 = 8'hc9;
assign n0423 = ( RD_ROM_0 == n0422 );
assign n0424 = 8'hca;
assign n0425 = ( RD_ROM_0 == n0424 );
assign n0426 = 8'hcb;
assign n0427 = ( RD_ROM_0 == n0426 );
assign n0428 = 8'hcc;
assign n0429 = ( RD_ROM_0 == n0428 );
assign n0430 = 8'hcd;
assign n0431 = ( RD_ROM_0 == n0430 );
assign n0432 = 8'hce;
assign n0433 = ( RD_ROM_0 == n0432 );
assign n0434 = 8'hcf;
assign n0435 = ( RD_ROM_0 == n0434 );
assign n0436 = ( RD_ROM_0 == n0045 );
assign n0437 = 8'hd1;
assign n0438 = ( RD_ROM_0 == n0437 );
assign n0439 = 8'hd2;
assign n0440 = ( RD_ROM_0 == n0439 );
assign n0441 = 8'hd5;
assign n0442 = ( RD_ROM_0 == n0441 );
assign n0443 = 8'hd6;
assign n0444 = ( RD_ROM_0 == n0443 );
assign n0445 = 8'hd7;
assign n0446 = ( RD_ROM_0 == n0445 );
assign n0447 = 8'hd8;
assign n0448 = ( RD_ROM_0 == n0447 );
assign n0449 = 8'hd9;
assign n0450 = ( RD_ROM_0 == n0449 );
assign n0451 = 8'hda;
assign n0452 = ( RD_ROM_0 == n0451 );
assign n0453 = 8'hdb;
assign n0454 = ( RD_ROM_0 == n0453 );
assign n0455 = 8'hdc;
assign n0456 = ( RD_ROM_0 == n0455 );
assign n0457 = 8'hdd;
assign n0458 = ( RD_ROM_0 == n0457 );
assign n0459 = 8'hde;
assign n0460 = ( RD_ROM_0 == n0459 );
assign n0461 = 8'hdf;
assign n0462 = ( RD_ROM_0 == n0461 );
assign n0463 = 8'hf1;
assign n0464 = ( RD_ROM_0 == n0463 );
assign n0465 = 8'hf5;
assign n0466 = ( RD_ROM_0 == n0465 );
assign n0467 = 8'hf6;
assign n0468 = ( RD_ROM_0 == n0467 );
assign n0469 = 8'hf7;
assign n0470 = ( RD_ROM_0 == n0469 );
assign n0471 = 8'hf8;
assign n0472 = ( RD_ROM_0 == n0471 );
assign n0473 = 8'hf9;
assign n0474 = ( RD_ROM_0 == n0473 );
assign n0475 = 8'hfa;
assign n0476 = ( RD_ROM_0 == n0475 );
assign n0477 = 8'hfb;
assign n0478 = ( RD_ROM_0 == n0477 );
assign n0479 = 8'hfc;
assign n0480 = ( RD_ROM_0 == n0479 );
assign n0481 = 8'hfd;
assign n0482 = ( RD_ROM_0 == n0481 );
assign n0483 = 8'hfe;
assign n0484 = ( RD_ROM_0 == n0483 );
assign n0485 = 8'hff;
assign n0486 = ( RD_ROM_0 == n0485 );
assign WR_ADDR_0_IRAM = WR_ADDR_ABSTR_IRAM_0;
assign WR_DATA_0_IRAM = WR_DATA_ABSTR_IRAM_0;
assign WR_COND_0_IRAM = ((WR_COND_ABSTR_IRAM_0 && !(n0277)));
assign WR_ADDR_1_IRAM = WR_ADDR_ABSTR_IRAM_1;
assign WR_DATA_1_IRAM = WR_DATA_ABSTR_IRAM_1;
assign WR_COND_1_IRAM = ((WR_COND_ABSTR_IRAM_1 && !(n0277)));
assign IRAM_full = {IRAM[15], IRAM[14], IRAM[13], IRAM[12], IRAM[11], IRAM[10], IRAM[9], IRAM[8], IRAM[7], IRAM[6], IRAM[5], IRAM[4], IRAM[3], IRAM[2], IRAM[1], IRAM[0]} ;
assign SBUF_next = SBUF;
assign SCON_next = SCON;
assign PCON_next = PCON;
assign TCON_next = TCON;
assign TL0_next = TL0;
assign TL1_next = TL1;
assign TH0_next = TH0;
assign TH1_next = TH1;
assign TMOD_next = TMOD;
assign IE_next = IE;
assign IP_next = IP;

always @(posedge clk) begin
  if (rst) begin
    ACC <= 8'h0;
    B <= 8'h0;
    DPH <= 8'h0;
    DPL <= 8'h0;
    IE <= 8'h0;
    IP <= 8'h0;
    P0 <= 8'hff;
    P0INREG <= 8'h0;
    P1 <= 8'hff;
    P1INREG <= 8'h0;
    P2 <= 8'hff;
    P2INREG <= 8'h0;
    P3 <= 8'hff;
    P3INREG <= 8'h0;
    PC <= 16'h0;
    PCON <= 8'h0;
    PSW <= 8'h0;
    SBUF <= 8'h0;
    SCON <= 8'h0;
    SP <= 8'h7;
    TCON <= 8'h0;
    TH0 <= 8'h0;
    TH1 <= 8'h0;
    TL0 <= 8'h0;
    TL1 <= 8'h0;
    TMOD <= 8'h0;
    XRAM_ADDR <= 16'h0;
    XRAM_DATA_OUT <= 8'h0;
`ifdef OC8051_SIMULATION
    IRAM[0] = 8'b0;
    IRAM[1] = 8'b0;
    IRAM[2] = 8'b0;
    IRAM[3] = 8'b0;
    IRAM[4] = 8'b0;
    IRAM[5] = 8'b0;
    IRAM[6] = 8'b0;
    IRAM[7] = 8'b0;
    IRAM[8] = 8'b0;
    IRAM[9] = 8'b0;
    IRAM[10] = 8'b0;
    IRAM[11] = 8'b0;
    IRAM[12] = 8'b0;
    IRAM[13] = 8'b0;
    IRAM[14] = 8'b0;
    IRAM[15] = 8'b0;
`endif
  end
  else begin
    if (step) begin
      P0INREG <= P0IN;
      P1INREG <= P1IN;
      P2INREG <= P2IN;
      P3INREG <= P3IN;
      ACC <= ACC_next;
      P2 <= P2_next;
      P0 <= P0_next;
      P1 <= P1_next;
      XRAM_ADDR <= XRAM_ADDR_next;
      P3 <= P3_next;
      SP <= SP_next;
      PC <= PC_next;
      B <= B_next;
      XRAM_DATA_OUT <= XRAM_DATA_OUT_next;
      DPL <= DPL_next;
      PSW <= PSW_next;
      DPH <= DPH_next;
      if (WR_COND_0_IRAM) IRAM[WR_ADDR_0_IRAM] <= WR_DATA_0_IRAM;
      if (WR_COND_1_IRAM) IRAM[WR_ADDR_1_IRAM] <= WR_DATA_1_IRAM;
    end
  end
end

endmodule
