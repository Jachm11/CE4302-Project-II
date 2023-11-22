module VALU_4xN #(parameter N=32)
(
	// Control signals
	input logic rerouting_select,
	input logic [2:0] rerouting_code,
	input logic [3:0] ALU_op_E,

	// Data signals
	input logic [4*N-1:0] operand_0_bus,
	input logic [4*N-1:0] operand_1_bus,

	output logic [4*N-1:0] ALU_result_bus
);

	logic [4*N-1:0] ALU_aux_result;
	
	ALU_RV32I #(.N(N)) ALU_0
	(
		.op(ALU_op_E),
		.a(operand_0_bus[N-1:0]),
		.b(operand_1_bus[N-1:0]),

		.o(ALU_aux_result[N-1:0])
	);

	ALU_RV32I #(.N(N)) ALU_1
	(
		.op(ALU_op_E),
		.a(operand_0_bus[2*N-1:N]),
		.b(operand_1_bus[2*N-1:N]),

		.o(ALU_aux_result[2*N-1:N])
	);

	ALU_RV32I #(.N(N)) ALU_2
	(
		.op(ALU_op_E),
		.a(operand_0_bus[3*N-1:2*N]),
		.b(operand_1_bus[3*N-1:2*N]),

		.o(ALU_aux_result[3*N-1:2*N])
	);

	ALU_RV32I #(.N(N)) ALU_3
	(
		.op(ALU_op_E),
		.a(operand_0_bus[4*N-1:3*N]),
		.b(operand_1_bus[4*N-1:3*N]),

		.o(ALU_aux_result[4*N-1:3*N])
	);
	
	logic [4*N-1:0] routing_aux_result;
	Router_RV32I router
	(
		.rerouting_code(rerouting_code),
		.scalar(operand_0_bus[N-1:0]),
		.vector_in(operand_1_bus),

		.vector_out(routing_aux_result)
	);

	Multiplexer_MxN #(.M(2), .N(4*N)) mux
	(
		.select(rerouting_select),
		.channels({routing_aux_result, ALU_aux_result}),
		
		.channel_out(ALU_result_bus)
	);
endmodule