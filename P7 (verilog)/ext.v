`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:53 11/21/2016 
// Design Name: 
// Module Name:    ext 
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
module ext(
	input [15:0]Imm16,
	input [2:0]ExtOp,
	output [31:0]Imm32
    );
	 
	assign Imm32 = /*high_zero*/(ExtOp == 0) * {16'b0, Imm16[15:0]} + 
	               /*hign_sign*/(ExtOp == 1) * {{16{Imm16[15]}}, Imm16[15:0]} +
						/*low_zero*/(ExtOp == 2) * {Imm16[15:0], 16'b0};
endmodule