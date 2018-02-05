`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:31 11/21/2016 
// Design Name: 
// Module Name:    grf 
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
module grf(
	input clk,
	input reset,
	input RegWrite,
	input [4:0]RA,
	input [4:0]RB,
	input [4:0]RW,
	input [31:0]DataW,
	output [31:0]DataA,
	output [31:0]DataB
    );

	reg[31:0] Rgst[31:1];
	integer i;
	
	initial begin
		for(i=1; i<32; i=i+1) begin
			Rgst[i] = (i==28) ? 32'h0000_1800 :
						 (i==29) ? 32'h0000_2ffc :
										0 ;
		end
	end
	
	assign DataA = (RA == 0) ? 0 :
						((RA == RW) && RegWrite) ? DataW :
						Rgst[RA] ;
	assign DataB = (RB == 0) ? 0 :
						((RB == RW) && RegWrite) ? DataW :
						Rgst[RB] ;		
	
	always @(posedge clk) begin
		if (reset) begin
			for(i=1; i<32; i=i+1) Rgst[i] <= (i==28) ? 32'h0000_1800 :
														(i==29) ? 32'h0000_2ffc :
														0 ;
		end else if (clk && RegWrite) begin
			if(RW > 0) begin
				Rgst[RW] <= DataW;
				$display("$%d <= %h",RW,DataW);
			end //else begin
				//$display("$ 0 <= 00000000");
			//end
		end
	end

endmodule
