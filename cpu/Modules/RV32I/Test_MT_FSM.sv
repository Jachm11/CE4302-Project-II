`timescale 1ns / 1ps
module Test_MT_FSM;

  // Inputs
  logic MT;
  logic clock;
  logic async_reset;

  // Outputs
  logic state;

  // Instantiate the MT_FSM module
  MT_FSM uut (
    .MT(MT),
    .clock(clock),
    .async_reset(async_reset),
    .state(state)
  );

  initial begin
    clock = 0; async_reset = 0; #10; async_reset = 1;
    

    assert(state == 0) else $fatal("Test failed: Initial state mismatch");

    // Apply MT = 1
    MT = 1;
    #10;
    assert(state == 1) else $fatal("Test failed: State transition from 0 to 1 failed");

    // Apply MT = 0
    MT = 0;
    #10;
    assert(state == 0) else $fatal("Test failed: State transition from 1 to 0 failed");

  end
  
  always #5 clock = ~clock;

endmodule
