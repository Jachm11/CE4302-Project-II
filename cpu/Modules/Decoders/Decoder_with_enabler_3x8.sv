module Decoder_with_enabler_3x8
(
	input logic [2:0] code,
	input logic enabler,
	
	output logic [7:0] o
);
	
	logic [7:0] o_aux;
	always_comb
	begin
		case(code)
			3'b000: o_aux = 8'b00000001;
			3'b001: o_aux = 8'b00000010;
			3'b010: o_aux = 8'b00000100;
			3'b011: o_aux = 8'b00001000;
			3'b100: o_aux = 8'b00010000;
			3'b101: o_aux = 8'b00100000;
			3'b110: o_aux = 8'b01000000;
			3'b111: o_aux = 8'b10000000;
			default: o_aux = 8'd0;
		endcase
	end
	assign o = (enabler == 1'b1) ? o_aux : 8'd0;
endmodule
