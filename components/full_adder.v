`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 01.01.2023 09:43:35
// Design Name: Full Adder
// Module Name: full_adder
// Description: Implementation of Full Adder.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder(
    output sum, cout,
    input a,
    input b,
    input cin
);

// More efficient
wire ab_xor = a ^ b;

assign cout = (a & b) | (cin & ab_xor);
assign sum = ab_xor ^ cin;

/*
assign sum = a ^ b ^ cin;
assign cout = (a & b) | (b & cin) | (cin & a);
*/
endmodule
