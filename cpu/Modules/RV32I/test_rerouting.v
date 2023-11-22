module test_rerouting;

  // Parámetros del módulo
  reg STV, VTS, f7_eq_0x1, f7_eq_0x2, f7_eq_0x3;
  wire rerouting_select;
  wire [2:0] rerouting_code;

  // Instanciación del módulo
  Rerouting_decoder_RV32I uut (
    .STV(STV),
    .VTS(VTS),
    .f7_eq_0x1(f7_eq_0x1),
    .f7_eq_0x2(f7_eq_0x2),
    .f7_eq_0x3(f7_eq_0x3),
    .rerouting_select(rerouting_select),
    .rerouting_code(rerouting_code)
  );

  // Patrones de entrada
  initial begin
    $dumpfile("dump.vcd");  // Archivo VCD para simulación
    $dumpvars(0, test_rerouting); // Dump de variables

    // Test 1: STV activo, VTS inactivo, f7_eq_0x1 y f7_eq_0x2 inactivos, f7_eq_0x3 activo
    STV = 1'b1;
    VTS = 1'b0;
    f7_eq_0x1 = 1'b0;
    f7_eq_0x2 = 1'b0;
    f7_eq_0x3 = 1'b1;
    #10; // Esperar un poco para que se propague la salida
    if (rerouting_select !== 1'b1 || rerouting_code !== 3'b001)
      $error("Test 1 failed at time %0t", $time);

    // Test 2: STV inactivo, VTS activo, f7_eq_0x1 inactivo, f7_eq_0x2 y f7_eq_0x3 activos
    STV = 1'b0;
    VTS = 1'b1;
    f7_eq_0x1 = 1'b0;
    f7_eq_0x2 = 1'b1;
    f7_eq_0x3 = 1'b1;
    #10;
    if (rerouting_select !== 1'b1 || rerouting_code !== 3'b111)
      $error("Test 2 failed at time %0t", $time);

    $finish;
  end

endmodule
