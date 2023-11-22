`timescale 1ns / 1ps
module Test_Decoder_f7_RV32I;

  // Parameters
  parameter N = 4;

  // Inputs
  logic [6:0] f7;
  
  // Outputs
  logic o_0x0, o_0x1, o_0x2, o_0x3, o_0x20;

  // Instantiate the module
  Decoder_f7_RV32I #(N) uut (
    .f7(f7),
    .o_0x0(o_0x0),
    .o_0x1(o_0x1),
    .o_0x2(o_0x2),
    .o_0x3(o_0x3),
    .o_0x20(o_0x20)
  );

  // Initial block to apply inputs
  initial begin
    // Test case 1
    f7 = 7'h0;
    #10; 
    
    // Test case 2
    f7 = 7'h20;
    #10;

  end

endmodule