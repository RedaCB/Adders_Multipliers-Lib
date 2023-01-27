//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 29.01.2023 17:24:15
// Design Name: Lookahead Carry Adder
// Module Name: lookahead_carry_adder
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module lookahead_carry_adder #(WIDTH = 16)(
    output [WIDTH-1 : 0] sum,
    output cout,
    input [WIDTH-1 : 0] a, b,
    input cin
);

    wire [WIDTH-1 : 0] G;   // Generate
    wire [WIDTH-1 : 0] P;   // Propagate
    wire [WIDTH : 0] C;     // Carry
    
    assign G = a & b;   // Generate
    assign P = a ^ b;   // Propagate
    
    assign C[0] = cin;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin
            assign C[i+1] = G[i] | (P[i] & C[i]);
        end
    endgenerate
    
    assign cout = C[WIDTH];
    assign sum = P ^ C;

endmodule