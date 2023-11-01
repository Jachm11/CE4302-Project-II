module RV32I
(
	input logic [31:0] read_data,
	input logic data_ready,
	input logic [31:0] instruction,
	input logic instruction_ready,

	input logic clock,
	input logic async_reset,


	output logic memory_transaction,
	output logic mem_write,
	output logic [31:0] alu_result,
	output logic [31:0] data_out,
	output logic [3:0] byte_enablers,
	output logic [31:0] pc
);

	// Nets
	logic [1:0] mux_pc_src_select;
	logic [31:0] adder_pc_4_o;
	logic [31:0] PC_4_E;
	logic [31:0] alu_result_E;
	logic [31:0] mux_pc_src_o;
	logic enable_fetch;
	logic [31:0] pc_reg_o;
	logic branch_D;	
	logic [31:0] adder_branch_prediction_o;
	logic enable_decode;
	logic flush_decode;
	logic [31:0] instruction_D;
	logic [31:0] PC_D;
	logic [31:0] PC_4_D;
	logic [6:0] opcode;
	logic [4:0] Rd_D;
	logic [2:0] f3;
	logic [4:0] Rs1_D;
	logic [4:0] Rs2_D;
	logic [6:0] f7;
	logic [24:0] raw_immediate;
	logic reg_write_D;
	logic [1:0] result_source_D;
	logic [2:0] width_type_D;
	logic mem_write_D;
	logic [3:0] alu_op_D;
	logic [2:0] cond_code_D;
	logic alu_source_D;
	logic jump_D;
	logic i_jump_D;
	logic pc_to_alu_D;
	logic memory_transaction_D;
	logic [2:0] immediate_type_D;
	logic [31:0] immediate_D;
	logic [4:0] Rd_W;
	logic [31:0] mux_result_W_o;
	logic [31:0] RD1_D;
	logic [31:0] RD2_D;
	logic [19:0] control_signals_D; assign control_signals_D = {memory_transaction_D,	pc_to_alu_D,	branch_D,	i_jump_D,	jump_D,	alu_source_D,	cond_code_D,	alu_op_D,	mem_write_D,	width_type_D,	result_source_D,	reg_write_D};
																				//[19]							[18]				[17]			[16]			[15]		[14]				[13:11]			[10:7]		[6]				[5:3]				[2:1]					[0]
	logic enable_execute;
	logic flush_execute;
	logic [19:0] control_signals_E;
	logic [31:0] RD1_E;
	logic [31:0] RD2_E;
	logic [31:0] PC_E;
	logic [4:0] Rd_E;
	logic [31:0] immediate_E;
	logic [4:0] Rs1_E;
	logic [4:0] Rs2_E;
	logic [1:0] forward_Rs1_E;
	logic [1:0] forward_Rs2_E;
	logic [31:0] alu_result_M;
	logic [31:0] mux_overtaking_1_o;
	logic [31:0] mux_overtaking_2_o;	
	logic comparison_unit_o;
	logic missed_branch_o;
	
	logic jump_or_ijump;
	assign jump_or_ijump = control_signals_E[15] || control_signals_E[16];

	logic missed_branch_or_jumps;
	assign missed_branch_or_jumps = missed_branch_o || jump_or_ijump;	

	assign mux_pc_src_select = {jump_or_ijump, missed_branch_o};

	logic [31:0] mux_operand_a_o;
	logic [31:0] mux_operand_b_o;
	logic enable_memory;
	logic flush_memory;
	logic [7:0] control_signals_M;
	logic [4:0] Rd_M;
	logic [31:0] PC_4_M;
	logic [31:0] input_byte_handler_o;
	logic [2:0] control_signals_W;
	logic [31:0] alu_result_W;
	logic [31:0] read_data_W;
	logic [31:0] PC_4_W;

	
	assign memory_transaction = control_signals_M[7];
	assign mem_write = control_signals_M[6];
	assign alu_result = alu_result_M;



	Multiplexer_MxN #(.M(3), .N(32)) mux_pc_src
	(
		mux_pc_src_select, {alu_result_E, PC_4_E, adder_pc_4_o},
		mux_pc_src_o
	);

	Register_N_with_enabler_vP #(.N(32)) pc_reg(
		mux_pc_src_o, enable_fetch, clock, async_reset,
		pc_reg_o);

		


	Multiplexer_MxN #(.M(2), .N(32)) mux_pc_out(
		branch_D, {adder_branch_prediction_o, pc_reg_o},
		pc);


	Adder_N #(.N(32)) adder_pc_4(
		pc, 32'd4,
		adder_pc_4_o);


	Pipe_Decoder_vP pipe_d(
		instruction, pc, adder_pc_4_o,
		enable_decode, clock, async_reset,flush_decode,
		instruction_D, PC_D, PC_4_D);


	Instruction_Splitter_RV32I instruction_splitter(
		instruction_D,
		opcode, Rd_D, f3, Rs1_D, Rs2_D, f7, raw_immediate);


	Main_Decoder control_unit(
		opcode, f3, f7,
		reg_write_D, result_source_D, width_type_D, mem_write_D, alu_op_D, cond_code_D, alu_source_D, jump_D, i_jump_D, branch_D, pc_to_alu_D, memory_transaction_D, immediate_type_D);


	Sign_extend_RV32I sign_extend(
		immediate_type_D, raw_immediate,
		immediate_D);


	Adder_N #(.N(32)) adder_branch_prediction(
		PC_D, immediate_D,
		adder_branch_prediction_o);


	Regfile_File_32x32_vN reg_file(
		control_signals_W[0], Rs1_D, Rs2_D, Rd_W, mux_result_W_o,
		clock, async_reset,
		RD1_D, RD2_D);


	Pipe_Execute_vP pipe_execute(
		control_signals_D, RD1_D, RD2_D, PC_D, Rd_D, immediate_D, PC_4_D, Rs1_D, Rs2_D,
		enable_execute, clock, async_reset, flush_execute,
		control_signals_E, RD1_E, RD2_E, PC_E, Rd_E, immediate_E, PC_4_E, Rs1_E, Rs2_E);


	Multiplexer_MxN #(.M(3), .N(32)) mux_overtaking_1(
		forward_Rs1_E, {mux_result_W_o, alu_result_M, RD1_E},
		mux_overtaking_1_o);


	Multiplexer_MxN #(.M(3), .N(32)) mux_overtaking_2(
		forward_Rs2_E, {mux_result_W_o, alu_result_M, RD2_E},
		mux_overtaking_2_o);


	Comparison_unit_RV32I comparison_unit(
		control_signals_E[13:11], mux_overtaking_1_o, mux_overtaking_2_o,
		comparison_unit_o);


	Exception missed_branch(
		control_signals_E[17], comparison_unit_o,
		missed_branch_o);


	Multiplexer_MxN #(.M(2), .N(32)) mux_operand_a(
		control_signals_E[18], {PC_E, mux_overtaking_1_o},
		mux_operand_a_o);


	Multiplexer_MxN #(.M(2), .N(32)) mux_operand_b(
		control_signals_E[14], {immediate_E, mux_overtaking_2_o},
		mux_operand_b_o);


	ALU_RV32I #(.N(32)) alu(
		control_signals_E[10:7], mux_operand_a_o, mux_operand_b_o,
		alu_result_E);


	Pipe_Memory_vP pipe_memory(
		{control_signals_E[19], control_signals_E[6:0]}, alu_result_E, mux_overtaking_2_o, Rd_E, PC_4_E,
		enable_memory, clock, async_reset, flush_memory,
		control_signals_M, alu_result_M, data_out, Rd_M, PC_4_M);


	Output_Byte_Handler_RV32I output_byte_handler(
		control_signals_M[5:3], control_signals_M[6],
		byte_enablers);


	Input_Byte_Handler_RV32I input_byte_handler(
		control_signals_M[5:3], read_data,
		input_byte_handler_o);


	Pipe_Writeback_vP pipe_writeback(
		control_signals_M[2:0], alu_result_M, input_byte_handler_o, Rd_M, PC_4_M,
		clock, async_reset,
		control_signals_W, alu_result_W, read_data_W, Rd_W, PC_4_W);


	Multiplexer_MxN #(.M(3), .N(32)) mux_result_W(
		control_signals_W[2:1], {PC_4_W, read_data_W, alu_result_W},
		mux_result_W_o);


	Hazard_unit_RV32I hazard_unit(
		Rs1_D, Rs2_D, Rs1_E, Rs2_E,
		Rd_E, Rd_M, Rd_W,
		control_signals_M[0], control_signals_W[0], control_signals_E[1], missed_branch_or_jumps, control_signals_M[7], data_ready, instruction_ready,

		forward_Rs1_E, forward_Rs2_E,
		enable_fetch, enable_decode, enable_execute, enable_memory,
		flush_decode, flush_execute, flush_memory);


endmodule