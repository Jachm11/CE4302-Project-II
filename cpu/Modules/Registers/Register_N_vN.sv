module Register_N_vN #(parameter N = 8)
(
	input [N-1:0] data,
	
	input clock,
	input async_reset,
	
	output reg [N-1:0] q
);

	always @(negedge clock or negedge async_reset)
	begin
	
		if(!async_reset)
			q <= 0;
		
		else
			q <= data;
			
	end

endmodule