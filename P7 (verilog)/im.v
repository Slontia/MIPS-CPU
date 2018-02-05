`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:15 11/22/2016 
// Design Name: 
// Module Name:    im 
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
module im(
	input [31:0]Addr,
	output [31:0]Instr
    );
	 
	reg [31:0]code[3072:2047+3072];
	
	initial begin
		$readmemh ("code.txt",code,3072);
		$readmemh ("interrupt.txt",code,4192);
	end
	
	assign Instr = code[Addr[31:2]];

endmodule