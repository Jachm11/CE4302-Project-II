module Main_decoder
(
	input logic [6:0] opcode,
	input logic [2:0] f3,
	input logic [6:0] f7,


	output logic write_scalar_reg,
	output logic [1:0] result_source,
	output logic [2:0] width_type,
	output logic mem_write,
	output logic [3:0] ALU_op,
	output logic [2:0] cond_code,
	output logic ALU_source,
	output logic jump,
	output logic i_jump,
	output logic branch,
	output logic PC_to_ALU,
	output logic memory_transaction,
	output logic [2:0] immediate_type,
	
	output logic immediate_i_exception,
	output logic write_vector_reg,
	output logic select_operand_0_vector,
	output logic select_operand_1_vector,
	output logic rerouting_select,
	output logic [2:0] rerouting_code
);	
	// Instructions types
	logic R;
	logic IA;
	logic IL;
	logic S;
	logic B;
	logic J;
	logic IJ;
	logic U;
	logic U_PC;
	logic IT;
	logic VR;
	logic ST;
	logic VT;
	logic SV;
	logic LV;
	logic VA;

	logic [7:0] decoded_f3;
	
	logic f7_0;
	logic f7_1;
	logic f7_2;
	logic f7_3;	
	logic f7_0x20;
	
	// -- Modules --
	Instruction_decoder_RV32I id
	(
		.opcode(opcode),
	
		.r(R),
		.i_arithmetic_logic(IA),
		.i_load(IL),
		.store(S),
		.branch(B),
		.jump(J),

		.i_jump(IJ),
		.u(U),
		.u_pc(U_PC),
		.i_transfer(IT),
		.vector_r(VR),
		.scalar_to_vector(ST),
		.vector_to_scalar(VT),
		.store_vector(SV),
		.load_vector(LV),
		.vector_absolute(VA)		
	);
	
	Decoder_N dec_f3
	(
		.code(f3),
		.o(decoded_f3)
	);

	Decoder_f7_RV32I dec_f7
	(
		.f7(f7),
		
		.o_0x0(f7_0),
		.o_0x1(f7_1),
		.o_0x2(f7_2),
		.o_0x3(f7_3),		
		.o_0x20(f7_0x20)
	);
	
	assign write_scalar_reg = |{R, IA, IL, J, IJ, U, U_PC, VT};
	
	Result_source_decoder_RV32I rsd
	(
		.load(IL),
		.jump(J),
		.i_jump(IJ),
		.load_vector(LV),
		
		.f3_eq_0(decoded_f3[0]),
		
		.result_source(result_source)
	);

	Load_store_width_decoder_RV32I lsd
	(
		.load(IL),
		.store(S),
		.load_vector(LV),
		.store_vector(SV),
		.decoded_f3(decoded_f3),

		.width(width_type)
	);
	
	assign mem_write = S||SV;
		
	ALU_decoder_RV32I ALU_dec
	(
		.R(R),
		.I(IA),
		.U(U),
		.VR(VR),
		.abs(VA),
		
		.decoded_f3(decoded_f3),
		
		.f7_eq_0x0(f7_0),
		.f7_eq_0x1(f7_1),
		.f7_eq_0x20(f7_0x20),
		
		.ALU_op(ALU_op)
	);
	
	Branch_condition_decoder_RV32I bcd
	(
		.decoded_f3(decoded_f3),
		.B(B),
		
		.comp_code(cond_code)
	);

	assign ALU_source = |{IA, IL, S, B, J, IJ, U, U_PC, SV, LV};

	assign jump = J;

	assign i_jump = IJ;

	assign branch = B;

	assign PC_to_ALU = |{B, J, U_PC};

	assign memory_transaction = |{S, IL, SV, LV};
	
	assign immediate_type[0] = |{S, U, U_PC, SV};
	assign immediate_type[1] = |{B, U, U_PC};
	assign immediate_type[2] = J;
	
	
	assign immediate_i_exception = &{IA, decoded_f3[5], f7_0x20};
	
	assign write_vector_reg = |{VR, ST, LV, VA};
	
	assign select_operand_0_vector = (VR || VA);

	assign select_operand_1_vector = |{VR, ST, VT, SV};
	
	
	Rerouting_decoder_RV32I Rerouting_dec
	(
		.STV(ST),
		.VTS(VT),
		.f7_eq_0x1(f7_1),
		.f7_eq_0x2(f7_2),
		.f7_eq_0x3(f7_3),

		.rerouting_select(rerouting_select),
		.rerouting_code(rerouting_code)
	);

endmodule