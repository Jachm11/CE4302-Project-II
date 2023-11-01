module DFF_Tri_Latch_vP
(
	input logic d,
	
	input clock,
	input reset,
	
	output logic q
);

	logic p_o;
	logic n_o;
	logic not_d;
	assign not_d = !d;
	
	Register_N_vP #(.N(1)) p(not_d, clock, reset, p_o);
	Register_N_vN #(.N(1)) n(p_o, clock, reset, n_o);
	
	assign q = ~(p_o & n_o);

endmodule