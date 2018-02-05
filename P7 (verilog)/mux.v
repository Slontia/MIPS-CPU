`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:49:55 11/21/2016 
// Design Name: 
// Module Name:    mux 
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
module mux_8_32(
	input [31:0]Data0,
	input [31:0]Data1,
	input [31:0]Data2,
	input [31:0]Data3,
	input [31:0]Data4,
	input [31:0]Data5,
	input [31:0]Data6,
	input [31:0]Data7,
	input [2:0]Sel,
	output [31:0]DataO
    );
	 
	assign DataO = (Sel == 0) ? Data0 :
						(Sel == 1) ? Data1 :
						(Sel == 2) ? Data2 :
						(Sel == 3) ? Data3 :
						(Sel == 4) ? Data4 :
						(Sel == 5) ? Data5 :
						(Sel == 6) ? Data6 :
										 Data7 ;																				 
endmodule


module mux_2_32(
	input [31:0]Data0,
	input [31:0]Data1,
	input Sel,
	output [31:0]DataO
    );
	 
	assign DataO = (Sel == 0) ? Data0 : Data1 ;
																			 
endmodule


module mux_8_5(
	input [4:0]Data0,
	input [4:0]Data1,
	input [4:0]Data2,
	input [4:0]Data3,
	input [4:0]Data4,
	input [4:0]Data5,
	input [4:0]Data6,
	input [4:0]Data7,
	input [2:0]Sel,
	output [4:0]DataO
    );
	 
	assign DataO = (Sel == 0) ? Data0 :
						(Sel == 1) ? Data1 :
						(Sel == 2) ? Data2 :
						(Sel == 3) ? Data3 :
						(Sel == 4) ? Data4 :
						(Sel == 5) ? Data5 :
						(Sel == 6) ? Data6 :
										 Data7 ;
endmodule








