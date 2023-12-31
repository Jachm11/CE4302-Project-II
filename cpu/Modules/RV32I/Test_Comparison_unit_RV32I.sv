`timescale 1ns/1ns

module Test_Comparison_unit_RV32I;

  // Define parameters
  parameter TIMEUNIT = 1ns;
  parameter TIMEPRECISION = 1ns;

  // Inputs
  logic [2:0] cond;
  logic [31:0] a;
  logic [31:0] b;

  // Output
  logic approved;

  // Instantiate Comparison_unit_RV32I module
  Comparison_unit_RV32I uut (
    .cond(cond),
    .a(a),
    .b(b),
    .approved(approved)
  );

  // Initial block for testbench
  initial begin
 
    // Initialize inputs
    cond = 3'b000; // Assuming initial condition is '=='
    a = 32'h00000000; // Assuming initial value of 'a'
    b = 32'h00000000; // Assuming initial value of 'b'
	 #10;
	 $display("approved %b", approved);
	 assert(approved === 1);
 
    cond = 3'b010; // Set condition to '!='
    a = 32'h00000001; // Set a to test '!=' condition
    b = 32'h00000002; // Set b to test '!=' condition
    #10;
	 assert(approved === 1);

    cond = 3'b100; // Set condition to '<'
    a = 32'h00000001; // Set a to test '<' condition
    b = 32'h00000002; // Set b to test '<' condition
    #10;
    assert(approved === 1);
	 
	 #10;
	

  end


endmodule
