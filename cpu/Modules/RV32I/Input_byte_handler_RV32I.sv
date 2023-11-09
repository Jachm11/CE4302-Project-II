module Input_byte_handler_RV32I
(
	input logic [2:0] width_type,
	input logic [31:0] read_data_0,
	
	output logic [31:0] o
);
	
	logic [31:0] signed_byte;
	assign signed_byte = {{(25){read_data_0[7]}}, read_data_0[6:0]};
	
	logic [31:0] signed_half_word;
	assign signed_half_word = {{(17){read_data_0[15]}}, read_data_0[14:0]};

	logic [31:0] unsigned_byte;
	assign unsigned_byte = {{(24){1'b0}}, read_data_0[7:0]};

	logic [31:0] unsigned_half_word;
	assign unsigned_half_word = {{(16){1'b0}}, read_data_0[15:0]};


	logic [127:0] mux_read_data_0_o;
	Multiplexer_MxN #(.M(8), .N(32)) mux_read_data_0
	(
		.select(width_type),
		.channels(
		{
			read_data_0,			// 7
			read_data_0,			// 6
			read_data_0,			// 5
			unsigned_half_word,	// 4
			unsigned_byte,			// 3
			read_data_0,			// 2
			signed_half_word,		// 1
			signed_byte				// 0
		}),

		.channel_out(o)
	);
endmodule
