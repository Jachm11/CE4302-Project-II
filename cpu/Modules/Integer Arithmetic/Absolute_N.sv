module Absolute_N #(parameter N=4)
(
	input logic [N-1:0] A,
	output logic [N-1:0] abs_A
);


	logic [N-1:0] adder_o;
	Adder_with_carry_in_N #(.N(N)) add
	(
		.ci(A[N-1]),
		.A(~A),
		.B({N{1'b0}}),
		
		.O(adder_o)
	);	

	Multiplexer_MxN #(.M(2), .N(N)) mux
	(
		.select(A[N-1]),
		.channels({adder_o, A}),
		
		.channel_out(abs_A)
	);


endmodule