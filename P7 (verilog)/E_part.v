`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:15 11/22/2016 
// Design Name: 
// Module Name:    E_part 
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
module E_part(
	input reset,
	input clk,
	input BreakMD,
	input ReturnLOHI,
	input [31:0]Instr_E,
	input [31:0]PC8_E,
	input [31:0]DataRS_E,
	input [31:0]DataRT_E,
	input [31:0]EXT_E,
	input [2:0]RS_Eforward,//Fctr
	input [2:0]RT_Eforward,//Fctr
	input [31:0]AO_Mf,//Fdata
	input [31:0]RegDataW_W,//Fdata
	input [31:0]PC8_Mf,//Fdata
	input [31:0]PC8_Wf,//Fdata
	input [31:0]LOHI_Mf,
	output [31:0]Instr_M,
	output [31:0]PC8_M,
	output [31:0]AO_M,
	output [31:0]DataRT_M,
	output [31:0]LOHI_M,
	output Busy
    );
	 
	//Output Set
	assign Instr_M = Instr_E;
	assign PC8_M = PC8_E;
	assign AO_M = ALU_DataO;
	assign DataRT_M = DataRT_new;
	assign LOHI_M = LOHI_OUT;
	
	//Divide Instruction
	wire[5:0] Op, Func;
	assign Op = Instr_E[31:26];
	assign Func = Instr_E[5:0];
	
	
	//Create controller
	wire LOHIsel;
	wire [2:0]ALU_Bsel, ALU_Asel, ALUMDctr;
	wire [3:0]ALUctr;
	controller controller_E(
		.Op(Op),
		.Func(Func),
		.ALU_Asel(ALU_Asel),
		.ALU_Bsel(ALU_Bsel),
		.ALUctr(ALUctr),
		.LOHIsel(LOHIsel),
		.ALUMDctr(ALUMDctr)
	);
	
	
	//Forward judgement
	wire[31:0] DataRS_new, DataRT_new;
	mux_8_32 MF_RS_E(
		.Data0(DataRS_E),
		.Data1(AO_Mf),
		.Data2(RegDataW_W),
		.Data3(PC8_Mf),
		.Data4(PC8_Wf),
		.Data5(LOHI_Mf),
		.Sel(RS_Eforward),
		.DataO(DataRS_new)
	);
	mux_8_32 MF_RT_E(
		.Data0(DataRT_E),
		.Data1(AO_Mf),
		.Data2(RegDataW_W),
		.Data3(PC8_Mf),
		.Data4(PC8_Wf),
		.Data5(LOHI_Mf),
		.Sel(RT_Eforward),
		.DataO(DataRT_new)
	);
	
	
	//MUX for ALU_Data
	wire [31:0]ALU_DataA, ALU_DataB;
	
	mux_8_32 MUX_ALU_A(
		.Data0(DataRS_new),
		.Data1(EXT_E),
		.Sel(ALU_Asel),
		.DataO(ALU_DataA)
	);
	
	mux_8_32 MUX_ALU_B(
		.Data0(DataRT_new),
		.Data1(EXT_E),
		.Sel(ALU_Bsel),
		.DataO(ALU_DataB)
	);
	
	//Create ALU
	wire [31:0]ALU_DataO;
	alu _alu(
		.ALUctr(ALUctr),
		.DataA(ALU_DataA),
		.DataB(ALU_DataB),
		.DataO(ALU_DataO)		
	);
	
	//Create ALU_MUL&DIV
	wire [31:0]HI_OUT, LO_OUT;
	aluMD _aluMD (
		.reset(reset),
		.clk(clk),
		.BreakMD(BreakMD),
		.ReturnLOHI(ReturnLOHI),
		.ALUMDctr(ALUMDctr),
		.DataA(ALU_DataA),
		.DataB(ALU_DataB),
		.HI(HI_OUT),
		.LO(LO_OUT),
		.Busy(Busy)
	);
	
	//MUX for HI&LO
	wire [31:0]LOHI_OUT;
	mux_2_32 HI_LO_MUX (
		.Data0(LO_OUT),
		.Data1(HI_OUT),
		.Sel(LOHIsel),
		.DataO(LOHI_OUT)
	);


endmodule
