`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:25:59 11/22/2016 
// Design Name: 
// Module Name:    dm 
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
`define TargetWord memory[Addr[11:2]]

module dm(
	input clk,
	input reset,
	input MemWrite,
	input [2:0]StoreType,
	input [31:0]Addr,
	input [31:0]DataW,
	output [31:0]DataR
    );

	reg [31:0]memory[2047:0];
	integer i;
	
	initial begin
		for (i=0; i<2048; i=i+1) memory[i] = 0;
	end
	
	assign DataR = `TargetWord;
	
	
	
	always @(posedge clk) begin
		if (reset) begin
			for (i=0; i<2048; i=i+1) memory[i] <= 0;
		end else if (clk && MemWrite) begin
			case (StoreType)
			
				/*word*/0: begin
					`TargetWord <= DataW;
					$display("*%h <= %h",Addr,DataW);			
				end
				
				/*half*/1: begin
					case (Addr[1])
						0: `TargetWord[15:0]  <= DataW[15:0];
						1: `TargetWord[31:16] <= DataW[15:0];
					endcase
					$display("*%h <= %h",Addr,DataW[15:0]);	
				end
				
				/*word*/2: begin
					case (Addr[1:0])
						0:	`TargetWord[7:0]  <= DataW[7:0];
						1: `TargetWord[15:8]  <= DataW[7:0];
						2: `TargetWord[23:16]  <= DataW[7:0];
						3: `TargetWord[31:24]  <= DataW[7:0];
					endcase
					$display("*%h <= %h",Addr,DataW[7:0]);
				end
				
			endcase
		end
	end

endmodule