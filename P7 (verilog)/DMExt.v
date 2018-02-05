`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:58 12/08/2016 
// Design Name: 
// Module Name:    DMExt 
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
module DMExt(
	input [31:0]DataW,
	input [1:0]Addr,
	input [2:0]LoadType,
	output [31:0]ExtDataW
    );
	 
	assign ExtDataW =          /*word*/(LoadType == 0) ? DataW :
							/*half_unsigned*/(LoadType == 1) ? 
														~Addr[1] ? {16'b0, DataW[15:0]} :
														           {16'b0, DataW[31:16]} :
							  /*half_signed*/(LoadType == 2) ? 
														~Addr[1] ? {{16{DataW[15]}}, DataW[15:0]} :
														           {{16{DataW[31]}}, DataW[31:16]} :
							/*byte_unsigned*/(LoadType == 3) ? 
														(Addr==0) ? {24'b0, DataW[7:0]} :
														(Addr==1) ? {24'b0, DataW[15:8]} :	
														(Addr==2) ? {24'b0, DataW[23:16]} :
														            {24'b0, DataW[31:24]} :
							  /*byte_signed*/(LoadType == 4) ? 
														(Addr==0) ? {{24{DataW[7]}}, DataW[7:0]} :
														(Addr==1) ? {{24{DataW[15]}}, DataW[15:8]} :	
														(Addr==2) ? {{24{DataW[23]}}, DataW[23:16]} :
														            {{24{DataW[31]}}, DataW[31:24]} :
													32'hEEEE_EEEE; // ERROR
							  


endmodule
