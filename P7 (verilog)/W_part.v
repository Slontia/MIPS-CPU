`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:41 11/22/2016 
// Design Name: 
// Module Name:    W_part 
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
module W_part(
	input [31:0]Instr_W,
	input [31:0]PC8_W,
	input [31:0]AO_W,
	input [31:0]DM_W,
	input [31:0]LOHI_W,
	input [31:0]CP0DataO_W,
	output [4:0]RW_back_D,
	output [31:0]DataW_back_D,
	output RegWrite_back_D
    );
	 
	
	//Output Set
	assign RW_back_D = Reg_RW;
	assign DataW_back_D = Reg_DataW;
	assign RegWrite_back_D = RegWrite;
	
	
	//Divide Instruction
	wire[5:0] Op, Func;
	wire[4:0] Rs, Rt, Rd;
	assign Op = Instr_W[31:26];
	assign Func = Instr_W[5:0];
	assign Rs = Instr_W[25:21];
	assign Rt = Instr_W[20:16];
	assign Rd = Instr_W[15:11];
	parameter Ra = 5'd31;
	
	
	//Create Controller
	wire RegWrite;
	wire[2:0] RegDst, DataToReg, LoadType;
	controller controller_W(
		.Op(Op),
		.Func(Func),
		.Rs(Rs),
		.RegDst(RegDst),
		.DataToReg(DataToReg),
		.RegWrite(RegWrite),
		.LoadType(LoadType)
	);
	
	
	//create DMExt
	wire[31:0] ExtDM;
	DMExt _DMExt (
		.DataW(DM_W),
		.Addr(AO_W[1:0]),
		.LoadType(LoadType),
		.ExtDataW(ExtDM)
	);
	
	//MUX for RW
	wire[4:0] Reg_RW;
	mux_8_5 MUX_RW(
		.Data0(Rt),
		.Data1(Rd),
		.Data2(Ra),
		.Sel(RegDst),
		.DataO(Reg_RW)
	);
	
	
	//MUX for DataW
	wire[31:0] Reg_DataW;
	mux_8_32 MUX_DataW(
		.Data0(AO_W),
		.Data1(ExtDM),
		.Data2(PC8_W),
		.Data3(LOHI_W),
		.Data4(CP0DataO_W),
		.Sel(DataToReg),
		.DataO(Reg_DataW)
	);

endmodule
