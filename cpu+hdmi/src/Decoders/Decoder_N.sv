module Decoder_N #(parameter N=3)
(
	input logic [N-1:0] code,
	
	output logic [(2**N)-1:0] o
);
	always_comb
	begin
		o = 0;
		o[code] = 1'b1;
	end

endmodule