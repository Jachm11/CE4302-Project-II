module Address_offset_16_byte
(
	input logic [15:0] address_without_offset,
	input logic [3:0] offset,

	output logic [15:0] sub_address_0,
	output logic [15:0] sub_address_1,
	output logic [15:0] sub_address_2,
	output logic [15:0] sub_address_3,
	output logic [15:0] sub_address_4,
	output logic [15:0] sub_address_5,
	output logic [15:0] sub_address_6,
	output logic [15:0] sub_address_7,
	output logic [15:0] sub_address_8,
	output logic [15:0] sub_address_9,
	output logic [15:0] sub_address_10,
	output logic [15:0] sub_address_11,
	output logic [15:0] sub_address_12,
	output logic [15:0] sub_address_13,
	output logic [15:0] sub_address_14,
	output logic [15:0] sub_address_15
);
	logic [15:0] dec_o;
	Decoder_N #(.N(4)) dec
	(
		.code(offset),
		
		.o(dec_o)
	);

	Adder_with_carry_in_N #(.N(16)) add0(!dec_o[0], 			address_without_offset, 16'd0, sub_address_0);
	Adder_with_carry_in_N #(.N(16)) add1(!(|dec_o[1:0]), 		address_without_offset, 16'd0, sub_address_1);
	Adder_with_carry_in_N #(.N(16)) add2(!(|dec_o[2:0]), 		address_without_offset, 16'd0, sub_address_2);
	Adder_with_carry_in_N #(.N(16)) add3(!(|dec_o[3:0]), 		address_without_offset, 16'd0, sub_address_3);
	Adder_with_carry_in_N #(.N(16)) add4(!(|dec_o[4:0]), 		address_without_offset, 16'd0, sub_address_4);
	Adder_with_carry_in_N #(.N(16)) add5(!(|dec_o[5:0]), 		address_without_offset, 16'd0, sub_address_5);
	Adder_with_carry_in_N #(.N(16)) add6(!(|dec_o[6:0]), 		address_without_offset, 16'd0, sub_address_6);
	Adder_with_carry_in_N #(.N(16)) add7(!(|dec_o[7:0]), 		address_without_offset, 16'd0, sub_address_7);
	Adder_with_carry_in_N #(.N(16)) add8(!(|dec_o[8:0]), 		address_without_offset, 16'd0, sub_address_8);
	Adder_with_carry_in_N #(.N(16)) add9(!(|dec_o[9:0]), 		address_without_offset, 16'd0, sub_address_9);
	Adder_with_carry_in_N #(.N(16)) add10(!(|dec_o[10:0]),	address_without_offset, 16'd0, sub_address_10);
	Adder_with_carry_in_N #(.N(16)) add11(!(|dec_o[11:0]), 	address_without_offset, 16'd0, sub_address_11);
	Adder_with_carry_in_N #(.N(16)) add12(!(|dec_o[12:0]), 	address_without_offset, 16'd0, sub_address_12);
	Adder_with_carry_in_N #(.N(16)) add13(!(|dec_o[13:0]), 	address_without_offset, 16'd0, sub_address_13);
	Adder_with_carry_in_N #(.N(16)) add14(!(|dec_o[14:0]), 	address_without_offset, 16'd0, sub_address_14);
	assign sub_address_15 = address_without_offset;
endmodule
/*
	Address_offset_16_byte AO
	(
		.address_without_offset(),
		.offset(),

		.sub_address_0(),
		.sub_address_1(),
		.sub_address_2(),
		.sub_address_3(),
		.sub_address_4(),
		.sub_address_5(),
		.sub_address_6(),
		.sub_address_7(),
		.sub_address_8(),
		.sub_address_9(),
		.sub_address_10(),
		.sub_address_11(),
		.sub_address_12(),
		.sub_address_13(),
		.sub_address_14(),
		.sub_address_15()
	);
*/