module Decoder_f7_RV32I #(parameter N=4)
(
	input logic [6:0] f7,
	
	output logic o_0x0,
	output logic o_0x1,
	output logic o_0x2,
	output logic o_0x3,
	output logic o_0x20
);
	
	logic [4:0] o_aux;
	always_comb
	begin
		case(f7)
			7'h0:		o_aux =	5'b00001;
			7'h1:		o_aux =	5'b00010;
			7'h2:		o_aux =	5'b00100;
			7'h3:		o_aux =	5'b01000;
			7'h20:	o_aux = 	5'b10000;
			
			default: o_aux =	5'd0;
		endcase
	end
	
	assign {o_0x20, o_0x3, o_0x2, o_0x1, o_0x0} = o_aux;

endmodule
