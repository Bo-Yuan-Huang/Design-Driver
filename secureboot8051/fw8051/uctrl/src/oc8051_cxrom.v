/*
 * Fully-combinational ROM module that interfaces with the oc8051.
 *
 * This wrapper was written by Pramod Subramanyan.
 * Email: psubrama@princeton.edu
 */ 


module oc8051_cxrom(cxrom_addr, cxrom_data_out);
    input  [15:0]   cxrom_addr;
    output [31:0]   cxrom_data_out;

    wire [15:0] addr = cxrom_addr;
    wire [31:0] cxrom_data_out = data_out;

`include "../bench/rom/sha_test.v"

endmodule
