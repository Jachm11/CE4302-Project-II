module Encoder_15x4
(
	input logic [14:0] i,
	
	output logic [3:0] code
);
	
	logic [3:0] o_aux;
	always_comb
	begin
		case(i)
			15'b000000000000001: o_aux = 4'd1;
			15'b000000000000010: o_aux = 4'd2;
			15'b000000000000100: o_aux = 4'd3;
			15'b000000000001000: o_aux = 4'd4;
			15'b000000000010000: o_aux = 4'd5;
			15'b000000000100000: o_aux = 4'd6;
			15'b000000001000000: o_aux = 4'd7;
			15'b000000010000000: o_aux = 4'd8;
			15'b000000100000000: o_aux = 4'd9;
			15'b000001000000000: o_aux = 4'd10;
			15'b000010000000000: o_aux = 4'd11;
			15'b000100000000000: o_aux = 4'd12;
			15'b001000000000000: o_aux = 4'd13;
			15'b010000000000000: o_aux = 4'd14;
			15'b100000000000000: o_aux = 4'd15;
			default: o_aux = 4'd0;
		endcase
	end
	assign code = o_aux;
endmodule
