module Pipe_writeback_vP
(
		// Control signals in
			// Debug
				input logic [31:0] instruction_M,
			// Regular
				input logic write_scalar_reg_M,
				input logic [1:0] result_source_M,
			// Vector
				input logic write_vector_reg_M,
		// Data signals in
			// Reg address
				input logic [5:0] rd_M,
			//
				input logic [127:0] ALU_result_bus_M,
				input logic [127:0] read_data_bus_M,
			//
				input logic [31:0] PC_plus_4_M,

		// Secuential signals
			input logic enabler,
			input logic clock,
			input logic async_reset,

		// Control signals out
			// Debug
				output logic [31:0] instruction_W,
			// Regular
				output logic write_scalar_reg_W,
				output logic [1:0] result_source_W,
			// Vector
				output logic write_vector_reg_W,
		// Data signals
			// Reg address
				output logic [5:0] rd_W,
			//
				output logic [127:0] ALU_result_bus_W,
				output logic [127:0] read_data_bus_W,
			//
				output logic [31:0] PC_plus_4_W
);
	always @(posedge clock or negedge async_reset)
	begin

		if(!async_reset)
		begin
			// Control signals
			instruction_W <= 0;
			write_scalar_reg_W <= 0;
			result_source_W <= 0;
			write_vector_reg_W <= 0;
			
			// Data signals
			ALU_result_bus_W <= 0;
			read_data_bus_W <= 0;
			rd_W <= 0;
			PC_plus_4_W <= 0;
		end
		
		else if(enabler)
		begin
			// Control signals
			instruction_W <= instruction_M;
			write_scalar_reg_W <= write_scalar_reg_M;
			result_source_W <= result_source_M;
			write_vector_reg_W <= write_vector_reg_M;
			
			// Data signals
			ALU_result_bus_W <= ALU_result_bus_M;
			read_data_bus_W <= read_data_bus_M;
			rd_W <= rd_M;
			PC_plus_4_W <= PC_plus_4_M;		
		end
	end

endmodule