module Adder_Subtractor_N #(parameter N=4)
(
	input op,			// 0 -> add. 1 -> sub
	input [N-1:0] a,
	input [N-1:0] b,
	
	output [N-1:0] o
);
	logic [N-1:0] b_a1;
	A1_N #(N) a1(b, op, b_a1);
	Adder_with_carry_in_N #(N) adder(op, a, b_a1, o);
	
endmodule
