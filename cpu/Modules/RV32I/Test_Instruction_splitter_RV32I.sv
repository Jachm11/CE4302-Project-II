`timescale 1ns/1ns

module Test_Instruction_splitter_RV32I;

  // Define parameters
  parameter TIMEUNIT = 1ns;
  parameter TIMEPRECISION = 1ns;

  // Inputs
  logic [31:0] instruction;

  // Outputs
  logic [6:0] opcode;
  logic [4:0] rd;
  logic [2:0] f3;
  logic [4:0] r1;
  logic [4:0] r2;
  logic [6:0] f7;
  logic [24:0] raw_immediate;

  // Instantiate Instruction_splitter_RV32I module
  Instruction_splitter_RV32I uut (
    .instruction(instruction),
    .opcode(opcode),
    .rd(rd),
    .f3(f3),
    .r1(r1),
    .r2(r2),
    .f7(f7),
    .raw_immediate(raw_immediate)
  );

  // Initial block for testbench
  initial begin
    // Initialize inputs
    instruction = 32'b00000000001100010000000010110011; // Assuming initial instruction value
	 #10;
    // Type B
    assert(opcode === 7'b0110011) else $fatal("Test Failed: Opcode assertion");
    assert(rd === 5'b00001) else $fatal("Test Failed: rd assertion");
    assert(f3 === 3'b000) else $fatal("Test Failed: f3 assertion");
    assert(r1 === 5'b00010) else $fatal("Test Failed: r1 assertion");
    assert(r2 === 5'b00011) else $fatal("Test Failed: r2 assertion");
    assert(f7 === 7'b0000000) else $fatal("Test Failed: f7 assertion");
  
    
	 // Type I
	 instruction = 32'b00000001010000010000000010010011;
	 #10;
	 assert(opcode === 7'b0010011) else $fatal("Test Failed: Opcode assertion");
    assert(rd === 5'b00001) else $fatal("Test Failed: rd assertion");
    assert(f3 === 3'b000) else $fatal("Test Failed: f3 assertion");
    assert(r1 === 5'b00010) else $fatal("Test Failed: r1 assertion");
    assert(f7 === 7'b0000000) else $fatal("Test Failed: f7 assertion");
	 assert(raw_immediate === 24'b0000000101000001000000001);
	
	 

	 
  end

  // Add any other necessary simulation setup or monitor blocks here

endmodule
