module ALU_RV32I #(parameter N=4)
(
	input logic [3:0] op,
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	
	output logic [N-1:0] o
);
	logic [N-1:0] add_sub_o;
	Adder_Subtractor_N #(N) add_sub(op[0], a, b, add_sub_o);
	
	logic signed [N-1:0] a_signed_for_shift_right_arithmetic;
	assign a_signed_for_shift_right_arithmetic = a;
	
	
	logic [N-1:0] slt_o;
	SLT_U_N #(.N(N)) slt(op[0], a, b, slt_o);
	
	logic [N-1:0] abs_o;	
	Absolute_N #(.N(N)) abs
	(
		.A(a),
		.abs_A(abs_o)
	);

		
	Multiplexer_MxN #(.M(16), .N(N)) mux
	(
		.select(op),
		.channels({
			a % b,		// 15 => %
			a / b,		// 14 => /
			a * b,		// 13 => *
			abs_o,		// 12 => Abs
			b,				// 11 => Pass B
			a,				// 10 => Pass A
			slt_o,		// 9 => SLTU
			slt_o,		// 8 => SLT
			a_signed_for_shift_right_arithmetic >>> b,		// 7 => SRA (signed)
			a >> b,		// 6 => SRL (unsigned)
			a << b,		// 5 => SLL
			a & b,		// 4 => AND
			a | b,		// 3 => OR
			a ^ b,		// 2 => XOR
			add_sub_o,	// 1 => -
			add_sub_o	// 0 => +
		}),
		.channel_out(o)
	);

endmodule