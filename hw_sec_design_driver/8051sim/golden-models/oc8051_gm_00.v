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
  B,
  B_next,
  XRAM_ADDR,
  XRAM_ADDR_next,
  P3,
  P3_next,
  SP,
  SP_next,
  PC,
  PC_next,
  P1,
  P1_next,
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
  ACC_abstr,
  P2_abstr,
  P0_abstr,
  B_abstr,
  XRAM_ADDR_abstr,
  P3_abstr,
  SP_abstr,
  PC_abstr,
  P1_abstr,
  XRAM_DATA_OUT_abstr,
  DPL_abstr,
  PSW_abstr,
  DPH_abstr,
  WR_COND_ABSTR_IRAM_0,
  WR_ADDR_ABSTR_IRAM_0,
  WR_DATA_ABSTR_IRAM_0,
  WR_COND_ABSTR_IRAM_1,
  WR_ADDR_ABSTR_IRAM_1,
  WR_DATA_ABSTR_IRAM_1,
  RD_IRAM_0_ABSTR_ADDR,
  RD_IRAM_1_ABSTR_ADDR,
  RD_ROM_1_ABSTR_ADDR,
  RD_ROM_2_ABSTR_ADDR
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
output [7:0] B;
output [7:0] B_next;
output [15:0] XRAM_ADDR;
output [15:0] XRAM_ADDR_next;
output [7:0] P3;
output [7:0] P3_next;
output [7:0] SP;
output [7:0] SP_next;
output [15:0] PC;
output [15:0] PC_next;
output [7:0] P1;
output [7:0] P1_next;
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
input [7:0] ACC_abstr;
input [7:0] P2_abstr;
input [7:0] P0_abstr;
input [7:0] B_abstr;
input [15:0] XRAM_ADDR_abstr;
input [7:0] P3_abstr;
input [7:0] SP_abstr;
input [15:0] PC_abstr;
input [7:0] P1_abstr;
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
input [7:0] RD_IRAM_0_ABSTR_ADDR;
input [7:0] RD_IRAM_1_ABSTR_ADDR;
input [15:0] RD_ROM_1_ABSTR_ADDR;
input [15:0] RD_ROM_2_ABSTR_ADDR;

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

wire [7:0] ACC_00;
wire [7:0] ACC_next;
wire [7:0] B_00;
wire [7:0] B_next;
wire [7:0] DPH_00;
wire [7:0] DPH_next;
wire [7:0] DPL_00;
wire [7:0] DPL_next;
wire [7:0] IE_next;
wire [7:0] IP_next;
wire [7:0] P0_00;
wire [7:0] P0_next;
wire [7:0] P1_00;
wire [7:0] P1_next;
wire [7:0] P2_00;
wire [7:0] P2_next;
wire [7:0] P3_00;
wire [7:0] P3_next;
wire [7:0] PCON_next;
wire [15:0] PC_00;
wire [15:0] PC_next;
wire [7:0] PSW_00;
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
wire [7:0] SP_00;
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
wire [15:0] XRAM_ADDR_00;
wire [15:0] XRAM_ADDR_next;
wire [7:0] XRAM_DATA_OUT_00;
wire [7:0] XRAM_DATA_OUT_next;
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
wire n0383;
wire [7:0] n0384;
wire n0385;
wire [7:0] n0386;
wire n0387;
wire [7:0] n0388;
wire n0389;
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
wire [7:0] n0560;
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
wire [3:0] n0572;
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
wire [3:0] n0605;
wire [7:0] n0606;
wire [15:0] n0607;
wire n0608;
wire [15:0] n0609;
wire [15:0] n0610;
wire n0611;
wire [15:0] n0612;
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
wire n0702;
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
wire [15:0] n0714;
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
wire n0734;
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
wire [15:0] n0746;
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
wire n0834;
wire [15:0] n0835;
wire n0836;
wire [15:0] n0837;
wire n0838;
wire [15:0] n0839;
wire n0840;
wire [15:0] n0841;
wire n0842;
wire [15:0] n0843;
wire n0844;
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
wire [15:0] n0988;
wire [15:0] n0989;
wire [15:0] n0990;
wire [15:0] n0991;
wire [15:0] n0992;
wire [15:0] n0993;
wire [15:0] n0994;
wire [15:0] n0995;
wire [15:0] n0996;
wire [15:0] n0997;
wire [15:0] n0998;
wire [15:0] n0999;
wire [15:0] n1000;
wire [7:0] n1001;
wire [6:0] n1002;
wire [0:0] n1003;
wire [0:0] n1004;
wire [0:0] n1005;
wire [0:0] n1006;
wire [0:0] n1007;
wire [0:0] n1008;
wire [0:0] n1009;
wire [0:0] n1010;
wire [0:0] n1011;
wire [0:0] n1012;
wire [0:0] n1013;
wire [0:0] n1014;
wire [0:0] n1015;
wire [0:0] n1016;
wire [0:0] n1017;
wire [7:0] n1018;
wire [0:0] n1019;
wire n1020;
wire [3:0] n1021;
wire [7:0] n1022;
wire n1023;
wire [7:0] n1024;
wire n1025;
wire n1026;
wire [7:0] n1027;
wire n1028;
wire n1029;
wire n1030;
wire n1031;
wire n1032;
wire n1033;
wire n1034;
wire n1035;
wire [7:0] n1036;
wire n1037;
wire n1038;
wire n1039;
wire n1040;
wire n1041;
wire n1042;
wire n1043;
wire n1044;
wire [7:0] n1045;
wire n1046;
wire [7:0] n1047;
wire n1048;
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
wire [3:0] n1072;
wire [7:0] n1073;
wire [3:0] n1074;
wire [7:0] n1075;
wire [3:0] n1076;
wire [3:0] n1077;
wire [3:0] n1078;
wire [3:0] n1079;
wire [3:0] n1080;
wire [3:0] n1081;
wire [3:0] n1082;
wire [0:0] n1083;
wire n1084;
wire [3:0] n1085;
wire [2:0] n1086;
wire [7:0] n1087;
wire [7:0] n1088;
wire [7:0] n1089;
wire n1090;
wire n1091;
wire n1092;
wire n1093;
wire n1094;
wire n1095;
wire n1096;
wire n1097;
wire n1098;
wire n1099;
wire n1100;
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
wire [3:0] n1118;
wire [7:0] n1119;
wire [7:0] n1120;
wire [3:0] n1121;
wire [7:0] n1122;
wire [15:0] n1123;
wire [15:0] n1124;
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
wire [0:0] n1136;
wire n1137;
wire n1138;
wire n1139;
wire n1140;
wire n1141;
wire n1142;
wire n1143;
wire n1144;
wire n1145;
wire n1146;
wire n1147;
wire n1148;
wire n1149;
wire n1150;
wire n1151;
wire n1152;
wire n1153;
wire n1154;
wire n1155;
wire n1156;
wire n1157;
wire n1158;
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
wire [0:0] n1181;
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
wire [0:0] n1213;
wire [0:0] n1214;
wire [7:0] n1215;
wire [7:0] n1216;
wire [7:0] n1217;
wire [7:0] n1218;
wire [7:0] n1219;
wire [7:0] n1220;
wire [7:0] n1221;
wire [3:0] n1222;
wire [3:0] n1223;
wire [7:0] n1224;
wire n1225;
wire [7:0] n1226;
wire n1227;
wire [7:0] n1228;
wire n1229;
wire [7:0] n1230;
wire n1231;
wire [7:0] n1232;
wire n1233;
wire [7:0] n1234;
wire n1235;
wire [7:0] n1236;
wire n1237;
wire [7:0] n1238;
wire n1239;
wire [7:0] n1240;
wire n1241;
wire [7:0] n1242;
wire n1243;
wire [7:0] n1244;
wire n1245;
wire [7:0] n1246;
wire n1247;
wire [7:0] n1248;
wire n1249;
wire [7:0] n1250;
wire n1251;
wire [7:0] n1252;
wire n1253;
wire [7:0] n1254;
wire n1255;
wire [7:0] n1256;
wire n1257;
wire [7:0] n1258;
wire n1259;
wire [7:0] n1260;
wire n1261;
wire [7:0] n1262;
wire n1263;
wire [7:0] n1264;
wire n1265;
wire [7:0] n1266;
wire n1267;
wire [7:0] n1268;
wire n1269;
wire [7:0] n1270;
wire n1271;
wire [7:0] n1272;
wire n1273;
wire [7:0] n1274;
wire n1275;
wire [7:0] n1276;
wire n1277;
wire [7:0] n1278;
wire n1279;
wire [7:0] n1280;
wire n1281;

reg [7:0] IRAM[15:0];

// port: IRAM->RD_IRAM_0
// port: IRAM->RD_IRAM_1
// port: ROM->RD_ROM_0
// port: ROM->RD_ROM_1
// port: ROM->RD_ROM_2
// RD_IRAM_0_ADDR=(if (eq RD_ROM_0 (bv 5 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 6 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 7 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 8 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 9 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 10 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 11 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 12 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 13 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 14 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 15 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 16 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 21 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 22 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 23 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 24 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 25 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 26 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 27 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 28 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 29 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 30 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 31 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 32 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 34 8)) SP (if (eq RD_ROM_0 (bv 37 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 38 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 39 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 40 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 41 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 42 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 43 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 44 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 45 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 46 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 47 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 48 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 50 8)) SP (if (eq RD_ROM_0 (bv 53 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 54 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 55 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 56 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 57 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 58 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 59 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 60 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 61 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 62 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 63 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 66 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 67 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 69 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 70 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 71 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 72 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 73 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 74 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 75 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 76 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 77 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 78 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 79 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 82 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 83 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 85 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 86 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 87 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 88 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 89 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 90 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 91 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 92 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 93 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 94 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 95 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 98 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 99 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 101 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 102 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 103 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 104 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 105 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 106 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 107 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 108 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 109 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 110 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 111 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 114 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 118 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 119 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 130 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 133 8)) RD_ROM_2 (if (eq RD_ROM_0 (bv 134 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 135 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 136 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 137 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 138 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 139 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 140 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 141 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 142 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 143 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 146 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 149 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 150 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 151 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 152 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 153 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 154 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 155 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 156 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 157 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 158 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 159 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 160 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 162 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 166 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 167 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 168 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 169 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 170 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 171 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 172 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 173 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 174 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 175 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 176 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 178 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 181 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 182 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 183 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 184 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 185 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 186 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 187 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 188 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 189 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 190 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 191 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 192 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 194 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 197 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 198 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 199 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 200 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 201 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 202 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 203 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 204 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 205 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 206 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 207 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 208 8)) SP (if (eq RD_ROM_0 (bv 210 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 213 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 214 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 215 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 216 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 217 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 218 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 219 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 220 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 221 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 222 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 223 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 226 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 227 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 229 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 230 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 231 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 232 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 233 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 234 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 235 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 236 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 237 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 238 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 239 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 242 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 243 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 246 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
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
assign n0358 = 8'he2;
assign n0359 = ( RD_ROM_0 == n0358 );
assign n0360 = 8'he3;
assign n0361 = ( RD_ROM_0 == n0360 );
assign n0362 = 8'he5;
assign n0363 = ( RD_ROM_0 == n0362 );
assign n0364 = 8'he6;
assign n0365 = ( RD_ROM_0 == n0364 );
assign n0366 = 8'he7;
assign n0367 = ( RD_ROM_0 == n0366 );
assign n0368 = 8'he8;
assign n0369 = ( RD_ROM_0 == n0368 );
assign n0370 = 8'he9;
assign n0371 = ( RD_ROM_0 == n0370 );
assign n0372 = 8'hea;
assign n0373 = ( RD_ROM_0 == n0372 );
assign n0374 = 8'heb;
assign n0375 = ( RD_ROM_0 == n0374 );
assign n0376 = 8'hec;
assign n0377 = ( RD_ROM_0 == n0376 );
assign n0378 = 8'hed;
assign n0379 = ( RD_ROM_0 == n0378 );
assign n0380 = 8'hee;
assign n0381 = ( RD_ROM_0 == n0380 );
assign n0382 = 8'hef;
assign n0383 = ( RD_ROM_0 == n0382 );
assign n0384 = 8'hf2;
assign n0385 = ( RD_ROM_0 == n0384 );
assign n0386 = 8'hf3;
assign n0387 = ( RD_ROM_0 == n0386 );
assign n0388 = 8'hf6;
assign n0389 = ( RD_ROM_0 == n0388 );
assign n0390 = ( n0389 ) ? ( n0007 ) : ( n0011 );
assign n0391 = ( n0387 ) ? ( n0011 ) : ( n0390 );
assign n0392 = ( n0385 ) ? ( n0007 ) : ( n0391 );
assign n0393 = ( n0383 ) ? ( n0039 ) : ( n0392 );
assign n0394 = ( n0381 ) ? ( n0035 ) : ( n0393 );
assign n0395 = ( n0379 ) ? ( n0031 ) : ( n0394 );
assign n0396 = ( n0377 ) ? ( n0027 ) : ( n0395 );
assign n0397 = ( n0375 ) ? ( n0023 ) : ( n0396 );
assign n0398 = ( n0373 ) ? ( n0019 ) : ( n0397 );
assign n0399 = ( n0371 ) ? ( n0011 ) : ( n0398 );
assign n0400 = ( n0369 ) ? ( n0007 ) : ( n0399 );
assign n0401 = ( n0367 ) ? ( n0011 ) : ( n0400 );
assign n0402 = ( n0365 ) ? ( n0007 ) : ( n0401 );
assign n0403 = ( n0363 ) ? ( RD_ROM_1 ) : ( n0402 );
assign n0404 = ( n0361 ) ? ( n0011 ) : ( n0403 );
assign n0405 = ( n0359 ) ? ( n0007 ) : ( n0404 );
assign n0406 = ( n0357 ) ? ( n0039 ) : ( n0405 );
assign n0407 = ( n0355 ) ? ( n0035 ) : ( n0406 );
assign n0408 = ( n0353 ) ? ( n0031 ) : ( n0407 );
assign n0409 = ( n0351 ) ? ( n0027 ) : ( n0408 );
assign n0410 = ( n0349 ) ? ( n0023 ) : ( n0409 );
assign n0411 = ( n0347 ) ? ( n0019 ) : ( n0410 );
assign n0412 = ( n0345 ) ? ( n0011 ) : ( n0411 );
assign n0413 = ( n0343 ) ? ( n0007 ) : ( n0412 );
assign n0414 = ( n0341 ) ? ( n0011 ) : ( n0413 );
assign n0415 = ( n0339 ) ? ( n0007 ) : ( n0414 );
assign n0416 = ( n0337 ) ? ( RD_ROM_1 ) : ( n0415 );
assign n0417 = ( n0335 ) ? ( n0050 ) : ( n0416 );
assign n0418 = ( n0333 ) ? ( SP ) : ( n0417 );
assign n0419 = ( n0331 ) ? ( n0039 ) : ( n0418 );
assign n0420 = ( n0329 ) ? ( n0035 ) : ( n0419 );
assign n0421 = ( n0327 ) ? ( n0031 ) : ( n0420 );
assign n0422 = ( n0325 ) ? ( n0027 ) : ( n0421 );
assign n0423 = ( n0323 ) ? ( n0023 ) : ( n0422 );
assign n0424 = ( n0321 ) ? ( n0019 ) : ( n0423 );
assign n0425 = ( n0319 ) ? ( n0011 ) : ( n0424 );
assign n0426 = ( n0317 ) ? ( n0007 ) : ( n0425 );
assign n0427 = ( n0315 ) ? ( n0011 ) : ( n0426 );
assign n0428 = ( n0313 ) ? ( n0007 ) : ( n0427 );
assign n0429 = ( n0311 ) ? ( RD_ROM_1 ) : ( n0428 );
assign n0430 = ( n0309 ) ? ( n0050 ) : ( n0429 );
assign n0431 = ( n0307 ) ? ( RD_ROM_1 ) : ( n0430 );
assign n0432 = ( n0305 ) ? ( n0039 ) : ( n0431 );
assign n0433 = ( n0303 ) ? ( n0035 ) : ( n0432 );
assign n0434 = ( n0301 ) ? ( n0031 ) : ( n0433 );
assign n0435 = ( n0299 ) ? ( n0027 ) : ( n0434 );
assign n0436 = ( n0297 ) ? ( n0023 ) : ( n0435 );
assign n0437 = ( n0295 ) ? ( n0019 ) : ( n0436 );
assign n0438 = ( n0293 ) ? ( n0011 ) : ( n0437 );
assign n0439 = ( n0291 ) ? ( n0007 ) : ( n0438 );
assign n0440 = ( n0289 ) ? ( n0011 ) : ( n0439 );
assign n0441 = ( n0287 ) ? ( n0007 ) : ( n0440 );
assign n0442 = ( n0285 ) ? ( RD_ROM_1 ) : ( n0441 );
assign n0443 = ( n0283 ) ? ( n0050 ) : ( n0442 );
assign n0444 = ( n0281 ) ? ( n0050 ) : ( n0443 );
assign n0445 = ( n0279 ) ? ( RD_ROM_1 ) : ( n0444 );
assign n0446 = ( n0277 ) ? ( RD_ROM_1 ) : ( n0445 );
assign n0447 = ( n0275 ) ? ( RD_ROM_1 ) : ( n0446 );
assign n0448 = ( n0273 ) ? ( RD_ROM_1 ) : ( n0447 );
assign n0449 = ( n0271 ) ? ( RD_ROM_1 ) : ( n0448 );
assign n0450 = ( n0269 ) ? ( RD_ROM_1 ) : ( n0449 );
assign n0451 = ( n0267 ) ? ( RD_ROM_1 ) : ( n0450 );
assign n0452 = ( n0265 ) ? ( RD_ROM_1 ) : ( n0451 );
assign n0453 = ( n0263 ) ? ( n0011 ) : ( n0452 );
assign n0454 = ( n0261 ) ? ( n0007 ) : ( n0453 );
assign n0455 = ( n0259 ) ? ( n0050 ) : ( n0454 );
assign n0456 = ( n0257 ) ? ( n0050 ) : ( n0455 );
assign n0457 = ( n0255 ) ? ( n0039 ) : ( n0456 );
assign n0458 = ( n0253 ) ? ( n0035 ) : ( n0457 );
assign n0459 = ( n0251 ) ? ( n0031 ) : ( n0458 );
assign n0460 = ( n0249 ) ? ( n0027 ) : ( n0459 );
assign n0461 = ( n0247 ) ? ( n0023 ) : ( n0460 );
assign n0462 = ( n0245 ) ? ( n0019 ) : ( n0461 );
assign n0463 = ( n0243 ) ? ( n0011 ) : ( n0462 );
assign n0464 = ( n0241 ) ? ( n0007 ) : ( n0463 );
assign n0465 = ( n0239 ) ? ( n0011 ) : ( n0464 );
assign n0466 = ( n0237 ) ? ( n0007 ) : ( n0465 );
assign n0467 = ( n0235 ) ? ( RD_ROM_1 ) : ( n0466 );
assign n0468 = ( n0233 ) ? ( n0050 ) : ( n0467 );
assign n0469 = ( n0231 ) ? ( n0039 ) : ( n0468 );
assign n0470 = ( n0229 ) ? ( n0035 ) : ( n0469 );
assign n0471 = ( n0227 ) ? ( n0031 ) : ( n0470 );
assign n0472 = ( n0225 ) ? ( n0027 ) : ( n0471 );
assign n0473 = ( n0223 ) ? ( n0023 ) : ( n0472 );
assign n0474 = ( n0221 ) ? ( n0019 ) : ( n0473 );
assign n0475 = ( n0219 ) ? ( n0011 ) : ( n0474 );
assign n0476 = ( n0217 ) ? ( n0007 ) : ( n0475 );
assign n0477 = ( n0215 ) ? ( n0011 ) : ( n0476 );
assign n0478 = ( n0213 ) ? ( n0007 ) : ( n0477 );
assign n0479 = ( n0211 ) ? ( RD_ROM_2 ) : ( n0478 );
assign n0480 = ( n0209 ) ? ( n0050 ) : ( n0479 );
assign n0481 = ( n0207 ) ? ( n0011 ) : ( n0480 );
assign n0482 = ( n0205 ) ? ( n0007 ) : ( n0481 );
assign n0483 = ( n0203 ) ? ( n0050 ) : ( n0482 );
assign n0484 = ( n0201 ) ? ( n0039 ) : ( n0483 );
assign n0485 = ( n0199 ) ? ( n0035 ) : ( n0484 );
assign n0486 = ( n0197 ) ? ( n0031 ) : ( n0485 );
assign n0487 = ( n0195 ) ? ( n0027 ) : ( n0486 );
assign n0488 = ( n0193 ) ? ( n0023 ) : ( n0487 );
assign n0489 = ( n0191 ) ? ( n0019 ) : ( n0488 );
assign n0490 = ( n0189 ) ? ( n0011 ) : ( n0489 );
assign n0491 = ( n0187 ) ? ( n0007 ) : ( n0490 );
assign n0492 = ( n0185 ) ? ( n0011 ) : ( n0491 );
assign n0493 = ( n0183 ) ? ( n0007 ) : ( n0492 );
assign n0494 = ( n0181 ) ? ( RD_ROM_1 ) : ( n0493 );
assign n0495 = ( n0179 ) ? ( RD_ROM_1 ) : ( n0494 );
assign n0496 = ( n0177 ) ? ( RD_ROM_1 ) : ( n0495 );
assign n0497 = ( n0175 ) ? ( n0039 ) : ( n0496 );
assign n0498 = ( n0173 ) ? ( n0035 ) : ( n0497 );
assign n0499 = ( n0171 ) ? ( n0031 ) : ( n0498 );
assign n0500 = ( n0169 ) ? ( n0027 ) : ( n0499 );
assign n0501 = ( n0167 ) ? ( n0023 ) : ( n0500 );
assign n0502 = ( n0165 ) ? ( n0019 ) : ( n0501 );
assign n0503 = ( n0163 ) ? ( n0011 ) : ( n0502 );
assign n0504 = ( n0161 ) ? ( n0007 ) : ( n0503 );
assign n0505 = ( n0159 ) ? ( n0011 ) : ( n0504 );
assign n0506 = ( n0157 ) ? ( n0007 ) : ( n0505 );
assign n0507 = ( n0155 ) ? ( RD_ROM_1 ) : ( n0506 );
assign n0508 = ( n0153 ) ? ( RD_ROM_1 ) : ( n0507 );
assign n0509 = ( n0151 ) ? ( RD_ROM_1 ) : ( n0508 );
assign n0510 = ( n0149 ) ? ( n0039 ) : ( n0509 );
assign n0511 = ( n0147 ) ? ( n0035 ) : ( n0510 );
assign n0512 = ( n0145 ) ? ( n0031 ) : ( n0511 );
assign n0513 = ( n0143 ) ? ( n0027 ) : ( n0512 );
assign n0514 = ( n0141 ) ? ( n0023 ) : ( n0513 );
assign n0515 = ( n0139 ) ? ( n0019 ) : ( n0514 );
assign n0516 = ( n0137 ) ? ( n0011 ) : ( n0515 );
assign n0517 = ( n0135 ) ? ( n0007 ) : ( n0516 );
assign n0518 = ( n0133 ) ? ( n0011 ) : ( n0517 );
assign n0519 = ( n0131 ) ? ( n0007 ) : ( n0518 );
assign n0520 = ( n0129 ) ? ( RD_ROM_1 ) : ( n0519 );
assign n0521 = ( n0127 ) ? ( RD_ROM_1 ) : ( n0520 );
assign n0522 = ( n0125 ) ? ( RD_ROM_1 ) : ( n0521 );
assign n0523 = ( n0123 ) ? ( n0039 ) : ( n0522 );
assign n0524 = ( n0121 ) ? ( n0035 ) : ( n0523 );
assign n0525 = ( n0119 ) ? ( n0031 ) : ( n0524 );
assign n0526 = ( n0117 ) ? ( n0027 ) : ( n0525 );
assign n0527 = ( n0115 ) ? ( n0023 ) : ( n0526 );
assign n0528 = ( n0113 ) ? ( n0019 ) : ( n0527 );
assign n0529 = ( n0111 ) ? ( n0011 ) : ( n0528 );
assign n0530 = ( n0109 ) ? ( n0007 ) : ( n0529 );
assign n0531 = ( n0107 ) ? ( n0011 ) : ( n0530 );
assign n0532 = ( n0105 ) ? ( n0007 ) : ( n0531 );
assign n0533 = ( n0103 ) ? ( RD_ROM_1 ) : ( n0532 );
assign n0534 = ( n0101 ) ? ( SP ) : ( n0533 );
assign n0535 = ( n0099 ) ? ( n0050 ) : ( n0534 );
assign n0536 = ( n0097 ) ? ( n0039 ) : ( n0535 );
assign n0537 = ( n0095 ) ? ( n0035 ) : ( n0536 );
assign n0538 = ( n0093 ) ? ( n0031 ) : ( n0537 );
assign n0539 = ( n0091 ) ? ( n0027 ) : ( n0538 );
assign n0540 = ( n0089 ) ? ( n0023 ) : ( n0539 );
assign n0541 = ( n0087 ) ? ( n0019 ) : ( n0540 );
assign n0542 = ( n0085 ) ? ( n0011 ) : ( n0541 );
assign n0543 = ( n0083 ) ? ( n0007 ) : ( n0542 );
assign n0544 = ( n0081 ) ? ( n0011 ) : ( n0543 );
assign n0545 = ( n0079 ) ? ( n0007 ) : ( n0544 );
assign n0546 = ( n0077 ) ? ( RD_ROM_1 ) : ( n0545 );
assign n0547 = ( n0075 ) ? ( SP ) : ( n0546 );
assign n0548 = ( n0073 ) ? ( n0050 ) : ( n0547 );
assign n0549 = ( n0072 ) ? ( n0039 ) : ( n0548 );
assign n0550 = ( n0070 ) ? ( n0035 ) : ( n0549 );
assign n0551 = ( n0068 ) ? ( n0031 ) : ( n0550 );
assign n0552 = ( n0066 ) ? ( n0027 ) : ( n0551 );
assign n0553 = ( n0064 ) ? ( n0023 ) : ( n0552 );
assign n0554 = ( n0062 ) ? ( n0019 ) : ( n0553 );
assign n0555 = ( n0060 ) ? ( n0011 ) : ( n0554 );
assign n0556 = ( n0058 ) ? ( n0007 ) : ( n0555 );
assign n0557 = ( n0056 ) ? ( n0011 ) : ( n0556 );
assign n0558 = ( n0054 ) ? ( n0007 ) : ( n0557 );
assign n0559 = ( n0052 ) ? ( RD_ROM_1 ) : ( n0558 );
assign n0560 = ( n0041 ) ? ( n0050 ) : ( n0559 );
assign n0561 = ( n0037 ) ? ( n0039 ) : ( n0560 );
assign n0562 = ( n0033 ) ? ( n0035 ) : ( n0561 );
assign n0563 = ( n0029 ) ? ( n0031 ) : ( n0562 );
assign n0564 = ( n0025 ) ? ( n0027 ) : ( n0563 );
assign n0565 = ( n0021 ) ? ( n0023 ) : ( n0564 );
assign n0566 = ( n0017 ) ? ( n0019 ) : ( n0565 );
assign n0567 = ( n0015 ) ? ( n0011 ) : ( n0566 );
assign n0568 = ( n0013 ) ? ( n0007 ) : ( n0567 );
assign n0569 = ( n0009 ) ? ( n0011 ) : ( n0568 );
assign n0570 = ( n0004 ) ? ( n0007 ) : ( n0569 );
assign n0571 = ( n0002 ) ? ( RD_ROM_1 ) : ( n0570 );
assign RD_IRAM_0_ADDR = n0571;
assign n0572 = n0571[3:0];
assign n0573 = IRAM[n0572];
assign RD_IRAM_0 = n0573;
// RD_IRAM_1_ADDR=(if (eq RD_ROM_0 (bv 6 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 7 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 22 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 23 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 34 8)) (sub SP (bv 1 8)) (if (eq RD_ROM_0 (bv 38 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 39 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 50 8)) (sub SP (bv 1 8)) (if (eq RD_ROM_0 (bv 54 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 55 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 70 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 71 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 86 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 87 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 102 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 103 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 134 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 135 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 150 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 151 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 166 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 167 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 182 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 183 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 198 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 199 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 214 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 215 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 230 8)) RD_IRAM_0 RD_IRAM_0)))))))))))))))))))))))))))))
assign n0574 = 8'h1;
assign n0575 = ( SP - n0574 );
assign n0576 = ( n0365 ) ? ( RD_IRAM_0 ) : ( RD_IRAM_0 );
assign n0577 = ( n0341 ) ? ( RD_IRAM_0 ) : ( n0576 );
assign n0578 = ( n0339 ) ? ( RD_IRAM_0 ) : ( n0577 );
assign n0579 = ( n0315 ) ? ( RD_IRAM_0 ) : ( n0578 );
assign n0580 = ( n0313 ) ? ( RD_IRAM_0 ) : ( n0579 );
assign n0581 = ( n0289 ) ? ( RD_IRAM_0 ) : ( n0580 );
assign n0582 = ( n0287 ) ? ( RD_IRAM_0 ) : ( n0581 );
assign n0583 = ( n0263 ) ? ( RD_ROM_1 ) : ( n0582 );
assign n0584 = ( n0261 ) ? ( RD_ROM_1 ) : ( n0583 );
assign n0585 = ( n0239 ) ? ( RD_IRAM_0 ) : ( n0584 );
assign n0586 = ( n0237 ) ? ( RD_IRAM_0 ) : ( n0585 );
assign n0587 = ( n0215 ) ? ( RD_IRAM_0 ) : ( n0586 );
assign n0588 = ( n0213 ) ? ( RD_IRAM_0 ) : ( n0587 );
assign n0589 = ( n0185 ) ? ( RD_IRAM_0 ) : ( n0588 );
assign n0590 = ( n0183 ) ? ( RD_IRAM_0 ) : ( n0589 );
assign n0591 = ( n0159 ) ? ( RD_IRAM_0 ) : ( n0590 );
assign n0592 = ( n0157 ) ? ( RD_IRAM_0 ) : ( n0591 );
assign n0593 = ( n0133 ) ? ( RD_IRAM_0 ) : ( n0592 );
assign n0594 = ( n0131 ) ? ( RD_IRAM_0 ) : ( n0593 );
assign n0595 = ( n0107 ) ? ( RD_IRAM_0 ) : ( n0594 );
assign n0596 = ( n0105 ) ? ( RD_IRAM_0 ) : ( n0595 );
assign n0597 = ( n0101 ) ? ( n0575 ) : ( n0596 );
assign n0598 = ( n0081 ) ? ( RD_IRAM_0 ) : ( n0597 );
assign n0599 = ( n0079 ) ? ( RD_IRAM_0 ) : ( n0598 );
assign n0600 = ( n0075 ) ? ( n0575 ) : ( n0599 );
assign n0601 = ( n0056 ) ? ( RD_IRAM_0 ) : ( n0600 );
assign n0602 = ( n0054 ) ? ( RD_IRAM_0 ) : ( n0601 );
assign n0603 = ( n0009 ) ? ( RD_IRAM_0 ) : ( n0602 );
assign n0604 = ( n0004 ) ? ( RD_IRAM_0 ) : ( n0603 );
assign RD_IRAM_1_ADDR = n0604;
assign n0605 = n0604[3:0];
assign n0606 = IRAM[n0605];
assign RD_IRAM_1 = n0606;
// RD_ROM_0_ADDR=PC
assign RD_ROM_0_ADDR = PC;
// RD_ROM_1_ADDR=(if (eq RD_ROM_0 (bv 1 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 2 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 5 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 16 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 17 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 18 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 21 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 32 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 33 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 36 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 37 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 48 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 49 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 52 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 53 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 64 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 65 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 66 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 67 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 68 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 69 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 80 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 81 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 82 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 83 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 84 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 85 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 96 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 97 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 98 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 99 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 100 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 101 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 112 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 113 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 114 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 116 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 117 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 118 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 119 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 120 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 121 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 122 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 123 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 124 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 125 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 126 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 127 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 128 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 129 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 130 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 131 16)) (add (zero-ext 8 ACC) (add PC (bv 1 16))) (if (eq RD_ROM_0 (bv 133 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 134 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 135 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 136 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 137 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 138 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 139 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 140 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 141 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 142 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 143 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 144 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 145 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 146 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 147 16)) (add (zero-ext 8 ACC) (concat DPH DPL)) (if (eq RD_ROM_0 (bv 148 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 149 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 160 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 161 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 162 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 166 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 167 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 168 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 169 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 170 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 171 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 172 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 173 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 174 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 175 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 176 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 177 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 178 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 180 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 181 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 182 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 183 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 184 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 185 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 186 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 187 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 188 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 189 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 190 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 191 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 192 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 193 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 194 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 197 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 208 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 209 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 210 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 213 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 216 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 217 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 218 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 219 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 220 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 221 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 222 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 223 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 225 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 229 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 241 16)) (add PC (bv 2 16)) (add PC (bv 1 16))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
assign n0607 = 16'h1;
assign n0608 = ( RD_ROM_0 == n0607 );
assign n0609 = 16'h2;
assign n0610 = ( PC + n0609 );
assign n0611 = ( RD_ROM_0 == n0609 );
assign n0612 = ( PC + n0607 );
assign n0613 = 16'h5;
assign n0614 = ( RD_ROM_0 == n0613 );
assign n0615 = 16'h10;
assign n0616 = ( RD_ROM_0 == n0615 );
assign n0617 = 16'h11;
assign n0618 = ( RD_ROM_0 == n0617 );
assign n0619 = 16'h12;
assign n0620 = ( RD_ROM_0 == n0619 );
assign n0621 = 16'h15;
assign n0622 = ( RD_ROM_0 == n0621 );
assign n0623 = 16'h20;
assign n0624 = ( RD_ROM_0 == n0623 );
assign n0625 = 16'h21;
assign n0626 = ( RD_ROM_0 == n0625 );
assign n0627 = 16'h24;
assign n0628 = ( RD_ROM_0 == n0627 );
assign n0629 = 16'h25;
assign n0630 = ( RD_ROM_0 == n0629 );
assign n0631 = 16'h30;
assign n0632 = ( RD_ROM_0 == n0631 );
assign n0633 = 16'h31;
assign n0634 = ( RD_ROM_0 == n0633 );
assign n0635 = 16'h34;
assign n0636 = ( RD_ROM_0 == n0635 );
assign n0637 = 16'h35;
assign n0638 = ( RD_ROM_0 == n0637 );
assign n0639 = 16'h40;
assign n0640 = ( RD_ROM_0 == n0639 );
assign n0641 = 16'h41;
assign n0642 = ( RD_ROM_0 == n0641 );
assign n0643 = 16'h42;
assign n0644 = ( RD_ROM_0 == n0643 );
assign n0645 = 16'h43;
assign n0646 = ( RD_ROM_0 == n0645 );
assign n0647 = 16'h44;
assign n0648 = ( RD_ROM_0 == n0647 );
assign n0649 = 16'h45;
assign n0650 = ( RD_ROM_0 == n0649 );
assign n0651 = 16'h50;
assign n0652 = ( RD_ROM_0 == n0651 );
assign n0653 = 16'h51;
assign n0654 = ( RD_ROM_0 == n0653 );
assign n0655 = 16'h52;
assign n0656 = ( RD_ROM_0 == n0655 );
assign n0657 = 16'h53;
assign n0658 = ( RD_ROM_0 == n0657 );
assign n0659 = 16'h54;
assign n0660 = ( RD_ROM_0 == n0659 );
assign n0661 = 16'h55;
assign n0662 = ( RD_ROM_0 == n0661 );
assign n0663 = 16'h60;
assign n0664 = ( RD_ROM_0 == n0663 );
assign n0665 = 16'h61;
assign n0666 = ( RD_ROM_0 == n0665 );
assign n0667 = 16'h62;
assign n0668 = ( RD_ROM_0 == n0667 );
assign n0669 = 16'h63;
assign n0670 = ( RD_ROM_0 == n0669 );
assign n0671 = 16'h64;
assign n0672 = ( RD_ROM_0 == n0671 );
assign n0673 = 16'h65;
assign n0674 = ( RD_ROM_0 == n0673 );
assign n0675 = 16'h70;
assign n0676 = ( RD_ROM_0 == n0675 );
assign n0677 = 16'h71;
assign n0678 = ( RD_ROM_0 == n0677 );
assign n0679 = 16'h72;
assign n0680 = ( RD_ROM_0 == n0679 );
assign n0681 = 16'h74;
assign n0682 = ( RD_ROM_0 == n0681 );
assign n0683 = 16'h75;
assign n0684 = ( RD_ROM_0 == n0683 );
assign n0685 = 16'h76;
assign n0686 = ( RD_ROM_0 == n0685 );
assign n0687 = 16'h77;
assign n0688 = ( RD_ROM_0 == n0687 );
assign n0689 = 16'h78;
assign n0690 = ( RD_ROM_0 == n0689 );
assign n0691 = 16'h79;
assign n0692 = ( RD_ROM_0 == n0691 );
assign n0693 = 16'h7a;
assign n0694 = ( RD_ROM_0 == n0693 );
assign n0695 = 16'h7b;
assign n0696 = ( RD_ROM_0 == n0695 );
assign n0697 = 16'h7c;
assign n0698 = ( RD_ROM_0 == n0697 );
assign n0699 = 16'h7d;
assign n0700 = ( RD_ROM_0 == n0699 );
assign n0701 = 16'h7e;
assign n0702 = ( RD_ROM_0 == n0701 );
assign n0703 = 16'h7f;
assign n0704 = ( RD_ROM_0 == n0703 );
assign n0705 = 16'h80;
assign n0706 = ( RD_ROM_0 == n0705 );
assign n0707 = 16'h81;
assign n0708 = ( RD_ROM_0 == n0707 );
assign n0709 = 16'h82;
assign n0710 = ( RD_ROM_0 == n0709 );
assign n0711 = 16'h83;
assign n0712 = ( RD_ROM_0 == n0711 );
assign n0713 = { 8'b0, ACC };
assign n0714 = ( n0713 + n0612 );
assign n0715 = 16'h85;
assign n0716 = ( RD_ROM_0 == n0715 );
assign n0717 = 16'h86;
assign n0718 = ( RD_ROM_0 == n0717 );
assign n0719 = 16'h87;
assign n0720 = ( RD_ROM_0 == n0719 );
assign n0721 = 16'h88;
assign n0722 = ( RD_ROM_0 == n0721 );
assign n0723 = 16'h89;
assign n0724 = ( RD_ROM_0 == n0723 );
assign n0725 = 16'h8a;
assign n0726 = ( RD_ROM_0 == n0725 );
assign n0727 = 16'h8b;
assign n0728 = ( RD_ROM_0 == n0727 );
assign n0729 = 16'h8c;
assign n0730 = ( RD_ROM_0 == n0729 );
assign n0731 = 16'h8d;
assign n0732 = ( RD_ROM_0 == n0731 );
assign n0733 = 16'h8e;
assign n0734 = ( RD_ROM_0 == n0733 );
assign n0735 = 16'h8f;
assign n0736 = ( RD_ROM_0 == n0735 );
assign n0737 = 16'h90;
assign n0738 = ( RD_ROM_0 == n0737 );
assign n0739 = 16'h91;
assign n0740 = ( RD_ROM_0 == n0739 );
assign n0741 = 16'h92;
assign n0742 = ( RD_ROM_0 == n0741 );
assign n0743 = 16'h93;
assign n0744 = ( RD_ROM_0 == n0743 );
assign n0745 = { ( DPH ), ( DPL ) };
assign n0746 = ( n0713 + n0745 );
assign n0747 = 16'h94;
assign n0748 = ( RD_ROM_0 == n0747 );
assign n0749 = 16'h95;
assign n0750 = ( RD_ROM_0 == n0749 );
assign n0751 = 16'ha0;
assign n0752 = ( RD_ROM_0 == n0751 );
assign n0753 = 16'ha1;
assign n0754 = ( RD_ROM_0 == n0753 );
assign n0755 = 16'ha2;
assign n0756 = ( RD_ROM_0 == n0755 );
assign n0757 = 16'ha6;
assign n0758 = ( RD_ROM_0 == n0757 );
assign n0759 = 16'ha7;
assign n0760 = ( RD_ROM_0 == n0759 );
assign n0761 = 16'ha8;
assign n0762 = ( RD_ROM_0 == n0761 );
assign n0763 = 16'ha9;
assign n0764 = ( RD_ROM_0 == n0763 );
assign n0765 = 16'haa;
assign n0766 = ( RD_ROM_0 == n0765 );
assign n0767 = 16'hab;
assign n0768 = ( RD_ROM_0 == n0767 );
assign n0769 = 16'hac;
assign n0770 = ( RD_ROM_0 == n0769 );
assign n0771 = 16'had;
assign n0772 = ( RD_ROM_0 == n0771 );
assign n0773 = 16'hae;
assign n0774 = ( RD_ROM_0 == n0773 );
assign n0775 = 16'haf;
assign n0776 = ( RD_ROM_0 == n0775 );
assign n0777 = 16'hb0;
assign n0778 = ( RD_ROM_0 == n0777 );
assign n0779 = 16'hb1;
assign n0780 = ( RD_ROM_0 == n0779 );
assign n0781 = 16'hb2;
assign n0782 = ( RD_ROM_0 == n0781 );
assign n0783 = 16'hb4;
assign n0784 = ( RD_ROM_0 == n0783 );
assign n0785 = 16'hb5;
assign n0786 = ( RD_ROM_0 == n0785 );
assign n0787 = 16'hb6;
assign n0788 = ( RD_ROM_0 == n0787 );
assign n0789 = 16'hb7;
assign n0790 = ( RD_ROM_0 == n0789 );
assign n0791 = 16'hb8;
assign n0792 = ( RD_ROM_0 == n0791 );
assign n0793 = 16'hb9;
assign n0794 = ( RD_ROM_0 == n0793 );
assign n0795 = 16'hba;
assign n0796 = ( RD_ROM_0 == n0795 );
assign n0797 = 16'hbb;
assign n0798 = ( RD_ROM_0 == n0797 );
assign n0799 = 16'hbc;
assign n0800 = ( RD_ROM_0 == n0799 );
assign n0801 = 16'hbd;
assign n0802 = ( RD_ROM_0 == n0801 );
assign n0803 = 16'hbe;
assign n0804 = ( RD_ROM_0 == n0803 );
assign n0805 = 16'hbf;
assign n0806 = ( RD_ROM_0 == n0805 );
assign n0807 = 16'hc0;
assign n0808 = ( RD_ROM_0 == n0807 );
assign n0809 = 16'hc1;
assign n0810 = ( RD_ROM_0 == n0809 );
assign n0811 = 16'hc2;
assign n0812 = ( RD_ROM_0 == n0811 );
assign n0813 = 16'hc5;
assign n0814 = ( RD_ROM_0 == n0813 );
assign n0815 = 16'hd0;
assign n0816 = ( RD_ROM_0 == n0815 );
assign n0817 = 16'hd1;
assign n0818 = ( RD_ROM_0 == n0817 );
assign n0819 = 16'hd2;
assign n0820 = ( RD_ROM_0 == n0819 );
assign n0821 = 16'hd5;
assign n0822 = ( RD_ROM_0 == n0821 );
assign n0823 = 16'hd8;
assign n0824 = ( RD_ROM_0 == n0823 );
assign n0825 = 16'hd9;
assign n0826 = ( RD_ROM_0 == n0825 );
assign n0827 = 16'hda;
assign n0828 = ( RD_ROM_0 == n0827 );
assign n0829 = 16'hdb;
assign n0830 = ( RD_ROM_0 == n0829 );
assign n0831 = 16'hdc;
assign n0832 = ( RD_ROM_0 == n0831 );
assign n0833 = 16'hdd;
assign n0834 = ( RD_ROM_0 == n0833 );
assign n0835 = 16'hde;
assign n0836 = ( RD_ROM_0 == n0835 );
assign n0837 = 16'hdf;
assign n0838 = ( RD_ROM_0 == n0837 );
assign n0839 = 16'he1;
assign n0840 = ( RD_ROM_0 == n0839 );
assign n0841 = 16'he5;
assign n0842 = ( RD_ROM_0 == n0841 );
assign n0843 = 16'hf1;
assign n0844 = ( RD_ROM_0 == n0843 );
assign n0845 = ( n0844 ) ? ( n0610 ) : ( n0612 );
assign n0846 = ( n0842 ) ? ( n0612 ) : ( n0845 );
assign n0847 = ( n0840 ) ? ( n0610 ) : ( n0846 );
assign n0848 = ( n0838 ) ? ( n0612 ) : ( n0847 );
assign n0849 = ( n0836 ) ? ( n0612 ) : ( n0848 );
assign n0850 = ( n0834 ) ? ( n0612 ) : ( n0849 );
assign n0851 = ( n0832 ) ? ( n0612 ) : ( n0850 );
assign n0852 = ( n0830 ) ? ( n0612 ) : ( n0851 );
assign n0853 = ( n0828 ) ? ( n0612 ) : ( n0852 );
assign n0854 = ( n0826 ) ? ( n0612 ) : ( n0853 );
assign n0855 = ( n0824 ) ? ( n0612 ) : ( n0854 );
assign n0856 = ( n0822 ) ? ( n0612 ) : ( n0855 );
assign n0857 = ( n0820 ) ? ( n0612 ) : ( n0856 );
assign n0858 = ( n0818 ) ? ( n0610 ) : ( n0857 );
assign n0859 = ( n0816 ) ? ( n0612 ) : ( n0858 );
assign n0860 = ( n0814 ) ? ( n0612 ) : ( n0859 );
assign n0861 = ( n0812 ) ? ( n0612 ) : ( n0860 );
assign n0862 = ( n0810 ) ? ( n0610 ) : ( n0861 );
assign n0863 = ( n0808 ) ? ( n0612 ) : ( n0862 );
assign n0864 = ( n0806 ) ? ( n0612 ) : ( n0863 );
assign n0865 = ( n0804 ) ? ( n0612 ) : ( n0864 );
assign n0866 = ( n0802 ) ? ( n0612 ) : ( n0865 );
assign n0867 = ( n0800 ) ? ( n0612 ) : ( n0866 );
assign n0868 = ( n0798 ) ? ( n0612 ) : ( n0867 );
assign n0869 = ( n0796 ) ? ( n0612 ) : ( n0868 );
assign n0870 = ( n0794 ) ? ( n0612 ) : ( n0869 );
assign n0871 = ( n0792 ) ? ( n0612 ) : ( n0870 );
assign n0872 = ( n0790 ) ? ( n0612 ) : ( n0871 );
assign n0873 = ( n0788 ) ? ( n0612 ) : ( n0872 );
assign n0874 = ( n0786 ) ? ( n0612 ) : ( n0873 );
assign n0875 = ( n0784 ) ? ( n0612 ) : ( n0874 );
assign n0876 = ( n0782 ) ? ( n0612 ) : ( n0875 );
assign n0877 = ( n0780 ) ? ( n0610 ) : ( n0876 );
assign n0878 = ( n0778 ) ? ( n0612 ) : ( n0877 );
assign n0879 = ( n0776 ) ? ( n0612 ) : ( n0878 );
assign n0880 = ( n0774 ) ? ( n0612 ) : ( n0879 );
assign n0881 = ( n0772 ) ? ( n0612 ) : ( n0880 );
assign n0882 = ( n0770 ) ? ( n0612 ) : ( n0881 );
assign n0883 = ( n0768 ) ? ( n0612 ) : ( n0882 );
assign n0884 = ( n0766 ) ? ( n0612 ) : ( n0883 );
assign n0885 = ( n0764 ) ? ( n0612 ) : ( n0884 );
assign n0886 = ( n0762 ) ? ( n0612 ) : ( n0885 );
assign n0887 = ( n0760 ) ? ( n0612 ) : ( n0886 );
assign n0888 = ( n0758 ) ? ( n0612 ) : ( n0887 );
assign n0889 = ( n0756 ) ? ( n0612 ) : ( n0888 );
assign n0890 = ( n0754 ) ? ( n0610 ) : ( n0889 );
assign n0891 = ( n0752 ) ? ( n0612 ) : ( n0890 );
assign n0892 = ( n0750 ) ? ( n0612 ) : ( n0891 );
assign n0893 = ( n0748 ) ? ( n0612 ) : ( n0892 );
assign n0894 = ( n0744 ) ? ( n0746 ) : ( n0893 );
assign n0895 = ( n0742 ) ? ( n0612 ) : ( n0894 );
assign n0896 = ( n0740 ) ? ( n0610 ) : ( n0895 );
assign n0897 = ( n0738 ) ? ( n0612 ) : ( n0896 );
assign n0898 = ( n0736 ) ? ( n0612 ) : ( n0897 );
assign n0899 = ( n0734 ) ? ( n0612 ) : ( n0898 );
assign n0900 = ( n0732 ) ? ( n0612 ) : ( n0899 );
assign n0901 = ( n0730 ) ? ( n0612 ) : ( n0900 );
assign n0902 = ( n0728 ) ? ( n0612 ) : ( n0901 );
assign n0903 = ( n0726 ) ? ( n0612 ) : ( n0902 );
assign n0904 = ( n0724 ) ? ( n0612 ) : ( n0903 );
assign n0905 = ( n0722 ) ? ( n0612 ) : ( n0904 );
assign n0906 = ( n0720 ) ? ( n0612 ) : ( n0905 );
assign n0907 = ( n0718 ) ? ( n0612 ) : ( n0906 );
assign n0908 = ( n0716 ) ? ( n0610 ) : ( n0907 );
assign n0909 = ( n0712 ) ? ( n0714 ) : ( n0908 );
assign n0910 = ( n0710 ) ? ( n0612 ) : ( n0909 );
assign n0911 = ( n0708 ) ? ( n0610 ) : ( n0910 );
assign n0912 = ( n0706 ) ? ( n0612 ) : ( n0911 );
assign n0913 = ( n0704 ) ? ( n0612 ) : ( n0912 );
assign n0914 = ( n0702 ) ? ( n0612 ) : ( n0913 );
assign n0915 = ( n0700 ) ? ( n0612 ) : ( n0914 );
assign n0916 = ( n0698 ) ? ( n0612 ) : ( n0915 );
assign n0917 = ( n0696 ) ? ( n0612 ) : ( n0916 );
assign n0918 = ( n0694 ) ? ( n0612 ) : ( n0917 );
assign n0919 = ( n0692 ) ? ( n0612 ) : ( n0918 );
assign n0920 = ( n0690 ) ? ( n0612 ) : ( n0919 );
assign n0921 = ( n0688 ) ? ( n0612 ) : ( n0920 );
assign n0922 = ( n0686 ) ? ( n0612 ) : ( n0921 );
assign n0923 = ( n0684 ) ? ( n0612 ) : ( n0922 );
assign n0924 = ( n0682 ) ? ( n0612 ) : ( n0923 );
assign n0925 = ( n0680 ) ? ( n0612 ) : ( n0924 );
assign n0926 = ( n0678 ) ? ( n0610 ) : ( n0925 );
assign n0927 = ( n0676 ) ? ( n0612 ) : ( n0926 );
assign n0928 = ( n0674 ) ? ( n0612 ) : ( n0927 );
assign n0929 = ( n0672 ) ? ( n0612 ) : ( n0928 );
assign n0930 = ( n0670 ) ? ( n0612 ) : ( n0929 );
assign n0931 = ( n0668 ) ? ( n0612 ) : ( n0930 );
assign n0932 = ( n0666 ) ? ( n0610 ) : ( n0931 );
assign n0933 = ( n0664 ) ? ( n0612 ) : ( n0932 );
assign n0934 = ( n0662 ) ? ( n0612 ) : ( n0933 );
assign n0935 = ( n0660 ) ? ( n0612 ) : ( n0934 );
assign n0936 = ( n0658 ) ? ( n0612 ) : ( n0935 );
assign n0937 = ( n0656 ) ? ( n0612 ) : ( n0936 );
assign n0938 = ( n0654 ) ? ( n0610 ) : ( n0937 );
assign n0939 = ( n0652 ) ? ( n0612 ) : ( n0938 );
assign n0940 = ( n0650 ) ? ( n0612 ) : ( n0939 );
assign n0941 = ( n0648 ) ? ( n0612 ) : ( n0940 );
assign n0942 = ( n0646 ) ? ( n0612 ) : ( n0941 );
assign n0943 = ( n0644 ) ? ( n0612 ) : ( n0942 );
assign n0944 = ( n0642 ) ? ( n0610 ) : ( n0943 );
assign n0945 = ( n0640 ) ? ( n0612 ) : ( n0944 );
assign n0946 = ( n0638 ) ? ( n0612 ) : ( n0945 );
assign n0947 = ( n0636 ) ? ( n0612 ) : ( n0946 );
assign n0948 = ( n0634 ) ? ( n0610 ) : ( n0947 );
assign n0949 = ( n0632 ) ? ( n0612 ) : ( n0948 );
assign n0950 = ( n0630 ) ? ( n0612 ) : ( n0949 );
assign n0951 = ( n0628 ) ? ( n0612 ) : ( n0950 );
assign n0952 = ( n0626 ) ? ( n0610 ) : ( n0951 );
assign n0953 = ( n0624 ) ? ( n0612 ) : ( n0952 );
assign n0954 = ( n0622 ) ? ( n0612 ) : ( n0953 );
assign n0955 = ( n0620 ) ? ( n0612 ) : ( n0954 );
assign n0956 = ( n0618 ) ? ( n0610 ) : ( n0955 );
assign n0957 = ( n0616 ) ? ( n0612 ) : ( n0956 );
assign n0958 = ( n0614 ) ? ( n0612 ) : ( n0957 );
assign n0959 = ( n0611 ) ? ( n0612 ) : ( n0958 );
assign n0960 = ( n0608 ) ? ( n0610 ) : ( n0959 );
assign RD_ROM_1_ADDR = n0960;
// RD_ROM_2_ADDR=(if (eq RD_ROM_0 (bv 1 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 2 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 16 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 17 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 18 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 32 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 33 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 48 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 49 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 65 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 67 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 81 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 83 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 97 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 99 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 113 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 117 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 129 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 133 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 144 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 145 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 161 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 177 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 180 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 181 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 182 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 183 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 184 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 185 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 186 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 187 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 188 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 189 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 190 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 191 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 193 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 209 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 213 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 225 16)) (add PC (bv 1 16)) (add PC (bv 1 16)))))))))))))))))))))))))))))))))))))))))
assign n0961 = ( n0840 ) ? ( n0612 ) : ( n0612 );
assign n0962 = ( n0822 ) ? ( n0610 ) : ( n0961 );
assign n0963 = ( n0818 ) ? ( n0612 ) : ( n0962 );
assign n0964 = ( n0810 ) ? ( n0612 ) : ( n0963 );
assign n0965 = ( n0806 ) ? ( n0610 ) : ( n0964 );
assign n0966 = ( n0804 ) ? ( n0610 ) : ( n0965 );
assign n0967 = ( n0802 ) ? ( n0610 ) : ( n0966 );
assign n0968 = ( n0800 ) ? ( n0610 ) : ( n0967 );
assign n0969 = ( n0798 ) ? ( n0610 ) : ( n0968 );
assign n0970 = ( n0796 ) ? ( n0610 ) : ( n0969 );
assign n0971 = ( n0794 ) ? ( n0610 ) : ( n0970 );
assign n0972 = ( n0792 ) ? ( n0610 ) : ( n0971 );
assign n0973 = ( n0790 ) ? ( n0610 ) : ( n0972 );
assign n0974 = ( n0788 ) ? ( n0610 ) : ( n0973 );
assign n0975 = ( n0786 ) ? ( n0610 ) : ( n0974 );
assign n0976 = ( n0784 ) ? ( n0610 ) : ( n0975 );
assign n0977 = ( n0780 ) ? ( n0612 ) : ( n0976 );
assign n0978 = ( n0754 ) ? ( n0612 ) : ( n0977 );
assign n0979 = ( n0740 ) ? ( n0612 ) : ( n0978 );
assign n0980 = ( n0738 ) ? ( n0610 ) : ( n0979 );
assign n0981 = ( n0716 ) ? ( n0612 ) : ( n0980 );
assign n0982 = ( n0708 ) ? ( n0612 ) : ( n0981 );
assign n0983 = ( n0684 ) ? ( n0610 ) : ( n0982 );
assign n0984 = ( n0678 ) ? ( n0612 ) : ( n0983 );
assign n0985 = ( n0670 ) ? ( n0610 ) : ( n0984 );
assign n0986 = ( n0666 ) ? ( n0612 ) : ( n0985 );
assign n0987 = ( n0658 ) ? ( n0610 ) : ( n0986 );
assign n0988 = ( n0654 ) ? ( n0612 ) : ( n0987 );
assign n0989 = ( n0646 ) ? ( n0610 ) : ( n0988 );
assign n0990 = ( n0642 ) ? ( n0612 ) : ( n0989 );
assign n0991 = ( n0634 ) ? ( n0612 ) : ( n0990 );
assign n0992 = ( n0632 ) ? ( n0610 ) : ( n0991 );
assign n0993 = ( n0626 ) ? ( n0612 ) : ( n0992 );
assign n0994 = ( n0624 ) ? ( n0610 ) : ( n0993 );
assign n0995 = ( n0620 ) ? ( n0610 ) : ( n0994 );
assign n0996 = ( n0618 ) ? ( n0612 ) : ( n0995 );
assign n0997 = ( n0616 ) ? ( n0610 ) : ( n0996 );
assign n0998 = ( n0611 ) ? ( n0610 ) : ( n0997 );
assign n0999 = ( n0608 ) ? ( n0612 ) : ( n0998 );
assign RD_ROM_2_ADDR = n0999;
// 
// ACC_00
// 
assign ACC_00 = ACC;
// 
// B_00
// 
assign B_00 = B;
// 
// DPL_00
// 
assign DPL_00 = DPL;
// 
// DPH_00
// 
assign DPH_00 = DPH;
// 
// XRAM_ADDR_00
// 
assign n1000 = 16'h0;
assign XRAM_ADDR_00 = n1000;
// 
// PC_00
// 
assign PC_00 = n0612;
// 
// P2_00
// 
assign P2_00 = P2;
// 
// P3_00
// 
assign P3_00 = P3;
// 
// P0_00
// 
assign P0_00 = P0;
// 
// P1_00
// 
assign P1_00 = P1;
// 
// XRAM_DATA_OUT_00
// 
assign n1001 = 8'h0;
assign XRAM_DATA_OUT_00 = n1001;
// 
// SP_00
// 
assign SP_00 = SP;
// 
// PSW_00
// 
assign n1002 = PSW[7:1];
assign n1003 = ACC[7:7];
assign n1004 = ACC[6:6];
assign n1005 = ACC[5:5];
assign n1006 = ACC[4:4];
assign n1007 = ACC[3:3];
assign n1008 = ACC[2:2];
assign n1009 = ACC[1:1];
assign n1010 = ACC[0:0];
assign n1011 = ( n1009 ^ n1010 );
assign n1012 = ( n1008 ^ n1011 );
assign n1013 = ( n1007 ^ n1012 );
assign n1014 = ( n1006 ^ n1013 );
assign n1015 = ( n1005 ^ n1014 );
assign n1016 = ( n1004 ^ n1015 );
assign n1017 = ( n1003 ^ n1016 );
assign n1018 = { ( n1002 ), ( n1017 ) };
assign PSW_00 = n1018;
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
assign n1019 = 1'h0;
assign n1020 = ( n0042 == n1019 );
assign n1021 = RD_ROM_1[3:0];
assign n1022 = 8'h80;
assign n1023 = ( RD_ROM_1 == n1022 );
assign n1024 = 8'h81;
assign n1025 = ( RD_ROM_1 == n1024 );
assign n1026 = ( RD_ROM_1 == n0208 );
assign n1027 = 8'h83;
assign n1028 = ( RD_ROM_1 == n1027 );
assign n1029 = ( RD_ROM_1 == n0214 );
assign n1030 = ( RD_ROM_1 == n0216 );
assign n1031 = ( RD_ROM_1 == n0218 );
assign n1032 = ( RD_ROM_1 == n0220 );
assign n1033 = ( RD_ROM_1 == n0224 );
assign n1034 = ( RD_ROM_1 == n0222 );
assign n1035 = ( RD_ROM_1 == n0226 );
assign n1036 = 8'h90;
assign n1037 = ( RD_ROM_1 == n1036 );
assign n1038 = ( RD_ROM_1 == n0240 );
assign n1039 = ( RD_ROM_1 == n0242 );
assign n1040 = ( RD_ROM_1 == n0256 );
assign n1041 = ( RD_ROM_1 == n0264 );
assign n1042 = ( RD_ROM_1 == n0280 );
assign n1043 = ( RD_ROM_1 == n0290 );
assign n1044 = ( RD_ROM_1 == n0332 );
assign n1045 = 8'he0;
assign n1046 = ( RD_ROM_1 == n1045 );
assign n1047 = 8'hf0;
assign n1048 = ( RD_ROM_1 == n1047 );
assign n1049 = ( n1048 ) ? ( B ) : ( n1001 );
assign n1050 = ( n1046 ) ? ( ACC ) : ( n1049 );
assign n1051 = ( n1044 ) ? ( PSW ) : ( n1050 );
assign n1052 = ( n1043 ) ? ( IP ) : ( n1051 );
assign n1053 = ( n1042 ) ? ( P3 ) : ( n1052 );
assign n1054 = ( n1041 ) ? ( IE ) : ( n1053 );
assign n1055 = ( n1040 ) ? ( P2 ) : ( n1054 );
assign n1056 = ( n1039 ) ? ( SBUF ) : ( n1055 );
assign n1057 = ( n1038 ) ? ( SCON ) : ( n1056 );
assign n1058 = ( n1037 ) ? ( P1 ) : ( n1057 );
assign n1059 = ( n1035 ) ? ( TH1 ) : ( n1058 );
assign n1060 = ( n1034 ) ? ( TL1 ) : ( n1059 );
assign n1061 = ( n1033 ) ? ( TH0 ) : ( n1060 );
assign n1062 = ( n1032 ) ? ( TL0 ) : ( n1061 );
assign n1063 = ( n1031 ) ? ( TMOD ) : ( n1062 );
assign n1064 = ( n1030 ) ? ( TCON ) : ( n1063 );
assign n1065 = ( n1029 ) ? ( PCON ) : ( n1064 );
assign n1066 = ( n1028 ) ? ( DPH ) : ( n1065 );
assign n1067 = ( n1026 ) ? ( DPL ) : ( n1066 );
assign n1068 = ( n1025 ) ? ( SP ) : ( n1067 );
assign n1069 = ( n1023 ) ? ( P0 ) : ( n1068 );
assign n1070 = ( n1020 ) ? ( RD_IRAM_0 ) : ( n1069 );
assign n1071 = ( n1070 + n0574 );
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
assign n1072 = RD_IRAM_0[3:0];
assign n1073 = ( RD_IRAM_1 + n0574 );
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
assign n1074 = n0007[3:0];
assign n1075 = ( RD_IRAM_0 + n0574 );
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
assign n1076 = n0011[3:0];
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
assign n1077 = n0019[3:0];
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
assign n1078 = n0023[3:0];
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
assign n1079 = n0027[3:0];
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
assign n1080 = n0031[3:0];
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
assign n1081 = n0035[3:0];
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
assign n1082 = n0039[3:0];
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
assign n1083 = n0050[7:7];
assign n1084 = ( n1083 == n1019 );
assign n1085 = n0050[3:0];
assign n1086 = RD_ROM_1[2:0];
assign n1087 = { 5'b0, n1086 };
assign n1088 = ( n0574 << n1087 );
assign n1089 = ~( n1088 );
assign n1090 = ( n0050 == n1022 );
assign n1091 = ( n0050 == n0216 );
assign n1092 = ( n0050 == n1036 );
assign n1093 = ( n0050 == n0240 );
assign n1094 = ( n0050 == n0256 );
assign n1095 = ( n0050 == n0264 );
assign n1096 = ( n0050 == n0280 );
assign n1097 = ( n0050 == n0290 );
assign n1098 = ( n0050 == n0332 );
assign n1099 = ( n0050 == n1045 );
assign n1100 = ( n0050 == n1047 );
assign n1101 = ( n1100 ) ? ( B ) : ( n1001 );
assign n1102 = ( n1099 ) ? ( ACC ) : ( n1101 );
assign n1103 = ( n1098 ) ? ( PSW ) : ( n1102 );
assign n1104 = ( n1097 ) ? ( IP ) : ( n1103 );
assign n1105 = ( n1096 ) ? ( P3INREG ) : ( n1104 );
assign n1106 = ( n1095 ) ? ( IE ) : ( n1105 );
assign n1107 = ( n1094 ) ? ( P2INREG ) : ( n1106 );
assign n1108 = ( n1093 ) ? ( SCON ) : ( n1107 );
assign n1109 = ( n1092 ) ? ( P1INREG ) : ( n1108 );
assign n1110 = ( n1091 ) ? ( TCON ) : ( n1109 );
assign n1111 = ( n1090 ) ? ( P0INREG ) : ( n1110 );
assign n1112 = ( n1084 ) ? ( RD_IRAM_0 ) : ( n1111 );
assign n1113 = ( n1089 & n1112 );
assign n1114 = { 7'b0, n1019 };
assign n1115 = ( n1114 << n1087 );
assign n1116 = ( n1113 | n1115 );
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
assign n1117 = ( SP + n0574 );
assign n1118 = n1117[3:0];
assign n1119 = n0610[7:0];
assign n1120 = ( n1117 + n0574 );
assign n1121 = n1120[3:0];
assign n1122 = n0610[15:8];
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
assign n1123 = 16'h3;
assign n1124 = ( PC + n1123 );
assign n1125 = n1124[7:0];
assign n1126 = n1124[15:8];
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
assign n1127 = ( n1070 - n0574 );
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
assign n1128 = ( RD_IRAM_1 - n0574 );
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
assign n1129 = ( RD_IRAM_0 - n0574 );
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
assign n1130 = ( n1070 | ACC );
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
assign n1131 = ( n1070 | RD_ROM_2 );
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
assign n1132 = ( n1070 & ACC );
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
assign n1133 = ( n1070 & RD_ROM_2 );
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
assign n1134 = ( n1070 ^ ACC );
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
assign n1135 = ( n1070 ^ RD_ROM_2 );
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
assign n1136 = RD_ROM_2[7:7];
assign n1137 = ( n1136 == n1019 );
assign n1138 = ( RD_ROM_2 == n1022 );
assign n1139 = ( RD_ROM_2 == n1024 );
assign n1140 = ( RD_ROM_2 == n0208 );
assign n1141 = ( RD_ROM_2 == n1027 );
assign n1142 = ( RD_ROM_2 == n0214 );
assign n1143 = ( RD_ROM_2 == n0216 );
assign n1144 = ( RD_ROM_2 == n0218 );
assign n1145 = ( RD_ROM_2 == n0220 );
assign n1146 = ( RD_ROM_2 == n0224 );
assign n1147 = ( RD_ROM_2 == n0222 );
assign n1148 = ( RD_ROM_2 == n0226 );
assign n1149 = ( RD_ROM_2 == n1036 );
assign n1150 = ( RD_ROM_2 == n0240 );
assign n1151 = ( RD_ROM_2 == n0242 );
assign n1152 = ( RD_ROM_2 == n0256 );
assign n1153 = ( RD_ROM_2 == n0264 );
assign n1154 = ( RD_ROM_2 == n0280 );
assign n1155 = ( RD_ROM_2 == n0290 );
assign n1156 = ( RD_ROM_2 == n0332 );
assign n1157 = ( RD_ROM_2 == n1045 );
assign n1158 = ( RD_ROM_2 == n1047 );
assign n1159 = ( n1158 ) ? ( B ) : ( n1001 );
assign n1160 = ( n1157 ) ? ( ACC ) : ( n1159 );
assign n1161 = ( n1156 ) ? ( PSW ) : ( n1160 );
assign n1162 = ( n1155 ) ? ( IP ) : ( n1161 );
assign n1163 = ( n1154 ) ? ( P3INREG ) : ( n1162 );
assign n1164 = ( n1153 ) ? ( IE ) : ( n1163 );
assign n1165 = ( n1152 ) ? ( P2INREG ) : ( n1164 );
assign n1166 = ( n1151 ) ? ( SBUF ) : ( n1165 );
assign n1167 = ( n1150 ) ? ( SCON ) : ( n1166 );
assign n1168 = ( n1149 ) ? ( P1INREG ) : ( n1167 );
assign n1169 = ( n1148 ) ? ( TH1 ) : ( n1168 );
assign n1170 = ( n1147 ) ? ( TL1 ) : ( n1169 );
assign n1171 = ( n1146 ) ? ( TH0 ) : ( n1170 );
assign n1172 = ( n1145 ) ? ( TL0 ) : ( n1171 );
assign n1173 = ( n1144 ) ? ( TMOD ) : ( n1172 );
assign n1174 = ( n1143 ) ? ( TCON ) : ( n1173 );
assign n1175 = ( n1142 ) ? ( PCON ) : ( n1174 );
assign n1176 = ( n1141 ) ? ( DPH ) : ( n1175 );
assign n1177 = ( n1140 ) ? ( DPL ) : ( n1176 );
assign n1178 = ( n1139 ) ? ( SP ) : ( n1177 );
assign n1179 = ( n1138 ) ? ( P0INREG ) : ( n1178 );
assign n1180 = ( n1137 ) ? ( RD_IRAM_0 ) : ( n1179 );
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
assign n1181 = PSW[7:7];
assign n1182 = { 7'b0, n1181 };
assign n1183 = ( n1182 << n1087 );
assign n1184 = ( n1113 | n1183 );
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
// 
// P1_a5
// 
// 
// DPL_a5
// 
// 
// DPH_a5
// 
// 
// XRAM_ADDR_a5
// 
// 
// PC_a5
// 
// 
// P2_a5
// 
// 
// P3_a5
// 
// 
// P0_a5
// 
// 
// B_a5
// 
// 
// XRAM_DATA_OUT_a5
// 
// 
// SP_a5
// 
// 
// PSW_a5
// 
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
assign n1185 = ( n1042 ) ? ( P3INREG ) : ( n1052 );
assign n1186 = ( n1041 ) ? ( IE ) : ( n1185 );
assign n1187 = ( n1040 ) ? ( P2INREG ) : ( n1186 );
assign n1188 = ( n1039 ) ? ( SBUF ) : ( n1187 );
assign n1189 = ( n1038 ) ? ( SCON ) : ( n1188 );
assign n1190 = ( n1037 ) ? ( P1INREG ) : ( n1189 );
assign n1191 = ( n1035 ) ? ( TH1 ) : ( n1190 );
assign n1192 = ( n1034 ) ? ( TL1 ) : ( n1191 );
assign n1193 = ( n1033 ) ? ( TH0 ) : ( n1192 );
assign n1194 = ( n1032 ) ? ( TL0 ) : ( n1193 );
assign n1195 = ( n1031 ) ? ( TMOD ) : ( n1194 );
assign n1196 = ( n1030 ) ? ( TCON ) : ( n1195 );
assign n1197 = ( n1029 ) ? ( PCON ) : ( n1196 );
assign n1198 = ( n1028 ) ? ( DPH ) : ( n1197 );
assign n1199 = ( n1026 ) ? ( DPL ) : ( n1198 );
assign n1200 = ( n1025 ) ? ( SP ) : ( n1199 );
assign n1201 = ( n1023 ) ? ( P0INREG ) : ( n1200 );
assign n1202 = ( n1020 ) ? ( RD_IRAM_1 ) : ( n1201 );
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
assign n1203 = ( n1020 ) ? ( RD_IRAM_0 ) : ( n1201 );
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
assign n1204 = ( n1096 ) ? ( P3 ) : ( n1104 );
assign n1205 = ( n1095 ) ? ( IE ) : ( n1204 );
assign n1206 = ( n1094 ) ? ( P2 ) : ( n1205 );
assign n1207 = ( n1093 ) ? ( SCON ) : ( n1206 );
assign n1208 = ( n1092 ) ? ( P1 ) : ( n1207 );
assign n1209 = ( n1091 ) ? ( TCON ) : ( n1208 );
assign n1210 = ( n1090 ) ? ( P0 ) : ( n1209 );
assign n1211 = ( n1084 ) ? ( RD_IRAM_0 ) : ( n1210 );
assign n1212 = ( n1089 & n1211 );
assign n1213 = n1211[n1086];
assign n1214 = ~( n1213 );
assign n1215 = { 7'b0, n1214 };
assign n1216 = ( n1215 << n1087 );
assign n1217 = ( n1212 | n1216 );
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
assign n1218 = ( n1212 | n1115 );
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
assign n1219 = { 7'b0, n0043 };
assign n1220 = ( n1219 << n1087 );
assign n1221 = ( n1212 | n1220 );
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
assign n1222 = RD_IRAM_1[7:4];
assign n1223 = ACC[3:0];
assign n1224 = { ( n1222 ), ( n1223 ) };
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
assign n1225 = ( RD_ROM_0 == n1001 );
assign ACC_next =   ( n1225 ) ? ( ACC_00 ) :  ( ACC_abstr );
assign P2_next =   ( n1225 ) ? ( P2_00 ) :  ( P2_abstr );
assign P0_next =   ( n1225 ) ? ( P0_00 ) :  ( P0_abstr );
assign B_next =   ( n1225 ) ? ( B_00 ) :  ( B_abstr );
assign XRAM_ADDR_next =   ( n1225 ) ? ( XRAM_ADDR_00 ) :  ( XRAM_ADDR_abstr );
assign P3_next =   ( n1225 ) ? ( P3_00 ) :  ( P3_abstr );
assign SP_next =   ( n1225 ) ? ( SP_00 ) :  ( SP_abstr );
assign PC_next =   ( n1225 ) ? ( PC_00 ) :  ( PC_abstr );
assign P1_next =   ( n1225 ) ? ( P1_00 ) :  ( P1_abstr );
assign XRAM_DATA_OUT_next =   ( n1225 ) ? ( XRAM_DATA_OUT_00 ) :  ( XRAM_DATA_OUT_abstr );
assign DPL_next =   ( n1225 ) ? ( DPL_00 ) :  ( DPL_abstr );
assign PSW_next =   ( n1225 ) ? ( PSW_00 ) :  ( PSW_abstr );
assign DPH_next =   ( n1225 ) ? ( DPH_00 ) :  ( DPH_abstr );
assign n1226 = 8'h11;
assign n1227 = ( RD_ROM_0 == n1226 );
assign n1228 = 8'h12;
assign n1229 = ( RD_ROM_0 == n1228 );
assign n1230 = 8'h31;
assign n1231 = ( RD_ROM_0 == n1230 );
assign n1232 = 8'h51;
assign n1233 = ( RD_ROM_0 == n1232 );
assign n1234 = 8'h71;
assign n1235 = ( RD_ROM_0 == n1234 );
assign n1236 = 8'h75;
assign n1237 = ( RD_ROM_0 == n1236 );
assign n1238 = 8'h78;
assign n1239 = ( RD_ROM_0 == n1238 );
assign n1240 = 8'h79;
assign n1241 = ( RD_ROM_0 == n1240 );
assign n1242 = 8'h7a;
assign n1243 = ( RD_ROM_0 == n1242 );
assign n1244 = 8'h7b;
assign n1245 = ( RD_ROM_0 == n1244 );
assign n1246 = 8'h7c;
assign n1247 = ( RD_ROM_0 == n1246 );
assign n1248 = 8'h7d;
assign n1249 = ( RD_ROM_0 == n1248 );
assign n1250 = 8'h7e;
assign n1251 = ( RD_ROM_0 == n1250 );
assign n1252 = 8'h7f;
assign n1253 = ( RD_ROM_0 == n1252 );
assign n1254 = 8'h91;
assign n1255 = ( RD_ROM_0 == n1254 );
assign n1256 = 8'hb1;
assign n1257 = ( RD_ROM_0 == n1256 );
assign n1258 = 8'hd1;
assign n1259 = ( RD_ROM_0 == n1258 );
assign n1260 = 8'hf1;
assign n1261 = ( RD_ROM_0 == n1260 );
assign n1262 = 8'hf5;
assign n1263 = ( RD_ROM_0 == n1262 );
assign n1264 = 8'hf7;
assign n1265 = ( RD_ROM_0 == n1264 );
assign n1266 = 8'hf8;
assign n1267 = ( RD_ROM_0 == n1266 );
assign n1268 = 8'hf9;
assign n1269 = ( RD_ROM_0 == n1268 );
assign n1270 = 8'hfa;
assign n1271 = ( RD_ROM_0 == n1270 );
assign n1272 = 8'hfb;
assign n1273 = ( RD_ROM_0 == n1272 );
assign n1274 = 8'hfc;
assign n1275 = ( RD_ROM_0 == n1274 );
assign n1276 = 8'hfd;
assign n1277 = ( RD_ROM_0 == n1276 );
assign n1278 = 8'hfe;
assign n1279 = ( RD_ROM_0 == n1278 );
assign n1280 = 8'hff;
assign n1281 = ( RD_ROM_0 == n1280 );
assign WR_ADDR_0_IRAM = ((n0002) && (n1020)) ? (n1021) : ((n0004) ? (n1072) : ((n0009) ? (n1072) : ((n0013) ? (n1074) : ((n0015) ? (n1076) : ((n0017) ? (n1077) : ((n0021) ? (n1078) : ((n0025) ? (n1079) : ((n0029) ? (n1080) : ((n0033) ? (n1081) : ((n0037) ? (n1082) : (((n0041) && (n1084)) ? (n1085) : (((n1227) && (((n1118) != (n1121)))) ? (n1118) : (((n1229) && (((n1118) != (n1121)))) ? (n1118) : (((n0052) && (n1020)) ? (n1021) : ((n0054) ? (n1072) : ((n0056) ? (n1072) : ((n0058) ? (n1074) : ((n0060) ? (n1076) : ((n0062) ? (n1077) : ((n0064) ? (n1078) : ((n0066) ? (n1079) : ((n0068) ? (n1080) : ((n0070) ? (n1081) : ((n0072) ? (n1082) : (((n1231) && (((n1118) != (n1121)))) ? (n1118) : (((n0125) && (n1020)) ? (n1021) : (((n0127) && (n1020)) ? (n1021) : (((n1233) && (((n1118) != (n1121)))) ? (n1118) : (((n0151) && (n1020)) ? (n1021) : (((n0153) && (n1020)) ? (n1021) : (((n0177) && (n1020)) ? (n1021) : (((n0179) && (n1020)) ? (n1021) : (((n1235) && (((n1118) != (n1121)))) ? (n1118) : (((n1237) && (n1020)) ? (n1021) : ((n0205) ? (n1072) : ((n0207) ? (n1072) : ((n1239) ? (n1074) : ((n1241) ? (n1076) : ((n1243) ? (n1077) : ((n1245) ? (n1078) : ((n1247) ? (n1079) : ((n1249) ? (n1080) : ((n1251) ? (n1081) : ((n1253) ? (n1082) : (((n0211) && (n1020)) ? (n1021) : (((n0213) && (n1020)) ? (n1021) : (((n0215) && (n1020)) ? (n1021) : (((n0217) && (n1020)) ? (n1021) : (((n0219) && (n1020)) ? (n1021) : (((n0221) && (n1020)) ? (n1021) : (((n0223) && (n1020)) ? (n1021) : (((n0225) && (n1020)) ? (n1021) : (((n0227) && (n1020)) ? (n1021) : (((n0229) && (n1020)) ? (n1021) : (((n0231) && (n1020)) ? (n1021) : (((n1255) && (((n1118) != (n1121)))) ? (n1118) : (((n0233) && (n1084)) ? (n1085) : ((n0261) ? (n1072) : ((n0263) ? (n1072) : ((n0265) ? (n1074) : ((n0267) ? (n1076) : ((n0269) ? (n1077) : ((n0271) ? (n1078) : ((n0273) ? (n1079) : ((n0275) ? (n1080) : ((n0277) ? (n1081) : ((n0279) ? (n1082) : (((n1257) && (((n1118) != (n1121)))) ? (n1118) : (((n0283) && (n1084)) ? (n1085) : ((n0307) ? (n1118) : (((n0309) && (n1084)) ? (n1085) : (((n0311) && (n1020)) ? (n1021) : ((n0313) ? (n1072) : ((n0315) ? (n1072) : ((n0317) ? (n1074) : ((n0319) ? (n1076) : ((n0321) ? (n1077) : ((n0323) ? (n1078) : ((n0325) ? (n1079) : ((n0327) ? (n1080) : ((n0329) ? (n1081) : ((n0331) ? (n1082) : (((n0333) && (n1020)) ? (n1021) : (((n1259) && (((n1118) != (n1121)))) ? (n1118) : (((n0335) && (n1084)) ? (n1085) : (((n0337) && (n1020)) ? (n1021) : ((n0339) ? (n1072) : ((n0341) ? (n1072) : ((n0343) ? (n1074) : ((n0345) ? (n1076) : ((n0347) ? (n1077) : ((n0349) ? (n1078) : ((n0351) ? (n1079) : ((n0353) ? (n1080) : ((n0355) ? (n1081) : ((n0357) ? (n1082) : (((n1261) && (((n1118) != (n1121)))) ? (n1118) : (((n1263) && (n1020)) ? (n1021) : ((n0389) ? (n1072) : ((n1265) ? (n1072) : ((n1267) ? (n1074) : ((n1269) ? (n1076) : ((n1271) ? (n1077) : ((n1273) ? (n1078) : ((n1275) ? (n1079) : ((n1277) ? (n1080) : ((n1279) ? (n1081) : (n1082))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign WR_DATA_0_IRAM = ((n0002) && (n1020)) ? (n1071) : ((n0004) ? (n1073) : ((n0009) ? (n1073) : ((n0013) ? (n1075) : ((n0015) ? (n1075) : ((n0017) ? (n1075) : ((n0021) ? (n1075) : ((n0025) ? (n1075) : ((n0029) ? (n1075) : ((n0033) ? (n1075) : ((n0037) ? (n1075) : (((n0041) && (n1084)) ? (n1116) : (((n1227) && (((n1118) != (n1121)))) ? (n1119) : (((n1229) && (((n1118) != (n1121)))) ? (n1125) : (((n0052) && (n1020)) ? (n1127) : ((n0054) ? (n1128) : ((n0056) ? (n1128) : ((n0058) ? (n1129) : ((n0060) ? (n1129) : ((n0062) ? (n1129) : ((n0064) ? (n1129) : ((n0066) ? (n1129) : ((n0068) ? (n1129) : ((n0070) ? (n1129) : ((n0072) ? (n1129) : (((n1231) && (((n1118) != (n1121)))) ? (n1119) : (((n0125) && (n1020)) ? (n1130) : (((n0127) && (n1020)) ? (n1131) : (((n1233) && (((n1118) != (n1121)))) ? (n1119) : (((n0151) && (n1020)) ? (n1132) : (((n0153) && (n1020)) ? (n1133) : (((n0177) && (n1020)) ? (n1134) : (((n0179) && (n1020)) ? (n1135) : (((n1235) && (((n1118) != (n1121)))) ? (n1119) : (((n1237) && (n1020)) ? (RD_ROM_2) : ((n0205) ? (RD_ROM_1) : ((n0207) ? (RD_ROM_1) : ((n1239) ? (RD_ROM_1) : ((n1241) ? (RD_ROM_1) : ((n1243) ? (RD_ROM_1) : ((n1245) ? (RD_ROM_1) : ((n1247) ? (RD_ROM_1) : ((n1249) ? (RD_ROM_1) : ((n1251) ? (RD_ROM_1) : ((n1253) ? (RD_ROM_1) : (((n0211) && (n1020)) ? (n1180) : (((n0213) && (n1020)) ? (RD_IRAM_1) : (((n0215) && (n1020)) ? (RD_IRAM_1) : (((n0217) && (n1020)) ? (RD_IRAM_0) : (((n0219) && (n1020)) ? (RD_IRAM_0) : (((n0221) && (n1020)) ? (RD_IRAM_0) : (((n0223) && (n1020)) ? (RD_IRAM_0) : (((n0225) && (n1020)) ? (RD_IRAM_0) : (((n0227) && (n1020)) ? (RD_IRAM_0) : (((n0229) && (n1020)) ? (RD_IRAM_0) : (((n0231) && (n1020)) ? (RD_IRAM_0) : (((n1255) && (((n1118) != (n1121)))) ? (n1119) : (((n0233) && (n1084)) ? (n1184) : ((n0261) ? (n1202) : ((n0263) ? (n1202) : ((n0265) ? (n1203) : ((n0267) ? (n1203) : ((n0269) ? (n1203) : ((n0271) ? (n1203) : ((n0273) ? (n1203) : ((n0275) ? (n1203) : ((n0277) ? (n1203) : ((n0279) ? (n1203) : (((n1257) && (((n1118) != (n1121)))) ? (n1119) : (((n0283) && (n1084)) ? (n1217) : ((n0307) ? (n1203) : (((n0309) && (n1084)) ? (n1218) : (((n0311) && (n1020)) ? (ACC) : ((n0313) ? (ACC) : ((n0315) ? (ACC) : ((n0317) ? (ACC) : ((n0319) ? (ACC) : ((n0321) ? (ACC) : ((n0323) ? (ACC) : ((n0325) ? (ACC) : ((n0327) ? (ACC) : ((n0329) ? (ACC) : ((n0331) ? (ACC) : (((n0333) && (n1020)) ? (RD_IRAM_0) : (((n1259) && (((n1118) != (n1121)))) ? (n1119) : (((n0335) && (n1084)) ? (n1221) : (((n0337) && (n1020)) ? (n1127) : ((n0339) ? (n1224) : ((n0341) ? (n1224) : ((n0343) ? (n1129) : ((n0345) ? (n1129) : ((n0347) ? (n1129) : ((n0349) ? (n1129) : ((n0351) ? (n1129) : ((n0353) ? (n1129) : ((n0355) ? (n1129) : ((n0357) ? (n1129) : (((n1261) && (((n1118) != (n1121)))) ? (n1119) : (((n1263) && (n1020)) ? (ACC) : ((n0389) ? (ACC) : ((n1265) ? (ACC) : ((n1267) ? (ACC) : ((n1269) ? (ACC) : ((n1271) ? (ACC) : ((n1273) ? (ACC) : ((n1275) ? (ACC) : ((n1277) ? (ACC) : ((n1279) ? (ACC) : (ACC))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign WR_COND_0_IRAM = ((n0002) && (n1020)) || (n0004) || (n0009) || (n0013) || (n0015) || (n0017) || (n0021) || (n0025) || (n0029) || (n0033) || (n0037) || ((n0041) && (n1084)) || ((n1227) && (((n1118) != (n1121)))) || ((n1229) && (((n1118) != (n1121)))) || ((n0052) && (n1020)) || (n0054) || (n0056) || (n0058) || (n0060) || (n0062) || (n0064) || (n0066) || (n0068) || (n0070) || (n0072) || ((n1231) && (((n1118) != (n1121)))) || ((n0125) && (n1020)) || ((n0127) && (n1020)) || ((n1233) && (((n1118) != (n1121)))) || ((n0151) && (n1020)) || ((n0153) && (n1020)) || ((n0177) && (n1020)) || ((n0179) && (n1020)) || ((n1235) && (((n1118) != (n1121)))) || ((n1237) && (n1020)) || (n0205) || (n0207) || (n1239) || (n1241) || (n1243) || (n1245) || (n1247) || (n1249) || (n1251) || (n1253) || ((n0211) && (n1020)) || ((n0213) && (n1020)) || ((n0215) && (n1020)) || ((n0217) && (n1020)) || ((n0219) && (n1020)) || ((n0221) && (n1020)) || ((n0223) && (n1020)) || ((n0225) && (n1020)) || ((n0227) && (n1020)) || ((n0229) && (n1020)) || ((n0231) && (n1020)) || ((n1255) && (((n1118) != (n1121)))) || ((n0233) && (n1084)) || (n0261) || (n0263) || (n0265) || (n0267) || (n0269) || (n0271) || (n0273) || (n0275) || (n0277) || (n0279) || ((n1257) && (((n1118) != (n1121)))) || ((n0283) && (n1084)) || (n0307) || ((n0309) && (n1084)) || ((n0311) && (n1020)) || (n0313) || (n0315) || (n0317) || (n0319) || (n0321) || (n0323) || (n0325) || (n0327) || (n0329) || (n0331) || ((n0333) && (n1020)) || ((n1259) && (((n1118) != (n1121)))) || ((n0335) && (n1084)) || ((n0337) && (n1020)) || (n0339) || (n0341) || (n0343) || (n0345) || (n0347) || (n0349) || (n0351) || (n0353) || (n0355) || (n0357) || ((n1261) && (((n1118) != (n1121)))) || ((n1263) && (n1020)) || (n0389) || (n1265) || (n1267) || (n1269) || (n1271) || (n1273) || (n1275) || (n1277) || (n1279) || (n1281);
assign WR_ADDR_1_IRAM = (n1227) ? (n1121) : ((n1229) ? (n1121) : ((n1231) ? (n1121) : ((n1233) ? (n1121) : ((n1235) ? (n1121) : ((n1255) ? (n1121) : ((n1257) ? (n1121) : ((n1259) ? (n1121) : (n1121))))))));
assign WR_DATA_1_IRAM = (n1227) ? (n1122) : ((n1229) ? (n1126) : ((n1231) ? (n1122) : ((n1233) ? (n1122) : ((n1235) ? (n1122) : ((n1255) ? (n1122) : ((n1257) ? (n1122) : ((n1259) ? (n1122) : (n1122))))))));
assign WR_COND_1_IRAM = (n1227) || (n1229) || (n1231) || (n1233) || (n1235) || (n1255) || (n1257) || (n1259) || (n1261);
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
      B <= B_next;
      XRAM_ADDR <= XRAM_ADDR_next;
      P3 <= P3_next;
      SP <= SP_next;
      PC <= PC_next;
      P1 <= P1_next;
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
