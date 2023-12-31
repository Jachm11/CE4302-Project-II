module RV32I_Harvard
(
	input logic clock,
	input logic async_reset
);
	// RV32I variables
		// Data in
			logic [127:0] read_data_bus;
			logic data_ready;
		// Instruction
			logic [31:0] instruction;		
			logic instruction_ready;
		// Data out
			logic memory_transaction;
			logic mem_write;
			logic [31:0] ALU_result;
			logic [127:0] data_out_bus;
			logic [15:0] byte_enablers;
			logic [31:0] PC;
		assign instruction_ready = 1'b1;

	// Core-ROM Interface
		logic [31:0] shiftted_PC;
		assign shiftted_PC = PC >> 2;// ROM workaround

	// -- Modules --
		RV32I RV
		(
			// Inputs
			.read_data_bus(read_data_bus),
			.data_ready(data_ready),
			.instruction(instruction),
			.instruction_ready(instruction_ready),
			
			// Secuential signals
			.clock(clock),
			.async_reset(async_reset),

			// Outputs
			.memory_transaction(memory_transaction),
			.mem_write(mem_write),
			.ALU_result(ALU_result),
			.data_out_bus(data_out_bus),
			.byte_enablers(byte_enablers),
			.PC(PC)
		);

		// To wait for RAM read/write cicle
		MT_FSM FSM
		(
			.MT(memory_transaction),
			// Secuential signals
			.clock(clock),	
			.async_reset(async_reset),

			.state(data_ready)
		);

		// ROM_1p_32w_8a_32b #(.PATH("C:/intelFPGA_lite/LBP/Projects/logic_circuit_main/Modules/Memory/Mifs/Instructions/rippling.mif")) ROM
		ROM_1p_32w_8a_32b #(.PATH("C:/Users/aleja/OneDrive/Documents/D/Files/program_works/quartus/arqui_2_proyecto_2_procesador_vectorial/Modules/Memory/Mifs/Instructions/test.mif")) ROM
		(
			.address(shiftted_PC[7:0]),
			
			.clock(!clock),
			
			.q(instruction)
		);

		RAM_1p_8g_20a_128b RAM
		(
			.address(ALU_result[19:0]),
			.data_in(data_out_bus),
			.byte_enablers(byte_enablers),
			.write_enable(mem_write),

			.clock(!clock),

			.data_out(read_data_bus)
		);
endmodule