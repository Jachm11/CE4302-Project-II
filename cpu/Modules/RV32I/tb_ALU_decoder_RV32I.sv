module tb_ALU_decoder_RV32I;

  // Parámetros para controlar la simulación
  parameter SIM_TIME = 200; // Tiempo de simulación
  
  // Señales de entrada
  reg R, I, U, VR, abs;
  reg [7:0] decoded_f3;
  reg f7_eq_0x0, f7_eq_0x1, f7_eq_0x20;
  
  // Señal de salida
  wire [3:0] ALU_op;

  // Instancia del módulo bajo prueba
  ALU_decoder_RV32I uut (
    .R(R),
    .I(I),
    .U(U),
    .VR(VR),
    .abs(abs),
    .decoded_f3(decoded_f3),
    .f7_eq_0x0(f7_eq_0x0),
    .f7_eq_0x1(f7_eq_0x1),
    .f7_eq_0x20(f7_eq_0x20),
    .ALU_op(ALU_op)
  );

  // Inicialización de señales de entrada
  initial begin
    // Caso 1: Suma (add)
    R = 0;
    I = 0;
    U = 0;
    VR = 0;
    abs = 0;
    decoded_f3 = 8'b00000000; // Funct3 para add
    f7_eq_0x0 = 0;
    f7_eq_0x1 = 0;
    f7_eq_0x20 = 0;
    #10; // Esperar 10 unidades de tiempo para la estabilidad

    // Caso 2: Resta (sub)
    R = 1;
    I = 0;
    U = 0;
    VR = 0;
    abs = 0;
    decoded_f3 = 8'b00000000; // Funct3 para sub
    f7_eq_0x0 = 0;
    f7_eq_0x1 = 0;
    f7_eq_0x20 = 0;
    #10;

    // Caso 3: Multiplicación (mul)
    R = 0;
    I = 0;
    U = 0;
    VR = 0;
    abs = 0;
    decoded_f3 = 8'b00000001; // Funct3 para mul
    f7_eq_0x0 = 0;
    f7_eq_0x1 = 0;
    f7_eq_0x20 = 0;
    #10;

    // Caso 4: División (div)
    R = 0;
    I = 0;
    U = 0;
    VR = 0;
    abs = 0;
    decoded_f3 = 8'b00000001; // Funct3 para div
    f7_eq_0x0 = 0;
    f7_eq_0x1 = 0;
    f7_eq_0x20 = 0;
    #10;

    // Caso 5: Otra operación (ajusta según necesidad)
    // ...

    // Finalizar la simulación
    $finish;
  end

  // Imprimir resultados
  initial begin
    $monitor("Time=%0t R=%b I=%b U=%b VR=%b abs=%b decoded_f3=%h f7_eq_0x0=%b f7_eq_0x1=%b f7_eq_0x20=%b ALU_op=%b",
             $time, R, I, U, VR, abs, decoded_f3, f7_eq_0x0, f7_eq_0x1, f7_eq_0x20, ALU_op);
  end

endmodule
