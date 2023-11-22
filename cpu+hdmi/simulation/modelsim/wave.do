onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Test_RV32I_Harvard/clock
add wave -noupdate /Test_RV32I_Harvard/async_reset
add wave -noupdate -group RV -expand -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/read_data_bus
add wave -noupdate -group RV -expand -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/data_ready
add wave -noupdate -group RV -expand -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/instruction
add wave -noupdate -group RV -expand -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/instruction_ready
add wave -noupdate -group RV -expand -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/clock
add wave -noupdate -group RV -expand -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/async_reset
add wave -noupdate -group RV -group Out /Test_RV32I_Harvard/rvh/RV/memory_transaction
add wave -noupdate -group RV -group Out /Test_RV32I_Harvard/rvh/RV/mem_write
add wave -noupdate -group RV -group Out /Test_RV32I_Harvard/rvh/RV/ALU_result
add wave -noupdate -group RV -group Out /Test_RV32I_Harvard/rvh/RV/data_out_bus
add wave -noupdate -group RV -group Out /Test_RV32I_Harvard/rvh/RV/byte_enablers
add wave -noupdate -group RV -group Out /Test_RV32I_Harvard/rvh/RV/PC
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_F
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_plus_4_F
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/instruction_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_scalar_reg_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/result_source_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/width_type_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/mem_write_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_op_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/cond_code_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_source_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/jump_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/i_jump_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/branch_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_to_ALU_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/memory_transaction_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_vector_reg_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/select_operand_0_vector_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/select_operand_1_vector_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rerouting_select_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rerouting_code_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/r1_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/r2_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rd_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/scalar_reg_data_0_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/scalar_reg_data_1_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/vector_reg_data_0_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/vector_reg_data_1_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/immediate_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_plus_4_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/predicted_PC_D
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/instruction_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_scalar_reg_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/result_source_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/width_type_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/mem_write_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_op_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/cond_code_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_source_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/branch_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/jump_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/i_jump_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_to_ALU_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/memory_transaction_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/change_PC_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_vector_reg_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/select_operand_0_vector_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/select_operand_1_vector_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rerouting_select_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rerouting_code_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rd_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/r1_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/r2_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/scalar_reg_data_0_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/scalar_reg_data_1_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/vector_reg_data_0_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/vector_reg_data_1_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/immediate_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_result_bus_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_data_bus_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_source_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_plus_4_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/instruction_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_scalar_reg_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/result_source_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/width_type_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/mem_write_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/memory_transaction_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_vector_reg_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rd_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_result_bus_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_data_bus_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/read_data_bus_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/read_data_0_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_plus_4_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/instruction_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_scalar_reg_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/result_source_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/write_vector_reg_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/rd_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/ALU_result_bus_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/read_data_bus_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/data_bus_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/PC_plus_4_W
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/enable_fetch
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/enable_decode
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/enable_execute
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/enable_memory
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/enable_writeback
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/flush_decode
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/flush_execute
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/flush_memory
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/forward_operand_0_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/forward_operand_1_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/mem_to_reg_E
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/dec_o
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/reg_write_M
add wave -noupdate -group RV -group Internal /Test_RV32I_Harvard/rvh/RV/reg_write_W
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC_plus_4_E
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/ALU_result_0_E
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/predicted_PC_D
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC_source_E
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/enable_fetch
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/branch_prediction_D
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/clock
add wave -noupdate -expand -group {Fetch Stage} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/async_reset
add wave -noupdate -expand -group {Fetch Stage} -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC_F
add wave -noupdate -expand -group {Fetch Stage} -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC_plus_4_F
add wave -noupdate -expand -group {Fetch Stage} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_PC_source_o
add wave -noupdate -expand -group {Fetch Stage} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/reg_PC_o
add wave -noupdate -expand -group {Fetch Stage} -expand -group {Mux PC Source} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_PC_source/select
add wave -noupdate -expand -group {Fetch Stage} -expand -group {Mux PC Source} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_PC_source/channels
add wave -noupdate -expand -group {Fetch Stage} -expand -group {Mux PC Source} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_PC_source/channel_out
add wave -noupdate -expand -group {Fetch Stage} -group PC -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC/data_in
add wave -noupdate -expand -group {Fetch Stage} -group PC -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC/enabler
add wave -noupdate -expand -group {Fetch Stage} -group PC -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC/clock
add wave -noupdate -expand -group {Fetch Stage} -group PC -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC/async_reset
add wave -noupdate -expand -group {Fetch Stage} -group PC -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/PC/data_out
add wave -noupdate -expand -group {Fetch Stage} -expand -group {Mux Prediction} -expand -group In -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_prediction/select
add wave -noupdate -expand -group {Fetch Stage} -expand -group {Mux Prediction} -expand -group In -group Intenrnal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_prediction/channels
add wave -noupdate -expand -group {Fetch Stage} -expand -group {Mux Prediction} -color Cyan -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/mux_prediction/channel_out
add wave -noupdate -expand -group {Fetch Stage} -group {Adder PC+=4} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/adder_pc_plus_4/A
add wave -noupdate -expand -group {Fetch Stage} -group {Adder PC+=4} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/adder_pc_plus_4/B
add wave -noupdate -expand -group {Fetch Stage} -group {Adder PC+=4} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/FS/adder_pc_plus_4/O
add wave -noupdate -expand -group ROM -radix hexadecimal /Test_RV32I_Harvard/rvh/ROM/address
add wave -noupdate -expand -group ROM -radix hexadecimal /Test_RV32I_Harvard/rvh/ROM/clock
add wave -noupdate -expand -group ROM -color Magenta -radix hexadecimal /Test_RV32I_Harvard/rvh/ROM/q
add wave -noupdate -expand -group ROM -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/ROM/sub_wire0
add wave -noupdate -group {Pipe Decode} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/instruction_F
add wave -noupdate -group {Pipe Decode} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/PC_F
add wave -noupdate -group {Pipe Decode} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/PC_plus_4_F
add wave -noupdate -group {Pipe Decode} -expand -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/enabler
add wave -noupdate -group {Pipe Decode} -expand -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/clock
add wave -noupdate -group {Pipe Decode} -expand -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/async_reset
add wave -noupdate -group {Pipe Decode} -expand -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/sync_reset
add wave -noupdate -group {Pipe Decode} -expand -group Out -color Magenta -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/instruction_D
add wave -noupdate -group {Pipe Decode} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/PC_D
add wave -noupdate -group {Pipe Decode} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PD/PC_plus_4_D
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/instruction
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/opcode
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/rd
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/f3
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/r1
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/r2
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/f7
add wave -noupdate -expand -group {Decode Stage} -group {Instruction Splitter} -group Out /Test_RV32I_Harvard/rvh/RV/DS/instruction_splitter/raw_immediate
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/write_scalar_reg
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/result_source
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/width_type
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/mem_write
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_op
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/cond_code
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_source
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/jump
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/i_jump
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/branch
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/PC_to_ALU
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/memory_transaction
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/immediate_type
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/immediate_i_exception
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/write_vector_reg
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/select_operand_0_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/select_operand_1_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rerouting_select
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group CS /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rerouting_code
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/opcode
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/r
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/i_arithmetic_logic
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/i_load
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/store
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/branch
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/jump
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/i_jump
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/u
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/u_pc
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/i_transfer
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/vector_r
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/scalar_to_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/vector_to_scalar
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/store_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/load_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -expand -group Out -color Pink /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/vector_absolute
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Instruction Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/id/o_aux
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {F3 Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f3/code
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {F3 Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f3/o
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/f7
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} -group Out /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/o_0x0
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} -group Out /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/o_0x1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} -group Out /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/o_0x2
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} -group Out /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/o_0x3
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} -group Out /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/o_0x20
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {F7 Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/dec_f7/o_aux
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Result Source Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rsd/load
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Result Source Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rsd/jump
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Result Source Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rsd/i_jump
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Result Source Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rsd/load_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Result Source Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rsd/f3_eq_0
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Result Source Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/rsd/result_source
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/load
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/store
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/load_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/store_vector
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/decoded_f3
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/width
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/scalar_memory_transaction
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/vector_memory_transaction
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/half
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/word
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/byte_u
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/half_u
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Load Store Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/lsd/o_aux
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/R
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/I
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/U
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/VR
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/abs
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/decoded_f3
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/f7_eq_0x0
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/f7_eq_0x1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/f7_eq_0x20
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/ALU_op
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {ALU Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/ALU_dec/encoder_input
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Branch Condition Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/bcd/decoded_f3
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Branch Condition Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/bcd/B
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Branch Condition Dec} -radix decimal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/bcd/comp_code
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -expand -group {Branch Condition Dec} -group Internal /Test_RV32I_Harvard/rvh/RV/DS/main_dec/bcd/encoder_input
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/STV
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/VTS
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/f7_eq_0x1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/f7_eq_0x2
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} -group In /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/f7_eq_0x3
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/rerouting_select
add wave -noupdate -expand -group {Decode Stage} -expand -group {Main Dec} -group {Rerouting Dec} /Test_RV32I_Harvard/rvh/RV/DS/main_dec/Rerouting_dec/rerouting_code
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/immediate_type
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/immediate_i_exception
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/raw_immediate
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/immediate
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/i_imm_without_changes
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/i_imm_aux
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/i_imm
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/s_imm
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/b_imm
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/u_imm
add wave -noupdate -expand -group {Decode Stage} -group {Immediate Builder} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/sign_ext/j_imm
add wave -noupdate -expand -group {Decode Stage} -group {+ Branch Prediction} /Test_RV32I_Harvard/rvh/RV/DS/adder_branch_prediction/A
add wave -noupdate -expand -group {Decode Stage} -group {+ Branch Prediction} /Test_RV32I_Harvard/rvh/RV/DS/adder_branch_prediction/B
add wave -noupdate -expand -group {Decode Stage} -group {+ Branch Prediction} /Test_RV32I_Harvard/rvh/RV/DS/adder_branch_prediction/O
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/write_enable
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/read_addr_1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/read_addr_2
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/write_addr
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/write_data
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/clock
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/async_reset
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/read_data_1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/read_data_2
add wave -noupdate -expand -group {Decode Stage} -expand -group {Scalar Reg File} -expand -group Internal -radix hexadecimal -childformat {{{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[31]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[30]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[29]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[28]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[27]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[26]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[25]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[24]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[23]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[22]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[21]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[20]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[19]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[18]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[17]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[16]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[15]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[14]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[13]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[12]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[11]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[10]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[9]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[8]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[7]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[6]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[5]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[4]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[3]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[2]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[1]} -radix hexadecimal}} -expand -subitemconfig {{/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[31]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[30]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[29]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[28]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[27]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[26]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[25]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[24]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[23]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[22]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[21]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[20]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[19]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[18]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[17]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[16]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[15]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[14]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[13]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[12]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[11]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[10]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[9]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[8]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[7]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[6]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[5]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[4]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[3]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[2]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf[1]} {-height 17 -radix hexadecimal}} /Test_RV32I_Harvard/rvh/RV/DS/scalar_reg_file/rf
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/write_enable
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/read_addr_1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/read_addr_2
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/write_addr
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/write_data
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/clock
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/async_reset
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/read_data_1
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/read_data_2
add wave -noupdate -expand -group {Decode Stage} -expand -group {Vector Reg File} -expand -group Internal -radix hexadecimal -childformat {{{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[31]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[30]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[29]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[28]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[27]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[26]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[25]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[24]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[23]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[22]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[21]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[20]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[19]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[18]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[17]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[16]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[15]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[14]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[13]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[12]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[11]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[10]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[9]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[8]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[7]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[6]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[5]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[4]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[3]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[2]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[1]} -radix hexadecimal}} -expand -subitemconfig {{/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[31]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[30]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[29]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[28]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[27]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[26]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[25]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[24]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[23]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[22]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[21]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[20]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[19]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[18]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[17]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[16]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[15]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[14]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[13]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[12]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[11]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[10]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[9]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[8]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[7]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[6]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[5]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[4]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[3]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[2]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf[1]} {-height 17 -radix hexadecimal}} /Test_RV32I_Harvard/rvh/RV/DS/vector_reg_file/rf
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/instruction_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/write_scalar_reg_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/result_source_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/width_type_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/mem_write_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/ALU_op_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/cond_code_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/ALU_source_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/branch_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/jump_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/i_jump_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/PC_to_ALU_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/memory_transaction_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/write_vector_reg_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/select_operand_0_vector_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/select_operand_1_vector_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/rerouting_select_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/rerouting_code_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/rd_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/r1_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/r2_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/scalar_reg_data_0_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/scalar_reg_data_1_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/vector_reg_data_0_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/vector_reg_data_1_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/immediate_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/PC_D
add wave -noupdate -expand -group {Pipe Execute} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/PC_plus_4_D
add wave -noupdate -expand -group {Pipe Execute} -group {Internal CS} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/enabler
add wave -noupdate -expand -group {Pipe Execute} -group {Internal CS} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/clock
add wave -noupdate -expand -group {Pipe Execute} -group {Internal CS} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/async_reset
add wave -noupdate -expand -group {Pipe Execute} -group {Internal CS} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/sync_reset
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -color Magenta -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/instruction_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/write_scalar_reg_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/result_source_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/width_type_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/mem_write_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/ALU_op_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/cond_code_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/ALU_source_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/branch_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/jump_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/i_jump_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/PC_to_ALU_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/memory_transaction_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/write_vector_reg_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/select_operand_0_vector_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/select_operand_1_vector_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/rerouting_select_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/rerouting_code_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/rd_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/r1_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/r2_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/scalar_reg_data_0_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/scalar_reg_data_1_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/vector_reg_data_0_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/vector_reg_data_1_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/immediate_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/PC_E
add wave -noupdate -expand -group {Pipe Execute} -expand -group Out -expand -group Data -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PE/PC_plus_4_E
add wave -noupdate -expand -group {Execute Stage} -group {Mux Fusion 0} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_fusion_0/select
add wave -noupdate -expand -group {Execute Stage} -group {Mux Fusion 0} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_fusion_0/channels
add wave -noupdate -expand -group {Execute Stage} -group {Mux Fusion 0} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_fusion_0/channel_out
add wave -noupdate -expand -group {Execute Stage} -group {Mux Fusion 1} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_fusion_1/select
add wave -noupdate -expand -group {Execute Stage} -group {Mux Fusion 1} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_fusion_1/channels
add wave -noupdate -expand -group {Execute Stage} -group {Mux Fusion 1} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_fusion_1/channel_out
add wave -noupdate -expand -group {Execute Stage} -group {Mux Forward 0} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/select
add wave -noupdate -expand -group {Execute Stage} -group {Mux Forward 0} -expand -group Internal -radix hexadecimal -childformat {{{/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[3]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[2]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[1]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[0]} -radix hexadecimal}} -expand -subitemconfig {{/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[3]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[2]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[1]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels[0]} {-height 17 -radix hexadecimal}} /Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channels
add wave -noupdate -expand -group {Execute Stage} -group {Mux Forward 0} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_forward_0/channel_out
add wave -noupdate -expand -group {Execute Stage} -group {Mux Forward 1} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_forward_1/select
add wave -noupdate -expand -group {Execute Stage} -group {Mux Forward 1} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_forward_1/channels
add wave -noupdate -expand -group {Execute Stage} -group {Mux Forward 1} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_forward_1/channel_out
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/comp/cond
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/comp/a
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/comp/b
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/comp/approved
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/comp/conditions
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -group {PC change} -color Gold -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/PC_source_E
add wave -noupdate -expand -group {Execute Stage} -group {Comparison Unit} -group {PC change} -color Gold /Test_RV32I_Harvard/rvh/RV/ES/change_PC_E
add wave -noupdate -expand -group {Execute Stage} -expand -group {Mux Operand 0} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_operand_0/select
add wave -noupdate -expand -group {Execute Stage} -expand -group {Mux Operand 0} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_operand_0/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group {Mux Operand 0} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_operand_0/channel_out
add wave -noupdate -expand -group {Execute Stage} -expand -group {Mux Operand 1} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/select
add wave -noupdate -expand -group {Execute Stage} -expand -group {Mux Operand 1} -group Internal -radix hexadecimal -childformat {{{/Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/channels[1]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/channels[0]} -radix hexadecimal}} -expand -subitemconfig {{/Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/channels[1]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/channels[0]} {-height 17 -radix hexadecimal}} /Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group {Mux Operand 1} -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/mux_operand_1/channel_out
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/op
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/a
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/b
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/add_sub_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/slt_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 0} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_0/abs_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/op
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/a
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/b
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/add_sub_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/slt_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 1} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_1/abs_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/op
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/a
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/b
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/add_sub_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/slt_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 2} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_2/abs_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/op
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/a
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/b
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/add_sub_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/slt_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {ALU 3} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/ALU_3/abs_o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -group {Router Dec} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/dec/code
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -group {Router Dec} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/dec/o
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[0]} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_0/select
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[0]} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_0/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[0]} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_0/channel_out
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[1]} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_1/select
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[1]} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_1/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[1]} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_1/channel_out
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[2]} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_2/select
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[2]} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_2/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[2]} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_2/channel_out
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[3]} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_3/select
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[3]} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_3/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -group Router -expand -group {Mux B[3]} -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/router/mux_3/channel_out
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {Mux ALU Result} -expand -group In -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/select
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {Mux ALU Result} -expand -group In -group Internal -radix hexadecimal -childformat {{{/Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/channels[1]} -radix hexadecimal} {{/Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/channels[0]} -radix hexadecimal}} -expand -subitemconfig {{/Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/channels[1]} {-height 17 -radix hexadecimal} {/Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/channels[0]} {-height 17 -radix hexadecimal}} /Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/channels
add wave -noupdate -expand -group {Execute Stage} -expand -group VALU -expand -group {Mux ALU Result} -expand -group Out -radix decimal /Test_RV32I_Harvard/rvh/RV/ES/VALU/mux/channel_out
add wave -noupdate -group {Mem To Reg Dec} /Test_RV32I_Harvard/rvh/RV/dec/code
add wave -noupdate -group {Mem To Reg Dec} /Test_RV32I_Harvard/rvh/RV/dec/o
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/instruction_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/write_scalar_reg_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/result_source_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/width_type_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/mem_write_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/memory_transaction_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/write_vector_reg_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/ALU_result_bus_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/write_data_bus_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/rd_E
add wave -noupdate -expand -group {Pipe Memory} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/PC_plus_4_E
add wave -noupdate -expand -group {Pipe Memory} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/enabler
add wave -noupdate -expand -group {Pipe Memory} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/clock
add wave -noupdate -expand -group {Pipe Memory} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/async_reset
add wave -noupdate -expand -group {Pipe Memory} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/sync_reset
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Magenta -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/instruction_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/write_scalar_reg_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/result_source_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/width_type_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/mem_write_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/memory_transaction_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/write_vector_reg_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/rd_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/ALU_result_bus_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -color {Medium Orchid} -radix decimal /Test_RV32I_Harvard/rvh/RV/PM/write_data_bus_M
add wave -noupdate -expand -group {Pipe Memory} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PM/PC_plus_4_M
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/address_a
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/address_b
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/data_in
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/byte_enablers
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/write_enable
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/clock
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/data_out_a
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/data_out_b
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/offset_a
add wave -noupdate -expand -group RAM /Test_RV32I_Harvard/rvh/RAM/offset_b
add wave -noupdate -expand -group OBH -group In /Test_RV32I_Harvard/rvh/RV/OBH/width_type
add wave -noupdate -expand -group OBH -group In /Test_RV32I_Harvard/rvh/RV/OBH/enabler
add wave -noupdate -expand -group OBH /Test_RV32I_Harvard/rvh/RV/OBH/byte_enablers
add wave -noupdate -expand -group OBH -group {OBH Dec} /Test_RV32I_Harvard/rvh/RV/OBH/dec/code
add wave -noupdate -expand -group OBH -group {OBH Dec} /Test_RV32I_Harvard/rvh/RV/OBH/dec/o
add wave -noupdate -group {MT FSM} -group CS /Test_RV32I_Harvard/rvh/FSM/clock
add wave -noupdate -group {MT FSM} -group CS /Test_RV32I_Harvard/rvh/FSM/async_reset
add wave -noupdate -group {MT FSM} -group Internal /Test_RV32I_Harvard/rvh/FSM/data
add wave -noupdate -group {MT FSM} /Test_RV32I_Harvard/rvh/FSM/MT
add wave -noupdate -group {MT FSM} /Test_RV32I_Harvard/rvh/FSM/state
add wave -noupdate -expand -group IBH /Test_RV32I_Harvard/rvh/RV/IBH/width_type
add wave -noupdate -expand -group IBH /Test_RV32I_Harvard/rvh/RV/IBH/read_data_0
add wave -noupdate -expand -group IBH /Test_RV32I_Harvard/rvh/RV/IBH/o
add wave -noupdate -expand -group IBH -group Internal /Test_RV32I_Harvard/rvh/RV/IBH/signed_byte
add wave -noupdate -expand -group IBH -group Internal /Test_RV32I_Harvard/rvh/RV/IBH/signed_half_word
add wave -noupdate -expand -group IBH -group Internal /Test_RV32I_Harvard/rvh/RV/IBH/unsigned_byte
add wave -noupdate -expand -group IBH -group Internal /Test_RV32I_Harvard/rvh/RV/IBH/unsigned_half_word
add wave -noupdate -expand -group IBH -group Internal /Test_RV32I_Harvard/rvh/RV/IBH/mux_read_data_0_o
add wave -noupdate -expand -group IBH -group {Mux IBH} /Test_RV32I_Harvard/rvh/RV/IBH/mux_read_data_0/select
add wave -noupdate -expand -group IBH -group {Mux IBH} /Test_RV32I_Harvard/rvh/RV/IBH/mux_read_data_0/channels
add wave -noupdate -expand -group IBH -group {Mux IBH} /Test_RV32I_Harvard/rvh/RV/IBH/mux_read_data_0/channel_out
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/instruction_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/write_scalar_reg_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/result_source_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/write_vector_reg_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/rd_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/ALU_result_bus_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/read_data_bus_M
add wave -noupdate -expand -group {Pipe Writeback} -group In -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/PC_plus_4_M
add wave -noupdate -expand -group {Pipe Writeback} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/enabler
add wave -noupdate -expand -group {Pipe Writeback} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/clock
add wave -noupdate -expand -group {Pipe Writeback} -group CS -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/async_reset
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -color Magenta -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/instruction_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/write_scalar_reg_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/write_vector_reg_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/result_source_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/rd_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -radix decimal /Test_RV32I_Harvard/rvh/RV/PW/ALU_result_bus_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -radix decimal /Test_RV32I_Harvard/rvh/RV/PW/read_data_bus_W
add wave -noupdate -expand -group {Pipe Writeback} -expand -group Out -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/PW/PC_plus_4_W
add wave -noupdate -expand -group {Mux Writeback} -color Gold -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/mux_W/select
add wave -noupdate -expand -group {Mux Writeback} -group Internal -radix hexadecimal /Test_RV32I_Harvard/rvh/RV/mux_W/channels
add wave -noupdate -expand -group {Mux Writeback} -radix decimal /Test_RV32I_Harvard/rvh/RV/mux_W/channel_out
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/r1_D
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/r2_D
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/r1_E
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/r2_E
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/rd_E
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/rd_M
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/rd_W
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/reg_write_M
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/reg_write_W
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/mem_to_reg_E
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/PC_source_E
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/mem_transaction
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/data_ready
add wave -noupdate -group {Hazard Unit} -group In /Test_RV32I_Harvard/rvh/RV/HU/instruction_ready
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/forward_operand_0_E
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/forward_operand_1_E
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/enable_fetch
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/enable_decode
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/enable_execute
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/enable_memory
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/enable_writeback
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/flush_decode
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/flush_execute
add wave -noupdate -group {Hazard Unit} -group Out /Test_RV32I_Harvard/rvh/RV/HU/flush_memory
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/match_r1_E_M
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/match_r2_E_M
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/match_r1_E_W
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/match_r2_E_W
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/and_0
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/and_1
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/and_2
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/and_3
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/ex_r1_o
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/ex_r2_o
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/match_r1_D_E
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/match_r2_D_E
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/D_E_dependence
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/load_hazard
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/waiting_for_d_mem_to_respond
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/waiting_for_any_mem_to_respond
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/waiting_for_any_mem_to_respond_and_execute_stage_changes_PC
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/nor_aux
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/and_aux
add wave -noupdate -group {Hazard Unit} -group Internal /Test_RV32I_Harvard/rvh/RV/HU/ex_aux_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25008547 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 402
configure wave -valuecolwidth 179
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {24955937 ps} {25267596 ps}
