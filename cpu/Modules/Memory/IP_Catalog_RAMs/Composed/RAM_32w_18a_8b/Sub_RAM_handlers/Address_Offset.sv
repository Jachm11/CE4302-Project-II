module Address_Offset
(
	input logic [15:0] address_in,
	input logic [1:0] offset,

	output logic [15:0] address_0,
	output logic [15:0] address_1,
	output logic [15:0] address_2,
	output logic [15:0] address_3
);
	Adder_with_carry_in_N #(.N(16)) add0(|offset, 	address_in, 16'd0, address_0);
	Adder_with_carry_in_N #(.N(16)) add1(offset[1], address_in, 16'd0, address_1);
	Adder_with_carry_in_N #(.N(16)) add2(&offset,	address_in, 16'd0, address_2);
	assign address_3 = address_in;
endmodule