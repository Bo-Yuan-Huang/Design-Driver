module dff (Q, D, C);
  input D, C;
  output Q;

  reg Q;
  always @(posedge C)
  begin
    Q <= D;
  end
endmodule
