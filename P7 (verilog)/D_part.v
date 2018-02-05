`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:09:23 11/21/2016 
// Design Name: 
// Module Name:    D_part 
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
module D_part(
	input clk,
	input reset,
	input [31:0]Instr_D,
	input [31:0]PC4_D,
	input [4:0]RW_W,//W_part
	input [31:0]DataW_W,//W_part
	input [2:0]RS_Dforward,//Fctr
	input [2:0]RT_Dforward,//Fctr
	input [31:0]AO_M,//Fdata
	input [31:0]PC8_Ef,//Fdata
	input [31:0]PC8_Mf,//Fdata
	input [31:0]LOHI_Mf,
	input RegWrite,
	output [31:0]Instr_E,
	output [31:0]PC8_E,
	output [31:0]DataRS_E,
	output [31:0]DataRT_E,
	output [31:0]EXT_E,
	output [31:0]NPC_back_F,
	output [31:0]DataRS_back_F,
	output [2:0]NPCsel_back_F,
	output ERET_Clr_D
	//output [2:0]ALUMDctr_toE
    );
	
	//Output Set
	assign Instr_E = Instr_D;
	assign PC8_E = PC4_D + 4;
	assign DataRS_E = DataA;
	assign DataRT_E = DataB;
	assign EXT_E = Imm32;
	assign NPC_back_F = NPC;
	assign DataRS_back_F = CMP_DataA;
	assign NPCsel_back_F = NPCsel;
	//assign ALUMDctr_toE = ALUMDctr;
	
	//Create Controller
	wire[2:0] ExtOp, NPCsel, NPCctr, ExtSel;
	controller controller_D(
		.Op(Op),
		.Func(Func),
		.Rt(Rt),
		.ExtSel(ExtSel),
		.ExtOp(ExtOp),
		.NPCsel(NPCsel),
		.NPCctr(NPCctr),
		.ERET_Clr_D(ERET_Clr_D)
	);
	
	//Devide Instruction
	wire[5:0] Op, Func;
	wire[4:0] Rs, Rt, Rd, S;
	wire[15:0] Imm16;
	wire[25:0] Imm26;
	assign Op = Instr_D[31:26];
	assign Rs = Instr_D[25:21];
	assign Rt = Instr_D[20:16];
	assign Rd = Instr_D[15:11];
	assign S = Instr_D[10:6];
	assign Func = Instr_D[5:0];
	assign Imm16 = Instr_D[15:0];
	assign Imm26 = Instr_D[25:0];
	
	
	//Create GRF
	wire [31:0]DataA, DataB;
	grf _grf (
		.clk(clk),
		.reset(reset),
		.RegWrite(RegWrite),
		.RA(Rs),
		.RB(Rt),
		.RW(RW_W),//W_pert
		.DataW(DataW_W),//W_part
		.DataA(DataA),
		.DataB(DataB)
	);
	
	//Create EXT
	wire [31:0] Ex32_Imm16, Ex32_S, Imm32;
	assign Ex32_S = {27'b0, S};
	ext _ext(
		.Imm16(Imm16),
		.ExtOp(ExtOp),
		.Imm32(Ex32_Imm16)
	);
	mux_8_32 MUX_EXT(
		.Data0(Ex32_Imm16),
		.Data1(Ex32_S),
		.Sel(ExtSel),
		.DataO(Imm32)
	);
	
	//Create CMP
	wire[4:0] CMPrst;
	wire[31:0] CMP_DataA, CMP_DataB;
	mux_8_32 MF_RS_D(
		.Data0(DataA),
		.Data1(AO_M),
		.Data2(PC8_Ef),
		.Data3(PC8_Mf),
		.Data4(LOHI_Mf),
		.Sel(RS_Dforward),
		.DataO(CMP_DataA)
	);
	mux_8_32 MF_RT_D(
		.Data0(DataB),
		.Data1(AO_M),
		.Data2(PC8_Ef),
		.Data3(PC8_Mf),
		.Data4(LOHI_Mf),
		.Sel(RT_Dforward),
		.DataO(CMP_DataB)
	);
	
	cmp _cmp (
		.DataA(CMP_DataA),
		.DataB(CMP_DataB),
		.CMPrst(CMPrst)
	);
	
	
	//Create NPC
	wire[31:0] NPC;
	npc _npc(
		.NPCctr(NPCctr),
		.PC4(PC4_D),
		.Imm26(Imm26),
		.CMPrst(CMPrst),
		.NPC(NPC)
	);


endmodule
