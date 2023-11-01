module Pipe_Memory_vP
(
	input logic [7:0] control_signals_E,
	input logic [31:0] ALU_result_E,
	input logic [31:0] write_data_E,	
	input logic [4:0] Rd_E,
	input logic [31:0] PC_4_E,
	
	input logic enabler,
	input logic clock,
	input logic async_reset,
	input logic sync_reset,

	output reg [7:0] control_signals_M,
	output reg [31:0] ALU_result_M,
	output reg [31:0] write_data_M,	
	output reg [4:0] Rd_M,
	output reg [31:0] PC_4_M
);
	always @(posedge clock or negedge async_reset)
	begin
		if(!async_reset)
		begin
			control_signals_M	<= 0;
			ALU_result_M		<= 0;
			write_data_M		<= 0;
			Rd_M					<= 0;
			PC_4_M				<= 0;
		end
		else if(enabler)
		begin
			if(!sync_reset)
			begin
				control_signals_M	<= 0;
				ALU_result_M		<= 0;
				write_data_M		<= 0;
				Rd_M					<= 0;
				PC_4_M				<= 0;
			end
			else
			begin
				control_signals_M	<= control_signals_E;
				ALU_result_M		<= ALU_result_E;
				write_data_M		<= write_data_E;
				Rd_M					<= Rd_E;
				PC_4_M				<= PC_4_E;
			end
		end
	end
endmodule