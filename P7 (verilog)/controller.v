`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:59 11/21/2016 
// Design Name: 
// Module Name:    controller 
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

//Put define together in case of crashing
/*
//RegDst
`define rt 0
`define rd 1
`define ra 2
//DataToReg
`define ALU 0
`define Mem 1
`define PC+8 2
//ExtOp
`define high_zero 0
`define high_sign 1
`define low_zero 2
//ALUsrc
`define DataB 0
`define imm32 1
//ALUctr
`define Add 0
`define Sub 1
`define Or 2
//NPCctr
`define B 0
`define J 1
//NPCsel
`define PC+4 0
`define NPC 1
*/

module controller(
	input [5:0]Op,
	input [5:0]Func,
	input [4:0]Rs,
	input [4:0]Rt,
	output RegWrite,
	output [2:0]RegDst,
	output [2:0]DataToReg,
	output [2:0]ExtSel,
	output [2:0]ExtOp,
	output [2:0]ALU_Asel,
	output [2:0]ALU_Bsel,
	output [3:0]ALUctr,
	output [2:0]ALUMDctr,
	output LOHIsel,
	output MemWrite,
	output [2:0]StoreType,
	output [2:0]LoadType,
	output IntEnable,
	output [2:0]NPCctr,
	output [2:0]NPCsel,
	output CP0Write,
	output ERET_Clr_D
    );
	 
	wire Rtype, addu, subu, ori, lui, lw, sw, beq, j, jal, jr;
	wire bgez, bltz, bgtz, blez, addi;
	wire and_, or_, xor_, add, sub, sll, srl, addiu, bne;
	
	//Type set
	assign ori  = (Op == 6'b001101);
	assign lui  = (Op == 6'b001111);
	assign addi = (Op == 6'b001000);
	assign lw   = (Op == 6'b100011);
	assign sw   = (Op == 6'b101011);
	assign beq  = (Op == 6'b000100);
	assign j    = (Op == 6'b000010);
	assign jal  = (Op == 6'b000011);
	assign bgez = (Op == 6'b000001) & (Rt == 5'b00001);
	assign bgtz = (Op == 6'b000111);
	assign blez = (Op == 6'b000110);
	assign bltz = (Op == 6'b000001) & (Rt == 5'b00000);
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
	
	//Instruction for controlling set
	assign RegWrite = mfc0 + addu + subu + ori + lui + lw + jal + addi + and_ + or_ + xor_ + add + sub + sll + srl + addiu + sltu + slt + nor_ + sltiu + slti + xori + andi + sra + sllv + srlv + srav + jalr + lh + lhu + lb + lbu + mflo + mfhi;
	assign RegDst = /*rd*/1 * (addu + subu + and_ + or_ + xor_ + add + sub + sll + srl + sltu + slt + nor_ + sra + sllv + srlv + srav + jalr + mflo + mfhi) + 
						 /*ra*/2 * jal;
	assign DataToReg = /*Mem*/1 * (lw + lh + lhu + lb + lbu) +
							 /*PC+8*/2 * (jal + jalr) +
							 /*LOHI*/3 * (mflo + mfhi) +
							 /*CP0*/4 * mfc0 ;
	assign ExtSel = /*S*/1 * (sll + srl + sra);
	assign ExtOp = /*high_sign*/1 * (lw + sw + addi + addiu + sltiu + slti + sh + sb + lh + lhu + lb + lbu) + 
						/*low_zero*/2 * lui;
	assign ALU_Asel = /*imm32*/1 * (sll + srl + sra);
	assign ALU_Bsel = /*imm32*/1 * (ori + lui + lw + sw + addi + addiu + sltiu + slti + xori + andi + sh + sb + lh + lhu + lb + lbu);
	assign ALUctr = /*sub*/1 * (subu + sub) + 
						 /*or*/2 * (ori + lui + or_) +
						 /*sll*/3 * (sll + sllv) +
						 /*srl*/4 * (srl + srlv) +
						 /*and*/5 * (and_ + andi) +
						 /*xor*/6 * (xor_ + xori) +
						 /*nor*/7 * (nor_) +
						 /*slt*/8 * (slt + slti) +
						 /*sltu*/9 * (sltu + sltiu) +
						 /*sra*/10 * (sra + srav) ;
	assign ALUMDctr = 1 * mult +
							2 * multu +
							3 * div +
							4 * divu +
							5 * mtlo +
							6 * mthi ;
	assign LOHIsel = mfhi;
	assign MemWrite = sw + sh + sb;
	assign StoreType = /*half*/1 * (sh) +
							 /*byte*/2 * (sb) ;
	assign LoadType = /*half_unsigned*/1 * (lhu) +
							/*half_signed*/2 * (lh) +
							/*byte_unsigned*/3 * (lbu) +
							/*byte_signed*/4 * (lb) ;
	assign NPCctr = /*J*/1 * (j + jal) +
						 /*bgez*/2 * bgez +
						 /*bgtz*/3 * bgtz +
						 /*blez*/4 * blez +
						 /*bltz*/5 * bltz +
						 /*bne*/6 * bne ;
	assign IntEnable = eret ;
	assign ERET_Clr_D = eret;
	assign NPCsel = /*NPC*/1 * (beq + j + jal + bgez + bgtz + blez + bltz + bne) +
	                /*DataRS*/2 * (jr + jalr) +
						 /*3 is interruption entrance*/
						 /*EPC*/4 * (eret);
	assign CP0Write = mtc0;
	

endmodule

