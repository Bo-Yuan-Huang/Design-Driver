/*
 * This wrapper was written by Pramod Subramanyan.
 *
 * Email: pramod.subramanyan@gmail.com
 */ 

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on

module reg256byte(clk, rst, en, wr, addr, data_in, data_out, reg_out);
    input           clk;
    input           rst;
    input           en;
    input           wr;
    input   [7:0]   addr;
    input   [7:0]   data_in;
    output  [7:0]   data_out;
    output  [2047:0] reg_out;

    reg     [2047:0] reg_out;

    wire wr0   = en && wr && addr == 8'd0;
    wire wr1   = en && wr && addr == 8'd1;
    wire wr2   = en && wr && addr == 8'd2;
    wire wr3   = en && wr && addr == 8'd3;
    wire wr4   = en && wr && addr == 8'd4;
    wire wr5   = en && wr && addr == 8'd5;
    wire wr6   = en && wr && addr == 8'd6;
    wire wr7   = en && wr && addr == 8'd7;
    wire wr8   = en && wr && addr == 8'd8;
    wire wr9   = en && wr && addr == 8'd9;
    wire wr10  = en && wr && addr == 8'd10;
    wire wr11  = en && wr && addr == 8'd11;
    wire wr12  = en && wr && addr == 8'd12;
    wire wr13  = en && wr && addr == 8'd13;
    wire wr14  = en && wr && addr == 8'd14;
    wire wr15  = en && wr && addr == 8'd15;
    wire wr16  = en && wr && addr == 8'd16;
    wire wr17  = en && wr && addr == 8'd17;
    wire wr18  = en && wr && addr == 8'd18;
    wire wr19  = en && wr && addr == 8'd19;
    wire wr20  = en && wr && addr == 8'd20;
    wire wr21  = en && wr && addr == 8'd21;
    wire wr22  = en && wr && addr == 8'd22;
    wire wr23  = en && wr && addr == 8'd23;
    wire wr24  = en && wr && addr == 8'd24;
    wire wr25  = en && wr && addr == 8'd25;
    wire wr26  = en && wr && addr == 8'd26;
    wire wr27  = en && wr && addr == 8'd27;
    wire wr28  = en && wr && addr == 8'd28;
    wire wr29  = en && wr && addr == 8'd29;
    wire wr30  = en && wr && addr == 8'd30;
    wire wr31  = en && wr && addr == 8'd31;
    wire wr32  = en && wr && addr == 8'd32;
    wire wr33  = en && wr && addr == 8'd33;
    wire wr34  = en && wr && addr == 8'd34;
    wire wr35  = en && wr && addr == 8'd35;
    wire wr36  = en && wr && addr == 8'd36;
    wire wr37  = en && wr && addr == 8'd37;
    wire wr38  = en && wr && addr == 8'd38;
    wire wr39  = en && wr && addr == 8'd39;
    wire wr40  = en && wr && addr == 8'd40;
    wire wr41  = en && wr && addr == 8'd41;
    wire wr42  = en && wr && addr == 8'd42;
    wire wr43  = en && wr && addr == 8'd43;
    wire wr44  = en && wr && addr == 8'd44;
    wire wr45  = en && wr && addr == 8'd45;
    wire wr46  = en && wr && addr == 8'd46;
    wire wr47  = en && wr && addr == 8'd47;
    wire wr48  = en && wr && addr == 8'd48;
    wire wr49  = en && wr && addr == 8'd49;
    wire wr50  = en && wr && addr == 8'd50;
    wire wr51  = en && wr && addr == 8'd51;
    wire wr52  = en && wr && addr == 8'd52;
    wire wr53  = en && wr && addr == 8'd53;
    wire wr54  = en && wr && addr == 8'd54;
    wire wr55  = en && wr && addr == 8'd55;
    wire wr56  = en && wr && addr == 8'd56;
    wire wr57  = en && wr && addr == 8'd57;
    wire wr58  = en && wr && addr == 8'd58;
    wire wr59  = en && wr && addr == 8'd59;
    wire wr60  = en && wr && addr == 8'd60;
    wire wr61  = en && wr && addr == 8'd61;
    wire wr62  = en && wr && addr == 8'd62;
    wire wr63  = en && wr && addr == 8'd63;
    wire wr64  = en && wr && addr == 8'd64;
    wire wr65  = en && wr && addr == 8'd65;
    wire wr66  = en && wr && addr == 8'd66;
    wire wr67  = en && wr && addr == 8'd67;
    wire wr68  = en && wr && addr == 8'd68;
    wire wr69  = en && wr && addr == 8'd69;
    wire wr70  = en && wr && addr == 8'd70;
    wire wr71  = en && wr && addr == 8'd71;
    wire wr72  = en && wr && addr == 8'd72;
    wire wr73  = en && wr && addr == 8'd73;
    wire wr74  = en && wr && addr == 8'd74;
    wire wr75  = en && wr && addr == 8'd75;
    wire wr76  = en && wr && addr == 8'd76;
    wire wr77  = en && wr && addr == 8'd77;
    wire wr78  = en && wr && addr == 8'd78;
    wire wr79  = en && wr && addr == 8'd79;
    wire wr80  = en && wr && addr == 8'd80;
    wire wr81  = en && wr && addr == 8'd81;
    wire wr82  = en && wr && addr == 8'd82;
    wire wr83  = en && wr && addr == 8'd83;
    wire wr84  = en && wr && addr == 8'd84;
    wire wr85  = en && wr && addr == 8'd85;
    wire wr86  = en && wr && addr == 8'd86;
    wire wr87  = en && wr && addr == 8'd87;
    wire wr88  = en && wr && addr == 8'd88;
    wire wr89  = en && wr && addr == 8'd89;
    wire wr90  = en && wr && addr == 8'd90;
    wire wr91  = en && wr && addr == 8'd91;
    wire wr92  = en && wr && addr == 8'd92;
    wire wr93  = en && wr && addr == 8'd93;
    wire wr94  = en && wr && addr == 8'd94;
    wire wr95  = en && wr && addr == 8'd95;
    wire wr96  = en && wr && addr == 8'd96;
    wire wr97  = en && wr && addr == 8'd97;
    wire wr98  = en && wr && addr == 8'd98;
    wire wr99  = en && wr && addr == 8'd99;
    wire wr100 = en && wr && addr == 8'd100;
    wire wr101 = en && wr && addr == 8'd101;
    wire wr102 = en && wr && addr == 8'd102;
    wire wr103 = en && wr && addr == 8'd103;
    wire wr104 = en && wr && addr == 8'd104;
    wire wr105 = en && wr && addr == 8'd105;
    wire wr106 = en && wr && addr == 8'd106;
    wire wr107 = en && wr && addr == 8'd107;
    wire wr108 = en && wr && addr == 8'd108;
    wire wr109 = en && wr && addr == 8'd109;
    wire wr110 = en && wr && addr == 8'd110;
    wire wr111 = en && wr && addr == 8'd111;
    wire wr112 = en && wr && addr == 8'd112;
    wire wr113 = en && wr && addr == 8'd113;
    wire wr114 = en && wr && addr == 8'd114;
    wire wr115 = en && wr && addr == 8'd115;
    wire wr116 = en && wr && addr == 8'd116;
    wire wr117 = en && wr && addr == 8'd117;
    wire wr118 = en && wr && addr == 8'd118;
    wire wr119 = en && wr && addr == 8'd119;
    wire wr120 = en && wr && addr == 8'd120;
    wire wr121 = en && wr && addr == 8'd121;
    wire wr122 = en && wr && addr == 8'd122;
    wire wr123 = en && wr && addr == 8'd123;
    wire wr124 = en && wr && addr == 8'd124;
    wire wr125 = en && wr && addr == 8'd125;
    wire wr126 = en && wr && addr == 8'd126;
    wire wr127 = en && wr && addr == 8'd127;
    wire wr128 = en && wr && addr == 8'd128;
    wire wr129 = en && wr && addr == 8'd129;
    wire wr130 = en && wr && addr == 8'd130;
    wire wr131 = en && wr && addr == 8'd131;
    wire wr132 = en && wr && addr == 8'd132;
    wire wr133 = en && wr && addr == 8'd133;
    wire wr134 = en && wr && addr == 8'd134;
    wire wr135 = en && wr && addr == 8'd135;
    wire wr136 = en && wr && addr == 8'd136;
    wire wr137 = en && wr && addr == 8'd137;
    wire wr138 = en && wr && addr == 8'd138;
    wire wr139 = en && wr && addr == 8'd139;
    wire wr140 = en && wr && addr == 8'd140;
    wire wr141 = en && wr && addr == 8'd141;
    wire wr142 = en && wr && addr == 8'd142;
    wire wr143 = en && wr && addr == 8'd143;
    wire wr144 = en && wr && addr == 8'd144;
    wire wr145 = en && wr && addr == 8'd145;
    wire wr146 = en && wr && addr == 8'd146;
    wire wr147 = en && wr && addr == 8'd147;
    wire wr148 = en && wr && addr == 8'd148;
    wire wr149 = en && wr && addr == 8'd149;
    wire wr150 = en && wr && addr == 8'd150;
    wire wr151 = en && wr && addr == 8'd151;
    wire wr152 = en && wr && addr == 8'd152;
    wire wr153 = en && wr && addr == 8'd153;
    wire wr154 = en && wr && addr == 8'd154;
    wire wr155 = en && wr && addr == 8'd155;
    wire wr156 = en && wr && addr == 8'd156;
    wire wr157 = en && wr && addr == 8'd157;
    wire wr158 = en && wr && addr == 8'd158;
    wire wr159 = en && wr && addr == 8'd159;
    wire wr160 = en && wr && addr == 8'd160;
    wire wr161 = en && wr && addr == 8'd161;
    wire wr162 = en && wr && addr == 8'd162;
    wire wr163 = en && wr && addr == 8'd163;
    wire wr164 = en && wr && addr == 8'd164;
    wire wr165 = en && wr && addr == 8'd165;
    wire wr166 = en && wr && addr == 8'd166;
    wire wr167 = en && wr && addr == 8'd167;
    wire wr168 = en && wr && addr == 8'd168;
    wire wr169 = en && wr && addr == 8'd169;
    wire wr170 = en && wr && addr == 8'd170;
    wire wr171 = en && wr && addr == 8'd171;
    wire wr172 = en && wr && addr == 8'd172;
    wire wr173 = en && wr && addr == 8'd173;
    wire wr174 = en && wr && addr == 8'd174;
    wire wr175 = en && wr && addr == 8'd175;
    wire wr176 = en && wr && addr == 8'd176;
    wire wr177 = en && wr && addr == 8'd177;
    wire wr178 = en && wr && addr == 8'd178;
    wire wr179 = en && wr && addr == 8'd179;
    wire wr180 = en && wr && addr == 8'd180;
    wire wr181 = en && wr && addr == 8'd181;
    wire wr182 = en && wr && addr == 8'd182;
    wire wr183 = en && wr && addr == 8'd183;
    wire wr184 = en && wr && addr == 8'd184;
    wire wr185 = en && wr && addr == 8'd185;
    wire wr186 = en && wr && addr == 8'd186;
    wire wr187 = en && wr && addr == 8'd187;
    wire wr188 = en && wr && addr == 8'd188;
    wire wr189 = en && wr && addr == 8'd189;
    wire wr190 = en && wr && addr == 8'd190;
    wire wr191 = en && wr && addr == 8'd191;
    wire wr192 = en && wr && addr == 8'd192;
    wire wr193 = en && wr && addr == 8'd193;
    wire wr194 = en && wr && addr == 8'd194;
    wire wr195 = en && wr && addr == 8'd195;
    wire wr196 = en && wr && addr == 8'd196;
    wire wr197 = en && wr && addr == 8'd197;
    wire wr198 = en && wr && addr == 8'd198;
    wire wr199 = en && wr && addr == 8'd199;
    wire wr200 = en && wr && addr == 8'd200;
    wire wr201 = en && wr && addr == 8'd201;
    wire wr202 = en && wr && addr == 8'd202;
    wire wr203 = en && wr && addr == 8'd203;
    wire wr204 = en && wr && addr == 8'd204;
    wire wr205 = en && wr && addr == 8'd205;
    wire wr206 = en && wr && addr == 8'd206;
    wire wr207 = en && wr && addr == 8'd207;
    wire wr208 = en && wr && addr == 8'd208;
    wire wr209 = en && wr && addr == 8'd209;
    wire wr210 = en && wr && addr == 8'd210;
    wire wr211 = en && wr && addr == 8'd211;
    wire wr212 = en && wr && addr == 8'd212;
    wire wr213 = en && wr && addr == 8'd213;
    wire wr214 = en && wr && addr == 8'd214;
    wire wr215 = en && wr && addr == 8'd215;
    wire wr216 = en && wr && addr == 8'd216;
    wire wr217 = en && wr && addr == 8'd217;
    wire wr218 = en && wr && addr == 8'd218;
    wire wr219 = en && wr && addr == 8'd219;
    wire wr220 = en && wr && addr == 8'd220;
    wire wr221 = en && wr && addr == 8'd221;
    wire wr222 = en && wr && addr == 8'd222;
    wire wr223 = en && wr && addr == 8'd223;
    wire wr224 = en && wr && addr == 8'd224;
    wire wr225 = en && wr && addr == 8'd225;
    wire wr226 = en && wr && addr == 8'd226;
    wire wr227 = en && wr && addr == 8'd227;
    wire wr228 = en && wr && addr == 8'd228;
    wire wr229 = en && wr && addr == 8'd229;
    wire wr230 = en && wr && addr == 8'd230;
    wire wr231 = en && wr && addr == 8'd231;
    wire wr232 = en && wr && addr == 8'd232;
    wire wr233 = en && wr && addr == 8'd233;
    wire wr234 = en && wr && addr == 8'd234;
    wire wr235 = en && wr && addr == 8'd235;
    wire wr236 = en && wr && addr == 8'd236;
    wire wr237 = en && wr && addr == 8'd237;
    wire wr238 = en && wr && addr == 8'd238;
    wire wr239 = en && wr && addr == 8'd239;
    wire wr240 = en && wr && addr == 8'd240;
    wire wr241 = en && wr && addr == 8'd241;
    wire wr242 = en && wr && addr == 8'd242;
    wire wr243 = en && wr && addr == 8'd243;
    wire wr244 = en && wr && addr == 8'd244;
    wire wr245 = en && wr && addr == 8'd245;
    wire wr246 = en && wr && addr == 8'd246;
    wire wr247 = en && wr && addr == 8'd247;
    wire wr248 = en && wr && addr == 8'd248;
    wire wr249 = en && wr && addr == 8'd249;
    wire wr250 = en && wr && addr == 8'd250;
    wire wr251 = en && wr && addr == 8'd251;
    wire wr252 = en && wr && addr == 8'd252;
    wire wr253 = en && wr && addr == 8'd253;
    wire wr254 = en && wr && addr == 8'd254;
    wire wr255 = en && wr && addr == 8'd255;

    wire[7:0] reg0_next = wr0     ? data_in : reg_out[7:0];
    wire[7:0] reg1_next = wr1     ? data_in : reg_out[15:8];
    wire[7:0] reg2_next = wr2     ? data_in : reg_out[23:16];
    wire[7:0] reg3_next = wr3     ? data_in : reg_out[31:24];
    wire[7:0] reg4_next = wr4     ? data_in : reg_out[39:32];
    wire[7:0] reg5_next = wr5     ? data_in : reg_out[47:40];
    wire[7:0] reg6_next = wr6     ? data_in : reg_out[55:48];
    wire[7:0] reg7_next = wr7     ? data_in : reg_out[63:56];
    wire[7:0] reg8_next = wr8     ? data_in : reg_out[71:64];
    wire[7:0] reg9_next = wr9     ? data_in : reg_out[79:72];
    wire[7:0] reg10_next = wr10   ? data_in : reg_out[87:80];
    wire[7:0] reg11_next = wr11   ? data_in : reg_out[95:88];
    wire[7:0] reg12_next = wr12   ? data_in : reg_out[103:96];
    wire[7:0] reg13_next = wr13   ? data_in : reg_out[111:104];
    wire[7:0] reg14_next = wr14   ? data_in : reg_out[119:112];
    wire[7:0] reg15_next = wr15   ? data_in : reg_out[127:120];
    wire[7:0] reg16_next = wr16   ? data_in : reg_out[135:128];
    wire[7:0] reg17_next = wr17   ? data_in : reg_out[143:136];
    wire[7:0] reg18_next = wr18   ? data_in : reg_out[151:144];
    wire[7:0] reg19_next = wr19   ? data_in : reg_out[159:152];
    wire[7:0] reg20_next = wr20   ? data_in : reg_out[167:160];
    wire[7:0] reg21_next = wr21   ? data_in : reg_out[175:168];
    wire[7:0] reg22_next = wr22   ? data_in : reg_out[183:176];
    wire[7:0] reg23_next = wr23   ? data_in : reg_out[191:184];
    wire[7:0] reg24_next = wr24   ? data_in : reg_out[199:192];
    wire[7:0] reg25_next = wr25   ? data_in : reg_out[207:200];
    wire[7:0] reg26_next = wr26   ? data_in : reg_out[215:208];
    wire[7:0] reg27_next = wr27   ? data_in : reg_out[223:216];
    wire[7:0] reg28_next = wr28   ? data_in : reg_out[231:224];
    wire[7:0] reg29_next = wr29   ? data_in : reg_out[239:232];
    wire[7:0] reg30_next = wr30   ? data_in : reg_out[247:240];
    wire[7:0] reg31_next = wr31   ? data_in : reg_out[255:248];
    wire[7:0] reg32_next = wr32   ? data_in : reg_out[263:256];
    wire[7:0] reg33_next = wr33   ? data_in : reg_out[271:264];
    wire[7:0] reg34_next = wr34   ? data_in : reg_out[279:272];
    wire[7:0] reg35_next = wr35   ? data_in : reg_out[287:280];
    wire[7:0] reg36_next = wr36   ? data_in : reg_out[295:288];
    wire[7:0] reg37_next = wr37   ? data_in : reg_out[303:296];
    wire[7:0] reg38_next = wr38   ? data_in : reg_out[311:304];
    wire[7:0] reg39_next = wr39   ? data_in : reg_out[319:312];
    wire[7:0] reg40_next = wr40   ? data_in : reg_out[327:320];
    wire[7:0] reg41_next = wr41   ? data_in : reg_out[335:328];
    wire[7:0] reg42_next = wr42   ? data_in : reg_out[343:336];
    wire[7:0] reg43_next = wr43   ? data_in : reg_out[351:344];
    wire[7:0] reg44_next = wr44   ? data_in : reg_out[359:352];
    wire[7:0] reg45_next = wr45   ? data_in : reg_out[367:360];
    wire[7:0] reg46_next = wr46   ? data_in : reg_out[375:368];
    wire[7:0] reg47_next = wr47   ? data_in : reg_out[383:376];
    wire[7:0] reg48_next = wr48   ? data_in : reg_out[391:384];
    wire[7:0] reg49_next = wr49   ? data_in : reg_out[399:392];
    wire[7:0] reg50_next = wr50   ? data_in : reg_out[407:400];
    wire[7:0] reg51_next = wr51   ? data_in : reg_out[415:408];
    wire[7:0] reg52_next = wr52   ? data_in : reg_out[423:416];
    wire[7:0] reg53_next = wr53   ? data_in : reg_out[431:424];
    wire[7:0] reg54_next = wr54   ? data_in : reg_out[439:432];
    wire[7:0] reg55_next = wr55   ? data_in : reg_out[447:440];
    wire[7:0] reg56_next = wr56   ? data_in : reg_out[455:448];
    wire[7:0] reg57_next = wr57   ? data_in : reg_out[463:456];
    wire[7:0] reg58_next = wr58   ? data_in : reg_out[471:464];
    wire[7:0] reg59_next = wr59   ? data_in : reg_out[479:472];
    wire[7:0] reg60_next = wr60   ? data_in : reg_out[487:480];
    wire[7:0] reg61_next = wr61   ? data_in : reg_out[495:488];
    wire[7:0] reg62_next = wr62   ? data_in : reg_out[503:496];
    wire[7:0] reg63_next = wr63   ? data_in : reg_out[511:504];
    wire[7:0] reg64_next = wr64   ? data_in : reg_out[519:512];
    wire[7:0] reg65_next = wr65   ? data_in : reg_out[527:520];
    wire[7:0] reg66_next = wr66   ? data_in : reg_out[535:528];
    wire[7:0] reg67_next = wr67   ? data_in : reg_out[543:536];
    wire[7:0] reg68_next = wr68   ? data_in : reg_out[551:544];
    wire[7:0] reg69_next = wr69   ? data_in : reg_out[559:552];
    wire[7:0] reg70_next = wr70   ? data_in : reg_out[567:560];
    wire[7:0] reg71_next = wr71   ? data_in : reg_out[575:568];
    wire[7:0] reg72_next = wr72   ? data_in : reg_out[583:576];
    wire[7:0] reg73_next = wr73   ? data_in : reg_out[591:584];
    wire[7:0] reg74_next = wr74   ? data_in : reg_out[599:592];
    wire[7:0] reg75_next = wr75   ? data_in : reg_out[607:600];
    wire[7:0] reg76_next = wr76   ? data_in : reg_out[615:608];
    wire[7:0] reg77_next = wr77   ? data_in : reg_out[623:616];
    wire[7:0] reg78_next = wr78   ? data_in : reg_out[631:624];
    wire[7:0] reg79_next = wr79   ? data_in : reg_out[639:632];
    wire[7:0] reg80_next = wr80   ? data_in : reg_out[647:640];
    wire[7:0] reg81_next = wr81   ? data_in : reg_out[655:648];
    wire[7:0] reg82_next = wr82   ? data_in : reg_out[663:656];
    wire[7:0] reg83_next = wr83   ? data_in : reg_out[671:664];
    wire[7:0] reg84_next = wr84   ? data_in : reg_out[679:672];
    wire[7:0] reg85_next = wr85   ? data_in : reg_out[687:680];
    wire[7:0] reg86_next = wr86   ? data_in : reg_out[695:688];
    wire[7:0] reg87_next = wr87   ? data_in : reg_out[703:696];
    wire[7:0] reg88_next = wr88   ? data_in : reg_out[711:704];
    wire[7:0] reg89_next = wr89   ? data_in : reg_out[719:712];
    wire[7:0] reg90_next = wr90   ? data_in : reg_out[727:720];
    wire[7:0] reg91_next = wr91   ? data_in : reg_out[735:728];
    wire[7:0] reg92_next = wr92   ? data_in : reg_out[743:736];
    wire[7:0] reg93_next = wr93   ? data_in : reg_out[751:744];
    wire[7:0] reg94_next = wr94   ? data_in : reg_out[759:752];
    wire[7:0] reg95_next = wr95   ? data_in : reg_out[767:760];
    wire[7:0] reg96_next = wr96   ? data_in : reg_out[775:768];
    wire[7:0] reg97_next = wr97   ? data_in : reg_out[783:776];
    wire[7:0] reg98_next = wr98   ? data_in : reg_out[791:784];
    wire[7:0] reg99_next = wr99   ? data_in : reg_out[799:792];
    wire[7:0] reg100_next = wr100 ? data_in : reg_out[807:800];
    wire[7:0] reg101_next = wr101 ? data_in : reg_out[815:808];
    wire[7:0] reg102_next = wr102 ? data_in : reg_out[823:816];
    wire[7:0] reg103_next = wr103 ? data_in : reg_out[831:824];
    wire[7:0] reg104_next = wr104 ? data_in : reg_out[839:832];
    wire[7:0] reg105_next = wr105 ? data_in : reg_out[847:840];
    wire[7:0] reg106_next = wr106 ? data_in : reg_out[855:848];
    wire[7:0] reg107_next = wr107 ? data_in : reg_out[863:856];
    wire[7:0] reg108_next = wr108 ? data_in : reg_out[871:864];
    wire[7:0] reg109_next = wr109 ? data_in : reg_out[879:872];
    wire[7:0] reg110_next = wr110 ? data_in : reg_out[887:880];
    wire[7:0] reg111_next = wr111 ? data_in : reg_out[895:888];
    wire[7:0] reg112_next = wr112 ? data_in : reg_out[903:896];
    wire[7:0] reg113_next = wr113 ? data_in : reg_out[911:904];
    wire[7:0] reg114_next = wr114 ? data_in : reg_out[919:912];
    wire[7:0] reg115_next = wr115 ? data_in : reg_out[927:920];
    wire[7:0] reg116_next = wr116 ? data_in : reg_out[935:928];
    wire[7:0] reg117_next = wr117 ? data_in : reg_out[943:936];
    wire[7:0] reg118_next = wr118 ? data_in : reg_out[951:944];
    wire[7:0] reg119_next = wr119 ? data_in : reg_out[959:952];
    wire[7:0] reg120_next = wr120 ? data_in : reg_out[967:960];
    wire[7:0] reg121_next = wr121 ? data_in : reg_out[975:968];
    wire[7:0] reg122_next = wr122 ? data_in : reg_out[983:976];
    wire[7:0] reg123_next = wr123 ? data_in : reg_out[991:984];
    wire[7:0] reg124_next = wr124 ? data_in : reg_out[999:992];
    wire[7:0] reg125_next = wr125 ? data_in : reg_out[1007:1000];
    wire[7:0] reg126_next = wr126 ? data_in : reg_out[1015:1008];
    wire[7:0] reg127_next = wr127 ? data_in : reg_out[1023:1016];
    wire[7:0] reg128_next = wr128 ? data_in : reg_out[1031:1024];
    wire[7:0] reg129_next = wr129 ? data_in : reg_out[1039:1032];
    wire[7:0] reg130_next = wr130 ? data_in : reg_out[1047:1040];
    wire[7:0] reg131_next = wr131 ? data_in : reg_out[1055:1048];
    wire[7:0] reg132_next = wr132 ? data_in : reg_out[1063:1056];
    wire[7:0] reg133_next = wr133 ? data_in : reg_out[1071:1064];
    wire[7:0] reg134_next = wr134 ? data_in : reg_out[1079:1072];
    wire[7:0] reg135_next = wr135 ? data_in : reg_out[1087:1080];
    wire[7:0] reg136_next = wr136 ? data_in : reg_out[1095:1088];
    wire[7:0] reg137_next = wr137 ? data_in : reg_out[1103:1096];
    wire[7:0] reg138_next = wr138 ? data_in : reg_out[1111:1104];
    wire[7:0] reg139_next = wr139 ? data_in : reg_out[1119:1112];
    wire[7:0] reg140_next = wr140 ? data_in : reg_out[1127:1120];
    wire[7:0] reg141_next = wr141 ? data_in : reg_out[1135:1128];
    wire[7:0] reg142_next = wr142 ? data_in : reg_out[1143:1136];
    wire[7:0] reg143_next = wr143 ? data_in : reg_out[1151:1144];
    wire[7:0] reg144_next = wr144 ? data_in : reg_out[1159:1152];
    wire[7:0] reg145_next = wr145 ? data_in : reg_out[1167:1160];
    wire[7:0] reg146_next = wr146 ? data_in : reg_out[1175:1168];
    wire[7:0] reg147_next = wr147 ? data_in : reg_out[1183:1176];
    wire[7:0] reg148_next = wr148 ? data_in : reg_out[1191:1184];
    wire[7:0] reg149_next = wr149 ? data_in : reg_out[1199:1192];
    wire[7:0] reg150_next = wr150 ? data_in : reg_out[1207:1200];
    wire[7:0] reg151_next = wr151 ? data_in : reg_out[1215:1208];
    wire[7:0] reg152_next = wr152 ? data_in : reg_out[1223:1216];
    wire[7:0] reg153_next = wr153 ? data_in : reg_out[1231:1224];
    wire[7:0] reg154_next = wr154 ? data_in : reg_out[1239:1232];
    wire[7:0] reg155_next = wr155 ? data_in : reg_out[1247:1240];
    wire[7:0] reg156_next = wr156 ? data_in : reg_out[1255:1248];
    wire[7:0] reg157_next = wr157 ? data_in : reg_out[1263:1256];
    wire[7:0] reg158_next = wr158 ? data_in : reg_out[1271:1264];
    wire[7:0] reg159_next = wr159 ? data_in : reg_out[1279:1272];
    wire[7:0] reg160_next = wr160 ? data_in : reg_out[1287:1280];
    wire[7:0] reg161_next = wr161 ? data_in : reg_out[1295:1288];
    wire[7:0] reg162_next = wr162 ? data_in : reg_out[1303:1296];
    wire[7:0] reg163_next = wr163 ? data_in : reg_out[1311:1304];
    wire[7:0] reg164_next = wr164 ? data_in : reg_out[1319:1312];
    wire[7:0] reg165_next = wr165 ? data_in : reg_out[1327:1320];
    wire[7:0] reg166_next = wr166 ? data_in : reg_out[1335:1328];
    wire[7:0] reg167_next = wr167 ? data_in : reg_out[1343:1336];
    wire[7:0] reg168_next = wr168 ? data_in : reg_out[1351:1344];
    wire[7:0] reg169_next = wr169 ? data_in : reg_out[1359:1352];
    wire[7:0] reg170_next = wr170 ? data_in : reg_out[1367:1360];
    wire[7:0] reg171_next = wr171 ? data_in : reg_out[1375:1368];
    wire[7:0] reg172_next = wr172 ? data_in : reg_out[1383:1376];
    wire[7:0] reg173_next = wr173 ? data_in : reg_out[1391:1384];
    wire[7:0] reg174_next = wr174 ? data_in : reg_out[1399:1392];
    wire[7:0] reg175_next = wr175 ? data_in : reg_out[1407:1400];
    wire[7:0] reg176_next = wr176 ? data_in : reg_out[1415:1408];
    wire[7:0] reg177_next = wr177 ? data_in : reg_out[1423:1416];
    wire[7:0] reg178_next = wr178 ? data_in : reg_out[1431:1424];
    wire[7:0] reg179_next = wr179 ? data_in : reg_out[1439:1432];
    wire[7:0] reg180_next = wr180 ? data_in : reg_out[1447:1440];
    wire[7:0] reg181_next = wr181 ? data_in : reg_out[1455:1448];
    wire[7:0] reg182_next = wr182 ? data_in : reg_out[1463:1456];
    wire[7:0] reg183_next = wr183 ? data_in : reg_out[1471:1464];
    wire[7:0] reg184_next = wr184 ? data_in : reg_out[1479:1472];
    wire[7:0] reg185_next = wr185 ? data_in : reg_out[1487:1480];
    wire[7:0] reg186_next = wr186 ? data_in : reg_out[1495:1488];
    wire[7:0] reg187_next = wr187 ? data_in : reg_out[1503:1496];
    wire[7:0] reg188_next = wr188 ? data_in : reg_out[1511:1504];
    wire[7:0] reg189_next = wr189 ? data_in : reg_out[1519:1512];
    wire[7:0] reg190_next = wr190 ? data_in : reg_out[1527:1520];
    wire[7:0] reg191_next = wr191 ? data_in : reg_out[1535:1528];
    wire[7:0] reg192_next = wr192 ? data_in : reg_out[1543:1536];
    wire[7:0] reg193_next = wr193 ? data_in : reg_out[1551:1544];
    wire[7:0] reg194_next = wr194 ? data_in : reg_out[1559:1552];
    wire[7:0] reg195_next = wr195 ? data_in : reg_out[1567:1560];
    wire[7:0] reg196_next = wr196 ? data_in : reg_out[1575:1568];
    wire[7:0] reg197_next = wr197 ? data_in : reg_out[1583:1576];
    wire[7:0] reg198_next = wr198 ? data_in : reg_out[1591:1584];
    wire[7:0] reg199_next = wr199 ? data_in : reg_out[1599:1592];
    wire[7:0] reg200_next = wr200 ? data_in : reg_out[1607:1600];
    wire[7:0] reg201_next = wr201 ? data_in : reg_out[1615:1608];
    wire[7:0] reg202_next = wr202 ? data_in : reg_out[1623:1616];
    wire[7:0] reg203_next = wr203 ? data_in : reg_out[1631:1624];
    wire[7:0] reg204_next = wr204 ? data_in : reg_out[1639:1632];
    wire[7:0] reg205_next = wr205 ? data_in : reg_out[1647:1640];
    wire[7:0] reg206_next = wr206 ? data_in : reg_out[1655:1648];
    wire[7:0] reg207_next = wr207 ? data_in : reg_out[1663:1656];
    wire[7:0] reg208_next = wr208 ? data_in : reg_out[1671:1664];
    wire[7:0] reg209_next = wr209 ? data_in : reg_out[1679:1672];
    wire[7:0] reg210_next = wr210 ? data_in : reg_out[1687:1680];
    wire[7:0] reg211_next = wr211 ? data_in : reg_out[1695:1688];
    wire[7:0] reg212_next = wr212 ? data_in : reg_out[1703:1696];
    wire[7:0] reg213_next = wr213 ? data_in : reg_out[1711:1704];
    wire[7:0] reg214_next = wr214 ? data_in : reg_out[1719:1712];
    wire[7:0] reg215_next = wr215 ? data_in : reg_out[1727:1720];
    wire[7:0] reg216_next = wr216 ? data_in : reg_out[1735:1728];
    wire[7:0] reg217_next = wr217 ? data_in : reg_out[1743:1736];
    wire[7:0] reg218_next = wr218 ? data_in : reg_out[1751:1744];
    wire[7:0] reg219_next = wr219 ? data_in : reg_out[1759:1752];
    wire[7:0] reg220_next = wr220 ? data_in : reg_out[1767:1760];
    wire[7:0] reg221_next = wr221 ? data_in : reg_out[1775:1768];
    wire[7:0] reg222_next = wr222 ? data_in : reg_out[1783:1776];
    wire[7:0] reg223_next = wr223 ? data_in : reg_out[1791:1784];
    wire[7:0] reg224_next = wr224 ? data_in : reg_out[1799:1792];
    wire[7:0] reg225_next = wr225 ? data_in : reg_out[1807:1800];
    wire[7:0] reg226_next = wr226 ? data_in : reg_out[1815:1808];
    wire[7:0] reg227_next = wr227 ? data_in : reg_out[1823:1816];
    wire[7:0] reg228_next = wr228 ? data_in : reg_out[1831:1824];
    wire[7:0] reg229_next = wr229 ? data_in : reg_out[1839:1832];
    wire[7:0] reg230_next = wr230 ? data_in : reg_out[1847:1840];
    wire[7:0] reg231_next = wr231 ? data_in : reg_out[1855:1848];
    wire[7:0] reg232_next = wr232 ? data_in : reg_out[1863:1856];
    wire[7:0] reg233_next = wr233 ? data_in : reg_out[1871:1864];
    wire[7:0] reg234_next = wr234 ? data_in : reg_out[1879:1872];
    wire[7:0] reg235_next = wr235 ? data_in : reg_out[1887:1880];
    wire[7:0] reg236_next = wr236 ? data_in : reg_out[1895:1888];
    wire[7:0] reg237_next = wr237 ? data_in : reg_out[1903:1896];
    wire[7:0] reg238_next = wr238 ? data_in : reg_out[1911:1904];
    wire[7:0] reg239_next = wr239 ? data_in : reg_out[1919:1912];
    wire[7:0] reg240_next = wr240 ? data_in : reg_out[1927:1920];
    wire[7:0] reg241_next = wr241 ? data_in : reg_out[1935:1928];
    wire[7:0] reg242_next = wr242 ? data_in : reg_out[1943:1936];
    wire[7:0] reg243_next = wr243 ? data_in : reg_out[1951:1944];
    wire[7:0] reg244_next = wr244 ? data_in : reg_out[1959:1952];
    wire[7:0] reg245_next = wr245 ? data_in : reg_out[1967:1960];
    wire[7:0] reg246_next = wr246 ? data_in : reg_out[1975:1968];
    wire[7:0] reg247_next = wr247 ? data_in : reg_out[1983:1976];
    wire[7:0] reg248_next = wr248 ? data_in : reg_out[1991:1984];
    wire[7:0] reg249_next = wr249 ? data_in : reg_out[1999:1992];
    wire[7:0] reg250_next = wr250 ? data_in : reg_out[2007:2000];
    wire[7:0] reg251_next = wr251 ? data_in : reg_out[2015:2008];
    wire[7:0] reg252_next = wr252 ? data_in : reg_out[2023:2016];
    wire[7:0] reg253_next = wr253 ? data_in : reg_out[2031:2024];
    wire[7:0] reg254_next = wr254 ? data_in : reg_out[2039:2032];
    wire[7:0] reg255_next = wr255 ? data_in : reg_out[2047:2040];

    wire [7:0] data_out_mux = 
                    addr == 8'd0   ? reg_out[7:0]       :
                    addr == 8'd1   ? reg_out[15:8]      :
                    addr == 8'd2   ? reg_out[23:16]     :
                    addr == 8'd3   ? reg_out[31:24]     :
                    addr == 8'd4   ? reg_out[39:32]     :
                    addr == 8'd5   ? reg_out[47:40]     :
                    addr == 8'd6   ? reg_out[55:48]     :
                    addr == 8'd7   ? reg_out[63:56]     :
                    addr == 8'd8   ? reg_out[71:64]     :
                    addr == 8'd9   ? reg_out[79:72]     :
                    addr == 8'd10  ? reg_out[87:80]     :
                    addr == 8'd11  ? reg_out[95:88]     :
                    addr == 8'd12  ? reg_out[103:96]    :
                    addr == 8'd13  ? reg_out[111:104]   :
                    addr == 8'd14  ? reg_out[119:112]   :
                    addr == 8'd15  ? reg_out[127:120]   :
                    addr == 8'd16  ? reg_out[135:128]   :
                    addr == 8'd17  ? reg_out[143:136]   :
                    addr == 8'd18  ? reg_out[151:144]   :
                    addr == 8'd19  ? reg_out[159:152]   :
                    addr == 8'd20  ? reg_out[167:160]   :
                    addr == 8'd21  ? reg_out[175:168]   :
                    addr == 8'd22  ? reg_out[183:176]   :
                    addr == 8'd23  ? reg_out[191:184]   :
                    addr == 8'd24  ? reg_out[199:192]   :
                    addr == 8'd25  ? reg_out[207:200]   :
                    addr == 8'd26  ? reg_out[215:208]   :
                    addr == 8'd27  ? reg_out[223:216]   :
                    addr == 8'd28  ? reg_out[231:224]   :
                    addr == 8'd29  ? reg_out[239:232]   :
                    addr == 8'd30  ? reg_out[247:240]   :
                    addr == 8'd31  ? reg_out[255:248]   :
                    addr == 8'd32  ? reg_out[263:256]   :
                    addr == 8'd33  ? reg_out[271:264]   :
                    addr == 8'd34  ? reg_out[279:272]   :
                    addr == 8'd35  ? reg_out[287:280]   :
                    addr == 8'd36  ? reg_out[295:288]   :
                    addr == 8'd37  ? reg_out[303:296]   :
                    addr == 8'd38  ? reg_out[311:304]   :
                    addr == 8'd39  ? reg_out[319:312]   :
                    addr == 8'd40  ? reg_out[327:320]   :
                    addr == 8'd41  ? reg_out[335:328]   :
                    addr == 8'd42  ? reg_out[343:336]   :
                    addr == 8'd43  ? reg_out[351:344]   :
                    addr == 8'd44  ? reg_out[359:352]   :
                    addr == 8'd45  ? reg_out[367:360]   :
                    addr == 8'd46  ? reg_out[375:368]   :
                    addr == 8'd47  ? reg_out[383:376]   :
                    addr == 8'd48  ? reg_out[391:384]   :
                    addr == 8'd49  ? reg_out[399:392]   :
                    addr == 8'd50  ? reg_out[407:400]   :
                    addr == 8'd51  ? reg_out[415:408]   :
                    addr == 8'd52  ? reg_out[423:416]   :
                    addr == 8'd53  ? reg_out[431:424]   :
                    addr == 8'd54  ? reg_out[439:432]   :
                    addr == 8'd55  ? reg_out[447:440]   :
                    addr == 8'd56  ? reg_out[455:448]   :
                    addr == 8'd57  ? reg_out[463:456]   :
                    addr == 8'd58  ? reg_out[471:464]   :
                    addr == 8'd59  ? reg_out[479:472]   :
                    addr == 8'd60  ? reg_out[487:480]   :
                    addr == 8'd61  ? reg_out[495:488]   :
                    addr == 8'd62  ? reg_out[503:496]   :
                    addr == 8'd63  ? reg_out[511:504]   :
                    addr == 8'd64  ? reg_out[519:512]   :
                    addr == 8'd65  ? reg_out[527:520]   :
                    addr == 8'd66  ? reg_out[535:528]   :
                    addr == 8'd67  ? reg_out[543:536]   :
                    addr == 8'd68  ? reg_out[551:544]   :
                    addr == 8'd69  ? reg_out[559:552]   :
                    addr == 8'd70  ? reg_out[567:560]   :
                    addr == 8'd71  ? reg_out[575:568]   :
                    addr == 8'd72  ? reg_out[583:576]   :
                    addr == 8'd73  ? reg_out[591:584]   :
                    addr == 8'd74  ? reg_out[599:592]   :
                    addr == 8'd75  ? reg_out[607:600]   :
                    addr == 8'd76  ? reg_out[615:608]   :
                    addr == 8'd77  ? reg_out[623:616]   :
                    addr == 8'd78  ? reg_out[631:624]   :
                    addr == 8'd79  ? reg_out[639:632]   :
                    addr == 8'd80  ? reg_out[647:640]   :
                    addr == 8'd81  ? reg_out[655:648]   :
                    addr == 8'd82  ? reg_out[663:656]   :
                    addr == 8'd83  ? reg_out[671:664]   :
                    addr == 8'd84  ? reg_out[679:672]   :
                    addr == 8'd85  ? reg_out[687:680]   :
                    addr == 8'd86  ? reg_out[695:688]   :
                    addr == 8'd87  ? reg_out[703:696]   :
                    addr == 8'd88  ? reg_out[711:704]   :
                    addr == 8'd89  ? reg_out[719:712]   :
                    addr == 8'd90  ? reg_out[727:720]   :
                    addr == 8'd91  ? reg_out[735:728]   :
                    addr == 8'd92  ? reg_out[743:736]   :
                    addr == 8'd93  ? reg_out[751:744]   :
                    addr == 8'd94  ? reg_out[759:752]   :
                    addr == 8'd95  ? reg_out[767:760]   :
                    addr == 8'd96  ? reg_out[775:768]   :
                    addr == 8'd97  ? reg_out[783:776]   :
                    addr == 8'd98  ? reg_out[791:784]   :
                    addr == 8'd99  ? reg_out[799:792]   :
                    addr == 8'd100 ? reg_out[807:800]   :
                    addr == 8'd101 ? reg_out[815:808]   :
                    addr == 8'd102 ? reg_out[823:816]   :
                    addr == 8'd103 ? reg_out[831:824]   :
                    addr == 8'd104 ? reg_out[839:832]   :
                    addr == 8'd105 ? reg_out[847:840]   :
                    addr == 8'd106 ? reg_out[855:848]   :
                    addr == 8'd107 ? reg_out[863:856]   :
                    addr == 8'd108 ? reg_out[871:864]   :
                    addr == 8'd109 ? reg_out[879:872]   :
                    addr == 8'd110 ? reg_out[887:880]   :
                    addr == 8'd111 ? reg_out[895:888]   :
                    addr == 8'd112 ? reg_out[903:896]   :
                    addr == 8'd113 ? reg_out[911:904]   :
                    addr == 8'd114 ? reg_out[919:912]   :
                    addr == 8'd115 ? reg_out[927:920]   :
                    addr == 8'd116 ? reg_out[935:928]   :
                    addr == 8'd117 ? reg_out[943:936]   :
                    addr == 8'd118 ? reg_out[951:944]   :
                    addr == 8'd119 ? reg_out[959:952]   :
                    addr == 8'd120 ? reg_out[967:960]   :
                    addr == 8'd121 ? reg_out[975:968]   :
                    addr == 8'd122 ? reg_out[983:976]   :
                    addr == 8'd123 ? reg_out[991:984]   :
                    addr == 8'd124 ? reg_out[999:992]   :
                    addr == 8'd125 ? reg_out[1007:1000] :
                    addr == 8'd126 ? reg_out[1015:1008] :
                    addr == 8'd127 ? reg_out[1023:1016] :
                    addr == 8'd128 ? reg_out[1031:1024] :
                    addr == 8'd129 ? reg_out[1039:1032] :
                    addr == 8'd130 ? reg_out[1047:1040] :
                    addr == 8'd131 ? reg_out[1055:1048] :
                    addr == 8'd132 ? reg_out[1063:1056] :
                    addr == 8'd133 ? reg_out[1071:1064] :
                    addr == 8'd134 ? reg_out[1079:1072] :
                    addr == 8'd135 ? reg_out[1087:1080] :
                    addr == 8'd136 ? reg_out[1095:1088] :
                    addr == 8'd137 ? reg_out[1103:1096] :
                    addr == 8'd138 ? reg_out[1111:1104] :
                    addr == 8'd139 ? reg_out[1119:1112] :
                    addr == 8'd140 ? reg_out[1127:1120] :
                    addr == 8'd141 ? reg_out[1135:1128] :
                    addr == 8'd142 ? reg_out[1143:1136] :
                    addr == 8'd143 ? reg_out[1151:1144] :
                    addr == 8'd144 ? reg_out[1159:1152] :
                    addr == 8'd145 ? reg_out[1167:1160] :
                    addr == 8'd146 ? reg_out[1175:1168] :
                    addr == 8'd147 ? reg_out[1183:1176] :
                    addr == 8'd148 ? reg_out[1191:1184] :
                    addr == 8'd149 ? reg_out[1199:1192] :
                    addr == 8'd150 ? reg_out[1207:1200] :
                    addr == 8'd151 ? reg_out[1215:1208] :
                    addr == 8'd152 ? reg_out[1223:1216] :
                    addr == 8'd153 ? reg_out[1231:1224] :
                    addr == 8'd154 ? reg_out[1239:1232] :
                    addr == 8'd155 ? reg_out[1247:1240] :
                    addr == 8'd156 ? reg_out[1255:1248] :
                    addr == 8'd157 ? reg_out[1263:1256] :
                    addr == 8'd158 ? reg_out[1271:1264] :
                    addr == 8'd159 ? reg_out[1279:1272] :
                    addr == 8'd160 ? reg_out[1287:1280] :
                    addr == 8'd161 ? reg_out[1295:1288] :
                    addr == 8'd162 ? reg_out[1303:1296] :
                    addr == 8'd163 ? reg_out[1311:1304] :
                    addr == 8'd164 ? reg_out[1319:1312] :
                    addr == 8'd165 ? reg_out[1327:1320] :
                    addr == 8'd166 ? reg_out[1335:1328] :
                    addr == 8'd167 ? reg_out[1343:1336] :
                    addr == 8'd168 ? reg_out[1351:1344] :
                    addr == 8'd169 ? reg_out[1359:1352] :
                    addr == 8'd170 ? reg_out[1367:1360] :
                    addr == 8'd171 ? reg_out[1375:1368] :
                    addr == 8'd172 ? reg_out[1383:1376] :
                    addr == 8'd173 ? reg_out[1391:1384] :
                    addr == 8'd174 ? reg_out[1399:1392] :
                    addr == 8'd175 ? reg_out[1407:1400] :
                    addr == 8'd176 ? reg_out[1415:1408] :
                    addr == 8'd177 ? reg_out[1423:1416] :
                    addr == 8'd178 ? reg_out[1431:1424] :
                    addr == 8'd179 ? reg_out[1439:1432] :
                    addr == 8'd180 ? reg_out[1447:1440] :
                    addr == 8'd181 ? reg_out[1455:1448] :
                    addr == 8'd182 ? reg_out[1463:1456] :
                    addr == 8'd183 ? reg_out[1471:1464] :
                    addr == 8'd184 ? reg_out[1479:1472] :
                    addr == 8'd185 ? reg_out[1487:1480] :
                    addr == 8'd186 ? reg_out[1495:1488] :
                    addr == 8'd187 ? reg_out[1503:1496] :
                    addr == 8'd188 ? reg_out[1511:1504] :
                    addr == 8'd189 ? reg_out[1519:1512] :
                    addr == 8'd190 ? reg_out[1527:1520] :
                    addr == 8'd191 ? reg_out[1535:1528] :
                    addr == 8'd192 ? reg_out[1543:1536] :
                    addr == 8'd193 ? reg_out[1551:1544] :
                    addr == 8'd194 ? reg_out[1559:1552] :
                    addr == 8'd195 ? reg_out[1567:1560] :
                    addr == 8'd196 ? reg_out[1575:1568] :
                    addr == 8'd197 ? reg_out[1583:1576] :
                    addr == 8'd198 ? reg_out[1591:1584] :
                    addr == 8'd199 ? reg_out[1599:1592] :
                    addr == 8'd200 ? reg_out[1607:1600] :
                    addr == 8'd201 ? reg_out[1615:1608] :
                    addr == 8'd202 ? reg_out[1623:1616] :
                    addr == 8'd203 ? reg_out[1631:1624] :
                    addr == 8'd204 ? reg_out[1639:1632] :
                    addr == 8'd205 ? reg_out[1647:1640] :
                    addr == 8'd206 ? reg_out[1655:1648] :
                    addr == 8'd207 ? reg_out[1663:1656] :
                    addr == 8'd208 ? reg_out[1671:1664] :
                    addr == 8'd209 ? reg_out[1679:1672] :
                    addr == 8'd210 ? reg_out[1687:1680] :
                    addr == 8'd211 ? reg_out[1695:1688] :
                    addr == 8'd212 ? reg_out[1703:1696] :
                    addr == 8'd213 ? reg_out[1711:1704] :
                    addr == 8'd214 ? reg_out[1719:1712] :
                    addr == 8'd215 ? reg_out[1727:1720] :
                    addr == 8'd216 ? reg_out[1735:1728] :
                    addr == 8'd217 ? reg_out[1743:1736] :
                    addr == 8'd218 ? reg_out[1751:1744] :
                    addr == 8'd219 ? reg_out[1759:1752] :
                    addr == 8'd220 ? reg_out[1767:1760] :
                    addr == 8'd221 ? reg_out[1775:1768] :
                    addr == 8'd222 ? reg_out[1783:1776] :
                    addr == 8'd223 ? reg_out[1791:1784] :
                    addr == 8'd224 ? reg_out[1799:1792] :
                    addr == 8'd225 ? reg_out[1807:1800] :
                    addr == 8'd226 ? reg_out[1815:1808] :
                    addr == 8'd227 ? reg_out[1823:1816] :
                    addr == 8'd228 ? reg_out[1831:1824] :
                    addr == 8'd229 ? reg_out[1839:1832] :
                    addr == 8'd230 ? reg_out[1847:1840] :
                    addr == 8'd231 ? reg_out[1855:1848] :
                    addr == 8'd232 ? reg_out[1863:1856] :
                    addr == 8'd233 ? reg_out[1871:1864] :
                    addr == 8'd234 ? reg_out[1879:1872] :
                    addr == 8'd235 ? reg_out[1887:1880] :
                    addr == 8'd236 ? reg_out[1895:1888] :
                    addr == 8'd237 ? reg_out[1903:1896] :
                    addr == 8'd238 ? reg_out[1911:1904] :
                    addr == 8'd239 ? reg_out[1919:1912] :
                    addr == 8'd240 ? reg_out[1927:1920] :
                    addr == 8'd241 ? reg_out[1935:1928] :
                    addr == 8'd242 ? reg_out[1943:1936] :
                    addr == 8'd243 ? reg_out[1951:1944] :
                    addr == 8'd244 ? reg_out[1959:1952] :
                    addr == 8'd245 ? reg_out[1967:1960] :
                    addr == 8'd246 ? reg_out[1975:1968] :
                    addr == 8'd247 ? reg_out[1983:1976] :
                    addr == 8'd248 ? reg_out[1991:1984] :
                    addr == 8'd249 ? reg_out[1999:1992] :
                    addr == 8'd250 ? reg_out[2007:2000] :
                    addr == 8'd251 ? reg_out[2015:2008] :
                    addr == 8'd252 ? reg_out[2023:2016] :
                    addr == 8'd253 ? reg_out[2031:2024] :
                    addr == 8'd254 ? reg_out[2039:2032] :
                    reg_out[2047:2040];

    assign data_out = data_out_mux;

    always @(posedge clk)
    begin
        if (rst) begin
            reg_out <= 2048'b0;
        end
        else begin
             reg_out[7:0]       <= reg0_next;
             reg_out[15:8]      <= reg1_next;
             reg_out[23:16]     <= reg2_next;
             reg_out[31:24]     <= reg3_next;
             reg_out[39:32]     <= reg4_next;
             reg_out[47:40]     <= reg5_next;
             reg_out[55:48]     <= reg6_next;
             reg_out[63:56]     <= reg7_next;
             reg_out[71:64]     <= reg8_next;
             reg_out[79:72]     <= reg9_next;
             reg_out[87:80]     <= reg10_next;
             reg_out[95:88]     <= reg11_next;
             reg_out[103:96]    <= reg12_next;
             reg_out[111:104]   <= reg13_next;
             reg_out[119:112]   <= reg14_next;
             reg_out[127:120]   <= reg15_next;
             reg_out[135:128]   <= reg16_next;
             reg_out[143:136]   <= reg17_next;
             reg_out[151:144]   <= reg18_next;
             reg_out[159:152]   <= reg19_next;
             reg_out[167:160]   <= reg20_next;
             reg_out[175:168]   <= reg21_next;
             reg_out[183:176]   <= reg22_next;
             reg_out[191:184]   <= reg23_next;
             reg_out[199:192]   <= reg24_next;
             reg_out[207:200]   <= reg25_next;
             reg_out[215:208]   <= reg26_next;
             reg_out[223:216]   <= reg27_next;
             reg_out[231:224]   <= reg28_next;
             reg_out[239:232]   <= reg29_next;
             reg_out[247:240]   <= reg30_next;
             reg_out[255:248]   <= reg31_next;
             reg_out[263:256]   <= reg32_next;
             reg_out[271:264]   <= reg33_next;
             reg_out[279:272]   <= reg34_next;
             reg_out[287:280]   <= reg35_next;
             reg_out[295:288]   <= reg36_next;
             reg_out[303:296]   <= reg37_next;
             reg_out[311:304]   <= reg38_next;
             reg_out[319:312]   <= reg39_next;
             reg_out[327:320]   <= reg40_next;
             reg_out[335:328]   <= reg41_next;
             reg_out[343:336]   <= reg42_next;
             reg_out[351:344]   <= reg43_next;
             reg_out[359:352]   <= reg44_next;
             reg_out[367:360]   <= reg45_next;
             reg_out[375:368]   <= reg46_next;
             reg_out[383:376]   <= reg47_next;
             reg_out[391:384]   <= reg48_next;
             reg_out[399:392]   <= reg49_next;
             reg_out[407:400]   <= reg50_next;
             reg_out[415:408]   <= reg51_next;
             reg_out[423:416]   <= reg52_next;
             reg_out[431:424]   <= reg53_next;
             reg_out[439:432]   <= reg54_next;
             reg_out[447:440]   <= reg55_next;
             reg_out[455:448]   <= reg56_next;
             reg_out[463:456]   <= reg57_next;
             reg_out[471:464]   <= reg58_next;
             reg_out[479:472]   <= reg59_next;
             reg_out[487:480]   <= reg60_next;
             reg_out[495:488]   <= reg61_next;
             reg_out[503:496]   <= reg62_next;
             reg_out[511:504]   <= reg63_next;
             reg_out[519:512]   <= reg64_next;
             reg_out[527:520]   <= reg65_next;
             reg_out[535:528]   <= reg66_next;
             reg_out[543:536]   <= reg67_next;
             reg_out[551:544]   <= reg68_next;
             reg_out[559:552]   <= reg69_next;
             reg_out[567:560]   <= reg70_next;
             reg_out[575:568]   <= reg71_next;
             reg_out[583:576]   <= reg72_next;
             reg_out[591:584]   <= reg73_next;
             reg_out[599:592]   <= reg74_next;
             reg_out[607:600]   <= reg75_next;
             reg_out[615:608]   <= reg76_next;
             reg_out[623:616]   <= reg77_next;
             reg_out[631:624]   <= reg78_next;
             reg_out[639:632]   <= reg79_next;
             reg_out[647:640]   <= reg80_next;
             reg_out[655:648]   <= reg81_next;
             reg_out[663:656]   <= reg82_next;
             reg_out[671:664]   <= reg83_next;
             reg_out[679:672]   <= reg84_next;
             reg_out[687:680]   <= reg85_next;
             reg_out[695:688]   <= reg86_next;
             reg_out[703:696]   <= reg87_next;
             reg_out[711:704]   <= reg88_next;
             reg_out[719:712]   <= reg89_next;
             reg_out[727:720]   <= reg90_next;
             reg_out[735:728]   <= reg91_next;
             reg_out[743:736]   <= reg92_next;
             reg_out[751:744]   <= reg93_next;
             reg_out[759:752]   <= reg94_next;
             reg_out[767:760]   <= reg95_next;
             reg_out[775:768]   <= reg96_next;
             reg_out[783:776]   <= reg97_next;
             reg_out[791:784]   <= reg98_next;
             reg_out[799:792]   <= reg99_next;
             reg_out[807:800]   <= reg100_next;
             reg_out[815:808]   <= reg101_next;
             reg_out[823:816]   <= reg102_next;
             reg_out[831:824]   <= reg103_next;
             reg_out[839:832]   <= reg104_next;
             reg_out[847:840]   <= reg105_next;
             reg_out[855:848]   <= reg106_next;
             reg_out[863:856]   <= reg107_next;
             reg_out[871:864]   <= reg108_next;
             reg_out[879:872]   <= reg109_next;
             reg_out[887:880]   <= reg110_next;
             reg_out[895:888]   <= reg111_next;
             reg_out[903:896]   <= reg112_next;
             reg_out[911:904]   <= reg113_next;
             reg_out[919:912]   <= reg114_next;
             reg_out[927:920]   <= reg115_next;
             reg_out[935:928]   <= reg116_next;
             reg_out[943:936]   <= reg117_next;
             reg_out[951:944]   <= reg118_next;
             reg_out[959:952]   <= reg119_next;
             reg_out[967:960]   <= reg120_next;
             reg_out[975:968]   <= reg121_next;
             reg_out[983:976]   <= reg122_next;
             reg_out[991:984]   <= reg123_next;
             reg_out[999:992]   <= reg124_next;
             reg_out[1007:1000] <= reg125_next;
             reg_out[1015:1008] <= reg126_next;
             reg_out[1023:1016] <= reg127_next;
             reg_out[1031:1024] <= reg128_next;
             reg_out[1039:1032] <= reg129_next;
             reg_out[1047:1040] <= reg130_next;
             reg_out[1055:1048] <= reg131_next;
             reg_out[1063:1056] <= reg132_next;
             reg_out[1071:1064] <= reg133_next;
             reg_out[1079:1072] <= reg134_next;
             reg_out[1087:1080] <= reg135_next;
             reg_out[1095:1088] <= reg136_next;
             reg_out[1103:1096] <= reg137_next;
             reg_out[1111:1104] <= reg138_next;
             reg_out[1119:1112] <= reg139_next;
             reg_out[1127:1120] <= reg140_next;
             reg_out[1135:1128] <= reg141_next;
             reg_out[1143:1136] <= reg142_next;
             reg_out[1151:1144] <= reg143_next;
             reg_out[1159:1152] <= reg144_next;
             reg_out[1167:1160] <= reg145_next;
             reg_out[1175:1168] <= reg146_next;
             reg_out[1183:1176] <= reg147_next;
             reg_out[1191:1184] <= reg148_next;
             reg_out[1199:1192] <= reg149_next;
             reg_out[1207:1200] <= reg150_next;
             reg_out[1215:1208] <= reg151_next;
             reg_out[1223:1216] <= reg152_next;
             reg_out[1231:1224] <= reg153_next;
             reg_out[1239:1232] <= reg154_next;
             reg_out[1247:1240] <= reg155_next;
             reg_out[1255:1248] <= reg156_next;
             reg_out[1263:1256] <= reg157_next;
             reg_out[1271:1264] <= reg158_next;
             reg_out[1279:1272] <= reg159_next;
             reg_out[1287:1280] <= reg160_next;
             reg_out[1295:1288] <= reg161_next;
             reg_out[1303:1296] <= reg162_next;
             reg_out[1311:1304] <= reg163_next;
             reg_out[1319:1312] <= reg164_next;
             reg_out[1327:1320] <= reg165_next;
             reg_out[1335:1328] <= reg166_next;
             reg_out[1343:1336] <= reg167_next;
             reg_out[1351:1344] <= reg168_next;
             reg_out[1359:1352] <= reg169_next;
             reg_out[1367:1360] <= reg170_next;
             reg_out[1375:1368] <= reg171_next;
             reg_out[1383:1376] <= reg172_next;
             reg_out[1391:1384] <= reg173_next;
             reg_out[1399:1392] <= reg174_next;
             reg_out[1407:1400] <= reg175_next;
             reg_out[1415:1408] <= reg176_next;
             reg_out[1423:1416] <= reg177_next;
             reg_out[1431:1424] <= reg178_next;
             reg_out[1439:1432] <= reg179_next;
             reg_out[1447:1440] <= reg180_next;
             reg_out[1455:1448] <= reg181_next;
             reg_out[1463:1456] <= reg182_next;
             reg_out[1471:1464] <= reg183_next;
             reg_out[1479:1472] <= reg184_next;
             reg_out[1487:1480] <= reg185_next;
             reg_out[1495:1488] <= reg186_next;
             reg_out[1503:1496] <= reg187_next;
             reg_out[1511:1504] <= reg188_next;
             reg_out[1519:1512] <= reg189_next;
             reg_out[1527:1520] <= reg190_next;
             reg_out[1535:1528] <= reg191_next;
             reg_out[1543:1536] <= reg192_next;
             reg_out[1551:1544] <= reg193_next;
             reg_out[1559:1552] <= reg194_next;
             reg_out[1567:1560] <= reg195_next;
             reg_out[1575:1568] <= reg196_next;
             reg_out[1583:1576] <= reg197_next;
             reg_out[1591:1584] <= reg198_next;
             reg_out[1599:1592] <= reg199_next;
             reg_out[1607:1600] <= reg200_next;
             reg_out[1615:1608] <= reg201_next;
             reg_out[1623:1616] <= reg202_next;
             reg_out[1631:1624] <= reg203_next;
             reg_out[1639:1632] <= reg204_next;
             reg_out[1647:1640] <= reg205_next;
             reg_out[1655:1648] <= reg206_next;
             reg_out[1663:1656] <= reg207_next;
             reg_out[1671:1664] <= reg208_next;
             reg_out[1679:1672] <= reg209_next;
             reg_out[1687:1680] <= reg210_next;
             reg_out[1695:1688] <= reg211_next;
             reg_out[1703:1696] <= reg212_next;
             reg_out[1711:1704] <= reg213_next;
             reg_out[1719:1712] <= reg214_next;
             reg_out[1727:1720] <= reg215_next;
             reg_out[1735:1728] <= reg216_next;
             reg_out[1743:1736] <= reg217_next;
             reg_out[1751:1744] <= reg218_next;
             reg_out[1759:1752] <= reg219_next;
             reg_out[1767:1760] <= reg220_next;
             reg_out[1775:1768] <= reg221_next;
             reg_out[1783:1776] <= reg222_next;
             reg_out[1791:1784] <= reg223_next;
             reg_out[1799:1792] <= reg224_next;
             reg_out[1807:1800] <= reg225_next;
             reg_out[1815:1808] <= reg226_next;
             reg_out[1823:1816] <= reg227_next;
             reg_out[1831:1824] <= reg228_next;
             reg_out[1839:1832] <= reg229_next;
             reg_out[1847:1840] <= reg230_next;
             reg_out[1855:1848] <= reg231_next;
             reg_out[1863:1856] <= reg232_next;
             reg_out[1871:1864] <= reg233_next;
             reg_out[1879:1872] <= reg234_next;
             reg_out[1887:1880] <= reg235_next;
             reg_out[1895:1888] <= reg236_next;
             reg_out[1903:1896] <= reg237_next;
             reg_out[1911:1904] <= reg238_next;
             reg_out[1919:1912] <= reg239_next;
             reg_out[1927:1920] <= reg240_next;
             reg_out[1935:1928] <= reg241_next;
             reg_out[1943:1936] <= reg242_next;
             reg_out[1951:1944] <= reg243_next;
             reg_out[1959:1952] <= reg244_next;
             reg_out[1967:1960] <= reg245_next;
             reg_out[1975:1968] <= reg246_next;
             reg_out[1983:1976] <= reg247_next;
             reg_out[1991:1984] <= reg248_next;
             reg_out[1999:1992] <= reg249_next;
             reg_out[2007:2000] <= reg250_next;
             reg_out[2015:2008] <= reg251_next;
             reg_out[2023:2016] <= reg252_next;
             reg_out[2031:2024] <= reg253_next;
             reg_out[2039:2032] <= reg254_next;
             reg_out[2047:2040] <= reg255_next;
        end
    end
endmodule
