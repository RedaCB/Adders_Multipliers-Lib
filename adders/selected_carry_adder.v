//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 29.01.2023 17:24:15
// Design Name: Selected Carry Adder
// Module Name: selected_carry_adder
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module selected_carry_adder #(parameter WIDTH = 16, ADD_WIDTH = 4)(
    output [WIDTH-1 : 0] sum,
    output cout,
    input  [WIDTH-1 : 0] a, b,
    input  cin
);

    wire [WIDTH-1 : 0] sum0, sum1;
    wire [(WIDTH/ADD_WIDTH) : 0] c;
    wire [(WIDTH/ADD_WIDTH)-1:0] cout0, cout1;
    
    assign c[0] = cin;
    genvar i;
    
    generate
        for (i = 0; i < (WIDTH/ADD_WIDTH); i = i + 1) begin : RCA_LOOP
            ripple_carry_adder #(ADD_WIDTH) rca0(sum0[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], cout0[i], a[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], b[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], 1'b0);
            ripple_carry_adder #(ADD_WIDTH) rca1(sum1[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], cout1[i], a[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], b[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], 1'b1);
            MUX2to1_wN #(ADD_WIDTH) mux_sum(sum[(ADD_WIDTH*i) + (ADD_WIDTH-1) :( ADD_WIDTH*i)], sum0[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], sum1[(ADD_WIDTH*i) + (ADD_WIDTH-1) : (ADD_WIDTH*i)], c[i]);
        end
    endgenerate 
    MUX2to1_wN #(1) mux_cout(c[1], cout0[0], cout1[0], 1'b0);
    
    genvar j;
    generate
        for (j = 1; j < (WIDTH/ADD_WIDTH); j = j + 1) begin : MUX_LOOP2
            MUX2to1_wN #(1) mux_cout(c[j+1], cout0[j], cout1[j], c[1]);
        end
    endgenerate
    
    assign cout = c[(WIDTH/ADD_WIDTH)];
    
endmodule