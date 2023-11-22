module Branch_condition_decoder_RV32I
(
	input logic [7:0] decoded_f3,
	input logic B,

	output logic [2:0] comp_code
);
	logic [4:0] encoder_input;
																	// default 0 -> ==
	assign encoder_input[0] = decoded_f3[1] && B;	// !=
	assign encoder_input[1] = decoded_f3[4] && B;	// <
	assign encoder_input[2] = decoded_f3[5] && B;	// >=
	assign encoder_input[3] = decoded_f3[6] && B;	// <u
	assign encoder_input[4] = decoded_f3[7] && B;	// >=u

	Encoder_5x3 cod
	(
		.i(encoder_input),
		.code(comp_code)
	);

endmodule