module dadda_mult_CLA_reduced_8(product, A, B);
    /* This attempt uses CLA of max length 4 but the 2nd last stage uses FA and HAs and 
     * the final stage addition is done using CLA of length 13. 
     * Area: 1062.964470 
     * Power: 0.5289
     * Timing: 1.17 */
    input [7:0] A, B;
    output [15:0] product;

    wire [7:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7;

    and AND00(pp0[0], A[0], B[0]);
    and AND01(pp0[1], A[1], B[0]);
    and AND02(pp0[2], A[2], B[0]);
    and AND03(pp0[3], A[3], B[0]);
    and AND04(pp0[4], A[4], B[0]);
    and AND05(pp0[5], A[5], B[0]);
    and AND06(pp0[6], A[6], B[0]);
    and AND07(pp0[7], A[7], B[0]);
    and AND08(pp1[0], A[0], B[1]);
    and AND09(pp1[1], A[1], B[1]);
    and AND10(pp1[2], A[2], B[1]);
    and AND11(pp1[3], A[3], B[1]);
    and AND12(pp1[4], A[4], B[1]);
    and AND13(pp1[5], A[5], B[1]);
    and AND14(pp1[6], A[6], B[1]);
    and AND15(pp1[7], A[7], B[1]);
    and AND16(pp2[0], A[0], B[2]);
    and AND17(pp2[1], A[1], B[2]);
    and AND18(pp2[2], A[2], B[2]);
    and AND19(pp2[3], A[3], B[2]);
    and AND20(pp2[4], A[4], B[2]);
    and AND21(pp2[5], A[5], B[2]);
    and AND22(pp2[6], A[6], B[2]);
    and AND23(pp2[7], A[7], B[2]);
    and AND24(pp3[0], A[0], B[3]);
    and AND25(pp3[1], A[1], B[3]);
    and AND26(pp3[2], A[2], B[3]);
    and AND27(pp3[3], A[3], B[3]);
    and AND28(pp3[4], A[4], B[3]);
    and AND29(pp3[5], A[5], B[3]);
    and AND30(pp3[6], A[6], B[3]);
    and AND31(pp3[7], A[7], B[3]);
    and AND32(pp4[0], A[0], B[4]);
    and AND33(pp4[1], A[1], B[4]);
    and AND34(pp4[2], A[2], B[4]);
    and AND35(pp4[3], A[3], B[4]);
    and AND36(pp4[4], A[4], B[4]);
    and AND37(pp4[5], A[5], B[4]);
    and AND38(pp4[6], A[6], B[4]);
    and AND39(pp4[7], A[7], B[4]);
    and AND40(pp5[0], A[0], B[5]);
    and AND41(pp5[1], A[1], B[5]);
    and AND42(pp5[2], A[2], B[5]);
    and AND43(pp5[3], A[3], B[5]);
    and AND44(pp5[4], A[4], B[5]);
    and AND45(pp5[5], A[5], B[5]);
    and AND46(pp5[6], A[6], B[5]);
    and AND47(pp5[7], A[7], B[5]);
    and AND48(pp6[0], A[0], B[6]);
    and AND49(pp6[1], A[1], B[6]);
    and AND50(pp6[2], A[2], B[6]);
    and AND51(pp6[3], A[3], B[6]);
    and AND52(pp6[4], A[4], B[6]);
    and AND53(pp6[5], A[5], B[6]);
    and AND54(pp6[6], A[6], B[6]);
    and AND55(pp6[7], A[7], B[6]);
    and AND56(pp7[0], A[0], B[7]);
    and AND57(pp7[1], A[1], B[7]);
    and AND58(pp7[2], A[2], B[7]);
    and AND59(pp7[3], A[3], B[7]);
    and AND60(pp7[4], A[4], B[7]);
    and AND61(pp7[5], A[5], B[7]);
    and AND62(pp7[6], A[6], B[7]);
    and AND63(pp7[7], A[7], B[7]);

    assign product[0] = pp0[0];

    /* 1st CLA */
    wire [3:0] G1, P1, C1;
    assign G1[0] = pp2[4] & pp3[3];
    assign G1[1] = pp2[5] & pp3[4];
    assign G1[2] = pp2[6] & pp3[5];
    assign G1[3] = pp2[7] & pp3[6];
    assign P1[0] = pp2[4] ^ pp3[3];
    assign P1[1] = pp2[5] ^ pp3[4];
    assign P1[2] = pp2[6] ^ pp3[5];
    assign P1[3] = pp2[7] ^ pp3[6];
    assign C1[1] = G1[0];
    assign C1[2] = G1[1] | (P1[1] & C1[1]);
    assign C1[3] = G1[2] | (P1[2] & C1[2]);
    assign c1    = G1[3] | (P1[3] & C1[3]);
    assign s11   = P1[0];
    assign s12   = P1[1] ^ C1[1];
    assign s13   = P1[2] ^ C1[2];
    assign s14   = P1[3] ^ C1[3];

    /* 2nd CLA */
    wire [3:0] G2, P2, C2;
    assign G2[0] = pp4[1] & pp5[0];
    assign G2[1] = pp4[2] & pp5[1];
    assign G2[2] = pp4[3] & pp5[2];
    assign G2[3] = pp4[4] & pp5[3];
    assign P2[0] = pp4[1] ^ pp5[0];
    assign P2[1] = pp4[2] ^ pp5[1];
    assign P2[2] = pp4[3] ^ pp5[2];
    assign P2[3] = pp4[4] ^ pp5[3];
    assign C2[1] = G2[0];
    assign C2[2] = G2[1] | (P2[1] & C2[1]);
    assign C2[3] = G2[2] | (P2[2] & C2[2]);
    assign c2    = G2[3] | (P2[3] & C2[3]);
    assign s21   = P2[0];
    assign s22   = P2[1] ^ C2[1];
    assign s23   = P2[2] ^ C2[2];
    assign s24   = P2[3] ^ C2[3];

    /* 3rd CLA */
    wire [3:0] G3, P3, C3;
    assign G3[0] = pp6[1] & pp7[0];
    assign G3[1] = pp6[2] & pp7[1];
    assign G3[2] = pp6[3] & pp7[2];
    assign G3[3] = pp6[4] & pp7[3];
    assign P3[0] = pp6[1] ^ pp7[0];
    assign P3[1] = pp6[2] ^ pp7[1];
    assign P3[2] = pp6[3] ^ pp7[2];
    assign P3[3] = pp6[4] ^ pp7[3];
    assign C3[1] = G3[0];
    assign C3[2] = G3[1] | (P3[1] & C3[1]);
    assign C3[3] = G3[2] | (P3[2] & C3[2]);
    assign c3    = G3[3] | (P3[3] & C3[3]);
    assign s31   = P3[0];
    assign s32   = P3[1] ^ C3[1];
    assign s33   = P3[2] ^ C3[2];
    assign s34   = P3[3] ^ C3[3];

    /* 4th CLA */
    wire [3:0] G4, P4, C4;
    assign G4[0] = pp0[3] & pp1[2];
    assign G4[1] = pp0[4] & pp1[3];
    assign G4[2] = pp0[5] & pp1[4];
    assign G4[3] = pp0[6] & pp1[5];
    assign P4[0] = pp0[3] ^ pp1[2];
    assign P4[1] = pp0[4] ^ pp1[3];
    assign P4[2] = pp0[5] ^ pp1[4];
    assign P4[3] = pp0[6] ^ pp1[5];
    assign C4[1] = G4[0];
    assign C4[2] = G4[1] | (P4[1] & C4[1]);
    assign C4[3] = G4[2] | (P4[2] & C4[2]);
    assign c4    = G4[3] | (P4[3] & C4[3]);
    assign s41   = P4[0];
    assign s42   = P4[1] ^ C4[1];
    assign s43   = P4[2] ^ C4[2];
    assign s44   = P4[3] ^ C4[3];

    /* 5th CLA */
    wire [3:0] G5, P5, C5;
    assign G5[0] = pp0[7] & pp1[6];
    assign G5[1] = pp1[7] & s13;
    assign G5[2] = pp4[5] & pp5[4];
    assign G5[3] = pp3[7] & pp4[6];
    assign P5[0] = pp0[7] ^ pp1[6];
    assign P5[1] = pp1[7] ^ s13;
    assign P5[2] = pp4[5] ^ pp5[4];
    assign P5[3] = pp3[7] ^ pp4[6];
    assign C5[0] = s31;
    assign C5[1] = G5[0] | (P5[0] & C5[0]);
    assign C5[2] = G5[1] | (P5[1] & C5[1]);
    assign C5[3] = G5[2] | (P5[2] & C5[2]);
    assign c5    = G5[3] | (P5[3] & C5[3]);
    assign s51   = P5[0] ^ C5[0];
    assign s52   = P5[1] ^ C5[1];
    assign s53   = P5[2] ^ C5[2];
    assign s54   = P5[3] ^ C5[3];

     /* 6th CLA */
    wire [1:0] G6, P6, C6;
    assign G6[0] = pp4[7] & pp5[6];
    assign G6[1] = pp5[7] & pp6[6];
    assign P6[0] = pp4[7] ^ pp5[6];
    assign P6[1] = pp5[7] ^ pp6[6];
    assign C6[0] = pp6[5];
    assign C6[1] = G6[0] | (P6[0] & C6[0]);
    assign c6    = G6[1] | (P6[1] & C6[1]);
    assign s61   = P6[0] ^ C6[0];
    assign s62   = P6[1] ^ C6[1];

    /* 7th CLA */
    wire [3:0] G7, P7, C7;
    assign G7[0] = pp2[2] & pp3[1];
    assign G7[1] = pp2[3] & pp3[2];
    assign G7[2] = pp6[0] & s11;
    assign G7[3] = s12    & s23;
    assign P7[0] = pp2[2] ^ pp3[1];
    assign P7[1] = pp2[3] ^ pp3[2];
    assign P7[2] = pp6[0] ^ s11;
    assign P7[3] = s12    ^ s23;
    assign C7[1] = G7[0];
    assign C7[2] = G7[1] | (P7[1] & C7[1]);
    assign C7[3] = G7[2] | (P7[2] & C7[2]);
    assign c7    = G7[3] | (P7[3] & C7[3]);
    assign s71   = P7[0];
    assign s72   = P7[1] ^ C7[1];
    assign s73   = P7[2] ^ C7[2];
    assign s74   = P7[3] ^ C7[3];

    /* 8th CLA */
    wire [3:0] G8, P8, C8;
    assign G8[0] = s24    & s32;
    assign G8[1] = s14    & c2;
    assign G8[2] = pp5[5] & c1;
    assign G8[3] = c3     & pp7[4];
    assign P8[0] = s24    ^ s32;
    assign P8[1] = s14    ^ c2;
    assign P8[2] = pp5[5] ^ c1;
    assign P8[3] = c3     ^ pp7[4];
    assign C8[1] = G8[0];
    assign C8[2] = G8[1] | (P8[1] & C8[1]);
    assign C8[3] = G8[2] | (P8[2] & C8[2]);
    assign c8    = G8[3] | (P8[3] & C8[3]);
    assign s81   = P8[0];
    assign s82   = P8[1] ^ C8[1];
    assign s83   = P8[2] ^ C8[2];
    assign s84   = P8[3] ^ C8[3];

    half_adder ha01(product[1], cA, pp0[1], pp1[0]);
    full_adder fa01(sB, cB, pp0[2],  pp1[1], pp2[0]);
    full_adder fa02(sC, cC, pp2[1],  pp3[0], s41);
    full_adder fa03(sD, cD, pp4[0],  s42, s71);
    full_adder fa04(sE, cE, s21,     s43, s72);
    full_adder fa05(sF, cF, s22,  s44, s73);
    full_adder fa06(sG, cG, c4,   s51, s74);
    full_adder fa07(sH, cH, s52,  c7, s81);
    full_adder fa08(sI, cI, s33,  s53, s82);
    
    /* CLA */
    wire [3:0] s9, in9_1, in9_2;
    wire c9;
    assign in9_1 = {s34,c5,pp7[5],pp6[7]};
    assign in9_2 = {s54,s61,s62,pp7[6]};
    lookahead_carry_adder #(4) CLA09(s9, c9, in9_1, in9_2, s83);  

    /* Final Stage */
    wire [12:0] G, P, C;
    assign G[0]  = sB     & cA;
    assign G[1]  = sC     & cB;
    assign G[2]  = sD     & cC;
    assign G[3]  = sE     & cD;
    assign G[4]  = sF     & cE;
    assign G[5]  = sG     & cF;
    assign G[6]  = sH     & cG;
    assign G[7]  = sI     & cH;
    assign G[8]  = s9[0]  & cI; 
    assign G[9]  = s9[1]  & s84;
    assign G[10] = s9[2]  & c8;
    assign G[11] = s9[3]  & c6;
    assign G[12] = pp7[7] & c9;

    assign P[0]  = sB     ^ cA;
    assign P[1]  = sC     ^ cB;
    assign P[2]  = sD     ^ cC;
    assign P[3]  = sE     ^ cD;
    assign P[4]  = sF     ^ cE;
    assign P[5]  = sG     ^ cF;
    assign P[6]  = sH     ^ cG;
    assign P[7]  = sI     ^ cH;
    assign P[8]  = s9[0]  ^ cI;
    assign P[9]  = s9[1]  ^ s84;
    assign P[10] = s9[2]  ^ c8;
    assign P[11] = s9[3]  ^ c6;
    assign P[12] = pp7[7] ^ c9;

    assign C[1]  = G[0];
    assign C[2]  = G[1]  | (P[1]  & C[1]);
    assign C[3]  = G[2]  | (P[2]  & C[2]);
    assign C[4]  = G[3]  | (P[3]  & C[3]);
    assign C[5]  = G[4]  | (P[4]  & C[4]);
    assign C[6]  = G[5]  | (P[5]  & C[5]);
    assign C[7]  = G[6]  | (P[6]  & C[6]);
    assign C[8]  = G[7]  | (P[7]  & C[7]);
    assign C[9]  = G[8]  | (P[8]  & C[8]);
    assign C[10] = G[9]  | (P[9]  & C[9]);
    assign C[11] = G[10] | (P[10] & C[10]);
    assign C[12] = G[11] | (P[11] & C[11]);
    assign product[15] = G[12] | (P[12] & C[12]);
    assign product[2]  = P[0];
    assign product[3]  = P[1]  ^ C[1];
    assign product[4]  = P[2]  ^ C[2];
    assign product[5]  = P[3]  ^ C[3];
    assign product[6]  = P[4]  ^ C[4];
    assign product[7]  = P[5]  ^ C[5];
    assign product[8]  = P[6]  ^ C[6];
    assign product[9]  = P[7]  ^ C[7];
    assign product[10] = P[8]  ^ C[8];
    assign product[11] = P[9]  ^ C[9];
    assign product[12] = P[10] ^ C[10];
    assign product[13] = P[11] ^ C[11];
    assign product[14] = P[12] ^ C[12];
endmodule
