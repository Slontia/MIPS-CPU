`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:25:46 11/22/2016 
// Design Name: 
// Module Name:    M_part 
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
module M_part(
	input clk,
	input reset,
	input [31:0]Instr_M,
	input [31:0]PC8_M,
	input [31:0]AO_M,
	input [31:0]DataRT_M,
	input [31:0]LOHI_M,
	input [2:0]RT_Mforward,//Fctr
	input [31:0]RegDataW_W,//Fdata
	input [31:0]PC8_Wf,//Fdata
	input [31:0]PrRD,//Data from bridge
	input DataOsel,//bridge or dm?(1 is bridge)
	output [31:0]Instr_W,
	output [31:0]PC8_W,
	output [31:0]AO_W,
	output [31:0]DM_W,
	output [31:0]LOHI_W,
	output CP0Write,//cp0
	output [31:0]CP0DataW,//cp0
	output IntEnable,//cp0
	output PrWE//Bridge
    );
	 
	//Output Set
	assign Instr_W = Instr_M;
	assign PC8_W = PC8_M;
	assign AO_W = AO_M;
	assign LOHI_W = LOHI_M;
	assign CP0DataW = DM_DataW;
	assign PrWE = MemWrite;
	
	
	//Divide Instruction
	wire[5:0] Op, Func;
	wire[4:0] Rs;
	assign Op = Instr_M[31:26];
	assign Func = Instr_M[5:0];
	assign Rs = Instr_M[25:21];
	
	
	//Create Controller
	wire MemWrite;
	wire[2:0] StoreType;
	controller controller_M (
		.Op(Op),
		.Func(Func),
		.Rs(Rs),
		.MemWrite(MemWrite),
		.StoreType(StoreType),
		.CP0Write(CP0Write),
		.IntEnable(IntEnable)
	);
	
	
	//Forward judgement
	wire[31:0] DM_DataW;
	mux_8_32 MF_RT_M (
		.Data0(DataRT_M),
		.Data1(RegDataW_W),
		.Data2(PC8_Wf),
		.Sel(RT_Mforward),
		.DataO(DM_DataW)
	);
	
	
	//Create DM
	wire[31:0] DM_DataO;
	dm _dm (
		.clk(clk),
		.reset(reset),
		.MemWrite(MemWrite && !DataOsel),
		.StoreType(StoreType),
		.Addr(AO_M),
		.DataW(DM_DataW),
		.DataR(DM_DataO)
	);
	
	//Sel bridge&dm
	
	mux_2_32 DM_Bridge_sel (
		.Data0(DM_DataO),
		.Data1(PrRD),
		.Sel(DataOsel),
		.DataO(DM_W)
	);
	
	


endmodule
