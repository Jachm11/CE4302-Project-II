`timescale 1ns / 1ps
module Test_Main_decoder;

  // Inputs
  logic [6:0] opcode;
  logic [2:0] f3;
  logic [6:0] f7;

  // Outputs
  logic write_scalar_reg;
  logic [1:0] result_source;
  logic [2:0] width_type;
  logic mem_write;
  logic [3:0] ALU_op;
  logic [2:0] cond_code;
  logic ALU_source;
  logic jump;
  logic i_jump;
  logic branch;
  logic PC_to_ALU;
  logic memory_transaction;
  logic [2:0] immediate_type;

  logic immediate_i_exception;
  logic write_vector_reg;
  logic select_operand_0_vector;
  logic select_operand_1_vector;
  logic rerouting_select;
  logic [2:0] rerouting_code;

  // Instantiate the Main_decoder module
  Main_decoder uut (
    .opcode(opcode),
    .f3(f3),
    .f7(f7),

    .write_scalar_reg(write_scalar_reg),
    .result_source(result_source),
    .width_type(width_type),
    .mem_write(mem_write),
    .ALU_op(ALU_op),
    .cond_code(cond_code),
    .ALU_source(ALU_source),
    .jump(jump),
    .i_jump(i_jump),
    .branch(branch),
    .PC_to_ALU(PC_to_ALU),
    .memory_transaction(memory_transaction),
    .immediate_type(immediate_type),

    .immediate_i_exception(immediate_i_exception),
    .write_vector_reg(write_vector_reg),
    .select_operand_0_vector(select_operand_0_vector),
    .select_operand_1_vector(select_operand_1_vector),
    .rerouting_select(rerouting_select),
    .rerouting_code(rerouting_code)
  );


  // Apply inputs and check outputs
  initial begin
    opcode = 7'b0101010;
    f3 = 3'b110;
    f7 = 7'b1010101;

    #10;


  end

endmodule
