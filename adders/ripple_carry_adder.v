`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 29.01.2023 17:24:15
// Design Name: Ripple Carry Adder
// Module Name: ripple_carry_adder
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_carry_adder #(parameter WIDTH = 16)(
    output [WIDTH-1:0] sum,
    output cout,
    input [WIDTH-1:0] a, b,
    input cin
);

    wire [WIDTH:0] c;
    assign c[0] = cin;//1'b0;
    genvar i;
    
    generate
        for (i=0; i<WIDTH; i=i+1) begin : RCA_LOOP
          
          full_adder fa(sum[i], c[i+1], a[i], b[i], c[i]);

        end
    endgenerate
    
    assign cout = c[WIDTH]; 
endmodule
