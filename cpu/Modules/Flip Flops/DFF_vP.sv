module DFF_vP
(
	input logic d,
	
	input clock,
	input reset,
	
	output reg q,
	output reg nq
);

	always @(posedge clock or negedge reset)
	begin
		if(!reset)
			q <= 0;
		else
			q <= d;
		nq <= !q;
	end

endmodule