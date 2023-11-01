module Pipe_Writeback_vP
(
	input logic [2:0] control_signals_M,
	input logic [31:0] ALU_result_M,
	input logic [31:0] read_data_M,	
	input logic [4:0] Rd_M,
	input logic [31:0] PC_4_M,
	
	input logic clock,
	input logic async_reset,

	output reg [2:0] control_signals_W,
	output reg [31:0] ALU_result_W,
	output reg [31:0] read_data_W,	
	output reg [4:0] Rd_W,
	output reg [31:0] PC_4_W
);
	always @(posedge clock or negedge async_reset)
	begin
		if(!async_reset)
		begin
			control_signals_W	<= 0;
			ALU_result_W		<= 0;
			read_data_W			<= 0;
			Rd_W					<= 0;
			PC_4_W				<= 0;
		end
		else
		begin
			control_signals_W	<= control_signals_M;
			ALU_result_W		<= ALU_result_M;
			read_data_W			<= read_data_M;
			Rd_W					<= Rd_M;
			PC_4_W				<= PC_4_M;
		end
	end

endmodule