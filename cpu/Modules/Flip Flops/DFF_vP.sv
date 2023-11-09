module DFF_vP
(
	input logic data,
	
	input clock,
	input async_reset,
	
	output reg q,
	output reg nq
);

	always @(posedge clock or negedge async_reset)
	begin
		
		if(!async_reset)
			q <= 0;
		
		else
			q <= data;
			
		nq <= !q;
	end

endmodule