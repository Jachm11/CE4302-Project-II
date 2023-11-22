module RV32I
(
	input logic [127:0] read_data_bus,
	input logic data_ready,
	input logic [31:0] instruction,
	input logic instruction_ready,

	// Secuential signals
	input logic clock,
	input logic async_reset,

	output logic memory_transaction,
	output logic mem_write,
	output logic [31:0] ALU_result,
	output logic [127:0] data_out_bus,
	output logic [15:0] byte_enablers,
	output logic [31:0] PC
);

	// Fetch Stage
		logic [31:0] PC_F;
		logic [31:0] PC_plus_4_F;

	// Decode Stage
		// Control signals
			// Debug
				logic [31:0] instruction_D;
			// regular
				logic write_scalar_reg_D;
				logic [1:0] result_source_D;
				logic [2:0] width_type_D;
				logic mem_write_D;
				logic [3:0] ALU_op_D;
				logic [2:0] cond_code_D;
				logic ALU_source_D;
				logic jump_D;
				logic i_jump_D;
				logic branch_D;
				logic PC_to_ALU_D;
				logic memory_transaction_D;
			// vectorial
				logic write_vector_reg_D;
				logic select_operand_0_vector_D;
				logic select_operand_1_vector_D;
				logic rerouting_select_D;
				logic [2:0] rerouting_code_D;
		// Data signals
			// Reg address
				logic [5:0] r1_D;
				logic [5:0] r2_D;
				logic [5:0] rd_D;
			// Scalar data
				logic [31:0] scalar_reg_data_0_D;
				logic [31:0] scalar_reg_data_1_D;
			// Vector data
				logic [127:0] vector_reg_data_0_D;
				logic [127:0] vector_reg_data_1_D;
			//
			logic [31:0] immediate_D;
			logic [31:0] PC_D;
			logic [31:0] PC_plus_4_D;
			logic [31:0] predicted_PC_D; // PPC


	// Execute Stage
		// Control signals
			// Debug
				logic [31:0] instruction_E;
			// Regular
				logic write_scalar_reg_E;
				logic [1:0] result_source_E;
				logic [2:0] width_type_E;
				logic mem_write_E;
				logic [3:0] ALU_op_E;
				logic [2:0] cond_code_E;
				logic ALU_source_E;
				logic branch_E;
				logic jump_E;
				logic i_jump_E;
				logic PC_to_ALU_E;
				logic memory_transaction_E;
				logic change_PC_E;
			// Vector
				logic write_vector_reg_E;
				logic select_operand_0_vector_E;
				logic select_operand_1_vector_E;
				logic rerouting_select_E;
				logic [2:0] rerouting_code_E;
		// Data signals
			// Reg address
				logic [5:0] rd_E;
				logic [5:0] r1_E;
				logic [5:0] r2_E;
			// Scalar data in
				logic [31:0] scalar_reg_data_0_E;
				logic [31:0] scalar_reg_data_1_E;
			// Vector data in
				logic [127:0] vector_reg_data_0_E;
				logic [127:0] vector_reg_data_1_E;
			//
			logic [31:0] immediate_E;
			//
			logic [127:0] ALU_result_bus_E;
			logic [127:0] write_data_bus_E;
			//
			logic [1:0] PC_source_E; // PCS
			logic [31:0] PC_E;
			logic [31:0] PC_plus_4_E;


	// Memory stage
		// Control signals
			// Debug
				logic [31:0] instruction_M;
			// Regular
				logic write_scalar_reg_M;
				logic [1:0] result_source_M;
				logic [2:0] width_type_M;
				logic mem_write_M;
				logic memory_transaction_M;
			// Vector
				logic write_vector_reg_M;
		// Data signals
			// Reg address
				logic [5:0] rd_M;
			//
			logic [127:0] ALU_result_bus_M;
			logic [127:0] write_data_bus_M;
			logic [127:0] read_data_bus_M;
			logic [31:0] read_data_0_M;
			//
			logic [31:0] PC_plus_4_M;
	

	
	// Writeback Stage
		// Control signals out
			// Debug
				logic [31:0] instruction_W;
			// Regular
				logic write_scalar_reg_W;
				logic [1:0] result_source_W;
			// Vector
				logic write_vector_reg_W;
		// Data signals
			// Reg address
				logic [5:0] rd_W;
			//
				logic [127:0] ALU_result_bus_W;
				logic [127:0] read_data_bus_W;
				logic [127:0] data_bus_W;// Despues del mux final
			//
				logic [31:0] PC_plus_4_W;


	// Hazard Unit
	logic enable_fetch; // EF
	logic enable_decode; // ED
	logic enable_execute;
	logic enable_memory;
	logic enable_writeback;	
	//
	logic flush_decode; // FD
	logic flush_execute; // FE
	logic flush_memory; // FM
	//
	logic [1:0] forward_operand_0_E;
	logic [1:0] forward_operand_1_E;


	Fetch_stage FS
	(
		// mux de eleccion de PC
			// select
				.PC_source_E(PC_source_E),
			// Channels
				.PC_plus_4_E(PC_plus_4_E),
				.ALU_result_0_E(ALU_result_bus_E[31:0]),

		// Reg PC
			.enable_fetch(enable_fetch),
		
		// Mux de prediccion
			// Select
				.branch_prediction_D(branch_D),
			// Channels
				.predicted_PC_D(predicted_PC_D),

		// Secuential signals
			.clock(clock),
			.async_reset(async_reset),

		// Signals out
			.PC_F(PC_F),
			.PC_plus_4_F(PC_plus_4_F)
	);
	assign PC = PC_F;
	
	Pipe_decode_vP PD
	(
		// Signals in
			.instruction_F(instruction),
			.PC_F(PC_F),
			.PC_plus_4_F(PC_plus_4_F),

		// Secuential signals		
			.enabler(enable_decode),
			.clock(clock),
			.async_reset(async_reset),
			.sync_reset(flush_decode),

		// Signals out
			.instruction_D(instruction_D),
			.PC_D(PC_D),
			.PC_plus_4_D(PC_plus_4_D)
	);

	Decode_stage DS
	(
		// Signals in
			.instruction_D(instruction_D),
			.PC_D(PC_D),	
			// Reg files
				.write_address_W(rd_W),
				.write_scalar_reg_W(write_scalar_reg_W),
				.write_vector_reg_W(write_vector_reg_W),
				.data_bus_W(data_bus_W),

		// Secuential signals
			.clock(clock),
			.async_reset(async_reset),
		
		// Control signals out
			.write_scalar_reg_D(write_scalar_reg_D),
			.result_source_D(result_source_D),
			.width_type_D(width_type_D),
			.mem_write_D(mem_write_D),
			.ALU_op_D(ALU_op_D),
			.cond_code_D(cond_code_D),
			.ALU_source_D(ALU_source_D),
			.branch_D(branch_D),
			.jump_D(jump_D),
			.i_jump_D(i_jump_D),
			.PC_to_ALU_D(PC_to_ALU_D),
			.memory_transaction_D(memory_transaction_D),
			//
			.write_vector_reg_D(write_vector_reg_D),
			.select_operand_0_vector_D(select_operand_0_vector_D),
			.select_operand_1_vector_D(select_operand_1_vector_D),
			.rerouting_select_D(rerouting_select_D),
			.rerouting_code_D(rerouting_code_D),
		
		// Data signals out
			.scalar_reg_data_0_D(scalar_reg_data_0_D),
			.scalar_reg_data_1_D(scalar_reg_data_1_D),
			//
			.vector_reg_data_0_D(vector_reg_data_0_D),
			.vector_reg_data_1_D(vector_reg_data_1_D),
			//
			.r1_D(r1_D),
			.r2_D(r2_D),
			.rd_D(rd_D),
			//
			.immediate_D(immediate_D),
			//
			.predicted_PC_D(predicted_PC_D)
	);

	Pipe_execute_vP PE
	(
		// Control signals in
			.instruction_D(instruction_D),
			//
			.write_scalar_reg_D(write_scalar_reg_D),
			.result_source_D(result_source_D),
			.width_type_D(width_type_D),
			.mem_write_D(mem_write_D),
			.ALU_op_D(ALU_op_D),
			.cond_code_D(cond_code_D),
			.ALU_source_D(ALU_source_D),
			.branch_D(branch_D),
			.jump_D(jump_D),
			.i_jump_D(i_jump_D),
			.PC_to_ALU_D(PC_to_ALU_D),
			.memory_transaction_D(memory_transaction_D),
			//
			.write_vector_reg_D(write_vector_reg_D),
			.select_operand_0_vector_D(select_operand_0_vector_D),
			.select_operand_1_vector_D(select_operand_1_vector_D),
			.rerouting_select_D(rerouting_select_D),
			.rerouting_code_D(rerouting_code_D),
		
		// Data signals in
			.rd_D(rd_D),
			.r1_D(r1_D),
			.r2_D(r2_D),
			//
			.scalar_reg_data_0_D(scalar_reg_data_0_D),
			.scalar_reg_data_1_D(scalar_reg_data_1_D),
			//
			.vector_reg_data_0_D(vector_reg_data_0_D),
			.vector_reg_data_1_D(vector_reg_data_1_D),
			//
			.immediate_D(immediate_D),	
			.PC_D(PC_D),
			.PC_plus_4_D(PC_plus_4_D),
		
		// Secuential signals
			.enabler(enable_execute),
			.clock(clock),
			.async_reset(async_reset),
			.sync_reset(flush_execute),
	
		// Control signals out
			.instruction_E(instruction_E),
			.write_scalar_reg_E(write_scalar_reg_E),
			.result_source_E(result_source_E),
			.width_type_E(width_type_E),
			.mem_write_E(mem_write_E),
			.ALU_op_E(ALU_op_E),
			.cond_code_E(cond_code_E),
			.ALU_source_E(ALU_source_E),
			.branch_E(branch_E),
			.jump_E(jump_E),
			.i_jump_E(i_jump_E),
			.PC_to_ALU_E(PC_to_ALU_E),
			.memory_transaction_E(memory_transaction_E),
			//
			.write_vector_reg_E(write_vector_reg_E),
			.select_operand_0_vector_E(select_operand_0_vector_E),
			.select_operand_1_vector_E(select_operand_1_vector_E),
			.rerouting_select_E(rerouting_select_E),
			.rerouting_code_E(rerouting_code_E),
		
		// Data signals out
			.rd_E(rd_E),
			.r1_E(r1_E),
			.r2_E(r2_E),
			//
			.scalar_reg_data_0_E(scalar_reg_data_0_E),
			.scalar_reg_data_1_E(scalar_reg_data_1_E),
			//
			.vector_reg_data_0_E(vector_reg_data_0_E),
			.vector_reg_data_1_E(vector_reg_data_1_E),
			//
			.immediate_E(immediate_E),
			.PC_E(PC_E),
			.PC_plus_4_E(PC_plus_4_E)
	);

	Execute_stage ES
	(
		// Control signals in
			.select_operand_0_vector_E(select_operand_0_vector_E),
			.select_operand_1_vector_E(select_operand_1_vector_E),
			.forward_operand_0_E(forward_operand_0_E),
			.forward_operand_1_E(forward_operand_1_E),
			.cond_code_E(cond_code_E),
			.branch_E(branch_E),
			.jump_E(jump_E),
			.i_jump_E(i_jump_E),
			.PC_to_ALU_E(PC_to_ALU_E),
			.ALU_source_E(ALU_source_E),
			.ALU_op_E(ALU_op_E),
			//
			.rerouting_code_E(rerouting_code_E),
			.rerouting_select_E(rerouting_select_E),

		// Data signals in
			.scalar_reg_data_0_E(scalar_reg_data_0_E),
			.scalar_reg_data_1_E(scalar_reg_data_1_E),
			//
			.vector_reg_data_0_E(vector_reg_data_0_E),
			.vector_reg_data_1_E(vector_reg_data_1_E),
			//
			.PC_E(PC_E),
			.immediate_E(immediate_E),
			//
			.data_bus_M(ALU_result_bus_M),
			.data_bus_W(data_bus_W),

		// Control signals out
			.PC_source_E(PC_source_E),
			.change_PC_E(change_PC_E),

		// Data signals out
			.ALU_result_bus_E(ALU_result_bus_E),
			.write_data_bus_E(write_data_bus_E)
	);

	logic mem_to_reg_E;
	logic [3:0] dec_o;
	Decoder_N #(.N(2)) dec
	(
		.code(result_source_E),

		.o(dec_o)
	);
	assign mem_to_reg_E = dec_o[1];
	
	Pipe_memory_vP PM
	(
		// Control signals in
			// Debug
				.instruction_E(instruction_E),
			// Regular
				.write_scalar_reg_E(write_scalar_reg_E),
				.result_source_E(result_source_E),
				.width_type_E(width_type_E),
				.mem_write_E(mem_write_E),
				.memory_transaction_E(memory_transaction_E),
			// Vector
				.write_vector_reg_E(write_vector_reg_E),
		// Data signals in
			// Reg
				.rd_E(rd_E),
			//
				.ALU_result_bus_E(ALU_result_bus_E),
				.write_data_bus_E(write_data_bus_E),
			//
				.PC_plus_4_E(PC_plus_4_E),

		// Secuential signals
			.enabler(enable_memory),
			.clock(clock),
			.async_reset(async_reset),
			.sync_reset(flush_memory),

		// Control signals out
			// Debug
				.instruction_M(instruction_M),
			// Regular
				.write_scalar_reg_M(write_scalar_reg_M),
				.result_source_M(result_source_M),
				.width_type_M(width_type_M),
				.mem_write_M(mem_write_M),
				.memory_transaction_M(memory_transaction_M),
			// Vector
				.write_vector_reg_M(write_vector_reg_M),
		// Data signals out
			// Reg
				.rd_M(rd_M),
			//
				.ALU_result_bus_M(ALU_result_bus_M),
				.write_data_bus_M(write_data_bus_M),
			//
				.PC_plus_4_M(PC_plus_4_M)
	);
	logic reg_write_M;
	assign reg_write_M = write_scalar_reg_M || write_vector_reg_M;
	
	assign memory_transaction = memory_transaction_M;
	assign mem_write = mem_write_M;
	assign ALU_result = ALU_result_bus_M[31:0];
	assign data_out_bus = write_data_bus_M;
	
	Output_byte_handler_RV32I OBH
	(
		.width_type(width_type_M),
		.enabler(mem_write_M),

		.byte_enablers(byte_enablers)
	);
	
	Input_byte_handler_RV32I IBH
	(
		.width_type(width_type_M),
		.read_data_0(read_data_bus[31:0]),
		
		.o(read_data_0_M)
	);
	assign read_data_bus_M = {read_data_bus[127:32] , read_data_0_M};

	
	Pipe_writeback_vP PW
	(
		// Control signals in
			// Debug
				.instruction_M(instruction_M),
			// Regular
				.write_scalar_reg_M(write_scalar_reg_M),
				.result_source_M(result_source_M),
			// Vector
				.write_vector_reg_M(write_vector_reg_M),
		// Data signals in
			// Reg address
				.rd_M(rd_M),
			//
				.ALU_result_bus_M(ALU_result_bus_M),
				.read_data_bus_M(read_data_bus_M),
			//
				.PC_plus_4_M(PC_plus_4_M),
			
		// Secuential signals
			.enabler(enable_writeback),
			.clock(clock),
			.async_reset(async_reset),

		// Control signals out
			// Debug
				.instruction_W(instruction_W),
			// Regular
				.write_scalar_reg_W(write_scalar_reg_W),
				.result_source_W(result_source_W),
			// Vector
				.write_vector_reg_W(write_vector_reg_W),
		// Data signals
			// Reg address
				.rd_W(rd_W),
			//
				.ALU_result_bus_W(ALU_result_bus_W),
				.read_data_bus_W(read_data_bus_W),
			//
				.PC_plus_4_W(PC_plus_4_W)
	);
	
	logic reg_write_W;
	assign reg_write_W = write_scalar_reg_W || write_vector_reg_W;

	
	Multiplexer_MxN #(.M(4), .N(128)) mux_W
	(
		.select(result_source_W),
		.channels({128'b0 , {96'b0, PC_plus_4_W}, read_data_bus_W, ALU_result_bus_W}),
		
		.channel_out(data_bus_W)
	);

	Hazard_unit_RV32I HU
	(
		.r1_D(r1_D),
		.r2_D(r2_D),
		.r1_E(r1_E),
		.r2_E(r2_E),
		
		.rd_E(rd_E),
		.rd_M(rd_M),
		.rd_W(rd_W),

		.reg_write_M(reg_write_M),
		.reg_write_W(reg_write_W),
		.mem_to_reg_E(mem_to_reg_E),
		.PC_source_E(change_PC_E),
		.mem_transaction(memory_transaction_M),
		.data_ready(data_ready),
		.instruction_ready(instruction_ready),
		
		// out
		.forward_operand_0_E(forward_operand_0_E),
		.forward_operand_1_E(forward_operand_1_E),

		.enable_fetch(enable_fetch),
		.enable_decode(enable_decode),
		.enable_execute(enable_execute),
		.enable_memory(enable_memory),
		.enable_writeback(enable_writeback),

		.flush_decode(flush_decode),
		.flush_execute(flush_execute),
		.flush_memory(flush_memory)
	);
	
	
endmodule