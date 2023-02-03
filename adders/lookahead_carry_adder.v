`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 29.01.2023 17:24:15
// Design Name: Lookahead Carry Adder
// Module Name: lookahead_carry
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module lookahead_carry_4 (a,b, cin, sum,cout);
    input [3:0] a,b;
    input cin;
    output [3:0] sum;
    output cout;
    
    wire [3:0] p, g, c;
    
    assign p = a^b;//propagate
    assign g = a&b; //generate
    
    //carry=gi + Pi.ci
    
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0]&c[0]);
    assign c[2] = g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
    assign c[3] = g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
    assign cout = g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] | p[3]&p[2]&p[1]&p[0]&c[0];
    assign sum  = p^c;

endmodule


module lookahead_carry_8 (
    output [15 : 0] sum,
    output cout,
    input [15 : 0] a, b,
    input cin
);
    
     wire c1;
    
    lookahead_carry_4 cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    lookahead_carry_4 cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(cout));
    
endmodule

module lookahead_carry_16 (
    output [15 : 0] sum,
    output cout,
    input [15 : 0] a, b,
    input cin
);
    
     wire c1,c2,c3;
    
    lookahead_carry_4 cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    lookahead_carry_4 cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
    lookahead_carry_4 cla3 (.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
    lookahead_carry_4 cla4 (.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(cout));
    
endmodule


module lookahead_carry_32 (
    output [31 : 0] sum,
    output cout,
    input [31 : 0] a, b,
    input cin
);
    
     wire c1,c2,c3,c4,c5,c6,c7;
    
    lookahead_carry_4 cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    lookahead_carry_4 cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
    lookahead_carry_4 cla3 (.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
    lookahead_carry_4 cla4 (.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(c4));
    
    lookahead_carry_4 cla5 (.a(a[19:16]), .b(b[19:16]), .cin(c4), .sum(sum[19:16]), .cout(c5));
    lookahead_carry_4 cla6 (.a(a[23:20]), .b(b[23:20]), .cin(c5), .sum(sum[23:20]), .cout(c6));
    lookahead_carry_4 cla7 (.a(a[27:24]), .b(b[27:24]), .cin(c6), .sum(sum[27:24]), .cout(c7));
    lookahead_carry_4 cla8 (.a(a[31:28]), .b(b[31:28]), .cin(c7), .sum(sum[31:28]), .cout(cout));
    
endmodule


module lookahead_carry_64 (
    output [63 : 0] sum,
    output cout,
    input [63 : 0] a, b,
    input cin
);
    
     wire c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15;
    
    lookahead_carry_4 cla1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1));
    lookahead_carry_4 cla2 (.a(a[7:4]), .b(b[7:4]), .cin(c1), .sum(sum[7:4]), .cout(c2));
    lookahead_carry_4 cla3 (.a(a[11:8]), .b(b[11:8]), .cin(c2), .sum(sum[11:8]), .cout(c3));
    lookahead_carry_4 cla4 (.a(a[15:12]), .b(b[15:12]), .cin(c3), .sum(sum[15:12]), .cout(c4));
    
    lookahead_carry_4 cla5 (.a(a[19:16]), .b(b[19:16]), .cin(c4), .sum(sum[19:16]), .cout(c5));
    lookahead_carry_4 cla6 (.a(a[23:20]), .b(b[23:20]), .cin(c5), .sum(sum[23:20]), .cout(c6));
    lookahead_carry_4 cla7 (.a(a[27:24]), .b(b[27:24]), .cin(c6), .sum(sum[27:24]), .cout(c7));
    lookahead_carry_4 cla8 (.a(a[31:28]), .b(b[31:28]), .cin(c7), .sum(sum[31:28]), .cout(c8));
    
    lookahead_carry_4 cla9 (.a(a[35:32]), .b(b[35:32]), .cin(c8), .sum(sum[35:32]), .cout(c9));
    lookahead_carry_4 cla10 (.a(a[39:36]), .b(b[39:36]), .cin(c9), .sum(sum[39:36]), .cout(c10));
    lookahead_carry_4 cla11 (.a(a[43:40]), .b(b[43:40]), .cin(c10), .sum(sum[43:40]), .cout(c11));
    lookahead_carry_4 cla12 (.a(a[47:44]), .b(b[47:44]), .cin(c11), .sum(sum[47:44]), .cout(c12));
    
    lookahead_carry_4 cla13 (.a(a[51:48]), .b(b[51:48]), .cin(c12), .sum(sum[51:48]), .cout(c13));
    lookahead_carry_4 cla14 (.a(a[55:52]), .b(b[55:52]), .cin(c13), .sum(sum[55:52]), .cout(c14));
    lookahead_carry_4 cla15 (.a(a[59:56]), .b(b[59:56]), .cin(c14), .sum(sum[59:56]), .cout(c15));
    lookahead_carry_4 cla16 (.a(a[63:60]), .b(b[63:60]), .cin(c15), .sum(sum[63:60]), .cout(cout));
    
endmodule
