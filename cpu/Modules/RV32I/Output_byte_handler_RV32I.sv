module Output_byte_handler_RV32I
(
	input logic [2:0] width_type,
	input logic enabler,

	output logic [15:0] byte_enablers
);
	logic [7:0] dec_o;
	Decoder_N #(.N(3)) dec
	(
		.code(width_type),
		.o(dec_o)
	);


	logic [15:0] o_aux;
	assign o_aux[0]		= |{dec_o[5], dec_o[2], dec_o[1], dec_o[0]};
	assign o_aux[1]		= |{dec_o[5], dec_o[2], dec_o[1]};
	assign o_aux[2]		= 	 dec_o[5] || dec_o[2];
	assign o_aux[3]		= 	 dec_o[5] || dec_o[2];
	
	assign o_aux[4]		= 	 dec_o[5];
	assign o_aux[5]		= 	 dec_o[5];
	assign o_aux[6]		= 	 dec_o[5];
	assign o_aux[7]		= 	 dec_o[5];
	assign o_aux[8]		= 	 dec_o[5];
	assign o_aux[9]		= 	 dec_o[5];
	assign o_aux[10]		= 	 dec_o[5];
	assign o_aux[11]		= 	 dec_o[5];
	assign o_aux[12]		= 	 dec_o[5];
	assign o_aux[13]		= 	 dec_o[5];
	assign o_aux[14]		= 	 dec_o[5];
	assign o_aux[15]		= 	 dec_o[5];

	assign byte_enablers = (enabler == 1'b1) ? o_aux : 16'd0;
endmodule