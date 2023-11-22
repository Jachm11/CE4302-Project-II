`timescale 1ns / 1ps
module Test_Pipe_decode_vP;

  // Inputs
  logic [31:0] instruction_F;
  logic [31:0] PC_F;
  logic [31:0] PC_plus_4_F;
  logic enabler;
  logic clock;
  logic async_reset;
  logic sync_reset;

  // Outputs
  logic [31:0] instruction_D;
  logic [31:0] PC_D;
  logic [31:0] PC_plus_4_D;

  Pipe_decode_vP uut (
    .instruction_F(instruction_F),
    .PC_F(PC_F),
    .PC_plus_4_F(PC_plus_4_F),
    .enabler(enabler),
    .clock(clock),
    .async_reset(async_reset),
    .sync_reset(sync_reset),
    .instruction_D(instruction_D),
    .PC_D(PC_D),
    .PC_plus_4_D(PC_plus_4_D)
  );

 
  initial begin
	 
	 clock = 0; async_reset = 0; sync_reset = 1; #10; async_reset = 1; #10;
    enabler = 1;
    instruction_F = 32'h003100F8;
    PC_F = 32'b0;
    PC_plus_4_F = PC_F + 4;
    #10;

  end
  
  always #5 clock = ~clock;

endmodule