`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:02:13 11/22/2016 
// Design Name: 
// Module Name:    alu 
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
module alu(
	input [3:0]ALUctr,
	input [31:0]DataA,
	input [31:0]DataB,
	output [31:0]DataO
    );
	
	assign DataO = /*add*/(ALUctr == 0) * (DataA + DataB) +
	               /*sub*/(ALUctr == 1) * (DataA - DataB) +
						/*or*/(ALUctr == 2) * (DataA | DataB) +
						/*sll*/(ALUctr == 3) * (DataB << DataA[4:0]) +
						/*srl*/(ALUctr == 4) * (DataB >> DataA[4:0]) +
						/*and*/(ALUctr == 5) * (DataA & DataB) +
						/*xor*/(ALUctr == 6) * (DataA ^ DataB) +
						/*nor*/(ALUctr == 7) * ~(DataA | DataB) +
						/*slt*/(ALUctr == 8) * ((DataA[31]==DataB[31]) ? (DataA[30:0]<DataB[30:0]) : DataA[31]) + 
						/*sltu*/(ALUctr == 9) * (DataA < DataB) +
						/*sra*/(ALUctr == 10) * ({{32{DataB[31]}}, DataB} >> DataA[4:0]);
						

endmodule
