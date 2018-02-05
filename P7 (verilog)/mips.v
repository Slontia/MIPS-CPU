`timescale 1ns / 1ps

//Send IR and set 4 controllers (easy to add new instructions)

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:38:27 11/21/2016 
// Design Name: 
// Module Name:    mips 
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

/*
ATTENTION:
1.对于跳转指令而言，如果是在延迟槽产生中断，那么EPC要记录PC-4（即跳转指令的PC）
2.E级和M级的乘除模块运算要取消
3.异常返回没有延迟槽
*/


module mips(
	input clk,
	input reset
    );
	
	wire[31:0] PrRD, PrWD, DEV0_RD, DEV1_RD, DEV_WD;
	wire[31:0] PrAddr;
	wire MemWrite, DEV0_WE, DEV1_WE, DataOsel;
	wire[3:2] DEV_Addr;
	wire [7:2]HWInt;
	assign HWInt[7:4] = 0;// Leisure
	
	cpu _cpu (
		.clk(clk),
		.reset(reset),
		.PrAddr(PrAddr), //Addr to Bridge
		.PrRD(PrRD), 	//Data read from Bridge
		.PrWD(PrWD),	//Data write to Bridge
		.PrWE(MemWrite),
		.HWInt(HWInt),		//6 interrupt request
	//output [3:0]PrBE(),
		.DataOsel(DataOsel)
	);
	
	bridge _bridge (
		.PrAddr(PrAddr),	//Addr from CPU
		.PrRD(PrRD),	//Data to CPU
		.PrWD(PrWD),		//Data from CPU
		.PrWE(MemWrite),
		.DEV_Addr(DEV_Addr),//Addr to DEV
		.DEV0_RD(DEV0_RD),	//Data from Timer0
		.DEV1_RD(DEV1_RD),	//Data from Timer1
		.DEV_WD(DEV_WD),	//Data to DEV
		.DEV0_WE(DEV0_WE),		//WriteEnable to Timer0
		.DEV1_WE(DEV1_WE),		//WriteEnable to Timer1
		.DataOsel(DataOsel)
	);
	
	timer timer0 (
		.clk(clk),
		.reset(reset),
		.Addr(DEV_Addr), // Which register to write 
		.WE(DEV0_WE), // Write if be 1
		.DataI(DEV_WD),// Write Data
		.DataO(DEV0_RD),// Output Data
		.IRQ(HWInt[2])
	);
	
	timer timer1 (
		.clk(clk),
		.reset(reset),
		.Addr(DEV_Addr), // Which register to write 
		.WE(DEV1_WE), // Write if be 1
		.DataI(DEV_WD),// Write Data
		.DataO(DEV1_RD),// Output Data
		.IRQ(HWInt[3])
	);
	
	


endmodule
