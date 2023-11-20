module Pipe_execute_vP
(
	// Control signals
	input logic [31:0] instruction_D,

	input logic write_scalar_reg_D,
	input logic [1:0] result_source_D,
	input logic [2:0] width_type_D,
	input logic mem_write_D,
	input logic [3:0] ALU_op_D,
	input logic [2:0] cond_code_D,
	input logic ALU_source_D,
	input logic branch_D,
	input logic jump_D,
	input logic i_jump_D,
	input logic PC_to_ALU_D,
	input logic memory_transaction_D,

	input logic write_vector_reg_D,
	input logic select_operand_0_vector_D,
	input logic select_operand_1_vector_D,
	input logic rerouting_select_D,
	input logic [2:0] rerouting_code_D,

	// Data signals
	input logic [5:0] rd_D,
	input logic [5:0] r1_D,
	input logic [5:0] r2_D,
	
	input logic [31:0] scalar_reg_data_0_D,
	input logic [31:0] scalar_reg_data_1_D,

	input logic [127:0] vector_reg_data_0_D,
	input logic [127:0] vector_reg_data_1_D,

	input logic [31:0] immediate_D,	
	input logic [31:0] PC_D,
	input logic [31:0] PC_plus_4_D,
	
	input logic enabler,
	input logic clock,
	input logic async_reset,
	input logic sync_reset,
	
	// Control signals
	output logic [31:0] instruction_E,

	output logic write_scalar_reg_E,
	output logic [1:0] result_source_E,
	output logic [2:0] width_type_E,
	output logic mem_write_E,
	output logic [3:0] ALU_op_E,
	output logic [2:0] cond_code_E,
	output logic ALU_source_E,
	output logic branch_E,
	output logic jump_E,
	output logic i_jump_E,
	output logic PC_to_ALU_E,
	output logic memory_transaction_E,
	
	output logic write_vector_reg_E,
	output logic select_operand_0_vector_E,
	output logic select_operand_1_vector_E,
	output logic rerouting_select_E,
	output logic [2:0] rerouting_code_E,

	// Data signals
	output logic [5:0] rd_E,
	output logic [5:0] r1_E,
	output logic [5:0] r2_E,
	
	output logic [31:0] scalar_reg_data_0_E,
	output logic [31:0] scalar_reg_data_1_E,

	output logic [127:0] vector_reg_data_0_E,
	output logic [127:0] vector_reg_data_1_E,

	output logic [31:0] immediate_E,	
	output logic [31:0] PC_E,
	output logic [31:0] PC_plus_4_E
);
	always @(posedge clock or negedge async_reset)
	begin

		if(!async_reset)
		begin
			// Control signals
			instruction_E <= 0;

			write_scalar_reg_E <= 0;
			result_source_E <= 0;
			width_type_E <= 0;
			mem_write_E <= 0;
			ALU_op_E <= 0;
			cond_code_E <= 0;
			ALU_source_E <= 0;
			branch_E <= 0;
			jump_E <= 0;
			i_jump_E <= 0;
			PC_to_ALU_E <= 0;
			memory_transaction_E <= 0;
				
			write_vector_reg_E <= 0;
			select_operand_0_vector_E <= 0;
			select_operand_1_vector_E <= 0;
			rerouting_select_E <= 0;
			rerouting_code_E <= 0;

			// Data signals
			rd_E <= 0;
			r1_E <= 0;
			r2_E <= 0;
				
			scalar_reg_data_0_E <= 0;
			scalar_reg_data_1_E <= 0;

			vector_reg_data_0_E <= 0;
			vector_reg_data_1_E <= 0;

			immediate_E <= 0;
			PC_E <= 0;
			PC_plus_4_E <= 0;
		end

		else if(!sync_reset)
		begin
			// Control signals
			instruction_E <= 0;

			write_scalar_reg_E <= 0;
			result_source_E <= 0;
			width_type_E <= 0;
			mem_write_E <= 0;
			ALU_op_E <= 0;
			cond_code_E <= 0;
			ALU_source_E <= 0;
			branch_E <= 0;
			jump_E <= 0;
			i_jump_E <= 0;
			PC_to_ALU_E <= 0;
			memory_transaction_E <= 0;
				
			write_vector_reg_E <= 0;
			select_operand_0_vector_E <= 0;
			select_operand_1_vector_E <= 0;
			rerouting_select_E <= 0;
			rerouting_code_E <= 0;

			// Data signals
			rd_E <= 0;
			r1_E <= 0;
			r2_E <= 0;
				
			scalar_reg_data_0_E <= 0;
			scalar_reg_data_1_E <= 0;

			vector_reg_data_0_E <= 0;
			vector_reg_data_1_E <= 0;

			immediate_E <= 0;
			PC_E <= 0;
			PC_plus_4_E <= 0;
		end
		
		else if(enabler)
		begin
			// Control signals
			instruction_E <= instruction_D;

			write_scalar_reg_E <= write_scalar_reg_D;
			result_source_E <= result_source_D;
			width_type_E <= width_type_D;
			mem_write_E <= mem_write_D;
			ALU_op_E <= ALU_op_D;
			cond_code_E <= cond_code_D;
			ALU_source_E <= ALU_source_D;
			branch_E <= branch_D;
			jump_E <= jump_D;
			i_jump_E <= i_jump_D;
			PC_to_ALU_E <= PC_to_ALU_D;
			memory_transaction_E <= memory_transaction_D;
				
			write_vector_reg_E <= write_vector_reg_D;
			select_operand_0_vector_E <= select_operand_0_vector_D;
			select_operand_1_vector_E <= select_operand_1_vector_D;
			rerouting_select_E <= rerouting_select_D;
			rerouting_code_E <= rerouting_code_D;

			// Data signals
			rd_E <= rd_D;
			r1_E <= r1_D;
			r2_E <= r2_D;
				
			scalar_reg_data_0_E <= scalar_reg_data_0_D;
			scalar_reg_data_1_E <= scalar_reg_data_1_D;

			vector_reg_data_0_E <= vector_reg_data_0_D;
			vector_reg_data_1_E <= vector_reg_data_1_D;

			immediate_E <= immediate_D;
			PC_E <= PC_D;
			PC_plus_4_E <= PC_plus_4_D;
		end
		
	end
endmodule