`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:57 11/22/2016 
// Design Name: 
// Module Name:    instr_type 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instr_type(
	input [31:0]Instr,
	output Cal_r,
	output Cal_i,
	output B,
	output Jr,
	output Load,
	output Store,
	output Jal,
	output Jal_nRa,
	output MfLOHI,
	output MtLOHI,
	output MulDivCal,
	output MulDiv,
	output JumpOrBranch,
	output MFC0,
	output MTC0,
	output ERET
    );
	 
	wire[5:0] Op, Func;
	wire[4:0] Rs;
	assign Op = Instr[31:26];
	assign Func = Instr[5:0];
	assign Rs = Instr[25:21];
	 
	//<=P5.3
	wire Rtype, addu, subu, ori, lui, lw, sw, beq, j, jal, jr;
	wire bgez_bltz, bgtz, blez, addi;
	wire and_, or_, xor_, add, sub, sll, srl, addiu, bne;

	assign ori  = (Op == 6'b001101);
	assign lui  = (Op == 6'b001111);
	assign addi = (Op == 6'b001000);
	assign lw   = (Op == 6'b100011);
	assign sw   = (Op == 6'b101011);
	assign beq  = (Op == 6'b000100);
	assign j    = (Op == 6'b000010);
	assign jal  = (Op == 6'b000011);
	assign bgez_bltz = (Op == 6'b000001);
	assign bgtz = (Op == 6'b000111);
	assign blez = (Op == 6'b000110);
	assign addiu= (Op == 6'b001001);
	assign bne  = (Op == 6'b000101);
	
	assign Rtype = (Op == 6'b000000);
	assign addu = Rtype && (Func == 6'b100001);
	assign subu = Rtype && (Func == 6'b100011);
	assign jr   = Rtype && (Func == 6'b001000);
	assign and_ = Rtype && (Func == 6'b100100);
	assign or_  = Rtype && (Func == 6'b100101);
	assign xor_ = Rtype && (Func == 6'b100110);
	assign add  = Rtype && (Func == 6'b100000);
	assign sub  = Rtype && (Func == 6'b100010);
	assign sll  = Rtype && (Func == 6'b000000);
	assign srl  = Rtype && (Func == 6'b000010);
	
	//P6(1)
	wire sltu, slt, nor_, sltiu, slti, xori, andi;
	assign sltu  = Rtype && (Func == 6'b101011);
	assign slt   = Rtype && (Func == 6'b101010);
	assign nor_  = Rtype && (Func == 6'b100111);
	assign sltiu = (Op == 6'b001011);
	assign slti  = (Op == 6'b001010);
	assign xori  = (Op == 6'b001110);
	assign andi  = (Op == 6'b001100);
	
	//P6(2)
	wire sra, sllv, srlv, srav;
	assign sra   = Rtype && (Func == 6'b000011);
	assign sllv  = Rtype && (Func == 6'b000100);
	assign srlv  = Rtype && (Func == 6'b000110);
	assign srav  = Rtype && (Func == 6'b000111);	
	
	//P6(3)
	wire jalr;
	assign jalr  = Rtype && (Func == 6'b001001); 
	
	//P6(4)
	wire sh, sb, lh, lhu, lb, lbu;
	assign sh  = (Op == 6'b101001);
	assign sb  = (Op == 6'b101000);
	assign lh  = (Op == 6'b100001);
	assign lhu = (Op == 6'b100101);
	assign lb  = (Op == 6'b100000);
	assign lbu = (Op == 6'b100100);
	
	//P6(5)
	wire mult, multu, div, divu, mtlo, mthi, mflo, mfhi;
	assign mult  = Rtype && (Func == 6'b011000);
	assign multu = Rtype && (Func == 6'b011001);
	assign div   = Rtype && (Func == 6'b011010);
	assign divu  = Rtype && (Func == 6'b011011);
	assign mtlo  = Rtype && (Func == 6'b010011);
	assign mthi  = Rtype && (Func == 6'b010001);
	assign mflo  = Rtype && (Func == 6'b010010);
	assign mfhi  = Rtype && (Func == 6'b010000);

	//P7
	wire mfc0, mtc0, eret;
	assign mtc0 = (Op == 6'b010000) && (Rs == 5'b00100);
	assign mfc0 = (Op == 6'b010000) && (Rs == 5'b00000);
	assign eret = (Op == 6'b010000) && (Func == 6'b011000);

	
	//Type Set
	assign Cal_r = addu + subu + and_ + or_ + xor_ + add + sub + sll + srl + sltu + slt + nor_ + sra + sllv + srlv + srav + mult + multu + div + divu;
	assign Cal_i = ori + lui + addi + addiu + sltiu + slti + xori + andi + mthi + mtlo;
	assign B = beq + bgez_bltz + bgtz + blez + bne;
	assign Load = lw + lh + lhu + lb + lbu;
	assign Store = sw + sh + sb;
	assign Jr = jr + jalr;
	assign Jal = jal;
	assign Jal_nRa = jalr;
	assign MfLOHI = mflo + mfhi;
	assign MtLOHI = mtlo + mthi;
	assign MulDivCal = mult + multu + div + divu ;
	assign MulDiv = mult + multu + div + divu + mtlo + mthi + mflo + mfhi;
	assign JumpOrBranch = B || Jr || Jal || Jal_nRa;
	assign MFC0 = mfc0;
	assign MTC0 = mtc0;
	assign ERET = eret;

endmodule
