module Load_store_width_decoder_RV32I
(
	input logic load,
	input logic store,
	input logic load_vector,
	input logic store_vector,
	
	input logic [7:0] decoded_f3,
	
	output logic [2:0] width
);
	logic scalar_memory_transaction;
	logic vector_memory_transaction;
	
	logic half;
	logic word;
	logic byte_u;
	logic half_u;
	
	logic [2:0] o_aux;

	
	assign scalar_memory_transaction = load || store;
	assign vector_memory_transaction = load_vector || store_vector;
	assign half =		decoded_f3[1] && scalar_memory_transaction;
	assign word =		decoded_f3[2] && scalar_memory_transaction;
	assign byte_u =	decoded_f3[4] && scalar_memory_transaction;
	assign half_u =	decoded_f3[5] && scalar_memory_transaction;
	
	Encoder_5x3 enc
	(
		.i({vector_memory_transaction, half_u, byte_u, word, half}),
		
		.code(o_aux)
	);
	assign width = o_aux;
endmodule
