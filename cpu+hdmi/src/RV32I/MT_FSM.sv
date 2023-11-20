module MT_FSM
(
	input logic MT,

    input logic clock,
    input logic async_reset,

    output logic state
);

	logic data;
	assign data = MT && !state;
	
	Register_N_vP #(.N(1)) regn
	(
		.data(data),

		.clock(clock),
		.async_reset(async_reset),

		.q(state)
	);

endmodule
