module Register_N_vN #(parameter N = 8)
(
	input [N-1:0] d,
	
	input clock,
	input reset,
	
	output reg [N-1:0] q
);

	always @(negedge clock or negedge reset)
	begin
		if(!reset)
			q <= 0;
		else
			q <= d;
	end

endmodule