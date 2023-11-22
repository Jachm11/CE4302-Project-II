module Result_source_decoder_RV32I
(
	input logic load,
	input logic jump,
	input logic i_jump,
	input logic load_vector,
	input logic f3_eq_0,
	
	output logic [1:0] result_source
);	
	assign result_source[0] = load || load_vector;
	assign result_source[1] = jump || (i_jump && f3_eq_0);

endmodule
