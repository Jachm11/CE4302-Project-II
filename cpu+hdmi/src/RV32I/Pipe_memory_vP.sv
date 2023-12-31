module Pipe_memory_vP
(
	// Control signals
	input logic [31:0] instruction_E,
	input logic write_scalar_reg_E,
	input logic [1:0] result_source_E,
	input logic [2:0] width_type_E,
	input logic mem_write_E,
	input logic memory_transaction_E,
	input logic write_vector_reg_E,
	// Data signals
	input logic [127:0] ALU_result_bus_E,
	input logic [127:0] write_data_bus_E,
	input logic [5:0] rd_E,
	input logic [31:0] PC_plus_4_E,

	// Secuential signals
		input logic enabler,
		input logic clock,
		input logic async_reset,
		input logic sync_reset,

	// Control signals
		// Debug
			output logic [31:0] instruction_M,
		// Regular
			output logic write_scalar_reg_M,
			output logic [1:0] result_source_M,
			output logic [2:0] width_type_M,
			output logic mem_write_M,
			output logic memory_transaction_M,
		// Vector
			output logic write_vector_reg_M,
	// Data signals
		// Reg address
			output logic [5:0] rd_M,
		//
		output logic [127:0] ALU_result_bus_M,
		output logic [127:0] write_data_bus_M,
		//
		output logic [31:0] PC_plus_4_M
);
	always @(posedge clock or negedge async_reset)
	begin
	
		if(!async_reset)
		begin
			// Control signals
			instruction_M <= 0;
			write_scalar_reg_M <= 0;
			result_source_M <= 0;
			width_type_M <= 0;
			mem_write_M <= 0;
			memory_transaction_M <= 0;
			write_vector_reg_M <= 0;
			
			// Data signals
			ALU_result_bus_M <= 0;
			write_data_bus_M <= 0;
			rd_M <= 0;
			PC_plus_4_M <= 0;
		end
		
		else if(!sync_reset)
		begin
			// Control signals
			instruction_M <= 0;
			write_scalar_reg_M <= 0;
			result_source_M <= 0;
			width_type_M <= 0;
			mem_write_M <= 0;
			memory_transaction_M <= 0;
			write_vector_reg_M <= 0;
			
			// Data signals
			ALU_result_bus_M <= 0;
			write_data_bus_M <= 0;
			rd_M <= 0;
			PC_plus_4_M <= 0;
		end
		
		else if(enabler)
		begin
			// Control signals
			instruction_M <= instruction_E;
			write_scalar_reg_M <= write_scalar_reg_E;
			result_source_M <= result_source_E;
			width_type_M <= width_type_E;
			mem_write_M <= mem_write_E;
			memory_transaction_M <= memory_transaction_E;
			write_vector_reg_M <= write_vector_reg_E;
			
			// Data signals
			ALU_result_bus_M <= ALU_result_bus_E;
			write_data_bus_M <= write_data_bus_E;
			rd_M <= rd_E;
			PC_plus_4_M <= PC_plus_4_E;
		end
		
	end
endmodule