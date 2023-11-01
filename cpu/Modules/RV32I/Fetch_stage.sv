module Fetch_stage
(
	// Nets	
	
	// mux de eleccion de PC
		// select
		input logic [1:0] pc_src_select_E,
		// Channels
		input logic [31:0] PC_plus_4_E,
		input logic [31:0] alu_result_E,

	// Reg PC
		// Enabler
		input logic enable_fetch,
	
	// Mux de prediccion
		// Select
		input logic branch_prediction_E,
		// Channels
		input logic [31:0] predicted_PC_D,

	input logic clock,
	input logic async_reset,
	
	output logic [31:0] PC_F,
	output logic [31:0] PC_plus_4_F
);
	// Aux nets
	// mux_pc_src
	logic [31:0] mux_pc_src_o;
	
	// Reg PC
	logic [31:0] reg_pc_o;

		
	// -- Modules --
	
	Multiplexer_MxN #(.M(4), .N(32)) mux_pc_src
	(
		.select(pc_src_select_E),
		.channels({32'd0, alu_result_E, PC_plus_4_E, PC_plus_4_F}),
		
		.channel_out(mux_pc_src_o) 
	);

	Register_N_with_enabler_vP #(.N(32)) reg_pc
	(
		.data_in(mux_pc_src_o),
		.enabler(enable_fetch),
		
		.clock(clock),
		.async_reset(async_reset),
		
		.data_out(reg_pc_o)		
	);


	Multiplexer_MxN #(.M(2), .N(32)) mux_prediction
	(
		.select(branch_prediction_E),
		.channels({predicted_PC_D, reg_pc_o}),

		.channel_out(PC_F)
	);


	Adder_N #(.N(32)) adder_pc_plus_4
	(
		.A(PC_F),
		.B(32'd4),
		
		.O(PC_plus_4_F)
	);
endmodule