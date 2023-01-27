`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 01.01.2023 13:21:09
// Design Name: Half Adder
// Module Name: half_adder
// Description: Implementation of Half Adder.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module half_adder(
    output sum,
    output carry,
    input a,
    input b
);

assign sum = a ^ b;
assign carry = a & b;

endmodule
