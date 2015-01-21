module NOR2 (A, B, Y);
    input A, B;
    output Y;
    nor (Y, A, B);
endmodule

module NAND2 (A, B, Y);
    input A, B;
    output Y;
    nand (Y, A, B);
endmodule

module OR2 (A, B, Y);
    input A, B;
    output Y;
    or (Y, A, B);
endmodule

module AND2 (A, B, Y);
    input A, B;
    output Y;
    and (Y, A, B);
endmodule

module INV (Y, A);
    input A;
    output Y;
    not (Y, A);
endmodule

module BUF(Y, A);
    input A;
    output Y;
    buf (Y, A);
endmodule

module DFFSRPQ (D, CK, R, SN, Q);
  input CK, D, R, SN;
  output Q;

  wire S;
  wire RN;
  wire DR;
  wire DSR;
  wire QnSR;
  wire QnS;
  wire Q;

  not (S, SN);
  not (RN, R); 

  and(DR, D, RN); // reset D
  or(DSR, DR, S); // set and reset D
  dff (QnSR, DSR);
  and (QnS, QnSR, RN); // reset Q
  or (Q, QnS, S); // set and reset Q
endmodule

module DFFQ (D, CK, Q);
  input D, CK;
  output Q;

  dff (Q, D);
endmodule

module DFFQ (D, CK, Q);
  input D, CK;
  output QN;
  wire Q;

  dff (Q, D);
  not (QN, Q);
endmodule
