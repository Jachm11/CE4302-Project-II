module Hazard_unit_RV32I
(
	input logic [4:0] Rs1_D,
	input logic [4:0] Rs2_D,
	input logic [4:0] Rs1_E,
	input logic [4:0] Rs2_E,
	
	input logic [4:0] Rd_E,
	input logic [4:0] Rd_M,
	input logic [4:0] Rd_W,

	input logic reg_write_M,
	input logic reg_write_W,
	input logic mem_to_reg_E,
	input logic pc_src_E,
	input logic mem_transaction,
	input logic data_ready,
	input logic instruction_ready,
	
	
	output logic [1:0] forward_Rs1_E,
	output logic [1:0] forward_Rs2_E,

	output logic enable_fetch,
	output logic enable_decode,
	output logic enable_execute,
	output logic enable_memory,
	
	output logic flush_decode,
	output logic flush_execute,
	output logic flush_memory
);

	// Unidad de adelantamiento
	
		logic match_Rs1_E_M;
		logic match_Rs2_E_M;

		logic match_Rs1_E_W;
		logic match_Rs2_E_W;

		// Matches
		always_comb
		begin
			if(Rs1_E == Rd_M)
				match_Rs1_E_M = 1'b1;
			else
				match_Rs1_E_M = 1'b0;
				
			if(Rs2_E == Rd_M)
				match_Rs2_E_M = 1'b1;
			else
				match_Rs2_E_M = 1'b0;
				
			if(Rs1_E == Rd_W)
				match_Rs1_E_W = 1'b1;
			else
				match_Rs1_E_W = 1'b0;

			if(Rs2_E == Rd_W)
				match_Rs2_E_W = 1'b1;
			else
				match_Rs2_E_W = 1'b0;
		end

		// ANDs
		logic and_0;
		assign and_0 = match_Rs1_E_M && reg_write_M;

		logic and_1;
		assign and_1 = match_Rs1_E_W && reg_write_W;

		logic and_2;
		assign and_2 = match_Rs2_E_M && reg_write_M;

		logic and_3;
		assign and_3 = match_Rs2_E_W && reg_write_W;

		//Exceptions
		logic ex_Rs1_o;
		Exception ex_Rs1(and_1, and_0, ex_Rs1_o);
		assign forward_Rs1_E[0] = and_0;
		assign forward_Rs1_E[1] = ex_Rs1_o;

		logic ex_Rs2_o;
		Exception ex_Rs2(and_3, and_2, ex_Rs2_o);
		assign forward_Rs2_E[0] = and_2;
		assign forward_Rs2_E[1] = ex_Rs2_o;

		
	// Enablers and nops
	
		logic match_Rs1_D_E;
		logic match_Rs2_D_E;

		// Load Hazard
			always_comb
			begin
				if(Rs1_D == Rd_E)
					match_Rs1_D_E = 1'b1;
				else
					match_Rs1_D_E = 1'b0;
					
				if(Rs2_D == Rd_E)
					match_Rs2_D_E = 1'b1;
				else
					match_Rs2_D_E = 1'b0;
			end
			
			logic D_E_dependence;
			assign D_E_dependence = match_Rs1_D_E || match_Rs2_D_E;

			logic load_hazard;
			assign load_hazard = D_E_dependence && mem_to_reg_E;
		
		// Memory response hazards
			logic ex_mem_o;
			Exception ex_mem(mem_transaction, data_ready, ex_mem_o);
			
			logic mem_or;
			assign mem_or = ex_mem_o || !instruction_ready;
			
			logic mem_and;
			assign mem_and = mem_or && pc_src_E;
	
	// auxiliar
	logic nor_aux;
	assign nor_aux = !(mem_or || load_hazard);

	logic and_aux;
	assign and_aux = mem_transaction && data_ready && !instruction_ready;

	logic ex_aux_o;
	Exception ex_aux(load_hazard, mem_or, ex_aux_o);
	
	
	// Assignments
	// Enablers
		assign enable_fetch = mem_and || nor_aux;

		assign enable_decode = nor_aux;

		assign enable_execute = !mem_or;

		assign enable_memory = !mem_or || and_aux;

	// Flushes
		assign flush_decode = !pc_src_E;

		assign flush_execute = !(pc_src_E || and_aux || ex_aux_o);

		assign flush_memory = 1'b1;

endmodule