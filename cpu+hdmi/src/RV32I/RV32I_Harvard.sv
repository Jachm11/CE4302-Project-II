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
		

		ROM_1p_13a_32g #(.PATH("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/Instructions/icosahedron.mif")) ROM(
			.address(shiftted_PC[12:0]),
			.clock(!clock),
			.q(instruction)
		);

  logic [18:0] RAM_data_out_b;
  RAM_1rwp_1rp_19a_128b_8g RAM
  (
    .address_a(ALU_result[18:0]),
    .address_b(19'd0),
    .data_in(data_out_bus),
    .byte_enablers(byte_enablers),
    .write_enable(mem_write),

    .clock(!clock),

    .data_out_a(read_data_bus),
    .data_out_b(RAM_data_out_b)
  );

endmodule