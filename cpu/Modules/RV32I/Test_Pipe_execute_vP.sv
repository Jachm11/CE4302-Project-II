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

  // Outputs
  reg [31:0] instruction_E;
  reg write_scalar_reg_E;
  reg [1:0] result_source_E;
  reg [2:0] width_type_E;
  reg mem_write_E;
  reg [3:0] ALU_op_E;
  reg [2:0] cond_code_E;
  reg ALU_source_E;
  reg branch_E;
  reg jump_E;
  reg i_jump_E;
  reg PC_to_ALU_E;
  reg memory_transaction_E;

  reg write_vector_reg_E;
  reg select_operand_0_vector_E;
  reg select_operand_1_vector_E;
  reg rerouting_select_E;
  reg [2:0] rerouting_code_E;

  // Data signals
  reg [5:0] rd_E;
  reg [5:0] r1_E;
  reg [5:0] r2_E;

  reg [31:0] scalar_reg_data_0_E;
  reg [31:0] scalar_reg_data_1_E;

  reg [127:0] vector_reg_data_0_E;
  reg [127:0] vector_reg_data_1_E;

  reg [31:0] immediate_E;  
  reg [31:0] PC_E;
  reg [31:0] PC_plus_4_E;

  // Clock and reset signals
  reg clock;
  reg async_reset;
  reg sync_reset;

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
    
    .enabler(1), // Enable the execution
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

    .vector_reg_data_0_E(vector_reg_data_0_E),
    .vector_reg_data_1_E(vector_reg_data_1_E),

    .immediate_E(immediate_E),
    .PC_E(PC_E),
    .PC_plus_4_E(PC_plus_4_E)
  );

  // Stimulus generation
  initial begin
		clock=0; async_reset=0;  #13;  /*auto clock*/  async_reset=1;
    // Test case 1: Default values
    async_reset = 1; sync_reset = 0;
    instruction_D = 32'h0000_0000;
    write_scalar_reg_D = 0;
    result_source_D = 2'b00;
    width_type_D = 3'b000;
    mem_write_D = 0;
    ALU_op_D = 4'b0000;
    cond_code_D = 3'b000;
    ALU_source_D = 0;
    branch_D = 0;
    jump_D = 0;
    i_jump_D = 0;
    PC_to_ALU_D = 0;
    memory_transaction_D = 0;

    write_vector_reg_D = 0;
    select_operand_0_vector_D = 0;
    select_operand_1_vector_D = 0;
    rerouting_select_D = 0;
    rerouting_code_D = 3'b000;

    rd_D = 6'b000000;
    r1_D = 6'b000000;
    r2_D = 6'b000000;

    scalar_reg_data_0_D = 32'h0000_0000;
    scalar_reg_data_1_D = 32'h0000_0000;

    vector_reg_data_0_D = 128'h0000_0000_0000_0000_0000_0000_0000_0000;
    vector_reg_data_1_D = 128'h0000_0000_0000_0000_0000_0000_0000_0000;

    immediate_D = 32'h0000_0000;
    PC_D = 32'h0000_0000;
    PC_plus_4_D = 32'h0000_0000;

    #10;
  end
  always #5 clock = ~clock;//#10 = un ciclo

endmodule 