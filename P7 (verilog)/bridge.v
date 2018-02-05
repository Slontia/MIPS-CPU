`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:17 12/17/2016 
// Design Name: 
// Module Name:    bridge 
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

module bridge(
	input [31:0]PrAddr,	//Addr from CPU
	output [31:0]PrRD,	//Data to CPU
	input [31:0]PrWD,		//Data from CPU
	
	output [3:2]DEV_Addr,//Addr to DEV
	input [31:0]DEV0_RD,	//Data from Timer0
	input [31:0]DEV1_RD,	//Data from Timer1
	output [31:0]DEV_WD,	//Data to DEV
	output DEV0_WE,		//WriteEnable to Timer0
	output DEV1_WE,		//WriteEnable to Timer1
	
	input PrWE,
	output DataOsel
    );
	 
	assign HitDEV0 = (PrAddr[31:4]==28'h0000_7F0 && PrAddr[3:2]!=3);
	assign HitDEV1 = (PrAddr[31:4]==28'h0000_7F1 && PrAddr[3:2]!=3);

	assign PrRD = HitDEV0 ? DEV0_RD :
					  HitDEV1 ? DEV1_RD :
									 32'hDEAD_BEEF;
	assign DataOsel = HitDEV0 || HitDEV1;
	assign DEV_Addr = PrAddr[3:2];
	assign DEV_WD = PrWD;
	assign DEV0_WE = HitDEV0 && PrWE;
	assign DEV1_WE = HitDEV1 && PrWE;

endmodule
