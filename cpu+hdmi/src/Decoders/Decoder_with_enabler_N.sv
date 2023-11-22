module Decoder_with_enabler_N #(parameter N=3)
(
	input logic [N-1:0] code,
	input logic enabler,	
	
	output logic [(2**N)-1:0] o
);
   genvar i;
   generate
		for(i=0; i < 2**N; i++)
		begin : forloop
			parameter [N-1:0] temp = i;
				assign o[i] = (code == temp && enabler) ? 1'b1 : 1'b0;
		end
	endgenerate

endmodule



/*
module Decoder_with_enabler_N #(parameter N=3)
(
	input logic [N-1:0] code,
	input logic enabler,	
	
	output logic [(2**N)-1:0] o
);
	
	logic [N-1:0] ands_outputs;
	
   genvar i,j;
   generate
		for(i=0; i < 2**N; i++)
		begin : forloop
		
			parameter [N-1:0] i_in_bits = i;
			
			logic [N-1:0] and_input;
			
			
			for(j=0; j < N; j++)
			begin : for_and
					if(i_in_bits[j]==1'b1)
						assign and_input[j] = code[j];
					else
						assign and_input[j] = !code[j];				
			end
			and_N #(.N(N+1)) and_({enabler, and_input}, o[i]);

		end
	endgenerate

endmodule
*/