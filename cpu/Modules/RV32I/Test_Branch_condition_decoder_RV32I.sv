`timescale 1ns / 1ps

module Test_Branch_condition_decoder_RV32I;

  // Inputs
  logic [7:0] decoded_f3;
  logic B_;

  // Outputs
  reg [2:0] comp_code;

  // Instantiate the module
  Branch_condition_decoder_RV32I uut (
    .decoded_f3(decoded_f3),
    .B(B_),
    .comp_code(comp_code)
  );

  initial begin
    decoded_f3 = 8'b0000_0000;
    B_ = 1;
    #10;
	 
    B_ = 0;
    decoded_f3[1] = 1;
    #10;
	 
    B_ = 1;
    decoded_f3[4] = 1;
    #10;

  end
endmodule
