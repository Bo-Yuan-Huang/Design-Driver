//
// decoder for 7 led display
//

module disp (in, out);

input [7:0] in;
output [13:0] out;

reg [13:0] out;

always @(in)
begin
  case (in[7:4])
    4'h0: out[13:7] = 7'b1110111;
    4'h1: out[13:7] = 7'b0100100;
    4'h2: out[13:7] = 7'b1011101;
    4'h3: out[13:7] = 7'b1101101;
    4'h4: out[13:7] = 7'b0101110;
    4'h5: out[13:7] = 7'b1101011;
    4'h6: out[13:7] = 7'b1111011;
    4'h7: out[13:7] = 7'b0100111;
    4'h8: out[13:7] = 7'b1111111;
    4'h9: out[13:7] = 7'b1101111;
    4'ha: out[13:7] = 7'b0111111;
    4'hb: out[13:7] = 7'b1111010;
    4'hc: out[13:7] = 7'b1010011;
    4'hd: out[13:7] = 7'b1111100;
    4'he: out[13:7] = 7'b1011011;
    4'hf: out[13:7] = 7'b0011011;
    default: out[13:7] = 7'b0000000;
  endcase

  case (in[3:0])
    4'h0: out[6:0] = 7'b1110111;
    4'h1: out[6:0] = 7'b0100100;
    4'h2: out[6:0] = 7'b1011101;
    4'h3: out[6:0] = 7'b1101101;
    4'h4: out[6:0] = 7'b0101110;
    4'h5: out[6:0] = 7'b1101011;
    4'h6: out[6:0] = 7'b1111011;
    4'h7: out[6:0] = 7'b0100111;
    4'h8: out[6:0] = 7'b1111111;
    4'h9: out[6:0] = 7'b1101111;
    4'ha: out[6:0] = 7'b0111111;
    4'hb: out[6:0] = 7'b1111010;
    4'hc: out[6:0] = 7'b1010011;
    4'hd: out[6:0] = 7'b1111100;
    4'he: out[6:0] = 7'b1011011;
    4'hf: out[6:0] = 7'b0011011;
    default: out[6:0] = 7'b0000000;
  endcase
end

endmodule
