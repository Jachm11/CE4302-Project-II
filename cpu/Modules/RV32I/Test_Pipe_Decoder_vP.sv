module Test_Pipe_Decoder_vP();

	logic [31:0] instruction_F;
	logic [31:0] PC_F;
	logic [31:0] PC_4_F;
	
	logic enabler;
	logic clock;
	logic async_reset;
	logic sync_reset;
	
	logic [31:0] instruction_D;
	logic [31:0] PC_D;
	logic [31:0] PC_4_D;

	Pipe_Decoder_vP pipe_d
	(
		instruction_F, PC_F, PC_4_F, enabler, clock, async_reset, sync_reset,
		instruction_D, PC_D, PC_4_D
	);

	initial
	begin
		enabler=1'b0;
		clock=1'b0;
		async_reset=1'b0;
		sync_reset=1'b0;
		
		instruction_F=32'h19000513;
		PC_F=32'h4;
		PC_4_F=32'h8;
		#15;
		
		async_reset=1'b1;
		sync_reset=1'b1;
		#10;

		enabler=1'b1;
		#10;

		#10;
		
		sync_reset=1'b0;
		#10;
		
		sync_reset=1'b1;		
		#10;
	end
	
	always #5 clock = ~clock;//#10 = un ciclo

endmodule
