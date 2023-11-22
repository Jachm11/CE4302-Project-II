module _4_Bit_Rotator_Left
(
	input logic [1:0] shamt,

	input logic [3:0] nibble,

	output logic bit_out_0,
	output logic bit_out_1,
	output logic bit_out_2,
	output logic bit_out_3
);

	logic [3:0] o_aux;
	always_comb
	begin
		case(shamt)
			2'b00: o_aux =	nibble;
			2'b01: o_aux = {nibble[2],	nibble[1],	nibble[0],	nibble[3]};
			2'b10: o_aux = {nibble[1],	nibble[0],	nibble[3],	nibble[2]};
			2'b11: o_aux = {nibble[0],	nibble[3],	nibble[2],	nibble[1]};
			default: o_aux = nibble;
		endcase
	end
	assign {bit_out_3, bit_out_2, bit_out_1, bit_out_0} = o_aux;
endmodule