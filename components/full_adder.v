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

    wire a_xor_b, a_and_b, axb_and_cin;
    
    //Sum
    xor(a_xor_b, a, b);
    xor(sum, a_xor_b, cin);
    
    // Cout
    and(a_and_b, a, b);
    and(axb_and_cin, a_xor_b, cin);
    or(cout, a_and_b, axb_and_cin);

endmodule
