  // Interpreting ecall_test.ihx as an Intel formal HEX file.
  wire [7:0] buff [162:0];
  assign buff[0] = 8'h2;
  assign buff[1] = 8'h0;
  assign buff[2] = 8'h6;
  assign buff[3] = 8'h2;
  assign buff[4] = 8'h0;
  assign buff[5] = 8'h88;
  assign buff[6] = 8'h75;
  assign buff[7] = 8'h81;
  assign buff[8] = 8'h7;
  assign buff[9] = 8'h12;
  assign buff[10] = 8'h0;
  assign buff[11] = 8'h9f;
  assign buff[12] = 8'he5;
  assign buff[13] = 8'h82;
  assign buff[14] = 8'h60;
  assign buff[15] = 8'h3;
  assign buff[16] = 8'h2;
  assign buff[17] = 8'h0;
  assign buff[18] = 8'h3;
  assign buff[19] = 8'h79;
  assign buff[20] = 8'h0;
  assign buff[21] = 8'he9;
  assign buff[22] = 8'h44;
  assign buff[23] = 8'h0;
  assign buff[24] = 8'h60;
  assign buff[25] = 8'h1b;
  assign buff[26] = 8'h7a;
  assign buff[27] = 8'h0;
  assign buff[28] = 8'h90;
  assign buff[29] = 8'h0;
  assign buff[30] = 8'ha3;
  assign buff[31] = 8'h78;
  assign buff[32] = 8'h1;
  assign buff[33] = 8'h75;
  assign buff[34] = 8'ha0;
  assign buff[35] = 8'h0;
  assign buff[36] = 8'he4;
  assign buff[37] = 8'h93;
  assign buff[38] = 8'hf2;
  assign buff[39] = 8'ha3;
  assign buff[40] = 8'h8;
  assign buff[41] = 8'hb8;
  assign buff[42] = 8'h0;
  assign buff[43] = 8'h2;
  assign buff[44] = 8'h5;
  assign buff[45] = 8'ha0;
  assign buff[46] = 8'hd9;
  assign buff[47] = 8'hf4;
  assign buff[48] = 8'hda;
  assign buff[49] = 8'hf2;
  assign buff[50] = 8'h75;
  assign buff[51] = 8'ha0;
  assign buff[52] = 8'hff;
  assign buff[53] = 8'he4;
  assign buff[54] = 8'h78;
  assign buff[55] = 8'hff;
  assign buff[56] = 8'hf6;
  assign buff[57] = 8'hd8;
  assign buff[58] = 8'hfd;
  assign buff[59] = 8'h78;
  assign buff[60] = 8'h0;
  assign buff[61] = 8'he8;
  assign buff[62] = 8'h44;
  assign buff[63] = 8'h0;
  assign buff[64] = 8'h60;
  assign buff[65] = 8'ha;
  assign buff[66] = 8'h79;
  assign buff[67] = 8'h1;
  assign buff[68] = 8'h75;
  assign buff[69] = 8'ha0;
  assign buff[70] = 8'h0;
  assign buff[71] = 8'he4;
  assign buff[72] = 8'hf3;
  assign buff[73] = 8'h9;
  assign buff[74] = 8'hd8;
  assign buff[75] = 8'hfc;
  assign buff[76] = 8'h78;
  assign buff[77] = 8'h0;
  assign buff[78] = 8'he8;
  assign buff[79] = 8'h44;
  assign buff[80] = 8'h0;
  assign buff[81] = 8'h60;
  assign buff[82] = 8'hc;
  assign buff[83] = 8'h79;
  assign buff[84] = 8'h0;
  assign buff[85] = 8'h90;
  assign buff[86] = 8'h0;
  assign buff[87] = 8'h1;
  assign buff[88] = 8'he4;
  assign buff[89] = 8'hf0;
  assign buff[90] = 8'ha3;
  assign buff[91] = 8'hd8;
  assign buff[92] = 8'hfc;
  assign buff[93] = 8'hd9;
  assign buff[94] = 8'hfa;
  assign buff[95] = 8'h2;
  assign buff[96] = 8'h0;
  assign buff[97] = 8'h3;
  assign buff[98] = 8'h75;
  assign buff[99] = 8'hb0;
  assign buff[100] = 8'hde;
  assign buff[101] = 8'h75;
  assign buff[102] = 8'ha0;
  assign buff[103] = 8'hde;
  assign buff[104] = 8'h75;
  assign buff[105] = 8'h90;
  assign buff[106] = 8'hde;
  assign buff[107] = 8'h75;
  assign buff[108] = 8'h80;
  assign buff[109] = 8'hde;
  assign buff[110] = 8'h75;
  assign buff[111] = 8'hb0;
  assign buff[112] = 8'had;
  assign buff[113] = 8'h75;
  assign buff[114] = 8'ha0;
  assign buff[115] = 8'had;
  assign buff[116] = 8'h75;
  assign buff[117] = 8'h90;
  assign buff[118] = 8'had;
  assign buff[119] = 8'h75;
  assign buff[120] = 8'h80;
  assign buff[121] = 8'had;
  assign buff[122] = 8'h75;
  assign buff[123] = 8'hb0;
  assign buff[124] = 8'h0;
  assign buff[125] = 8'h75;
  assign buff[126] = 8'ha0;
  assign buff[127] = 8'h0;
  assign buff[128] = 8'h75;
  assign buff[129] = 8'h90;
  assign buff[130] = 8'h0;
  assign buff[131] = 8'h75;
  assign buff[132] = 8'h80;
  assign buff[133] = 8'h0;
  assign buff[134] = 8'h80;
  assign buff[135] = 8'hfe;
  assign buff[136] = 8'h78;
  assign buff[137] = 8'h0;
  assign buff[138] = 8'h75;
  assign buff[139] = 8'h8e;
  assign buff[140] = 8'h9a;
  assign buff[141] = 8'h75;
  assign buff[142] = 8'h8f;
  assign buff[143] = 8'h0;
  assign buff[144] = 8'ha5;
  assign buff[145] = 8'h0;
  assign buff[146] = 8'h0;
  assign buff[147] = 8'he8;
  assign buff[148] = 8'h94;
  assign buff[149] = 8'h5;
  assign buff[150] = 8'h60;
  assign buff[151] = 8'h4;
  assign buff[152] = 8'h80;
  assign buff[153] = 8'hf6;
  assign buff[154] = 8'h8;
  assign buff[155] = 8'h32;
  assign buff[156] = 8'h2;
  assign buff[157] = 8'h0;
  assign buff[158] = 8'h62;
  assign buff[159] = 8'h75;
  assign buff[160] = 8'h82;
  assign buff[161] = 8'h0;
  assign buff[162] = 8'h22;
  wire [15:0] addr0 = addr;
  wire [15:0] addr1 = addr+1;
  wire [15:0] addr2 = addr+2;
  wire [15:0] addr3 = addr+3;
  wire [7:0] data_o0 = (addr0 < 163) ? buff[addr0] : 8'h0;
  wire [7:0] data_o1 = (addr1 < 163) ? buff[addr1] : 8'h0;
  wire [7:0] data_o2 = (addr2 < 163) ? buff[addr2] : 8'h0;
  wire [7:0] data_o3 = (addr3 < 163) ? buff[addr3] : 8'h0;
  wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};
