module Router_RV32I
(
	input logic [2:0] rerouting_code,
	input logic [31:0] scalar,
	input logic [127:0] vector_in,

	output logic [127:0] vector_out
);
	logic [7:0] dec_o;
	Decoder_N #(.N(3)) dec
	(
		.code(rerouting_code),
		.o(dec_o)
	);
	
	logic [2:0] mux_0_select;
	assign mux_0_select[0] = |{dec_o[6], dec_o[4], dec_o[3], dec_o[2], dec_o[1]};
	assign mux_0_select[1] = dec_o[6] || dec_o[5];
	assign mux_0_select[2] = dec_o[7];

	
	Multiplexer_MxN #(.M(8), .N(32)) mux_0
	(
		.select(mux_0_select),
		.channels({32'b0, 32'b0, 32'b0, vector_in[127:96], vector_in[95:64], vector_in[63:32], vector_in[31:0], scalar}),

		.channel_out(vector_out[31:0])
	);

	Multiplexer_MxN #(.M(2), .N(32)) mux_1
	(
		.select(dec_o[1]),
		.channels({scalar, vector_in[63:32]}),
		
		.channel_out(vector_out[63:32])
	);

	Multiplexer_MxN #(.M(2), .N(32)) mux_2
	(
		.select(dec_o[2]),
		.channels({scalar, vector_in[95:64]}),
		
		.channel_out(vector_out[95:64])
	);

	Multiplexer_MxN #(.M(2), .N(32)) mux_3
	(
		.select(dec_o[3]),
		.channels({scalar, vector_in[127:96]}),
		
		.channel_out(vector_out[127:96])
	);
endmodule