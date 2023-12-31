`timescale 1ns / 1ps
module Test_Hazard_unit_RV32I;

  // Parameters
  parameter TIME_SCALE = 1ns;
  
  	logic [5:0] r1_D_tb;  // Initialize with some values
	logic [5:0] r2_D_tb;
	logic [5:0] r1_E_tb;
	logic [5:0] r2_E_tb;
	logic [5:0] rd_E_tb;
	logic [5:0] rd_M_tb;
	logic [5:0] rd_W_tb;
	logic reg_write_M_tb;
	logic reg_write_W_tb;
	logic mem_to_reg_E_tb;
	logic PC_source_E_tb;
	logic mem_transaction_tb;
	logic data_ready_tb;
   logic instruction_ready_tb;

  // Outputs
  logic [1:0] forward_operand_0_E_tb;
  logic [1:0] forward_operand_1_E_tb;
  logic enable_fetch_tb;
  logic enable_decode_tb;
  logic enable_execute_tb;
  logic enable_memory_tb;
  logic enable_writeback_tb;
  logic flush_decode_tb;
  logic flush_execute_tb;
  logic flush_memory_tb;

  // Instantiate the module under test
  Hazard_unit_RV32I uut (
    // Connect inputs
    .r1_D(r1_D_tb),
    .r2_D(r2_D_tb),
    .r1_E(r1_E_tb),
    .r2_E(r2_E_tb),
    .rd_E(rd_E_tb),
    .rd_M(rd_M_tb),
    .rd_W(rd_W_tb),
    .reg_write_M(reg_write_M_tb),
    .reg_write_W(reg_write_W_tb),
    .mem_to_reg_E(mem_to_reg_E_tb),
    .PC_source_E(PC_source_E_tb),
    .mem_transaction(mem_transaction_tb),
    .data_ready(data_ready_tb),
    .instruction_ready(instruction_ready_tb),

    // Connect outputs
    .forward_operand_0_E(forward_operand_0_E_tb),
    .forward_operand_1_E(forward_operand_1_E_tb),
    .enable_fetch(enable_fetch_tb),
    .enable_decode(enable_decode_tb),
    .enable_execute(enable_execute_tb),
    .enable_memory(enable_memory_tb),
    .enable_writeback(enable_writeback_tb),
    .flush_decode(flush_decode_tb),
    .flush_execute(flush_execute_tb),
    .flush_memory(flush_memory_tb)
  );

  // Stimulus
  initial begin
  
  // Inputs
	r1_D_tb = 6'b000000;  // Initialize with some values
	r2_D_tb = 6'b000001;
	r1_E_tb = 6'b000010;
	r2_E_tb = 6'b000011;
	rd_E_tb = 6'b000100;
	rd_M_tb = 6'b000101;
	rd_W_tb = 6'b000110;
	reg_write_M_tb = 1'b0;
	reg_write_W_tb = 1'b0;
	mem_to_reg_E_tb = 1'b0;
	PC_source_E_tb = 1'b0;
	mem_transaction_tb = 1'b0;
	data_ready_tb = 1'b0;
   instruction_ready_tb = 1'b0;

   #100;
    
  end

endmodule