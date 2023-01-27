`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IMB-CNM, CSIC
// Engineer: Reda Chriki
// 
// Create Date: 27.01.2023 01:29:09
// Design Name: Test Bench Multipliers
// Module Name: tb_multipliers
// Description: Verification of multipliers.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mult();
    
localparam period = 10;
localparam WIDTH  = 8;

reg clk, resetn;
reg [WIDTH-1 : 0] data_in1;
reg [WIDTH-1 : 0] data_in2;
wire [(WIDTH*2)-1 : 0] data_out_array;
wire [(WIDTH*2)-1 : 0] data_out_wallace;
wire [(WIDTH*2)-1 : 0] data_out_karatsuba;

array_mult UUT0(
    .A(data_in1),
    .B(data_in2),
    .product(data_out_array)
);

mult_wallace UUT1(
    .A(data_in1),
    .B(data_in2),
    .product(data_out_wallace)
);


mult_karatsuba UUT2(
    .A(data_in1),
    .B(data_in2),
    .product(data_out_karatsuba)
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
        resetn <= 1'b0;
        #(period);
        resetn <= 1'b1;
        data_in1 <= 8'b11111111;
        data_in2 <= 8'b11111111;
        #(period*4);
        data_in1 <= 8'b00001011;
        data_in2 <= 8'b00000101;
        #(period*4);
        data_in1 <= 8'b11111111;
        data_in2 <= 8'b00000001;
        #(period*4);
        data_in1 <= 8'b00000001;
        data_in2 <= 8'b11111111;
        #(period*4);
        $stop;
    end



endmodule
