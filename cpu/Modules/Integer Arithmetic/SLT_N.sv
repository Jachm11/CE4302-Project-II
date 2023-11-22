module SLT_N #(parameter N=4)
(
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	
	output logic [N-1:0] o
);	
	assign o = (a < b) ? {{(N-1){1'b0}}, 1'b1} : {(N){1'b0}};

endmodule
