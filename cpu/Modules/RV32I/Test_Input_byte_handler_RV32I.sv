`timescale 1ns / 1ps

module Test_Input_byte_handler_RV32I;

  // Inputs
  logic [2:0] width_type;
  logic [31:0] read_data_0;

  // Outputs
  reg [31:0] o;

  // Instantiate the module
  Input_byte_handler_RV32I uut (
    .width_type(width_type),
    .read_data_0(read_data_0),
    .o(o)
  );

  // Stimulus generation
  initial begin
  
  
    // Test case 1: Default values
    width_type = 3'b000;
    read_data_0 = 32'h0000_00A5;
    #10;
	 //assert(o == 2'b000) else $fatal("Test failed. o is incorrect.");


    // Test case 2: Select unsigned_half_word
    width_type = 3'b100;
    read_data_0 = 32'hFFFF_ABCD;
    #10;
	 //assert(o == 32'hABCD) else $fatal("Test failed. o is incorrect.");

	 
    // Test case 3: Select read_data_0
    width_type = 3'b110;
    read_data_0 = 32'h1234_5678;
    #10;
    //assert(o == 32'h1234_5678) else $fatal("Test failed. o is incorrect.");

  end
endmodule
