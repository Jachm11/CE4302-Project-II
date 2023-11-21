/**

*/

module TopModule(
	// **input**
	input clock50, 
	input reset_n,
	input switch,

	// ********************************** //
	// ** HDMI CONNECTIONS **

	// AUDIO
	// SPDIF va desconectado
	output HDMI_I2S0,  // dont care, no se usan
	output HDMI_MCLK,  // dont care, no se usan
	output HDMI_LRCLK, // dont care, no se usan
	output HDMI_SCLK,   // dont care, no se usan

	// VIDEO
	output [23:0] HDMI_TX_D, // RGBchannel
	output HDMI_TX_VS,  // vsync
	output HDMI_TX_HS,  // hsync
	output HDMI_TX_DE,  // dataEnable
	output HDMI_TX_CLK, // vgaClock

	// REGISTERS AND CONFIG LOGIC
	// HPD viene del conector
	input HDMI_TX_INT,
	inout HDMI_I2C_SDA,  // HDMI i2c data
	output HDMI_I2C_SCL, // HDMI i2c clock
	output READY        // HDMI is ready signal from i2c module
	// ********************************** //
);

//       _________________________
//______/ Variables y asignaciones

// General
logic reset;
assign reset = ~reset_n; // reset de placa presionado funciona con logica negativa

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
	logic [7:0] color_index;
	
// Core-ROM Interface
logic [31:0] shiftted_PC;
assign shiftted_PC = PC >> 2;// ROM workaround
 
// Display variables
logic [9:0] pixelX;
logic [9:0] pixelY;
logic clock25, locked;
logic [18:0] address_hdmi;


// Señales de audio en alta impedancia
assign HDMI_I2S0  = 1'bz;
assign HDMI_MCLK  = 1'bz;
assign HDMI_LRCLK = 1'bz;
assign HDMI_SCLK  = 1'bz;

//       _________________________
//______/ Modulos

//**CORE**
RV32I RV(
	// inputs
	.read_data_bus(read_data_bus),
	.data_ready(data_ready),
	.instruction(instruction),
	.instruction_ready(instruction_ready),
			
	// Secuential signals
	.clock(clock50),
	.async_reset(reset_n),

	// output
	.memory_transaction(memory_transaction),
	.mem_write(mem_write),
	.ALU_result(ALU_result),
	.data_out_bus(data_out_bus),
	.byte_enablers(byte_enablers),
	.PC(PC)
);

// To wait for RAM read/write cicle
MT_FSM FSM(
	.MT(memory_transaction),
	// Secuential signals
	.clock(clock50),	
	.async_reset(reset_n),

	.state(data_ready)
);

// **MEMORY: INSTRUCTIONS ROM**
ROM_1p_32w_8a_32b #(.PATH("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/Instructions/test_vector.mif")) ROM(
	.address(shiftted_PC[7:0]),
	.clock(!clock50),
	.q(instruction)
);

// **MEMORY: DATA RAM**
RAM_1rwp_1rp_19a_128b_8g RAM
(
	.address_a(ALU_result[18:0]),
	.address_b(address_hdmi),
	.data_in(data_out_bus),
	.byte_enablers(byte_enablers),
	.write_enable(mem_write),

	.clock(!clock50),

	.data_out_a(read_data_bus),
	.data_out_b(color_index)	
);

// **VGA CLOCK**
pll_25 pll_25(
	// input
	.refclk(clock50),
	.rst(reset),
	
	// output
	.outclk_0(clock25),
	.locked(locked)
);

// **VGA MAIN CONTROLLER**
vgaHdmi vgaHdmi (
	// input
	.clock      (clock25),
	.clock50    (clock50),
	.reset      (~locked),
	.hsync      (HDMI_TX_HS),
	.vsync      (HDMI_TX_VS),

	// output
	.dataEnable (HDMI_TX_DE),
	.vgaClock   (HDMI_TX_CLK),
	.pixelX (pixelX),
	.pixelY (pixelY),
	.address(address_hdmi)
);

// **DISPLAY LOGIC**
pixelPrinter pixelPrinter(
	// input
	.vgaClk(HDMI_TX_CLK),
	.rst(~locked),
	.videoOn(HDMI_TX_DE),
	.color_index(color_index),
	
	//output
	.red(HDMI_TX_D [23:16]),
	.green(HDMI_TX_D [15:8]),
	.blue(HDMI_TX_D [7:0])
);

// **I2C Interface for ADV7513 initial config**
I2C_HDMI_Config #(
	.CLK_Freq (50000000), // trabajamos con reloj de 50MHz
	.I2C_Freq (20000)    // reloj de 20kHz for i2c clock
)

I2C_HDMI_Config (
  .iCLK        (clock50),
  .iRST_N      (reset_n),
  .I2C_SCLK    (HDMI_I2C_SCL),
  .I2C_SDAT    (HDMI_I2C_SDA),
  .HDMI_TX_INT (HDMI_TX_INT),
  .READY       (READY)
);

endmodule