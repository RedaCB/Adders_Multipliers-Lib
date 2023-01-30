// dadda multiplier
// A - 8 bits , B - 8bits, product(output) - 16bits
module dadda_mult_CSA_8(A, B, product);
    
    input [7:0] A;
    input [7:0] B;
    output wire [15:0] product;
    wire  gen_pp [0:7][7:0];
// stage-1 sum and carry
    wire [0:5]s1,c1;
// stage-2 sum and carry
    wire [0:13]s2,c2;   
// stage-3 sum and carry
    wire [0:9]s3,c3;
// stage-4 sum and carry
    wire [0:11]s4,c4;
// stage-5 sum and carry
    wire [0:13]s5,c5;




// generating partial products 
genvar i;
genvar j;

for(i = 0; i<8; i=i+1)begin

   for(j = 0; j<8;j = j+1)begin
      assign gen_pp[i][j] = A[j]*B[i];
end
end

 

//Reduction by stages.
// di_values = 2,3,4,6,8,13...


//Stage 1 - reducing fom 8 to 6  


    half_adder h1(.sum(s1[0]),.cout(c1[0]),.a(gen_pp[6][0]),.b(gen_pp[5][1]));
    half_adder h2(.sum(s1[2]),.cout(c1[2]),.a(gen_pp[4][3]),.b(gen_pp[3][4]));
    half_adder h3(.sum(s1[4]),.cout(c1[4]),.a(gen_pp[4][4]),.b(gen_pp[3][5]));

    full_adder c11(.sum(s1[1]),.cout(c1[1]),.a(gen_pp[7][0]),.b(gen_pp[6][1]),.cin(gen_pp[5][2]));
    full_adder c12(.sum(s1[3]),.cout(c1[3]),.a(gen_pp[7][1]),.b(gen_pp[6][2]),.cin(gen_pp[5][3]));     
    full_adder c13(.sum(s1[5]),.cout(c1[5]),.a(gen_pp[7][2]),.b(gen_pp[6][3]),.cin(gen_pp[5][4]));
    
//Stage 2 - reducing fom 6 to 4

    half_adder h4(.sum(s2[0]),.cout(c2[0]),.a(gen_pp[4][0]),.b(gen_pp[3][1]));
    half_adder h5(.sum(s2[2]),.cout(c2[2]),.a(gen_pp[2][3]),.b(gen_pp[1][4]));


    full_adder c21(.sum(s2[1]),.cout(c2[1]),.a(gen_pp[5][0]),.b(gen_pp[4][1]),.cin(gen_pp[3][2]));
    full_adder c22(.sum(s2[3]),.cout(c2[3]),.a(s1[0]),.b(gen_pp[4][2]),.cin(gen_pp[3][3]));
    full_adder c23(.sum(s2[4]),.cout(c2[4]),.a(gen_pp[2][4]),.b(gen_pp[1][5]),.cin(gen_pp[0][6]));
    full_adder c24(.sum(s2[5]),.cout(c2[5]),.a(s1[1]),.b(s1[2]),.cin(c1[0]));
    full_adder c25(.sum(s2[6]),.cout(c2[6]),.a(gen_pp[2][5]),.b(gen_pp[1][6]),.cin(gen_pp[0][7]));
    full_adder c26(.sum(s2[7]),.cout(c2[7]),.a(s1[3]),.b(s1[4]),.cin(c1[1]));
    full_adder c27(.sum(s2[8]),.cout(c2[8]),.a(c1[2]),.b(gen_pp[2][6]),.cin(gen_pp[1][7]));
    full_adder c28(.sum(s2[9]),.cout(c2[9]),.a(s1[5]),.b(c1[3]),.cin(c1[4]));
    full_adder c29(.sum(s2[10]),.cout(c2[10]),.a(gen_pp[4][5]),.b(gen_pp[3][6]),.cin(gen_pp[2][7]));
    full_adder c210(.sum(s2[11]),.cout(c2[11]),.a(gen_pp[7][3]),.b(c1[5]),.cin(gen_pp[6][4]));
    full_adder c211(.sum(s2[12]),.cout(c2[12]),.a(gen_pp[5][5]),.b(gen_pp[4][6]),.cin(gen_pp[3][7]));
    full_adder c212(.sum(s2[13]),.cout(c2[13]),.a(gen_pp[7][4]),.b(gen_pp[6][5]),.cin(gen_pp[5][6]));
    
//Stage 3 - reducing fom 4 to 3

    half_adder h6(.sum(s3[0]),.cout(c3[0]),.a(gen_pp[3][0]),.b(gen_pp[2][1]));

    full_adder c31(.sum(s3[1]),.cout(c3[1]),.a(s2[0]),.b(gen_pp[2][2]),.cin(gen_pp[1][3]));
    full_adder c32(.sum(s3[2]),.cout(c3[2]),.a(s2[1]),.b(s2[2]),.cin(c2[0]));
    full_adder c33(.sum(s3[3]),.cout(c3[3]),.a(c2[1]),.b(c2[2]),.cin(s2[3]));
    full_adder c34(.sum(s3[4]),.cout(c3[4]),.a(c2[3]),.b(c2[4]),.cin(s2[5]));
    full_adder c35(.sum(s3[5]),.cout(c3[5]),.a(c2[5]),.b(c2[6]),.cin(s2[7]));
    full_adder c36(.sum(s3[6]),.cout(c3[6]),.a(c2[7]),.b(c2[8]),.cin(s2[9]));
    full_adder c37(.sum(s3[7]),.cout(c3[7]),.a(c2[9]),.b(c2[10]),.cin(s2[11]));
    full_adder c38(.sum(s3[8]),.cout(c3[8]),.a(c2[11]),.b(c2[12]),.cin(s2[13]));
    full_adder c39(.sum(s3[9]),.cout(c3[9]),.a(gen_pp[7][5]),.b(gen_pp[6][6]),.cin(gen_pp[5][7]));

//Stage 4 - reducing fom 3 to 2

    half_adder h7(.sum(s4[0]),.cout(c4[0]),.a(gen_pp[2][0]),.b(gen_pp[1][1]));


    full_adder c41(.sum(s4[1]),.cout(c4[1]),.a(s3[0]),.b(gen_pp[1][2]),.cin(gen_pp[0][3]));
    full_adder c42(.sum(s4[2]),.cout(c4[2]),.a(c3[0]),.b(s3[1]),.cin(gen_pp[0][4]));
    full_adder c43(.sum(s4[3]),.cout(c4[3]),.a(c3[1]),.b(s3[2]),.cin(gen_pp[0][5]));
    full_adder c44(.sum(s4[4]),.cout(c4[4]),.a(c3[2]),.b(s3[3]),.cin(s2[4]));
    full_adder c45(.sum(s4[5]),.cout(c4[5]),.a(c3[3]),.b(s3[4]),.cin(s2[6]));
    full_adder c46(.sum(s4[6]),.cout(c4[6]),.a(c3[4]),.b(s3[5]),.cin(s2[8]));
    full_adder c47(.sum(s4[7]),.cout(c4[7]),.a(c3[5]),.b(s3[6]),.cin(s2[10]));
    full_adder c48(.sum(s4[8]),.cout(c4[8]),.a(c3[6]),.b(s3[7]),.cin(s2[12]));
    full_adder c49(.sum(s4[9]),.cout(c4[9]),.a(c3[7]),.b(s3[8]),.cin(gen_pp[4][7]));
    full_adder c410(.sum(s4[10]),.cout(c4[10]),.a(c3[8]),.b(s3[9]),.cin(c2[13]));
    full_adder c411(.sum(s4[11]),.cout(c4[11]),.a(c3[9]),.b(gen_pp[7][6]),.cin(gen_pp[6][7]));
    
//Stage 5 - reducing fom 2 to 1
    // adding total sum and carry to get final output

    half_adder h8(.sum(product[1]),.cout(c5[0]),.a(gen_pp[1][0]),.b(gen_pp[0][1]));



    full_adder c51(.sum(product[2]),.cout(c5[1]),.a(s4[0]),.b(gen_pp[0][2]),.cin(c5[0]));
    full_adder c52(.sum(product[3]),.cout(c5[2]),.a(c4[0]),.b(s4[1]),.cin(c5[1]));
    full_adder c54(.sum(product[4]),.cout(c5[3]),.a(c4[1]),.b(s4[2]),.cin(c5[2]));
    full_adder c55(.sum(product[5]),.cout(c5[4]),.a(c4[2]),.b(s4[3]),.cin(c5[3]));
    full_adder c56(.sum(product[6]),.cout(c5[5]),.a(c4[3]),.b(s4[4]),.cin(c5[4]));
    full_adder c57(.sum(product[7]),.cout(c5[6]),.a(c4[4]),.b(s4[5]),.cin(c5[5]));
    full_adder c58(.sum(product[8]),.cout(c5[7]),.a(c4[5]),.b(s4[6]),.cin(c5[6]));
    full_adder c59(.sum(product[9]),.cout(c5[8]),.a(c4[6]),.b(s4[7]),.cin(c5[7]));
    full_adder c510(.sum(product[10]),.cout(c5[9]),.a(c4[7]),.b(s4[8]),.cin(c5[8]));
    full_adder c511(.sum(product[11]),.cout(c5[10]),.a(c4[8]),.b(s4[9]),.cin(c5[9]));
    full_adder c512(.sum(product[12]),.cout(c5[11]),.a(c4[9]),.b(s4[10]),.cin(c5[10]));
    full_adder c513(.sum(product[13]),.cout(c5[12]),.a(c4[10]),.b(s4[11]),.cin(c5[11]));
    full_adder c514(.sum(product[14]),.cout(c5[13]),.a(c4[11]),.b(gen_pp[7][7]),.cin(c5[12]));

    assign product[0] =  gen_pp[0][0];
    assign product[15] = c5[13];
    
  
    
endmodule