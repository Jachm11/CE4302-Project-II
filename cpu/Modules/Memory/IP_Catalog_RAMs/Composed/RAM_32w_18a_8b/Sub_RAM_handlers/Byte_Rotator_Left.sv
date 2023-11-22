module Byte_Rotator_Left
(
	input logic [1:0] shamt,

	input logic [7:0] byte_in_0,
	input logic [7:0] byte_in_1,
	input logic [7:0] byte_in_2,
	input logic [7:0] byte_in_3,

	output logic [7:0] byte_out_0,
	output logic [7:0] byte_out_1,
	output logic [7:0] byte_out_2,
	output logic [7:0] byte_out_3
);

	logic [31:0] o_aux;
	always_comb
	begin
		case(shamt)
			2'b00: o_aux =	{	byte_in_3,	byte_in_2,	byte_in_1,	byte_in_0};
			2'b01: o_aux = {	byte_in_2,	byte_in_1,	byte_in_0, 	byte_in_3};
			2'b10: o_aux = {	byte_in_1,	byte_in_0, 	byte_in_3,	byte_in_2};
			2'b11: o_aux = {	byte_in_0, 	byte_in_3,	byte_in_2, 	byte_in_1};
			default: o_aux = 	{	byte_in_3,	byte_in_2,	byte_in_1,	byte_in_0};
		endcase
	end
	assign {byte_out_3, byte_out_2, byte_out_1, byte_out_0} = o_aux;
endmodule