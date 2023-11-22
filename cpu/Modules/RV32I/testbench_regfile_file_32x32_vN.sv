`timescale 1ns / 1ps

module testbench_regfile_file_32x32_vN;

  // Parámetros del módulo
  logic write_enable;
  logic [4:0] read_addr_1, read_addr_2, write_addr;
  logic [31:0] write_data;
  logic clock, async_reset;
  logic [31:0] read_data_1, read_data_2;

  // Instancia del módulo a probar
  Regfile_file_32x32_vN uut (
    .write_enable(write_enable),
    .read_addr_1(read_addr_1),
    .read_addr_2(read_addr_2),
    .write_addr(write_addr),
    .write_data(write_data),
    .clock(clock),
    .async_reset(async_reset),
    .read_data_1(read_data_1),
    .read_data_2(read_data_2)
  );

  // Generación de estímulos
  initial begin
    // Inicialización de señales
    write_enable = 0;
    read_addr_1 = 0;
    read_addr_2 = 0;
    write_addr = 0;
    write_data = 0;
    clock = 0;
    async_reset = 1;

    // Reset asincrónico
    #10;
    async_reset = 0;

    // Test 1: Escritura y lectura
    write_enable = 1;
    write_addr = 5'b00100; // Dirección 4
    write_data = 32'hABCDE123;
    #10; // Esperar 10 unidades de tiempo
    read_addr_1 = 5'b00100; // Leer desde la misma dirección
    read_addr_2 = 5'b00010; // Leer desde otra dirección
    #10; // Esperar 10 unidades de tiempo
    // Se espera que read_data_1 sea igual a write_data y read_data_2 sea 32'd0

    // Test 2: Escritura en diferentes direcciones y lectura
    #10;
    write_enable = 1;
    write_addr = 5'b11001; // Dirección 25
    write_data = 32'h98765432;
    #10;
    read_addr_1 = 5'b11001; // Leer desde la misma dirección
    read_addr_2 = 5'b01011; // Leer desde otra dirección
    #10;
    // Se espera que read_data_1 sea igual a write_data y read_data_2 sea 32'd0

    // Test 3: Desactivar escritura y leer desde direcciones no escritas
    #10;
    write_enable = 0; // Desactivar escritura
    read_addr_1 = 5'b10101; // Leer desde una dirección no escrita
    read_addr_2 = 5'b11111; // Leer desde otra dirección no escrita
    #10;
    // Se espera que read_data_1 y read_data_2 sean 32'd0

    // Finalizar la simulación
    $finish;
  end

  // Generación de reloj
  always begin
    #5; // Cambiar el reloj cada 5 unidades de tiempo
    clock = ~clock;
  end

endmodule