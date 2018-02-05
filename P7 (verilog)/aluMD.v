`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:04:00 12/08/2016 
// Design Name: 
// Module Name:    aluMD 
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

module aluMD(
	input reset,
	input clk,
	input BreakMD,
	input ReturnLOHI,
	input [2:0]ALUMDctr,
	input [31:0]DataA,
	input [31:0]DataB,
	output reg [31:0]HI,
	output reg [31:0]LO,
	output Busy
    );
	 
	assign Busy = mult | multu | div | divu | (counter>0);
	 
	reg[31:0] HIrst, LOrst;
	integer counter;
	
	initial begin
		counter = 0;
		HI = 0;
		LO = 0;
		HIrst = 0;
		LOrst = 0;
		PreHI = 0;
		PreLO = 0;
	end
	
	//Instrument Analyze
	wire mult, multu, div, divu, mtlo, mthi;
	assign mult = (ALUMDctr == 1);
	assign multu = (ALUMDctr == 2);
	assign div = (ALUMDctr == 3);
	assign divu = (ALUMDctr == 4);
	assign mtlo = (ALUMDctr == 5);
	assign mthi = (ALUMDctr == 6);
	
	//Calculation
	wire[63:0] DataSignA, DataSignB;
	assign DataSignA = {{32{DataSignA[31]}}, DataA};
	assign DataSignB = {{32{DataSignB[31]}}, DataB};
	wire[31:0] LOdiv;
	assign LOdiv = (divu | ~DataA[31] & ~DataB[31]) ? (DataA / DataB) ://pos * pos
									(DataA[31] & DataB[31]) ? ((~DataA + 1) / (~DataB + 1)) ://neg * neg
													(DataA[31]) ? ~((~DataA + 1) / DataB) + 1 ://A is neg
																	  ~(DataA / (~DataB + 1)) + 1 ;//B is neg
	
	reg[31:0] PreHI, PreLO;
	always @(posedge clk /*or posedge mult or posedge multu or posedge div or posedge divu*/) begin
		if (reset) begin
			counter <= 0;
			HI <= 0;
			LO <= 0;
			HIrst <= 0;
			LOrst <= 0;
			PreHI <= 0;
			PreLO <= 0;
		end else if (BreakMD) begin
			counter <= 0;
		end else if (ReturnLOHI) begin
			HI <= PreHI;
			LO <= PreLO;
		end else if(mult | multu) begin
			counter <= 4;//5-1
			{HIrst, LOrst} <= multu ? DataA * DataB : DataSignA * DataSignB ;																
		end else if (div | divu) begin
			counter <= 9;//10-1
			LOrst <= LOdiv;
			HIrst <= DataA - LOdiv * DataB;
		end else if (mtlo) begin
			LO <= DataA;
			PreLO <= LO;
		end else if (mthi) begin
			HI <= DataA;
			PreHI <= HI;
		end else if (Busy) begin
			counter = counter - 1;
			if (counter == 0) begin
				HI <= HIrst;
				LO <= LOrst;
				PreLO <= LO;
				PreHI <= HI;
			end
		end
	end
endmodule
