module PC_RV32I_N_vP #(parameter N = 8)
(
	input [N-1:0] pc_in,
	input enabler,
	
	input logic clock,
	input logic async_reset,
	
	output reg [N-1:0] pc_out
);
	always @(posedge clock or negedge async_reset)
	begin
		if(!async_reset)
			pc_out <= 0;
		else if(enabler)
			pc_out <= pc_in;
	end

endmodule