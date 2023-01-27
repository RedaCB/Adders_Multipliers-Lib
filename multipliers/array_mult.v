`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 27.01.2023 15:38:51
// Design Name: Array Multiplier
// Module Name: array_mult
// Description: Array multiplier with Gates AND, Full Adders and Half Adders.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define WIDTH_INPUT 8

module array_mult #(parameter WIDTH = 8) (
    output [(WIDTH*2)-1 : 0] product,
    input [WIDTH-1 : 0] A,
    input [WIDTH-1 : 0] B
);

wire [(WIDTH*WIDTH)-1 : 0] w;
wire [(WIDTH*WIDTH)-WIDTH-1 : 0] c;
wire [(WIDTH*WIDTH)-WIDTH : 0] s;


// ROW_j COL_i => GATES AND for MULTIPLICATION
genvar i, j;

for (i = 0; i < WIDTH; i = i+1) begin
    for (j = 0; j < WIDTH; j = j+1) begin
        and g (w[(i*WIDTH)+j], A[j], B[i]);
    end        
end

assign product[0] = w[0];

// 1st ROW OF MACs -> 1st LOOP w/ 1st ROW
genvar x, y;
for (x = 1; x < WIDTH-1; x = x + 1) begin
    full_adder fa (s[x+1], c[x], w[x+1], w[WIDTH+x], c[x-1]);
end

// 2nd LOOP 2da-nesima ROW
for (y = 1; y < WIDTH-1; y = y + 1) begin
    for (x = 0; x < WIDTH-2; x = x + 1) begin
        full_adder fax (s[x+2+(y*WIDTH)], c[x+1+(y*WIDTH)], s[x+3-WIDTH+(y*WIDTH)], w[x+WIDTH+1+(y*WIDTH)], c[x+(y*WIDTH)]);
    end
end

//3rd LOOP w/ INITIALS
genvar k;
half_adder hai1(product[1], c[0], w[1], w[WIDTH]);
for (k = 1; k < WIDTH-1; k = k + 1) begin
  half_adder hai (product[k+1], c[k*WIDTH], s[k*WIDTH-(WIDTH-2)], w[(k+1)*WIDTH]);
end

// 4th LOOP w/ FINALS
half_adder han(s[WIDTH], c[WIDTH-1], w[(WIDTH*2)-1], c[WIDTH-2]);

for (i = 0; i < WIDTH-2; i = i + 1) begin
  full_adder fan (s[(WIDTH*2) + i*WIDTH], c[(WIDTH*2-1) + i*WIDTH], c[WIDTH-1 + i*WIDTH], w[(WIDTH*2)-1 + i*WIDTH], c[(WIDTH*2-2) + i*WIDTH]);
end

for(x=0;x<WIDTH-1;x=x+1) begin
    assign product[x+WIDTH] = s[x+(WIDTH*WIDTH)-(WIDTH*2)+2];
end
assign product[(WIDTH*2)-1] = c[(WIDTH*WIDTH)-WIDTH-1];


endmodule
