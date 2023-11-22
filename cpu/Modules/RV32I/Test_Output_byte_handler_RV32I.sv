`timescale 1ns / 1ps

module Test_Output_byte_handler_RV32I;

  // Inputs
  logic [2:0] width_type;
  logic enabler;

  // Outputs
  reg [15:0] byte_enablers;

  // Instantiate the module
  Output_byte_handler_RV32I uut (
    .width_type(width_type),
    .enabler(enabler),
    .byte_enablers(byte_enablers)
  );

  // Stimulus generation
  initial begin
    // Test case 1: Default values
    width_type = 3'b000; // Select 1-byte
    enabler = 1;
    #10; 

    // Test case 2: Select 2-byte
    width_type = 3'b010;
    enabler = 1;
    #10;
    
    // Test case 3: Select 4-byte
    width_type = 3'b100;
    enabler = 1;
    #10;
	 
  end
endmodule
