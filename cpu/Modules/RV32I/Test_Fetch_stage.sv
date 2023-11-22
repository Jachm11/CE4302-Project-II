`timescale 1ns / 1ps

module Test_Fetch_stage;

  // Inputs
  logic [1:0] PC_source_E;
  logic [31:0] PC_plus_4_E, ALU_result_0_E;
  logic enable_fetch;
  logic branch_prediction_D;
  logic [31:0] predicted_PC_D;
  logic clock, async_reset;

  // Outputs
  reg [31:0] PC_F, PC_plus_4_F;

  // Instantiate the module
  Fetch_stage uut (
    .PC_source_E(PC_source_E),
    .PC_plus_4_E(PC_plus_4_E),
    .ALU_result_0_E(ALU_result_0_E),
    .enable_fetch(enable_fetch),
    .branch_prediction_D(branch_prediction_D),
    .predicted_PC_D(predicted_PC_D),
    .clock(clock),
    .async_reset(async_reset),
    .PC_F(PC_F),
    .PC_plus_4_F(PC_plus_4_F)
  );
  
  // Stimulus generation
  initial begin
	
	 clock = 0; async_reset = 0; #10; async_reset = 1;
    // Test case 1: Default values
    enable_fetch = 1;
    PC_source_E = 2'b00; // Choose PC_plus_4_F
    PC_plus_4_E = 32'h0000_0004;
    ALU_result_0_E = 32'h0000_0000;
    branch_prediction_D = 0;
    predicted_PC_D = 32'h0000_0008;
	
	
    #10;
    // Test case 2: Enable the fetch stage
    enable_fetch = 1;
    PC_source_E = 2'b01; // Choose ALU_result_0_E
    PC_plus_4_E = 32'h0000_0000;
    ALU_result_0_E = 32'h0000_0010;

    #10;
    // Test case 3: Disable the fetch stage
    enable_fetch = 0;
    PC_source_E = 2'b10; // Choose PC_plus_4_E
    PC_plus_4_E = 32'h0000_0020;
    ALU_result_0_E = 32'h0000_0000;

	 #10;
  end
  
  always #5 clock = ~clock;
endmodule
