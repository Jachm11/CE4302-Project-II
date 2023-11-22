`timescale 1ns / 1ps

module testbench_result_source_decoder_RV32I;

  // Parámetros del módulo
  logic load, jump, i_jump, load_vector, f3_eq_0;
  logic [1:0] result_source;

  // Instancia del módulo a probar
  Result_source_decoder_RV32I uut (
    .load(load),
    .jump(jump),
    .i_jump(i_jump),
    .load_vector(load_vector),
    .f3_eq_0(f3_eq_0),
    .result_source(result_source)
  );

  // Generación de estímulos
  initial begin
    // Test 1: Load activado
    load = 1;
    jump = 0;
    i_jump = 0;
    load_vector = 0;
    f3_eq_0 = 0;
    #10; // Esperar 10 unidades de tiempo
    // Se espera que result_source sea 2'b01 (load activado)

    // Test 2: Salto incondicional activado
    load = 0;
    jump = 1;
    i_jump = 0;
    load_vector = 0;
    f3_eq_0 = 0;
    #10; // Esperar 10 unidades de tiempo
    // Se espera que result_source sea 2'b10 (jump activado)

    // Test 3: Salto condicional activado (i_jump y f3_eq_0)
    load = 0;
    jump = 0;
    i_jump = 1;
    load_vector = 0;
    f3_eq_0 = 1;
    #10; // Esperar 10 unidades de tiempo
    // Se espera que result_source sea 2'b10 (jump activado)

    // Finalizar la simulación
    $finish;
  end

endmodule
