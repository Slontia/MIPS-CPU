`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:21 11/26/2016 
// Design Name: 
// Module Name:    cmp 
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
module cmp(
	input [31:0]DataA,
	input [31:0]DataB,
	input [4:0]CMPrst
    );
	 
	assign CMPrst[0] = (DataA == DataB);// ==
	assign CMPrst[1] = (DataA[31] == 0);//>=0
	assign CMPrst[2] = (DataA == 0);// ==0



endmodule
