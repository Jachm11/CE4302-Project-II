module RV32I_Harvard
(
	input logic _50MHz_clock,
	input logic async_reset,

	output logic memory_transaction,
	output logic mem_write,
	output logic [31:0] alu_result,
	output logic [31:0] data_out,
	output logic [3:0] byte_enablers,
	output logic [31:0] pc
);

	// // PLL variables
	// 	logic _25175kHz_clock;
	// 	logic locked;
		
	// RV32I variables
		logic [31:0] read_data;
		logic [31:0] instruction;
		// Memory response hazard
			logic instruction_ready;
			logic data_ready;
			assign instruction_ready = 1'b1;

	// Core-ROM Interface
		logic [31:0] shiftted_pc;	
		assign shiftted_pc = pc >> 2;// ROM workaround

	// Unused R/W RAM port
		logic [31:0] RAM_port_2;

	// // VGA variables
	// 	logic h_sync;
	// 	logic v_sync;
	// 	logic [9:0]  pixel_x;
	// 	logic [9:0]  pixel_y;
	// 	logic on_active_region;
		
	// // Pixel Printer variables
	// 	logic [7:0] R;
	// 	logic [7:0] G;
	// 	logic [7:0] B;
	// 	logic [17:0] color_address;


	// Modules

		// asdf_ip_pll pll
		// (
		// 	.refclk(_50MHz_clock),
		// 	.rst(1'b0),
		// 	.outclk_0(_25175kHz_clock),
		// 	.locked(locked)
		// );


		RV32I rv
		(
			.read_data(read_data),
			.data_ready(data_ready),
			.instruction(instruction),
			.instruction_ready(instruction_ready),
			
			.clock(_50MHz_clock),
			.async_reset(async_reset),
			
			.memory_transaction(memory_transaction),
			.mem_write(mem_write),
			.alu_result(alu_result),
			.data_out(data_out),
			.byte_enablers(byte_enablers),
			.pc(pc)
		);


		// To wait for RAM read/write cicle
		Register_N_vP #(.N(1)) dr_reg
		(
			.d(memory_transaction),
			
			.clock(_50MHz_clock),	
			.async_reset(async_reset),
			
			.q(data_ready)
		);


		// ROM_1p_32w_8a_32b #(.PATH("C:/intelFPGA_lite/LBP/Projects/logic_circuit_main/Modules/Memory/Mifs/Instructions/rippling.mif")) ROM
		ROM_1p_32w_8a_32b #(.PATH("C:/Users/aleja/OneDrive/Documents/D/Files/program_works/quartus/arqui_2_proyecto_2_procesador_vectorial/Modules/Memory/Mifs/Instructions/test.mif")) ROM
		(
			.address(shiftted_pc[7:0]),
			
			.clock(~_50MHz_clock),
			
			.q(instruction)
		);


		RAM_2p_32w_18a_8b RAM
		(
			// R/W port 1
			.address_1(alu_result[17:0]),
			.data_in_1(data_out),
			.byte_enablers_1(byte_enablers),
			.write_enable_1(mem_write),
			// R/W port 2			
			.address_2(18'd0),
			.data_in_2(32'd0),
			.byte_enablers_2(4'd0),
			.write_enable_2(1'b0),
			
			.clock(~_50MHz_clock),
			
			.data_out_1(read_data),
			.data_out_2(RAM_port_2)
		);


		// VGA_driver vga_controller
		// (
		// 	._25175kHz_clock(_25175kHz_clock),
		// 	.async_reset(async_reset),
			
		// 	.h_sync(h_sync),
		// 	.v_sync(v_sync),
		// 	.pixel_x(pixel_x),
		// 	.pixel_y(pixel_y),
		// 	.on_active_region(on_active_region)
		// );


		// pixel_printer grapher
		// (
		// 	._25175kHz_clock(_25175kHz_clock),
		// 	.async_reset(async_reset),
		// 	.on_active_region(on_active_region),
		// 	.pixel_x(pixel_x),
		// 	.pixel_y(pixel_y),
		// 	.color(RAM_port_2[7:0]),
			
		// 	.red(R),
		// 	.green(G),
		// 	.blue(B),
		// 	.address(color_address)
		// );

endmodule