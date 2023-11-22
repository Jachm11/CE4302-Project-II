`timescale 1ns/1ps

module tb_decoder_f7_RV32I;

  // Parámetros
  parameter N = 4;

  // Entradas
  reg [6:0] f7;
  
  // Salidas
  wire o_0x0, o_0x1, o_0x2, o_0x3, o_0x20;

  // Instancia del módulo
  Decoder_f7_RV32I #(N) uut (
    .f7(f7),
    .o_0x0(o_0x0),
    .o_0x1(o_0x1),
    .o_0x2(o_0x2),
    .o_0x3(o_0x3),
    .o_0x20(o_0x20)
  );

  // Estímulos
  initial begin
    // Caso de prueba 1
    f7 = 7'h0;
    #10;
    
    // Caso de prueba 2
    f7 = 7'h1;
    #10;

    // Caso de prueba 3
    f7 = 7'h2;
    #10;

    // Caso de prueba 4
    f7 = 7'h3;
    #10;

    // Caso de prueba 5
    f7 = 7'h20;
    #10;

    // Finalizar simulación
    $finish;
  end

endmodule
