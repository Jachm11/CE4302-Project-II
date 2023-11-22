module Hazard_unit_RV32I
(
	input logic [5:0] r1_D,
	input logic [5:0] r2_D,
	input logic [5:0] r1_E,
	input logic [5:0] r2_E,
	
	input logic [5:0] rd_E,
	input logic [5:0] rd_M,
	input logic [5:0] rd_W,

	input logic reg_write_M,
	input logic reg_write_W,
	input logic mem_to_reg_E,
	input logic PC_source_E,
	input logic mem_transaction,
	input logic data_ready,
	input logic instruction_ready,
	

	output logic [1:0] forward_operand_0_E,
	output logic [1:0] forward_operand_1_E,

	output logic enable_fetch,
	output logic enable_decode,
	output logic enable_execute,
	output logic enable_memory,
	output logic enable_writeback,

	output logic flush_decode,
	output logic flush_execute,
	output logic flush_memory
);

	// Unidad de adelantamiento
	
		logic match_r1_E_M;
		logic match_r2_E_M;

		logic match_r1_E_W;
		logic match_r2_E_W;

		// Matches
		assign match_r1_E_M = (r1_E == rd_M) ? 1'b1 : 1'b0;
		assign match_r2_E_M = (r2_E == rd_M) ? 1'b1 : 1'b0;
		assign match_r1_E_W = (r1_E == rd_W) ? 1'b1 : 1'b0;
		assign match_r2_E_W = (r2_E == rd_W) ? 1'b1 : 1'b0;

		// ANDs
		logic and_0;
		assign and_0 = match_r1_E_M && reg_write_M;

		logic and_1;
		assign and_1 = match_r1_E_W && reg_write_W;

		logic and_2;
		assign and_2 = match_r2_E_M && reg_write_M;

		logic and_3;
		assign and_3 = match_r2_E_W && reg_write_W;

		//Exceptions
		logic ex_r1_o;
		Exception ex_r1
		(
			.required(and_1),
			.exception(and_0),
			
			.o(ex_r1_o)
		);
		assign forward_operand_0_E[0] = and_0;
		assign forward_operand_0_E[1] = ex_r1_o;

		logic ex_r2_o;
		Exception ex_r2
		(
			.required(and_3),
			.exception(and_2),
			
			.o(ex_r2_o)
		);
		assign forward_operand_1_E[0] = and_2;
		assign forward_operand_1_E[1] = ex_r2_o;

		
	// Enablers and nops
	
		logic match_r1_D_E;
		logic match_r2_D_E;

		// Load Hazard
			assign match_r1_D_E = (r1_D == rd_E) ? 1'b1 : 1'b0;
			assign match_r2_D_E = (r2_D == rd_E) ? 1'b1 : 1'b0;
			
			logic D_E_dependence;
			assign D_E_dependence = match_r1_D_E || match_r2_D_E;

			logic load_hazard;
			assign load_hazard = D_E_dependence && mem_to_reg_E;
		
		// Memory response hazards
			logic waiting_for_d_mem_to_respond;
			Exception ex_mem
			(
				.required(mem_transaction),
				.exception(data_ready),

				.o(waiting_for_d_mem_to_respond)
			);
			
			logic waiting_for_any_mem_to_respond;
			assign waiting_for_any_mem_to_respond = waiting_for_d_mem_to_respond || !instruction_ready;
			
			logic waiting_for_any_mem_to_respond_and_execute_stage_changes_PC;
			assign waiting_for_any_mem_to_respond_and_execute_stage_changes_PC = waiting_for_any_mem_to_respond && PC_source_E;
	
	// auxiliar
	logic nor_aux;
	assign nor_aux = !(waiting_for_any_mem_to_respond || load_hazard);

	logic and_aux;
	assign and_aux = &{mem_transaction, data_ready, !instruction_ready};

	logic ex_aux_o;
	Exception ex_aux
	(
		.required(load_hazard),
		.exception(waiting_for_any_mem_to_respond),
		
		.o(ex_aux_o)
	);
	
	
	// Assignments
	// Enablers
		assign enable_fetch = waiting_for_any_mem_to_respond_and_execute_stage_changes_PC || nor_aux;

		assign enable_decode = nor_aux;

		assign enable_execute = !waiting_for_any_mem_to_respond;

		assign enable_memory = !waiting_for_any_mem_to_respond || and_aux;
		
		assign enable_writeback = enable_memory;

	// Flushes
		assign flush_decode = !PC_source_E;

		assign flush_execute = !(PC_source_E || and_aux || ex_aux_o);

		assign flush_memory = 1'b1;

endmodule