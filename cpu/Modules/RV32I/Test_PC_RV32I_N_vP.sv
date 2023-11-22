`timescale 1ns / 1ps

module Test_PC_RV32I_N_vP;

  // Parameters
  parameter N = 8;

  // Inputs
  logic [N-1:0] pc_in;
  logic enabler;
  logic clock, async_reset;

  // Outputs
  reg [N-1:0] pc_out;

  // Instantiate the module
  PC_RV32I_N_vP #(N) uut (
    .pc_in(pc_in),
    .enabler(enabler),
    .clock(clock),
    .async_reset(async_reset),
    .pc_out(pc_out)
  );

  // Stimulus generation
  initial begin

    clock = 0; async_reset = 1; enabler = 1; pc_in = 8'h00;
    #10; 
	 assert(pc_out == 8'h00) else $fatal("Test failed. pc_out is incorrect.");

    enabler = 1; pc_in = 8'h12;
    #10;
	 assert(pc_out == 8'h12) else $fatal("Test failed. pc_out is incorrect.");

    enabler = 0; pc_in = 8'h34;
    #10;
	 assert(pc_out == 8'h12) else $fatal("Test failed. pc_out is incorrect.");
    
  end
endmodule
