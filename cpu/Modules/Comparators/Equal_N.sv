module Equal_N #(parameter N=4)
(
	input logic [N-1:0] A,
	input logic [N-1:0] B,	
	
	output logic eq
);
	assign eq = (A == B);

endmodule