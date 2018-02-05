`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:00 12/19/2016 
// Design Name: 
// Module Name:    cp0 
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

`define IM 15:10
`define IE 0
`define EXL 1

`define HWInt 15:10
`define ExcCode 6:2

/*
WARNING:
1.初值问题还没有处理
*/

module cp0(
	input clk,
	input reset,
	
	//MTC0/MFC0
	input WE, // *Write Enable of CP0 (MTC0)
	input [4:0]AddrR, // *read CP0 addr (MFC0)
	input [4:0]AddrW, // *write CP0 addr (MTC0)
	input [31:0]DataI, // *Data from GPR to CP0 (MTC0)
	output [31:0]DataO, // *Data from CP0 GPR (MFC0)
	
	//EPC
	input [31:0]PC, // PC for interrupt
	output reg [31:0]EPC,
	
	//Cause
	input [6:2]ExcCode, // type of interrupt/exception
	input [5:0]HWInt, // interrupt of 6 devices
	output IntReq, // interrupt request to CPU controller
	
	//SR
	input EXTSet, // turn EXL to 1
	input EXTClr // turn EXT to 0 (ERET)
    );
	
	
	
	assign IntReq = (|(Cause[`HWInt] & SR[`IM])) && SR[`IE] && !SR[`EXL];
	
	reg[31:0] SR, Cause, PRId;
	initial begin
		SR = 32'h0000_FF11;
		Cause = 0;
		EPC = 0;
		PRId = 32'h2333_6666;
	end
	
	wire [5:0] Im;
	wire Ie, Exl;
	assign Im = SR[`IM];
	assign Ie = SR[`IE];
	assign Exl = SR[`EXL];
	
	// MFC0
	assign DataO = (AddrR==12) ? SR :
						(AddrR==13) ? Cause :
						(AddrR==14) ? EPC :
						(AddrR==15) ? PRId :
										  32'hDEAD_BEEF;
	
	always @(posedge clk) begin
		if (reset) begin
			SR <= 32'h0000_FF11;
			Cause <= 0;
			EPC = 0;
			PRId <= 32'h2333_6666;
		end else if (WE) begin // MTC0
			case (AddrW)
				12: SR <= DataI;
				14: EPC <= DataI;
			endcase
		end else begin
			if (!Exl) begin //[WARNING!] use IntReq may cause 1-term delay!
				Cause[`HWInt] <= HWInt;
				Cause[`ExcCode] <= ExcCode;
				EPC <= PC;
			end
			if (EXTSet) begin
				SR[`EXL] <= 1'b1;
			end else if (EXTClr) begin
				SR[`EXL] <= 1'b0;
			end
		end
	end
endmodule
