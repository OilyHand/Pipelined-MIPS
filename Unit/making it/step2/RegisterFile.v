`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////
// Module Name: RegisterFile
// Description: 
//
// Ports: 
//   - RD1, RD2: Read Data 1, Read Data 2
//   - RR!, RR2: Read Register 1, Read Register 2
//   - WR: Write Register
//   - WD: Write Data
//   - WriteReg: WriteReg control signal
//   - clk: clock
///////////////////////////////////////////////////////////////////////////////

module RegisterFile(RD1, RD2, zero, at, v0, v1, a0, a1, a2, a3, t0, t1, t2, t3, t4, t5, t6, t7,
                    s0, s1, s2, s3, s4, s5, s6, s7, t8, t9, k0, k1, gp, sp, fp, ra,
                    RR1, RR2, WR, WD, WriteReg, clk, rst);
                    
    output [31:0] RD1, RD2, zero, at, v0, v1, a0, a1, a2, a3, t0, t1, t2, t3, t4, t5, t6, t7,
                  s0, s1, s2, s3, s4, s5, s6, s7, t8, t9, k0, k1, gp, sp, fp, ra;
    input [4:0] RR1, RR2, WR; 
    input [31:0] WD;
    input clk, rst, WriteReg; // control signal
    
    wire [31:0] WSel;
    wire [31:0] Q [31:0];
    
    Decoder_5to32   U0 (.Y(WSel), .X(WR), .En(WriteReg));
           Mux_32   U1 (.Y(RD1), .Sel(RR1), 
                        .X0(Q[0]),   .X1(Q[1]),   .X2(Q[2]),   .X3(Q[3]), 
                        .X4(Q[4]),   .X5(Q[5]),   .X6(Q[6]),   .X7(Q[7]),
                        .X8(Q[8]),   .X9(Q[9]),   .X10(Q[10]), .X11(Q[11]), 
                        .X12(Q[12]), .X13(Q[13]), .X14(Q[14]), .X15(Q[15]), 
                        .X16(Q[16]), .X17(Q[17]), .X18(Q[18]), .X19(Q[19]), 
                        .X20(Q[20]), .X21(Q[21]), .X22(Q[22]), .X23(Q[23]),
                        .X24(Q[24]), .X25(Q[25]), .X26(Q[26]), .X27(Q[27]), 
                        .X28(Q[28]), .X29(Q[29]), .X30(Q[30]), .X31(Q[31])
                       );
                        
           Mux_32   U2 (.Y(RD2), .Sel(RR2),
                        .X0(Q[0]),   .X1(Q[1]),   .X2(Q[2]),   .X3(Q[3]),
                        .X4(Q[4]),   .X5(Q[5]),   .X6(Q[6]),   .X7(Q[7]),
                        .X8(Q[8]),   .X9(Q[9]),   .X10(Q[10]), .X11(Q[11]),
                        .X12(Q[12]), .X13(Q[13]), .X14(Q[14]), .X15(Q[15]), 
                        .X16(Q[16]), .X17(Q[17]), .X18(Q[18]), .X19(Q[19]),
                        .X20(Q[20]), .X21(Q[21]), .X22(Q[22]), .X23(Q[23]),
                        .X24(Q[24]), .X25(Q[25]), .X26(Q[26]), .X27(Q[27]),
                        .X28(Q[28]), .X29(Q[29]), .X30(Q[30]), .X31(Q[31])
                       );
    
    dff Reg0  (.Q(Q[0]),  .D(WD),  .En(WSel[0]), .clk(clk), .rst(rst));
    dff Reg1  (.Q(Q[1]),  .D(WD),  .En(WSel[1]), .clk(clk), .rst(rst));
    dff Reg2  (.Q(Q[2]),  .D(WD),  .En(WSel[2]), .clk(clk), .rst(rst));
    dff Reg3  (.Q(Q[3]),  .D(WD),  .En(WSel[3]), .clk(clk), .rst(rst));
    dff Reg4  (.Q(Q[4]),  .D(WD),  .En(WSel[4]), .clk(clk), .rst(rst));
    dff Reg5  (.Q(Q[5]),  .D(WD),  .En(WSel[5]), .clk(clk), .rst(rst));
    dff Reg6  (.Q(Q[6]),  .D(WD),  .En(WSel[6]), .clk(clk), .rst(rst));
    dff Reg7  (.Q(Q[7]),  .D(WD),  .En(WSel[7]), .clk(clk), .rst(rst));
    dff Reg8  (.Q(Q[8]),  .D(WD),  .En(WSel[8]), .clk(clk), .rst(rst));
    dff Reg9  (.Q(Q[9]),  .D(WD),  .En(WSel[9]), .clk(clk), .rst(rst));
    dff Reg10 (.Q(Q[10]), .D(WD),  .En(WSel[10]), .clk(clk), .rst(rst));
    dff Reg11 (.Q(Q[11]), .D(WD),  .En(WSel[11]), .clk(clk), .rst(rst));
    dff Reg12 (.Q(Q[12]), .D(WD),  .En(WSel[12]), .clk(clk), .rst(rst));
    dff Reg13 (.Q(Q[13]), .D(WD),  .En(WSel[13]), .clk(clk), .rst(rst));
    dff Reg14 (.Q(Q[14]), .D(WD),  .En(WSel[14]), .clk(clk), .rst(rst));
    dff Reg15 (.Q(Q[15]), .D(WD),  .En(WSel[15]), .clk(clk), .rst(rst));
    dff Reg16 (.Q(Q[16]), .D(WD),  .En(WSel[16]), .clk(clk), .rst(rst));
    dff Reg17 (.Q(Q[17]), .D(WD),  .En(WSel[17]), .clk(clk), .rst(rst));
    dff Reg18 (.Q(Q[18]), .D(WD),  .En(WSel[18]), .clk(clk), .rst(rst));
    dff Reg19 (.Q(Q[19]), .D(WD),  .En(WSel[19]), .clk(clk), .rst(rst));
    dff Reg20 (.Q(Q[20]), .D(WD),  .En(WSel[20]), .clk(clk), .rst(rst));
    dff Reg21 (.Q(Q[21]), .D(WD),  .En(WSel[21]), .clk(clk), .rst(rst));
    dff Reg22 (.Q(Q[22]), .D(WD),  .En(WSel[22]), .clk(clk), .rst(rst));
    dff Reg23 (.Q(Q[23]), .D(WD),  .En(WSel[23]), .clk(clk), .rst(rst));
    dff Reg24 (.Q(Q[24]), .D(WD),  .En(WSel[24]), .clk(clk), .rst(rst));
    dff Reg25 (.Q(Q[25]), .D(WD),  .En(WSel[25]), .clk(clk), .rst(rst));
    dff Reg26 (.Q(Q[26]), .D(WD),  .En(WSel[26]), .clk(clk), .rst(rst));
    dff Reg27 (.Q(Q[27]), .D(WD),  .En(WSel[27]), .clk(clk), .rst(rst));
    dff Reg28 (.Q(Q[28]), .D(WD),  .En(WSel[28]), .clk(clk), .rst(rst));
    dff Reg29 (.Q(Q[29]), .D(WD),  .En(WSel[29]), .clk(clk), .rst(rst));
    dff Reg30 (.Q(Q[30]), .D(WD),  .En(WSel[30]), .clk(clk), .rst(rst));
    dff Reg31 (.Q(Q[31]), .D(WD),  .En(WSel[31]), .clk(clk), .rst(rst));
    
    assign zero = Q[0];
    assign at = Q[1];
    assign v0 = Q[2];
    assign v1 = Q[3];
    assign a0 = Q[4];
    assign a1 = Q[5];
    assign a2 = Q[6];
    assign a3 = Q[7];
    assign t0 = Q[8];
    assign t1 = Q[9];
    assign t2 = Q[10];
    assign t3 = Q[11];
    assign t4 = Q[12];
    assign t5 = Q[13];
    assign t6 = Q[14];
    assign t7 = Q[15];
    assign s0 = Q[16];
    assign s1 = Q[17];
    assign s2 = Q[18];
    assign s3 = Q[19];
    assign s4 = Q[20];
    assign s5 = Q[21];
    assign s6 = Q[22];
    assign s7 = Q[23];
    assign t8 = Q[24];
    assign t9 = Q[25];
    assign k0 = Q[26];
    assign k1 = Q[27];
    assign gp = Q[28];
    assign sp = Q[29];
    assign fp = Q[30];
    assign ra = Q[31];    
       
endmodule
