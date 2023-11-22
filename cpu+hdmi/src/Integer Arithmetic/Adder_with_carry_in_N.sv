module Adder_with_carry_in_N #(parameter N=4)
(
	input ci,
	input [N-1:0] A,
	input [N-1:0] B,

	output [N-1:0] O
);
	assign O = ci + A + B;

endmodule
