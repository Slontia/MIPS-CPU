`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:49:16 11/22/2016 
// Design Name: 
// Module Name:    hu 
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
`define rs 25:21
`define rt 20:16
`define rd 15:11

module hu(
	input Busy,
	input [31:0]Instr_D,
	input [31:0]Instr_E,
	input [31:0]Instr_M,
	input [31:0]Instr_W,
	output [2:0]RS_Dforward,
	output [2:0]RT_Dforward,
	output [2:0]RS_Eforward,
	output [2:0]RT_Eforward,
	output [2:0]RT_Mforward,
	output IR_D_en,
	output IR_E_clr,
	output PC_en
    );
	 
	//Divide Instruction(Register)
	wire[4:0] Rs_D, Rt_D;
	wire[4:0] Rs_E, Rt_E, Rd_E;
	wire[4:0] Rt_M, Rd_M;
	wire[4:0] Rt_W, Rd_W;
	parameter Ra = 5'd31;
	
	assign Rs_D = Instr_D[`rs];
	assign Rt_D = Instr_D[`rt];
	
	assign Rs_E = Instr_E[`rs];
	assign Rt_E = Instr_E[`rt];
	assign Rd_E = Instr_E[`rd];
	
	assign Rt_M = Instr_M[`rt];
	assign Rd_M = Instr_M[`rd];
	
	assign Rt_W = Instr_W[`rt];
	assign Rd_W = Instr_W[`rd];
	
	
	//Instrction Type
	wire Cal_r_D, Cal_i_D, B_D, Jr_D, Load_D, Store_D, MfLOHI_D, MulDiv_D, ERET_D;
	instr_type Instr_D_type(
		.Instr(Instr_D),
		.Cal_r(Cal_r_D),
		.Cal_i(Cal_i_D),
		.B(B_D),
		.Jr(Jr_D),
		.Load(Load_D),
		.Store(Store_D),
		.MfLOHI(MfLOHI_D),
		.MulDiv(MulDiv_D),
		.ERET(ERET_D)
	);
	
	wire Cal_r_E, Cal_i_E, Load_E, Store_E, Jal_E, Jal_nRa_E, MfLOHI_E, MulDiv_E, MFC0_E, MTC0_E;
	instr_type Instr_E_type(
		.Instr(Instr_E),
		.Cal_r(Cal_r_E),
		.Cal_i(Cal_i_E),
		.Load(Load_E),
		.Store(Store_E),
		.Jal(Jal_E),
		.Jal_nRa(Jal_nRa_E),
		.MfLOHI(MfLOHI_E),
		.MulDiv(MulDiv_E),
		.MFC0(MFC0_E),
		.MTC0(MTC0_E)
	);
	
	wire Cal_r_M, Cal_i_M, Load_M, Store_M, Jal_M, Jal_nRa_M, MfLOHI_M, MFC0_M, MTC0_M;
	instr_type Instr_M_type(
		.Instr(Instr_M),
		.Cal_r(Cal_r_M),
		.Cal_i(Cal_i_M),
		.Load(Load_M),
		.Store(Store_M),
		.Jal(Jal_M),
		.Jal_nRa(Jal_nRa_M),
		.MfLOHI(MfLOHI_M),
		.MFC0(MFC0_M),
		.MTC0(MTC0_M)
	);
	
	wire Cal_r_W, Cal_i_W, Load_W, Jal_W, Jal_nRa_W, MfLOHI_W, MFC0_W;
	instr_type Instr_W_type(
		.Instr(Instr_W),
		.Cal_r(Cal_r_W),
		.Cal_i(Cal_i_W),
		.Load(Load_W),
		.Jal(Jal_W),
		.Jal_nRa(Jal_nRa_W),
		.MfLOHI(MfLOHI_W),
		.MFC0(MFC0_W)
	);
	
	
	//Pause judgement
	wire Stall, Stall_B, Stall_Jr, Stall_Cal_r, Stall_Cal_i, Stall_Load, Stall_Store, Stall_MulDiv, Stall_ERET;
	assign Stall_B = B_D & 	(((Cal_r_E | MfLOHI_E)			& ((Rs_D == Rd_E) & (Rs_D != 0) | (Rt_D == Rd_E) & (Rt_D != 0))) 	|
									 ((Cal_i_E | Load_E | MFC0_E) & ((Rs_D == Rt_E) & (Rs_D != 0) | (Rt_D == Rt_E) & (Rt_D != 0)))	|
								    ((Load_M | MFC0_M)				& ((Rs_D == Rt_M) & (Rs_D != 0) | (Rt_D == Rt_M) & (Rt_D != 0))));
	assign Stall_Jr = Jr_D &(((Cal_r_E | MfLOHI_E)			& (Rs_D == Rd_E) & (Rs_D != 0)) |
	                         ((Cal_i_E | Load_E | MFC0_E)	& (Rs_D == Rt_E) & (Rs_D != 0)) |
								    ((Load_M | MFC0_M)				& (Rs_D == Rt_M) & (Rs_D != 0)));
	assign Stall_Cal_r = Cal_r_D & ((Load_E | MFC0_E) & ((Rs_D == Rt_E) & (Rs_D != 0) | (Rt_D == Rt_E) & (Rt_D != 0)));
	assign Stall_Cal_i = Cal_i_D & ((Load_E | MFC0_E) & ((Rs_D == Rt_E) & (Rs_D != 0) /*| (Rt_D == Rt_E) & (Rt_D != 0)*/));
	assign Stall_Load  = Load_D  & ((Load_E | MFC0_E) & ((Rs_D == Rt_E) & (Rs_D != 0) /*| (Rt_D == Rt_E) & (Rt_D != 0)*/));
	assign Stall_Store = Store_D & ((Load_E | MFC0_E) & ((Rs_D == Rt_E) & (Rs_D != 0) /*| (Rt_D == Rt_E) & (Rt_D != 0)*/));
	assign Stall_ERET  = ERET_D  & ((MTC0_E & (Rd_E == 14)) | (MTC0_M & (Rd_M == 14)));/*14=EPC*/
	assign Stall_MulDiv = MulDiv_D & Busy ;
	
	assign Stall = Stall_B + Stall_Jr + Stall_Cal_r + Stall_Cal_i + Stall_Load + Stall_Store + Stall_MulDiv + Stall_ERET;
	
	
	//Forward judgement
	assign RS_Dforward = (Rs_D == 0) ? 0 : //forward if not $zero
								((B_D | Jr_D) & Jal_E   		& (Rs_D == Ra  )) 	? 2 :
								((B_D | Jr_D) & Jal_nRa_E   	& (Rs_D == Rd_E  )) 	? 2 :
	                     ((B_D | Jr_D) & Cal_r_M 		& (Rs_D == Rd_M)) 	? 1 :
	                     ((B_D | Jr_D) & Cal_i_M 		& (Rs_D == Rt_M)) 	? 1 :
								((B_D | Jr_D) & Jal_M   		& (Rs_D == Ra  )) 	? 3 :
								((B_D | Jr_D) & Jal_nRa_M   	& (Rs_D == Rd_M  )) 	? 3 :
								((B_D | Jr_D) & MfLOHI_M   	& (Rs_D == Rd_M  )) 	? 4 :
																									  0 ;
	assign RT_Dforward = (Rt_D == 0) ? 0 :
								(B_D & Jal_E   	& (Rt_D == Ra  )) ? 	2 :
	                     (B_D & Cal_r_M 	& (Rt_D == Rd_M)) ? 	1 :
	                     (B_D & Cal_i_M 	& (Rt_D == Rt_M)) ? 	1 :
								(B_D & Jal_M   	& (Rt_D == Ra  )) ? 	3 :
								(B_D & Jal_nRa_M	& (Rt_D == Rd_M)) ? 	3 :
								(B_D & MfLOHI_M	& (Rt_D == Rd_M)) ? 	4 :
																					0 ;
	assign RS_Eforward = (Rs_E == 0) ? 0 :
	                     ((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & Cal_r_M 		& (Rs_E == Rd_M)) 	? 	1 :
	                     ((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & Cal_i_M 		& (Rs_E == Rt_M)) 	? 	1 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & Jal_M   		& (Rs_E == Ra  )) 	? 	3 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & Jal_nRa_M		& (Rs_E == Rd_M)) 	? 	3 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & MfLOHI_M		& (Rs_E == Rd_M)) 	? 	5 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & (Cal_r_W | MfLOHI_W)			& (Rs_E == Rd_W)) ? 2 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & (Cal_i_W | Load_W | MFC0_W)	& (Rs_E == Rt_W)) ? 2 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & Jal_W   		& (Rs_E == Ra  )) 	? 	4 :
								((Cal_r_E | Cal_i_E | Load_E | Store_E | MulDiv_E) & Jal_nRa_W		& (Rs_E == Rd_W)) 	? 	4 :
																																						0 ;	
	assign RT_Eforward = (Rt_E == 0) ? 0 :
	                     ((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & Cal_r_M 		& (Rt_E == Rd_M)) 	? 	1 :
	                     ((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & Cal_i_M 		& (Rt_E == Rt_M)) 	? 	1 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & Jal_M   		& (Rt_E == Ra  )) 	? 	3 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & Jal_nRa_M   	& (Rt_E == Rd_M)) 	? 	3 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & MfLOHI_M   	& (Rt_E == Rd_M)) 	? 	5 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & (Cal_r_W | MfLOHI_W)			& (Rt_E == Rd_W)) ? 2 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & (Cal_i_W | Load_W | MFC0_W)	& (Rt_E == Rt_W)) ? 2 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & Jal_W   		& (Rt_E == Ra  )) 	? 	4 :
								((Cal_r_E | Store_E | MulDiv_E | MTC0_E) & Jal_nRa_W   	& (Rt_E == Rd_W  )) 	? 	4 :
																																			0 ;
	assign RT_Mforward = (Rt_M == 0) ? 0 :
	                     ((Store_M | MTC0_M) & (Cal_r_W | MfLOHI_W) 			& (Rt_M == Rd_W)) ? 1 :
								((Store_M | MTC0_M) & (Cal_i_W | Load_W | MFC0_W) 	& (Rt_M == Rt_W)) ? 1 :
								((Store_M | MTC0_M) & Jal_W   		& (Rt_M == Ra  )) 	? 	2 :
								((Store_M | MTC0_M) & Jal_nRa_W   	& (Rt_M == Rd_W  )) 	? 	2 :
																												0 ;
	
	assign IR_D_en = !Stall;
	assign IR_E_clr =  Stall;
	assign PC_en = !Stall;
	
endmodule
