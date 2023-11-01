module Pipe_Execute_vP
(
	input logic [19:0] control_signals_D,
	input logic [31:0] RD1_D,
	input logic [31:0] RD2_D,
	input logic [31:0] PC_D,
	input logic [4:0] Rd_D,
	input logic [31:0] Imm_D,
	input logic [31:0] PC_4_D,
	input logic [4:0] Rs1_D,
	input logic [4:0] Rs2_D,
	
	input logic enabler,
	input logic clock,
	input logic async_reset,
	input logic sync_reset,
	
	output reg [19:0] control_signals_E,
	output reg [31:0] RD1_E,
	output reg [31:0] RD2_E,
	output reg [31:0] PC_E,
	output reg [4:0] Rd_E,
	output reg [31:0] Imm_E,
	output reg [31:0] PC_4_E,
	output reg [4:0] Rs1_E,
	output reg [4:0] Rs2_E
);	
	always @(posedge clock or negedge async_reset)
	begin
		if(!async_reset)
		begin
			control_signals_E	<= 0;
			RD1_E					<= 0;
			RD2_E					<= 0;
			PC_E				 	<= 0;
			Rd_E					<= 0;
			Imm_E					<= 0;
			PC_4_E				<= 0;
			Rs1_E					<= 0;
			Rs2_E					<= 0;
		end
		else if(enabler)
		begin
			if(!sync_reset)
			begin
				control_signals_E	<= 0;
				RD1_E					<= 0;
				RD2_E					<= 0;
				PC_E				 	<= 0;
				Rd_E					<= 0;
				Imm_E					<= 0;
				PC_4_E				<= 0;
				Rs1_E					<= 0;
				Rs2_E					<= 0;
			end
			else
			begin
				control_signals_E	<= control_signals_D;
				RD1_E					<= RD1_D;
				RD2_E					<= RD2_D;
				PC_E		 			<= PC_D;
				Rd_E					<= Rd_D;
				Imm_E					<= Imm_D;
				PC_4_E				<= PC_4_D;
				Rs1_E					<= Rs1_D;
				Rs2_E					<= Rs2_D;
			end
		end
	end
endmodule