module Adder_N #(parameter N=4)
(
	input [N-1:0] A,
	input [N-1:0] B,
	
	output [N-1:0] O
);
	assign O = A+B;
endmodule