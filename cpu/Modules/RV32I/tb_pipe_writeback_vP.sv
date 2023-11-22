`timescale 1ns / 1ps

module tb_pipe_writeback_vP;

  // Parámetros
  parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

  // Señales de entrada
  reg [31:0] instruction_M;
  reg write_scalar_reg_M;
  reg [1:0] result_source_M;
  reg write_vector_reg_M;
  reg [5:0] rd_M;
  reg [127:0] ALU_result_bus_M;
  reg [127:0] read_data_bus_M;
  reg [31:0] PC_plus_4_M;

  // Señales de control
  reg enabler;
  reg clock;
  reg async_reset;

  // Señales de salida
  wire [31:0] instruction_W;
  wire write_scalar_reg_W;
  wire [1:0] result_source_W;
  wire write_vector_reg_W;
  wire [5:0] rd_W;
  wire [127:0] ALU_result_bus_W;
  wire [127:0] read_data_bus_W;
  wire [31:0] PC_plus_4_W;

  // Instanciar el módulo Pipe_writeback_vP
  Pipe_writeback_vP uut (
    .instruction_M(instruction_M),
    .write_scalar_reg_M(write_scalar_reg_M),
    .result_source_M(result_source_M),
    .write_vector_reg_M(write_vector_reg_M),
    .rd_M(rd_M),
    .ALU_result_bus_M(ALU_result_bus_M),
    .read_data_bus_M(read_data_bus_M),
    .PC_plus_4_M(PC_plus_4_M),
    .enabler(enabler),
    .clock(clock),
    .async_reset(async_reset),
    .instruction_W(instruction_W),
    .write_scalar_reg_W(write_scalar_reg_W),
    .result_source_W(result_source_W),
    .write_vector_reg_W(write_vector_reg_W),
    .rd_W(rd_W),
    .ALU_result_bus_W(ALU_result_bus_W),
    .read_data_bus_W(read_data_bus_W),
    .PC_plus_4_W(PC_plus_4_W)
  );

  // Generar señales de reloj
  
  initial
  begin
      clock=0; async_reset=0;  #13;  /*auto clock*/  async_reset=1;


	 // Inicializar señales
    instruction_M = 32'hABCDEF01;
    write_scalar_reg_M = 1;
    result_source_M = 2'b10;
    write_vector_reg_M = 1;
    rd_M = 6'b011010;
    ALU_result_bus_M = 128'h0123456789ABCDEF0123456789ABCDEF;
    read_data_bus_M = 128'hFEDCBA9876543210FEDCBA9876543210;
    PC_plus_4_M = 32'h80000004;

    enabler = 1;

    // Ejecutar simulación por 100 unidades de tiempo
	// #100 $finish;
		

  end
  /*Auto clock*/
  always #5 clock = ~clock;//#10 = un ciclo

endmodule
