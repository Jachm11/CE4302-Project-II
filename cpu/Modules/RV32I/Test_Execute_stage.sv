`timescale 1ns / 1ps
module Test_Execute_stage;

  // Parameters
  parameter TIME_SCALE = 1ns;

  // Inputs
  logic select_operand_0_vector_tb;
  logic select_operand_1_vector_tb;
  logic [1:0] forward_operand_0_tb;
  logic [1:0] forward_operand_1_tb;
  logic [2:0] cond_code_tb;
  logic branch_tb;
  logic jump_tb;
  logic i_jump_tb;
  logic PC_to_ALU_tb;
  logic ALU_source_tb;
  logic [3:0] ALU_op_tb;
  logic [2:0] rerouting_code_tb;
  logic rerouting_select_tb;
  logic [31:0] scalar_reg_data_0_tb;
  logic [31:0] scalar_reg_data_1_tb;
  logic [127:0] vector_reg_data_0_tb;
  logic [127:0] vector_reg_data_1_tb;
  logic [31:0] PC_tb;
  logic [31:0] immediate_tb;
  logic [127:0] data_bus_M_tb;
  logic [127:0] data_bus_W_tb;

  // Outputs
  logic [127:0] ALU_result_bus_tb;
  logic [127:0] write_data_bus_tb;
  logic [1:0] PC_source_tb;
  logic change_PC_tb;

  // Instantiate the module under test
  Execute_stage uut (
    // Connect inputs
    .select_operand_0_vector_E(select_operand_0_vector_tb),
    .select_operand_1_vector_E(select_operand_1_vector_tb),
    .forward_operand_0_E(forward_operand_0_tb),
    .forward_operand_1_E(forward_operand_1_tb),
    .cond_code_E(cond_code_tb),
    .branch_E(branch_tb),
    .jump_E(jump_tb),
    .i_jump_E(i_jump_tb),
    .PC_to_ALU_E(PC_to_ALU_tb),
    .ALU_source_E(ALU_source_tb),
    .ALU_op_E(ALU_op_tb),
    .rerouting_code_E(rerouting_code_tb),
    .rerouting_select_E(rerouting_select_tb),
    .scalar_reg_data_0_E(scalar_reg_data_0_tb),
    .scalar_reg_data_1_E(scalar_reg_data_1_tb),
    .vector_reg_data_0_E(vector_reg_data_0_tb),
    .vector_reg_data_1_E(vector_reg_data_1_tb),
    .PC_E(PC_tb),
    .immediate_E(immediate_tb),
    .data_bus_M(data_bus_M_tb),
    .data_bus_W(data_bus_W_tb),

    // Connect outputs
    .ALU_result_bus_E(ALU_result_bus_tb),
    .write_data_bus_E(write_data_bus_tb),
    .PC_source_E(PC_source_tb),
    .change_PC_E(change_PC_tb)
  );

  // Stimulus
  initial begin
    // Initialize inputs
    select_operand_0_vector_tb = 1;
    select_operand_1_vector_tb = 1;
    forward_operand_0_tb = 0;
    forward_operand_1_tb = 0;
    cond_code_tb = 0;
    branch_tb = 0;
    jump_tb = 0;
    i_jump_tb = 0;
    PC_to_ALU_tb = 0;
    ALU_source_tb = 0;
    ALU_op_tb = 0;
    rerouting_code_tb = 0;
    rerouting_select_tb = 0;
    scalar_reg_data_0_tb = 0;
    scalar_reg_data_1_tb = 0;
    vector_reg_data_0_tb = 128'h11112222333344445555666677778888;
    vector_reg_data_1_tb = 128'h11112222333344445555666677778888;
    PC_tb = 0;
    immediate_tb = 0;
    data_bus_M_tb = 0;
    data_bus_W_tb = 0;

    
	 #10;

  end

endmodule