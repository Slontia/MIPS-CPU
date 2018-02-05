`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:30 11/22/2016 
// Design Name: 
// Module Name:    F_part 
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
module F_part(
	input clk,
	input reset,
	input IntReq,
	input PCEnable,//pause ctr
	input [31:0]NPC_F,//jump_1
	input [31:0]DataRS,//jump_2
	input [31:0]EPC,
	input [2:0]NPCsel,//ctr
	output [31:0]Instr_D,
	output [31:0]PC4_D
    );
	 
	//Output Set
	assign Instr_D = Instr;
	assign PC4_D = PC_Out4;
	 
	//PC_Out Set
	reg [31:0]PC;
	wire [31:0]PC_OUT;
	assign PC_OUT = PC;
	
	//PC_Out+4 Set
	wire[31:0] PC_Out4;
	assign PC_Out4 = PC_OUT + 4;	
	
	initial begin
		PC = 32'h0000_3000;
	end
	
	wire [2:0]NPCselMUX;
	assign NPCselMUX = IntReq ? 3 : NPCsel ;
	//MUX for PC_IN
	wire[31:0] PC_IN;
	mux_8_32 MUX_PC(
		.Data0(PC_Out4),
		.Data1(NPC_F),
		.Data2(DataRS),
		.Data3(32'h0000_4180),
		.Data4(EPC),
		.Sel(NPCselMUX),
		.DataO(PC_IN)
	);
	
	
	//PC IN&OUT
	always @(posedge clk) begin
		if (reset) begin
			PC <= 32'h0000_3000;
		end else if(PCEnable) PC <= PC_IN;
	end
	
	//Create IM
	wire[31:0] Instr;
	im _im(
		.Addr(PC_OUT),
		.Instr(Instr)
	);

endmodule
