module Execute_stage
(
	// Control signals
	input logic select_operand_0_vector_E,
	input logic select_operand_1_vector_E,
	input logic [1:0] forward_operand_0_E,
	input logic [1:0] forward_operand_1_E,
	input logic [2:0] cond_code_E,
	input logic branch_E,
	input logic jump_E,
	input logic i_jump_E,
	input logic PC_to_ALU_E,
	input logic ALU_source_E,
	input logic [3:0] ALU_op_E,
	input logic [2:0] rerouting_code_E,
	input logic rerouting_select_E,
	
	output logic [1:0] PC_source_E,
	output logic change_PC_E,
	
	// Data signals
	
	input logic [31:0] scalar_reg_data_0_E,
	input logic [31:0] scalar_reg_data_1_E,
	input logic [127:0] vector_reg_data_0_E,
	input logic [127:0] vector_reg_data_1_E,
	input logic [31:0] PC_E,
	input logic [31:0] immediate_E,
	
	input logic [127:0] data_bus_M,
	input logic [127:0] data_bus_W,

	output logic [127:0] ALU_result_bus_E,
	output logic [127:0] write_data_bus_E
	
);
	logic [31:0] mux_fusion_0_o;
	Multiplexer_MxN #(.M(2), .N(32)) mux_fusion_0
	(
		.select(select_operand_0_vector_E),
		.channels({vector_reg_data_0_E[31:0], scalar_reg_data_0_E}),
		
		.channel_out(mux_fusion_0_o)
	);

	logic [31:0] mux_fusion_1_o;
	Multiplexer_MxN #(.M(2), .N(32)) mux_fusion_1
	(
		.select(select_operand_1_vector_E),
		.channels({vector_reg_data_1_E[31:0], scalar_reg_data_1_E}),
		
		.channel_out(mux_fusion_1_o)
	);

	logic [127:0] mux_forward_0_o;
	Multiplexer_MxN #(.M(4), .N(128)) mux_forward_0
	(
		.select(forward_operand_0_E),
		.channels({128'd0, data_bus_W, data_bus_M, {vector_reg_data_0_E[127:32], mux_fusion_0_o}}),
		
		.channel_out(mux_forward_0_o)
	);

	logic [127:0] mux_forward_1_o;
	Multiplexer_MxN #(.M(4), .N(128)) mux_forward_1
	(
		.select(forward_operand_1_E),
		.channels({128'd0, data_bus_W, data_bus_M, {vector_reg_data_1_E[127:32], mux_fusion_1_o}}),
		
		.channel_out(mux_forward_1_o)
	);
	
	
	logic branch_approved;
	Comparison_unit_RV32I comp
	(
		.cond(cond_code_E),
		.a(mux_forward_0_o[31:0]),
		.b(mux_forward_1_o[31:0]),
		
		.approved(branch_approved)
	);
	
	assign PC_source_E[0] = branch_E && !branch_approved;
	assign PC_source_E[1] = jump_E || i_jump_E;
	
	assign change_PC_E = PC_source_E[0] || PC_source_E[1];
	
	assign write_data_bus_E = mux_forward_1_o;

	logic [127:0] mux_operand_0_o;
	Multiplexer_MxN #(.M(2), .N(128)) mux_operand_0
	(
		.select(PC_to_ALU_E),
		.channels({{96'b0, PC_E}, mux_forward_0_o}),
		.channel_out(mux_operand_0_o)
	);

	logic [127:0] mux_operand_1_o;
	Multiplexer_MxN #(.M(2), .N(128)) mux_operand_1
	(
		.select(ALU_source_E),
		.channels({{96'b0, immediate_E}, mux_forward_1_o}),
		
		.channel_out(mux_operand_1_o)
	);
	
	VALU_4xN #(.N(32)) VALU
	(
		// Control signals
		.rerouting_select(rerouting_select_E),
		.rerouting_code(rerouting_code_E),
		.ALU_op_E(ALU_op_E),

		// Data signals
		.operand_0_bus(mux_operand_0_o),
		.operand_1_bus(mux_operand_1_o),

		.ALU_result_bus(ALU_result_bus_E)
	);
	

endmodule