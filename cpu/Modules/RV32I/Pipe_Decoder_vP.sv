module Pipe_Decoder_vP
(
	input logic [31:0] instruction_F,
	input logic [31:0] PC_F,
	input logic [31:0] PC_4_F,
	
	input logic enabler,
	input logic clock,
	input logic async_reset,
	input logic sync_reset,
	
	output reg [31:0] instruction_D,
	output reg [31:0] PC_D,
	output reg [31:0] PC_4_D
);	
	always @(posedge clock or negedge async_reset)
	begin
		if(!async_reset)
		begin
			instruction_D	<= 0;
			PC_D				<= 0;
			PC_4_D			<= 0;
		end
		else if(enabler)
		begin
			if(!sync_reset)
			begin
				instruction_D	<= 0;
				PC_D				<= 0;
				PC_4_D			<= 0;
			end
			else
			begin
				instruction_D	<= instruction_F;
				PC_D				<= PC_F;
				PC_4_D			<= PC_4_F;
			end
		end
	end

endmodule