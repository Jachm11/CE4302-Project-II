module Equal_with_enabler_N #(parameter N=4)
(
	input logic [N-1:0] A,
	input logic [N-1:0] B,
	input enabler,
	
	output logic eq
);
	assign eq = (A == B) & enabler;

endmodule