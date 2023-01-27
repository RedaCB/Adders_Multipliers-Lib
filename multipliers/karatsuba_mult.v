`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 27.01.2023 02:27:13
// Design Name: Karatsuba Multiplier
// Module Name: karatsuba_mult 
// Description: Implementation of multiplier using Karatsuba Arquitecture.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module karatsuba_mult #(parameter WIDTH = 8)(
    input   [WIDTH-1:0]    A,
    input   [WIDTH-1:0]    B,
    output  [WIDTH*2-1:0]    product
);

wire   [(WIDTH/2)-1:0] A_upper, A_lower;
wire   [(WIDTH/2)-1:0] B_upper, B_lower;
assign {A_upper, A_lower} = A;
assign {B_upper, B_lower} = B;

wire   [WIDTH-1:0]   p;
wire   [WIDTH-1:0]   q;
wire   [(WIDTH/2):0]       r;
wire   [(WIDTH/2):0]       s;
assign p = A_upper * B_upper;
assign q = A_lower * B_lower;
assign r = A_upper + A_lower;
assign s = B_upper + B_lower;

wire   [WIDTH:0]     u;
assign  u = p + q;

wire   [WIDTH+1:0]        t;
wire   r_hi, s_hi;
wire   [(WIDTH/2)-1:0]     r_lo, s_lo;

assign  {r_hi, r_lo} = r;
assign  {s_hi, s_lo} = s;

wire   [WIDTH-1:0]        t_s;

assign t_s = r_lo * s_lo;
assign t = ((r_hi & s_hi) << WIDTH) + ((r_hi * s_lo + s_hi * r_lo) << (WIDTH/2)) + t_s;

assign product = (p << WIDTH) + ((t - u) << (WIDTH/2)) + q;

endmodule
