`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:50:34 11/21/2016 
// Design Name: 
// Module Name:    npc 
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
module npc(
	input [2:0]NPCctr,
	input [31:0]PC4,
	input [25:0]Imm26,
	input [4:0]CMPrst,
	output [31:0]NPC
    );
	 
	wire[31:0] Imm32_b;
	assign Imm32_b = {{14{Imm26[15]}}, Imm26[15:0], 2'b00};
	
	wire Equal, NotEqual;
	assign Equal = CMPrst[0];
	assign NotEqual = ~CMPrst[0];
	
	
	wire GreaterZero, LessZero, GreaterEqualZero, LessEqualZero;
	assign GreaterEqualZero = CMPrst[1];
	assign GreaterZero  = CMPrst[1] & ~CMPrst[2];
	assign LessEqualZero = ~GreaterZero;
	assign LessZero = ~GreaterEqualZero;

	assign NPC = /*Beq*/(NPCctr == 0) ? (PC4 + (Equal ? Imm32_b : 4)) :
					/*J*/(NPCctr == 1) ? {PC4[31:28], Imm26[25:0], 2'b00} :
					/*bgez*/(NPCctr == 2) ? (PC4 + (GreaterEqualZero ? Imm32_b : 4)) :
					/*bgtz*/(NPCctr == 3) ? (PC4 + (GreaterZero ? Imm32_b : 4)) :
					/*blez*/(NPCctr == 4) ? (PC4 + (LessEqualZero ? Imm32_b : 4)) :
					/*bltz*/(NPCctr == 5) ? (PC4 + (LessZero ? Imm32_b : 4)) :
					/*bne*/(NPCctr == 6) ? (PC4 + (NotEqual ? Imm32_b : 4)) :
					0;
	

endmodule
