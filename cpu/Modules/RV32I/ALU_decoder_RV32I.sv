module ALU_decoder_RV32I
(
	input logic R,
	input logic I,
	input logic U,
	input logic VR,
	input logic abs,
	
	input logic [7:0] decoded_f3,
	
	input logic f7_eq_0x0,
	input logic f7_eq_0x1,
	input logic f7_eq_0x20,
	
	output logic [3:0] ALU_op
);
	
	logic [14:0] encoder_input;	
	// default 0 -> add
	assign encoder_input[0] = &{(R||VR), decoded_f3[0], f7_eq_0x20};										// sub		-> 1
	assign encoder_input[1] = (&{(R||VR), decoded_f3[4], f7_eq_0x0}) || (I && decoded_f3[4]); 	// xor		-> 2
	assign encoder_input[2] = (&{(R||VR), decoded_f3[6], f7_eq_0x0}) || (I && decoded_f3[6]);		// or			-> 3
	assign encoder_input[3] = (&{(R||VR), decoded_f3[7], f7_eq_0x0}) || (I && decoded_f3[7]);		// and		-> 4
	assign encoder_input[4] = (&{(R||VR), decoded_f3[1], f7_eq_0x0}) || (I && decoded_f3[1]);		// sll		-> 5
	assign encoder_input[5] = (&{(R||VR), decoded_f3[5], f7_eq_0x0}) || (I && decoded_f3[5]);		// srl		-> 6
	assign encoder_input[6] = (&{(R||VR), decoded_f3[5], f7_eq_0x20}) || (I && decoded_f3[5]);	// sra		-> 7
	assign encoder_input[7] = (&{(R||VR), decoded_f3[2], f7_eq_0x0}) || (I && decoded_f3[2]);		// slt		-> 8
	assign encoder_input[8] = (&{(R||VR), decoded_f3[3], f7_eq_0x0}) || (I && decoded_f3[3]);		// sltu		-> 9
	assign encoder_input[9] = 1'b0;																					// [Unused]	-> 10
	assign encoder_input[10] = U;																						// Pass B	-> 11
	assign encoder_input[11] = abs;																					// Pass A	-> 12
	assign encoder_input[12] = &{(R||VR), decoded_f3[0], f7_eq_0x1};										// mul		-> 13
	assign encoder_input[13] = &{(R||VR), decoded_f3[4], f7_eq_0x1};										// div		-> 14
	assign encoder_input[14] = &{(R||VR), decoded_f3[6], f7_eq_0x1};										// mod		-> 15

	Encoder_15x4 cod
	(
		.i(encoder_input),
		.code(ALU_op)
	);

endmodule