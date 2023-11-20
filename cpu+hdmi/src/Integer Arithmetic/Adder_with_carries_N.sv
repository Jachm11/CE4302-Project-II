module Adder_with_carries_N #(parameter N=4)
(
	input ci,
	input [N-1:0] A,
	input [N-1:0] B,
	
	output [N-1:0] O,
	output co
);	
	assign {co, O} = ci + A + B;
	
endmodule
