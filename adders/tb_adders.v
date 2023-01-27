`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2023 19:45:02
// Design Name: 
// Module Name: tb_adders
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_adders();
    
localparam period = 10;
localparam WIDTH  = 16;

reg clk, resetn;
reg [WIDTH-1 : 0] data_in1;
reg [WIDTH-1 : 0] data_in2;

wire [WIDTH-1 : 0] data_out_CRA;
wire [WIDTH-1 : 0] data_out_CLA;
wire [WIDTH-1 : 0] data_out_CSA;
wire [WIDTH-1 : 0] data_out_CSkA;

wire data_c_CRA;
wire data_c_CLA;
wire data_c_CSA;
wire data_c_CSkA;

    
ripple_carry_adder UUT0(
    .a(data_in1),
    .b(data_in2),
    .cin(1'b0),
    .sum(data_out_CRA),
    .cout(data_c_CRA)
);

selected_carry_adder UUT1(
    .a(data_in1),
    .b(data_in2),
    .cin(1'b0),
    .sum(data_out_CSA),
    .cout(data_c_CSA)
);

lookahead_carry_adder UUT2(
    .a(data_in1),
    .b(data_in2),
    .cin(1'b0),
    .sum(data_out_CLA),
    .cout(data_c_CLA)
);

skip_carry_adder UUT3(
    .a(data_in1),
    .b(data_in2),
    .cin(1'b0),
    .sum(data_out_CSkA),
    .cout(data_c_CSkA)
);



// Clock
always 
begin
    clk = 1'b0; 
    #(period / 2); // high for period * timescale = 5ns

    clk = 1'b1;
    #(period / 2); // low for period * timescale = 5ns
end

 always @(posedge clk)
    begin
        data_in1 <= 16'b0000000000000000;
        data_in2 <= 16'b0000000000000000;
        #(period);
        data_in1 <= 16'b1111111111111111;
        data_in2 <= 16'b1111111111111111;
        #(period*4);
        data_in1 <= 16'b0011111111001011;
        data_in2 <= 16'b0011111111000101;
        #(period*4);
        data_in1 <= 16'b1111111111111111;
        data_in2 <= 16'b0000000000000001;
        #(period*4);
        data_in1 <= 16'b0000000000000001;
        data_in2 <= 16'b1111111111111111;
        #(period*4);
        $stop;
    end
endmodule
