module Register_N_with_enabler_vP #(parameter N = 8)
(
	input logic [N-1:0] data_in,
	input logic enabler,
	
	input logic clock,
	input logic async_reset,
	
	output reg [N-1:0] data_out
);
	always @(posedge clock or negedge async_reset)
	begin
	
		if(!async_reset)
			data_out <= 0;
			
		else if(enabler)
			data_out <= data_in;
	end

endmodule