`timescale 1ns / 1ps

module Test_Pipe_execute_vP;

  // Inputs
  logic [31:0] instruction_D;
  logic write_scalar_reg_D;
  logic [1:0] result_source_D;
  logic [2:0] width_type_D;
  logic mem_write_D;
  logic [3:0] ALU_op_D;
  logic [2:0] cond_code_D;
  logic ALU_source_D;
  logic branch_D;
  logic jump_D;
  logic i_jump_D;
  logic PC_to_ALU_D;
  logic memory_transaction_D;

  logic write_vector_reg_D;
  logic select_operand_0_vector_D;
  logic select_operand_1_vector_D;
  logic rerouting_select_D;
  logic [2:0] rerouting_code_D;

  // Data signals
  logic [5:0] rd_D;
  logic [5:0] r1_D;
  logic [5:0] r2_D;

  logic [31:0] scalar_reg_data_0_D;
  logic [31:0] scalar_reg_data_1_D;

  logic [127:0] vector_reg_data_0_D;
  logic [127:0] vector_reg_data_1_D;

  logic [31:0] immediate_D;  
  logic [31:0] PC_D;
  logic [31:0] PC_plus_4_D;

  // Control signals
  logic enabler;
  logic clock;
  logic async_reset;
  logic sync_reset;

  // Outputs
  logic [31:0] instruction_E;

  logic write_scalar_reg_E;
  logic [1:0] result_source_E;
  logic [2:0] width_type_E;
  logic mem_write_E;
  logic [3:0] ALU_op_E;
  logic [2:0] cond_code_E;
  logic ALU_source_E;
  logic branch_E;
  logic jump_E;
  logic i_jump_E;
  logic PC_to_ALU_E;
  logic memory_transaction_E;

  logic write_vector_reg_E;
  logic select_operand_0_vector_E;
  logic select_operand_1_vector_E;
  logic rerouting_select_E;
  logic [2:0] rerouting_code_E;

  // Data signals
  logic [5:0] rd_E;
  logic [5:0] r1_E;
  logic [5:0] r2_E;

  logic [31:0] scalar_reg_data_0_E;
  logic [31:0] scalar_reg_data_1_E;

  logic [127:0] vector_reg_data_0_E;
  logic [127:0] vector_reg_data_1_E;

  logic [31:0] immediate_E;  
  logic [31:0] PC_E;
  logic [31:0] PC_plus_4_E;

  // Instantiate the module
  Pipe_execute_vP uut (
    .instruction_D(instruction_D),
    .write_scalar_reg_D(write_scalar_reg_D),
    .result_source_D(result_source_D),
    .width_type_D(width_type_D),
    .mem_write_D(mem_write_D),
    .ALU_op_D(ALU_op_D),
    .cond_code_D(cond_code_D),
    .ALU_source_D(ALU_source_D),
    .branch_D(branch_D),
    .jump_D(jump_D),
    .i_jump_D(i_jump_D),
    .PC_to_ALU_D(PC_to_ALU_D),
    .memory_transaction_D(memory_transaction_D),
    .write_vector_reg_D(write_vector_reg_D),
    .select_operand_0_vector_D(select_operand_0_vector_D),
    .select_operand_1_vector_D(select_operand_1_vector_D),
    .rerouting_select_D(rerouting_select_D),
    .rerouting_code_D(rerouting_code_D),
    .rd_D(rd_D),
    .r1_D(r1_D),
    .r2_D(r2_D),
    .scalar_reg_data_0_D(scalar_reg_data_0_D),
    .scalar_reg_data_1_D(scalar_reg_data_1_D),
    .vector_reg_data_0_D(vector_reg_data_0_D),
    .vector_reg_data_1_D(vector_reg_data_1_D),
    .immediate_D(immediate_D),
    .PC_D(PC_D),
    .PC_plus_4_D(PC_plus_4_D),
    .enabler(enabler),
    .clock(clock),
    .async_reset(async_reset),
    .sync_reset(sync_reset),
    .instruction_E(instruction_E),
    .write_scalar_reg_E(write_scalar_reg_E),
    .result_source_E(result_source_E),
    .width_type_E(width_type_E),
    .mem_write_E(mem_write_E),
    .ALU_op_E(ALU_op_E),
    .cond_code_E(cond_code_E),
    .ALU_source_E(ALU_source_E),
    .branch_E(branch_E),
    .jump_E(jump_E),
    .i_jump_E(i_jump_E),
    .PC_to_ALU_E(PC_to_ALU_E),
    .memory_transaction_E(memory_transaction_E),
    .write_vector_reg_E(write_vector_reg_E),
    .select_operand_0_vector_E(select_operand_0_vector_E),
    .select_operand_1_vector_E(select_operand_1_vector_E),
    .rerouting_select_E(rerouting_select_E),
    .rerouting_code_E(rerouting_code_E),
    .rd_E(rd_E),
    .r1_E(r1_E),
    .r2_E(r2_E),
    .scalar_reg_data_0_E(scalar_reg_data_0_E),
    .scalar_reg_data_1_E(scalar_reg_data_1_E),
    .vector_reg_data_0_E(vector_reg_dat
