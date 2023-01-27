`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 27.01.2023 01:26:37
// Design Name: Wallace Multiplier
// Module Name: wallace_mult
// Description: Implementation of multiplier using Wallace Arquitecture.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module shifter_mult #(parameter WIDTH = 8) (
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    output [WIDTH*2-1:0] product
);

    reg [WIDTH*2-1:0] product_reg;
    integer i;
    
    always @(*) begin
        product_reg = 0;
        for (i = 0; i < WIDTH; i = i + 1) begin
            if (A[i]) 
                product_reg = product_reg + (B << i);
        end
    end

    assign product = product_reg;

endmodule