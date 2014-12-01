  // Interpreting aes_test.hex as an Intel formal HEX file.
  wire [7:0] buff [513:0];
  assign buff[0] = 8'h2;
  assign buff[1] = 8'h0;
  assign buff[2] = 8'h6;
  assign buff[3] = 8'h2;
  assign buff[4] = 8'h0;
  assign buff[5] = 8'h88;
  assign buff[6] = 8'h75;
  assign buff[7] = 8'h81;
  assign buff[8] = 8'h9;
  assign buff[9] = 8'h12;
  assign buff[10] = 8'h1;
  assign buff[11] = 8'hfe;
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
  assign buff[29] = 8'h2;
  assign buff[30] = 8'h2;
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
  assign buff[136] = 8'h7e;
  assign buff[137] = 8'h0;
  assign buff[138] = 8'h7f;
  assign buff[139] = 8'h0;
  assign buff[140] = 8'hc3;
  assign buff[141] = 8'he4;
  assign buff[142] = 8'h9e;
  assign buff[143] = 8'h74;
  assign buff[144] = 8'h80;
  assign buff[145] = 8'h8f;
  assign buff[146] = 8'hf0;
  assign buff[147] = 8'h63;
  assign buff[148] = 8'hf0;
  assign buff[149] = 8'h80;
  assign buff[150] = 8'h95;
  assign buff[151] = 8'hf0;
  assign buff[152] = 8'h50;
  assign buff[153] = 8'h68;
  assign buff[154] = 8'h8e;
  assign buff[155] = 8'h4;
  assign buff[156] = 8'hef;
  assign buff[157] = 8'hcc;
  assign buff[158] = 8'h25;
  assign buff[159] = 8'he0;
  assign buff[160] = 8'hcc;
  assign buff[161] = 8'h33;
  assign buff[162] = 8'h24;
  assign buff[163] = 8'he0;
  assign buff[164] = 8'hfd;
  assign buff[165] = 8'h8e;
  assign buff[166] = 8'h8;
  assign buff[167] = 8'h8f;
  assign buff[168] = 8'h9;
  assign buff[169] = 8'h8e;
  assign buff[170] = 8'h82;
  assign buff[171] = 8'h8f;
  assign buff[172] = 8'h83;
  assign buff[173] = 8'hc0;
  assign buff[174] = 8'h7;
  assign buff[175] = 8'hc0;
  assign buff[176] = 8'h6;
  assign buff[177] = 8'hc0;
  assign buff[178] = 8'h5;
  assign buff[179] = 8'hc0;
  assign buff[180] = 8'h4;
  assign buff[181] = 8'h12;
  assign buff[182] = 8'h1;
  assign buff[183] = 8'he1;
  assign buff[184] = 8'haa;
  assign buff[185] = 8'h82;
  assign buff[186] = 8'hab;
  assign buff[187] = 8'h83;
  assign buff[188] = 8'hd0;
  assign buff[189] = 8'h4;
  assign buff[190] = 8'hd0;
  assign buff[191] = 8'h5;
  assign buff[192] = 8'hd0;
  assign buff[193] = 8'h6;
  assign buff[194] = 8'hd0;
  assign buff[195] = 8'h7;
  assign buff[196] = 8'h8e;
  assign buff[197] = 8'h1;
  assign buff[198] = 8'he9;
  assign buff[199] = 8'h14;
  assign buff[200] = 8'hc2;
  assign buff[201] = 8'hd5;
  assign buff[202] = 8'h75;
  assign buff[203] = 8'hf0;
  assign buff[204] = 8'h2;
  assign buff[205] = 8'h30;
  assign buff[206] = 8'he7;
  assign buff[207] = 8'h4;
  assign buff[208] = 8'hb2;
  assign buff[209] = 8'hd5;
  assign buff[210] = 8'hf4;
  assign buff[211] = 8'h4;
  assign buff[212] = 8'ha4;
  assign buff[213] = 8'h30;
  assign buff[214] = 8'hd5;
  assign buff[215] = 8'ha;
  assign buff[216] = 8'hf4;
  assign buff[217] = 8'h24;
  assign buff[218] = 8'h1;
  assign buff[219] = 8'hc5;
  assign buff[220] = 8'hf0;
  assign buff[221] = 8'hf4;
  assign buff[222] = 8'h34;
  assign buff[223] = 8'h0;
  assign buff[224] = 8'hc5;
  assign buff[225] = 8'hf0;
  assign buff[226] = 8'h24;
  assign buff[227] = 8'h0;
  assign buff[228] = 8'hf5;
  assign buff[229] = 8'h82;
  assign buff[230] = 8'h74;
  assign buff[231] = 8'he0;
  assign buff[232] = 8'h35;
  assign buff[233] = 8'hf0;
  assign buff[234] = 8'hf5;
  assign buff[235] = 8'h83;
  assign buff[236] = 8'he0;
  assign buff[237] = 8'hf8;
  assign buff[238] = 8'ha3;
  assign buff[239] = 8'he0;
  assign buff[240] = 8'hf9;
  assign buff[241] = 8'he8;
  assign buff[242] = 8'h2a;
  assign buff[243] = 8'hf8;
  assign buff[244] = 8'he9;
  assign buff[245] = 8'h3b;
  assign buff[246] = 8'hf9;
  assign buff[247] = 8'h8c;
  assign buff[248] = 8'h82;
  assign buff[249] = 8'h8d;
  assign buff[250] = 8'h83;
  assign buff[251] = 8'he8;
  assign buff[252] = 8'hf0;
  assign buff[253] = 8'he9;
  assign buff[254] = 8'ha3;
  assign buff[255] = 8'hf0;
  assign buff[256] = 8'h80;
  assign buff[257] = 8'h14;
  assign buff[258] = 8'h8e;
  assign buff[259] = 8'h4;
  assign buff[260] = 8'hef;
  assign buff[261] = 8'hcc;
  assign buff[262] = 8'h25;
  assign buff[263] = 8'he0;
  assign buff[264] = 8'hcc;
  assign buff[265] = 8'h33;
  assign buff[266] = 8'hfd;
  assign buff[267] = 8'h8c;
  assign buff[268] = 8'h82;
  assign buff[269] = 8'h74;
  assign buff[270] = 8'he0;
  assign buff[271] = 8'h2d;
  assign buff[272] = 8'hf5;
  assign buff[273] = 8'h83;
  assign buff[274] = 8'he4;
  assign buff[275] = 8'hf0;
  assign buff[276] = 8'ha3;
  assign buff[277] = 8'hf0;
  assign buff[278] = 8'he;
  assign buff[279] = 8'hbe;
  assign buff[280] = 8'h0;
  assign buff[281] = 8'h1;
  assign buff[282] = 8'hf;
  assign buff[283] = 8'hc3;
  assign buff[284] = 8'hee;
  assign buff[285] = 8'h94;
  assign buff[286] = 8'h8;
  assign buff[287] = 8'hef;
  assign buff[288] = 8'h64;
  assign buff[289] = 8'h80;
  assign buff[290] = 8'h94;
  assign buff[291] = 8'h80;
  assign buff[292] = 8'h50;
  assign buff[293] = 8'h3;
  assign buff[294] = 8'h2;
  assign buff[295] = 8'h0;
  assign buff[296] = 8'h8c;
  assign buff[297] = 8'h90;
  assign buff[298] = 8'hff;
  assign buff[299] = 8'h2;
  assign buff[300] = 8'h74;
  assign buff[301] = 8'h34;
  assign buff[302] = 8'hf0;
  assign buff[303] = 8'h74;
  assign buff[304] = 8'h12;
  assign buff[305] = 8'ha3;
  assign buff[306] = 8'hf0;
  assign buff[307] = 8'h90;
  assign buff[308] = 8'hff;
  assign buff[309] = 8'h2;
  assign buff[310] = 8'he0;
  assign buff[311] = 8'hfe;
  assign buff[312] = 8'ha3;
  assign buff[313] = 8'he0;
  assign buff[314] = 8'h8e;
  assign buff[315] = 8'h80;
  assign buff[316] = 8'h90;
  assign buff[317] = 8'hff;
  assign buff[318] = 8'h2;
  assign buff[319] = 8'he0;
  assign buff[320] = 8'ha3;
  assign buff[321] = 8'he0;
  assign buff[322] = 8'hff;
  assign buff[323] = 8'h8f;
  assign buff[324] = 8'h80;
  assign buff[325] = 8'h90;
  assign buff[326] = 8'hff;
  assign buff[327] = 8'h4;
  assign buff[328] = 8'h74;
  assign buff[329] = 8'h78;
  assign buff[330] = 8'hf0;
  assign buff[331] = 8'h74;
  assign buff[332] = 8'h56;
  assign buff[333] = 8'ha3;
  assign buff[334] = 8'hf0;
  assign buff[335] = 8'h90;
  assign buff[336] = 8'hff;
  assign buff[337] = 8'h4;
  assign buff[338] = 8'he0;
  assign buff[339] = 8'hfe;
  assign buff[340] = 8'ha3;
  assign buff[341] = 8'he0;
  assign buff[342] = 8'h8e;
  assign buff[343] = 8'h80;
  assign buff[344] = 8'h90;
  assign buff[345] = 8'hff;
  assign buff[346] = 8'h4;
  assign buff[347] = 8'he0;
  assign buff[348] = 8'ha3;
  assign buff[349] = 8'he0;
  assign buff[350] = 8'hff;
  assign buff[351] = 8'h8f;
  assign buff[352] = 8'h80;
  assign buff[353] = 8'h7e;
  assign buff[354] = 8'h0;
  assign buff[355] = 8'h7f;
  assign buff[356] = 8'h0;
  assign buff[357] = 8'hee;
  assign buff[358] = 8'h24;
  assign buff[359] = 8'h20;
  assign buff[360] = 8'hf5;
  assign buff[361] = 8'h82;
  assign buff[362] = 8'hef;
  assign buff[363] = 8'h34;
  assign buff[364] = 8'hff;
  assign buff[365] = 8'hf5;
  assign buff[366] = 8'h83;
  assign buff[367] = 8'h8e;
  assign buff[368] = 8'h5;
  assign buff[369] = 8'hed;
  assign buff[370] = 8'hc4;
  assign buff[371] = 8'h54;
  assign buff[372] = 8'hf0;
  assign buff[373] = 8'hfd;
  assign buff[374] = 8'h33;
  assign buff[375] = 8'h95;
  assign buff[376] = 8'he0;
  assign buff[377] = 8'hfc;
  assign buff[378] = 8'hee;
  assign buff[379] = 8'h42;
  assign buff[380] = 8'h5;
  assign buff[381] = 8'hef;
  assign buff[382] = 8'h42;
  assign buff[383] = 8'h4;
  assign buff[384] = 8'hed;
  assign buff[385] = 8'hf0;
  assign buff[386] = 8'he;
  assign buff[387] = 8'hbe;
  assign buff[388] = 8'h0;
  assign buff[389] = 8'h1;
  assign buff[390] = 8'hf;
  assign buff[391] = 8'hc3;
  assign buff[392] = 8'hee;
  assign buff[393] = 8'h94;
  assign buff[394] = 8'h10;
  assign buff[395] = 8'hef;
  assign buff[396] = 8'h64;
  assign buff[397] = 8'h80;
  assign buff[398] = 8'h94;
  assign buff[399] = 8'h80;
  assign buff[400] = 8'h40;
  assign buff[401] = 8'hd3;
  assign buff[402] = 8'h7e;
  assign buff[403] = 8'h0;
  assign buff[404] = 8'h7f;
  assign buff[405] = 8'h0;
  assign buff[406] = 8'hee;
  assign buff[407] = 8'h24;
  assign buff[408] = 8'h20;
  assign buff[409] = 8'hf5;
  assign buff[410] = 8'h82;
  assign buff[411] = 8'hef;
  assign buff[412] = 8'h34;
  assign buff[413] = 8'hff;
  assign buff[414] = 8'hf5;
  assign buff[415] = 8'h83;
  assign buff[416] = 8'he0;
  assign buff[417] = 8'hf5;
  assign buff[418] = 8'h80;
  assign buff[419] = 8'he;
  assign buff[420] = 8'hbe;
  assign buff[421] = 8'h0;
  assign buff[422] = 8'h1;
  assign buff[423] = 8'hf;
  assign buff[424] = 8'hc3;
  assign buff[425] = 8'hee;
  assign buff[426] = 8'h94;
  assign buff[427] = 8'h10;
  assign buff[428] = 8'hef;
  assign buff[429] = 8'h64;
  assign buff[430] = 8'h80;
  assign buff[431] = 8'h94;
  assign buff[432] = 8'h80;
  assign buff[433] = 8'h40;
  assign buff[434] = 8'he3;
  assign buff[435] = 8'h7e;
  assign buff[436] = 8'h0;
  assign buff[437] = 8'h7f;
  assign buff[438] = 8'h0;
  assign buff[439] = 8'h8e;
  assign buff[440] = 8'h4;
  assign buff[441] = 8'hef;
  assign buff[442] = 8'hcc;
  assign buff[443] = 8'h25;
  assign buff[444] = 8'he0;
  assign buff[445] = 8'hcc;
  assign buff[446] = 8'h33;
  assign buff[447] = 8'hfd;
  assign buff[448] = 8'h8c;
  assign buff[449] = 8'h82;
  assign buff[450] = 8'h74;
  assign buff[451] = 8'he0;
  assign buff[452] = 8'h2d;
  assign buff[453] = 8'hf5;
  assign buff[454] = 8'h83;
  assign buff[455] = 8'he0;
  assign buff[456] = 8'hfc;
  assign buff[457] = 8'ha3;
  assign buff[458] = 8'he0;
  assign buff[459] = 8'hfd;
  assign buff[460] = 8'h8c;
  assign buff[461] = 8'h80;
  assign buff[462] = 8'he;
  assign buff[463] = 8'hbe;
  assign buff[464] = 8'h0;
  assign buff[465] = 8'h1;
  assign buff[466] = 8'hf;
  assign buff[467] = 8'hc3;
  assign buff[468] = 8'hee;
  assign buff[469] = 8'h94;
  assign buff[470] = 8'h8;
  assign buff[471] = 8'hef;
  assign buff[472] = 8'h64;
  assign buff[473] = 8'h80;
  assign buff[474] = 8'h94;
  assign buff[475] = 8'h80;
  assign buff[476] = 8'h40;
  assign buff[477] = 8'hd9;
  assign buff[478] = 8'h2;
  assign buff[479] = 8'h0;
  assign buff[480] = 8'h62;
  assign buff[481] = 8'he5;
  assign buff[482] = 8'h82;
  assign buff[483] = 8'h85;
  assign buff[484] = 8'h8;
  assign buff[485] = 8'hf0;
  assign buff[486] = 8'ha4;
  assign buff[487] = 8'hc5;
  assign buff[488] = 8'h82;
  assign buff[489] = 8'hc0;
  assign buff[490] = 8'hf0;
  assign buff[491] = 8'h85;
  assign buff[492] = 8'h9;
  assign buff[493] = 8'hf0;
  assign buff[494] = 8'ha4;
  assign buff[495] = 8'hd0;
  assign buff[496] = 8'hf0;
  assign buff[497] = 8'h25;
  assign buff[498] = 8'hf0;
  assign buff[499] = 8'hc5;
  assign buff[500] = 8'h83;
  assign buff[501] = 8'h85;
  assign buff[502] = 8'h8;
  assign buff[503] = 8'hf0;
  assign buff[504] = 8'ha4;
  assign buff[505] = 8'h25;
  assign buff[506] = 8'h83;
  assign buff[507] = 8'hf5;
  assign buff[508] = 8'h83;
  assign buff[509] = 8'h22;
  assign buff[510] = 8'h75;
  assign buff[511] = 8'h82;
  assign buff[512] = 8'h0;
  assign buff[513] = 8'h22;
  wire [15:0] addr0 = addr;
  wire [15:0] addr1 = addr+1;
  wire [15:0] addr2 = addr+2;
  wire [15:0] addr3 = addr+3;
  wire [7:0] data_o0 = (addr0 < 514) ? buff[addr0] : 8'hx;
  wire [7:0] data_o1 = (addr1 < 514) ? buff[addr1] : 8'hx;
  wire [7:0] data_o2 = (addr2 < 514) ? buff[addr2] : 8'hx;
  wire [7:0] data_o3 = (addr3 < 514) ? buff[addr3] : 8'hx;
  wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};
