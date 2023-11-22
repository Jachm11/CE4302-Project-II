module Decode_stage
(

	input logic [31:0] instruction_D,
	input logic [31:0] PC_D,
		
	// Reg files
		input logic [5:0] write_address_W,
		input logic write_scalar_reg_W,
		input logic write_vector_reg_W,
		input logic [127:0] data_bus_W,

	input logic clock,
	input logic async_reset,
	
	// Control signals
	output logic write_scalar_reg_D,
	output logic [1:0] result_source_D,
	output logic [2:0] width_type_D,
	output logic mem_write_D,
	output logic [3:0] ALU_op_D,
	output logic [2:0] cond_code_D,
	output logic ALU_source_D,
	output logic branch_D,
	output logic jump_D,
	output logic i_jump_D,
	output logic PC_to_ALU_D,
	output logic memory_transaction_D,

	output logic write_vector_reg_D,
	output logic select_operand_0_vector_D,
	output logic select_operand_1_vector_D,
	output logic rerouting_select_D,
	output logic [2:0] rerouting_code_D,


	// Data signals
	output logic [31:0] scalar_reg_data_0_D,
	output logic [31:0] scalar_reg_data_1_D,

	output logic [127:0] vector_reg_data_0_D,
	output logic [127:0] vector_reg_data_1_D,
	
	output logic [5:0] r1_D,
	output logic [5:0] r2_D,
	output logic [5:0] rd_D,

	output logic [31:0] immediate_D,
	
	output logic [31:0] predicted_PC_D
);
	// Aux nets
	// Instruction Splitter
	logic [6:0] opcode;
	logic [4:0] rd;
	logic [2:0] f3;
	logic [4:0] r1;
	logic [4:0] r2;
	logic [6:0] f7;
	logic [24:0] raw_immediate;

	
	// Main Decoder
	logic [2:0] immediate_type_D;
	logic immediate_i_exception_D;
	

		
	// -- Modules --
	
	Instruction_splitter_RV32I instruction_splitter
	(
		.instruction(instruction_D),
		
		.opcode(opcode),
		.rd(rd),
		.f3(f3),
		.r1(r1),
		.r2(r2),
		.f7(f7),
		.raw_immediate(raw_immediate)
	);


	Main_decoder main_dec
	(
		.opcode(opcode),
		.f3(f3),
		.f7(f7),

		
		// Control signals
		.write_scalar_reg(write_scalar_reg_D),
		.result_source(result_source_D),
		.width_type(width_type_D),
		.mem_write(mem_write_D),
		.ALU_op(ALU_op_D),
		.cond_code(cond_code_D),
		.ALU_source(ALU_source_D),
		.jump(jump_D),
		.i_jump(i_jump_D),
		.branch(branch_D),
		.PC_to_ALU(PC_to_ALU_D),
		.memory_transaction(memory_transaction_D),
		.immediate_type(immediate_type_D),
		
		.immediate_i_exception(immediate_i_exception_D),
		.write_vector_reg(write_vector_reg_D),
		.select_operand_0_vector(select_operand_0_vector_D),
		.select_operand_1_vector(select_operand_1_vector_D),
		.rerouting_select(rerouting_select_D),
		.rerouting_code(rerouting_code_D)
	);	

	Sign_extend_RV32I sign_ext
	(
		.immediate_type(immediate_type_D),
		.immediate_i_exception(immediate_i_exception_D),
		.raw_immediate(raw_immediate),

		.immediate(immediate_D)
	);

	Adder_N #(.N(32)) adder_branch_prediction
	(
		.A(immediate_D),
		.B(PC_D),

		.O(predicted_PC_D)
	);

	Regfile_32x32_vN scalar_reg_file
	(
		.read_addr_1(r1),
		.read_addr_2(r2),
		.write_addr({write_address_W[4], write_address_W[3], write_address_W[2], write_address_W[1], write_address_W[0]}),
		.write_data(data_bus_W[31:0]),		
		.write_enable(write_scalar_reg_W),

		.clock(clock),
		.async_reset(async_reset),

		.read_data_1(scalar_reg_data_0_D),
		.read_data_2(scalar_reg_data_1_D)
	);
	
	Regfile_vector_32x128_vN vector_reg_file
	(
		.read_addr_1(r1),
		.read_addr_2(r2),
		.write_addr({write_address_W[4], write_address_W[3], write_address_W[2], write_address_W[1], write_address_W[0]}),
		.write_data(data_bus_W),
		.write_enable(write_vector_reg_W),

		.clock(clock),
		.async_reset(async_reset),

		.read_data_1(vector_reg_data_0_D),
		.read_data_2(vector_reg_data_1_D)
	);

	assign r1_D = {select_operand_0_vector_D, r1};
	assign r2_D = {select_operand_1_vector_D, r2};
	assign rd_D = {write_vector_reg_D, rd};

endmodule