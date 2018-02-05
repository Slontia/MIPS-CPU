`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:50 12/17/2016 
// Design Name: 
// Module Name:    timer 
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
`define im 3
`define mode 2:1
`define enable 0

module timer(
	input clk,
	input reset,
	input [3:2]Addr, // Which register to write 
	input WE, // Write if be 1
	input [31:0]DataI,// Write Data
	output [31:0]DataO,// Output Data
	output reg IRQ
    );

	assign DataO = (Addr==0) ? CTRL :
						(Addr==1) ? PRESET :
						(Addr==2) ? COUNT :
										32'hDEAD_BEEF;

	//State Set
	reg[1:0] State;
	parameter IDLE = 0, 
				 LOAD = 1, 
				 CNTING = 2, //counting
				 INT = 3; //interrupt
 
	//Register Set
	reg[31:0] CTRL, PRESET, COUNT;
	initial begin
		CTRL = 0;
		PRESET = 0;
		COUNT = 0;
		IRQ = 0;
		State = IDLE;
	end
	
	
	always @(posedge clk) begin
		//Register Operation
		if (reset) begin
			CTRL <= 0;
			PRESET <= 0;
			COUNT <= 0;
			IRQ <= 0;
			State <= IDLE;
		end else if (WE) begin
			case (Addr)//COUNT is UNWRITABLE!
				0: CTRL <= DataI;
				1: PRESET <= DataI;
				default: begin // Exception
					CTRL <= 32'hDEAD_BEEF;
					PRESET <= 32'hDEAD_BEEF;
				end
			endcase
		end
		
		//States Jump
		if ((WE && Addr==0) || reset) begin // if write CTRL
			if (DataI[`enable] == 0) begin
				State <= IDLE;
			end else begin
				State <= LOAD;
			end
			
		end else if (State==LOAD) begin
			COUNT <= (WE && Addr==1) ? DataI : PRESET;
			if (((WE && Addr==1) ? DataI : PRESET)!=0) begin
				IRQ <= 0; // Interrupt suspension
				State <= CNTING;
			end else begin
				State <= INT;
			end
			
		end else if (State==CNTING) begin  
			COUNT <= COUNT - 1;
			if (COUNT==1) begin
				State <= INT;
				IRQ <= CTRL[`im]; // Interrupt begin
			end
			
		end else if (State==INT) begin
			if (CTRL[`mode] == 1) begin
				COUNT <= PRESET;
				if (PRESET!=0) begin
					IRQ <= 0;
					State <= CNTING;
				end
			end
		end
		
	end
endmodule
