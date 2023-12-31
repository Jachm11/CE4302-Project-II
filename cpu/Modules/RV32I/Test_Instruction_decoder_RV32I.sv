`timescale 1ns / 1ps

module Test_Instruction_decoder_RV32I;

  // Inputs
  logic [6:0] opcode;
  
  // Outputs
  logic r, i_arithmetic_logic, i_load, store, branch, jump, i_jump, u, u_pc, i_transfer;
  logic vector_r, scalar_to_vector, vector_to_scalar, store_vector, load_vector, vector_absolute;

  // Instantiate the module
  Instruction_decoder_RV32I uut (
    .opcode(opcode),
    .r(r),
    .i_arithmetic_logic(i_arithmetic_logic),
    .i_load(i_load),
    .store(store),
    .branch(branch),
    .jump(jump),
    .i_jump(i_jump),
    .u(u),
    .u_pc(u_pc),
    .i_transfer(i_transfer),
    .vector_r(vector_r),
    .scalar_to_vector(scalar_to_vector),
    .vector_to_scalar(vector_to_scalar),
    .store_vector(store_vector),
    .load_vector(load_vector),
    .vector_absolute(vector_absolute)
  );

  // Stimulus generation
  initial begin
    // Test case 1: opcode = 51
    opcode = 7'd51;
	 #10;
    assert(r === 1) else $fatal("Test failed for opcode %0d. r is incorrect.", opcode);
    assert(i_arithmetic_logic === 0) else $fatal("Test failed for opcode %0d. i_arithmetic_logic is incorrect.", opcode);
    assert(i_load === 0) else $fatal("Test failed for opcode %0d. i_load is incorrect.", opcode);

    // Test case 2: opcode = 19
    opcode = 7'd19;
	 #10;
    assert(r === 0) else $fatal("Test failed for opcode %0d. r is incorrect.", opcode);
    assert(i_arithmetic_logic === 1) else $fatal("Test failed for opcode %0d. i_arithmetic_logic is incorrect.", opcode);
    assert(i_load === 0) else $fatal("Test failed for opcode %0d. i_load is incorrect.", opcode);

	 
	opcode = 7'd3;
	#10;
   assert(r === 0) else $fatal("Test failed for opcode %0d. r is incorrect.", opcode);
   assert(i_arithmetic_logic === 0) else $fatal("Test failed for opcode %0d. i_arithmetic_logic is incorrect.", opcode);
   assert(i_load === 1) else $fatal("Test failed for opcode %0d. i_load is incorrect.", opcode);


  end



endmodule
