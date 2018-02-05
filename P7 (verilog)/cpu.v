`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:07 12/17/2016 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
	input clk,
	input reset,
	input [31:0]PrRD, 	//Data read from Bridge 
	input [7:2]HWInt,		//6 interrupt request
	input DataOsel,
	output [31:0]PrAddr, //Addr to Bridge
	output [31:0]PrWD,	//Data write to Bridge
	output PrWE 
    );
	 
	assign PrAddr = AO_regM;
	assign PrWD = DataRT_regM;
	
	//================= Create CP0 ====================
	wire IntReq;
	wire [5:0]ExcCode;
	assign ExcCode = 0;
	wire [31:0]CP0DataO;
	reg [31:0]CP0DataO_regW;
	
	wire[31:0] PC_M_Interrupt;
	wire JumpOrBranch_W;
	instr_type INT_Instr_W_type (
		.Instr(Instr_regW),
		.JumpOrBranch(JumpOrBranch_W)
	);
	assign PC_M_Interrupt = JumpOrBranch_W ? PC8_regM-12 : PC8_regM-8 ;
	
	wire BreakMD, ReturnLOHI;
	wire MulDivCal_E, MulDivCal_M, MtLOHI_M;
	instr_type INT_Instr_E_type (
		.Instr(Instr_regE),
		.MulDivCal(MulDivCal_E)
	);
	instr_type INT_Instr_M_type (
		.Instr(Instr_regM),
		.MulDivCal(MulDivCal_M),
		.MtLOHI(MtLOHI_M)
	);
	assign BreakMD = (MulDivCal_M || MulDivCal_E) && IntReq;
	assign ReturnLOHI = MtLOHI_M && IntReq;
	
	wire[31:0] EPC;
	reg IntEnable_reg;
	
	cp0 _cp0(
		.clk(clk),
		.reset(reset),
		.WE(CP0Write), // *Write Enable of CP0 (MTC0)
		.AddrR(Instr_regM[15:11]), // *read CP0 addr (MFC0)
		.AddrW(Instr_regM[15:11]), // *write CP0 addr (MTC0)
		.DataI(CP0DataW), // *Data from GPR to CP0 (MTC0)
		.DataO(CP0DataO), // *Data from CP0 GPR (MFC0)
		.PC(PC_M_Interrupt), // PC for interrupt
		.EPC(EPC),
		.ExcCode(ExcCode), // type of interrupt/exception
		.HWInt(HWInt), // interrupt of 6 devices
		.IntReq(IntReq), // interrupt request to CPU controller
		.EXTSet(IntReq), // turn EXL to 1
		.EXTClr(IntEnable_reg) // turn EXT to 0 (ERET)
    );
	
	//=============== Registers ====================
	initial begin
		Instr_regD = 0;
		Instr_regE = 0;
		Instr_regM = 0;
		Instr_regW = 0;
	end
	 
	always @(posedge clk) begin
		IntEnable_reg <= IntEnable;
	
		//IF/ID
		if(reset || IntReq) Instr_regD <= 0;
		else if(IR_D_en) begin
			Instr_regD <= ERET_Clr_D ? 0 : Instr_D;
			PC4_regD <= PC4_D;
		end
		
		//ID/EX
		Instr_regE <= (IR_E_clr | reset | IntReq) ? 0 : Instr_E;
		PC8_regE <= PC8_E;
		DataRS_regE <= DataRS_E;
		DataRT_regE <= DataRT_E;
		EXT_regE <= EXT_E; 
		
		//EX/IM
		Instr_regM <= (reset | IntReq) ? 0 : Instr_M;
		PC8_regM <= PC8_M;
		AO_regM <= AO_M;
		DataRT_regM <= DataRT_M;
		LOHI_regM <= LOHI_M;
		
		//IM/WB
		Instr_regW <= reset ? 0 : Instr_W;
		PC8_regW <= PC8_W;
		AO_regW <= AO_W;
		DM_regW <= DM_W;
		LOHI_regW <= LOHI_W;
		CP0DataO_regW <= CP0DataO;
	
	end
	
	//========= F ====================
	wire[31:0] Instr_D, PC4_D;
	reg[31:0] Instr_regD, PC4_regD;
	F_part _F (
		.clk(clk),
		.reset(reset),
		.IntReq(IntReq),
		.PCEnable(PC_en),//pause ctr
		.NPC_F(NPC_back_F),
		.NPCsel(NPCsel_back_F),//ctr
		.DataRS(DataRS_back_F),
		.EPC(EPC),
		.Instr_D(Instr_D),
		.PC4_D(PC4_D)
	);
	
	//========== D ====================
	wire[31:0] Instr_E, PC8_E, DataRS_E, DataRT_E, EXT_E, NPC_back_F, DataRS_back_F, ALUMDctr_toE;
	reg[31:0] Instr_regE, PC8_regE, DataRS_regE, DataRT_regE, EXT_regE;
	wire[2:0] NPCsel_back_F;
	wire ERET_Clr_D;
	D_part _D (
		.clk(clk),
		.reset(reset),
		.Instr_D(Instr_regD),
		.PC4_D(PC4_regD),
		.RW_W(RW_back_D),//W_part
		.DataW_W(DataW_back_D),//W_part
		.RS_Dforward(RS_Dforward),//Fctr
		.RT_Dforward(RT_Dforward),//Fctr
		.AO_M(AO_regM),//Fdata
		.PC8_Ef(PC8_regE),//Fdata
		.PC8_Mf(PC8_regM),//Fdata
		.LOHI_Mf(LOHI_regM),//Fdata
		.RegWrite(RegWrite_back_D),
		.Instr_E(Instr_E),
		.PC8_E(PC8_E),
		.DataRS_E(DataRS_E),
		.DataRT_E(DataRT_E),
		.EXT_E(EXT_E),
		.NPC_back_F(NPC_back_F),
		.DataRS_back_F(DataRS_back_F),
		.NPCsel_back_F(NPCsel_back_F),
		.ERET_Clr_D(ERET_Clr_D)
		//.ALUMDctr_toE(ALUMDctr_toE)
	);
	
	//=============== E ========================
	wire Busy;
	wire[31:0] Instr_M, PC8_M, AO_M, DataRT_M, LOHI_M;
	reg[31:0] Instr_regM, PC8_regM, AO_regM, DataRT_regM, LOHI_regM;
	E_part _E (
		.reset(reset),
		.clk(clk),
		.BreakMD(BreakMD),
		.ReturnLOHI(ReturnLOHI),
		.Instr_E(Instr_regE),
		.PC8_E(PC8_regE),
		.DataRS_E(DataRS_regE),
		.DataRT_E(DataRT_regE),
		.EXT_E(EXT_regE),
		.RS_Eforward(RS_Eforward),//Fctr
		.RT_Eforward(RT_Eforward),//Fctr
		.AO_Mf(AO_regM),//Fdata
		.RegDataW_W(DataW_back_D),//Fdata
		.PC8_Mf(PC8_regM),//Fdata
		.PC8_Wf(PC8_regW),//Fdata
		.LOHI_Mf(LOHI_regM),//Fdata
		.Instr_M(Instr_M),
		.PC8_M(PC8_M),
		.AO_M(AO_M),
		.DataRT_M(DataRT_M),
		.LOHI_M(LOHI_M),
		.Busy(Busy)
	);
	
	
	//============= M =====================
	wire[31:0] Instr_W, PC8_W, AO_W, DM_W, LOHI_W, CP0DataW;
	reg[31:0] Instr_regW, PC8_regW, AO_regW, DM_regW, LOHI_regW;
	wire CP0Write;
	M_part _M (
		.clk(clk),
		.reset(reset),
		.Instr_M(Instr_regM),
		.PC8_M(PC8_regM),
		.AO_M(AO_regM),
		.DataRT_M(DataRT_regM),
		.RT_Mforward(RT_Mforward),//Fctr
		.RegDataW_W(DataW_back_D),//Fdata
		.PC8_Wf(PC8_regW),//Fdata
		.LOHI_M(LOHI_regM),
		.PrRD(PrRD),
		.DataOsel(DataOsel),
		.Instr_W(Instr_W),
		.PC8_W(PC8_W),
		.AO_W(AO_W),
		.DM_W(DM_W),
		.LOHI_W(LOHI_W),
		.CP0Write(CP0Write),
		.CP0DataW(CP0DataW),
		.IntEnable(IntEnable),
		.PrWE(PrWE)
	);
	
	
	//============= W ======================
	wire[4:0] RW_back_D;
	wire[31:0] DataW_back_D;
	wire RegWrite_back_D;
	W_part _W (
		.Instr_W(Instr_regW),
		.PC8_W(PC8_regW),
		.AO_W(AO_regW),
		.DM_W(DM_regW),
		.LOHI_W(LOHI_regW),
		.CP0DataO_W(CP0DataO_regW),
		.RW_back_D(RW_back_D),
		.DataW_back_D(DataW_back_D),
		.RegWrite_back_D(RegWrite_back_D)
	);
	
	//================ Create HU ================
	wire[2:0] RS_Dforward, RT_Dforward, RS_Eforward, RT_Eforward, RT_Mforward;
	wire IR_D_en, IR_E_clr, PC_en;
	hu _hu (
		.Busy(Busy),
		.Instr_D(Instr_regD),
		.Instr_E(Instr_regE),
		.Instr_M(Instr_regM),
		.Instr_W(Instr_regW),
		.RS_Dforward(RS_Dforward),
		.RT_Dforward(RT_Dforward),
		.RS_Eforward(RS_Eforward),
		.RT_Eforward(RT_Eforward),
		.RT_Mforward(RT_Mforward),
		.IR_D_en(IR_D_en),
		.IR_E_clr(IR_E_clr),
		.PC_en(PC_en)
	);	
	



endmodule
