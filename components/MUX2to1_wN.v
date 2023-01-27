`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 29.01.2023 16:02:21
// Design Name: Multiplexor 2 to 1 width N
// Module Name: MUX2to1_wN
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module MUX2to1_wN #(parameter N = 4)(
    output [N-1:0] o,
    input [N-1:0] a, b,
    input s
);
    
    assign o = s ? a : b;

endmodule