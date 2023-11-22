module DFF_vN
(
	input logic d,
	
	input clock,
	input reset,
	
	output logic q,
	output logic nq
);

	always @(negedge clock or negedge reset)
	begin
		if(!reset)
			q = 0;
		else
			q = d;
		nq = !q;
	end

endmodule