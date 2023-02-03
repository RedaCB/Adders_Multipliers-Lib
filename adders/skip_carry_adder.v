`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 29.01.2023 17:24:15
// Design Name: Skip Carry Adder
// Module Name: skip_carry_adder
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module SkipLogic(output cin_next,
  input [3:0] a, b, input cin, cout);
  
  wire p0, p1, p2, p3, P, e;
  
  or (p0, a[0], b[0]);
  or (p1, a[1], b[1]);
  or (p2, a[2], b[2]);
  or (p3, a[3], b[3]);
  
  and (P, p0, p1, p2, p3);
  and (e, P, cin);
  
  or (cin_next, e, cout);

endmodule


module skip_carry_adder #(parameter WIDTH = 16)(
    output [15:0] sum,
    output cout,
    input [15:0] a, b,
    input cin
);
  
  wire [WIDTH/4-1:0] couts;
  wire [WIDTH/4:0] e;
  
  assign e[0] = cin;
  
  genvar i;
  generate
      for (i = 0; i < WIDTH/4; i = i + 1) begin
        ripple_carry_adder #(WIDTH/4) rca(sum[i*WIDTH/4+(WIDTH/4-1):i*WIDTH/4], couts[i], a[i*WIDTH/4+(WIDTH/4-1):i*WIDTH/4], b[i*WIDTH/4+(WIDTH/4-1):i*WIDTH/4], e[i]);
        SkipLogic skip(e[i+1], a[i*WIDTH/4+(WIDTH/4-1):i*WIDTH/4], b[i*WIDTH/4+(WIDTH/4-1):i*WIDTH/4], e[i], couts[i]);
      end
  endgenerate 
  assign cout = e[WIDTH/4];          

endmodule