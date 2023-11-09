module Encoder_5x3
(
	input logic [4:0] i,
	
	output logic [2:0] code
);
	
	logic [2:0] o_aux;
	always_comb
	begin
		case(i)
			5'b00001: o_aux = 3'd1;
			5'b00010: o_aux = 3'd2;
			5'b00100: o_aux = 3'd3;
			5'b01000: o_aux = 3'd4;
			5'b10000: o_aux = 3'd5;
			default: o_aux = 3'd0;
		endcase
	end
	assign code = o_aux;
endmodule