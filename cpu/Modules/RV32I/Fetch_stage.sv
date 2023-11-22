module Fetch_stage
(
	// mux de eleccion de PC
		// select
		input logic [1:0] PC_source_E,
		// Channels
		input logic [31:0] PC_plus_4_E,
		input logic [31:0] ALU_result_0_E,

	// Reg PC
		// Enabler
		input logic enable_fetch,
	
	// Mux de prediccion
		// Select
		input logic branch_prediction_D,
		// Channels
		input logic [31:0] predicted_PC_D,

	input logic clock,
	input logic async_reset,
	
	output logic [31:0] PC_F,
	output logic [31:0] PC_plus_4_F
);
	logic [31:0] mux_PC_source_o;	
	Multiplexer_MxN #(.M(4), .N(32)) mux_PC_source
	(
		.select(PC_source_E),
		.channels({32'd0, ALU_result_0_E, PC_plus_4_E, PC_plus_4_F}),
		
		.channel_out(mux_PC_source_o) 
	);

	logic [31:0] reg_PC_o;
	Register_N_with_enabler_vP #(.N(32)) PC
	(
		.data_in(mux_PC_source_o),
		.enabler(enable_fetch),
		
		.clock(clock),
		.async_reset(async_reset),
		
		.data_out(reg_PC_o)		
	);

	Multiplexer_MxN #(.M(2), .N(32)) mux_prediction
	(
		.select(branch_prediction_D),
		.channels({predicted_PC_D, reg_PC_o}),

		.channel_out(PC_F)
	);

	Adder_N #(.N(32)) adder_pc_plus_4
	(
		.A(PC_F),
		.B(32'd4),
		
		.O(PC_plus_4_F)
	);
endmodule