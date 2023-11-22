module Enabler_N #(parameter N = 4)
(
	input [N-1:0] i,
	input enabler,
	output [N-1:0] o
);
//Sintetiza ANDs
	genvar j;
	generate
		for(j = 0; j < N; j++)
			begin: forloop
				assign o[j] = i[j] & enabler;
			end
	endgenerate
endmodule

//Sintetiza Deco y Mux
/*
	always_comb
	begin
		case(enabler)
			1'b1:  o=i;
			default:  o=0;
		endcase
	end
	
*/