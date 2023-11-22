module testbench_router_RV32I;

  // Parámetros y señales de prueba
  reg [2:0] rerouting_code_tb;
  reg [31:0] scalar_tb;
  reg [127:0] vector_in_tb;
  wire [127:0] vector_out_tb;

  // Instancia del módulo bajo prueba
  Router_RV32I dut (
    .rerouting_code(rerouting_code_tb),
    .scalar(scalar_tb),
    .vector_in(vector_in_tb),
    .vector_out(vector_out_tb)
  );

  // Inicialización de señales de entrada
  initial begin
    // Estímulo 1
    rerouting_code_tb = 3'b000;
    scalar_tb = 32'h12345678;
    vector_in_tb = 128'hA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5;
    #10;

    // Mostrar resultados del estímulo 1
    $display("Estímulo 1 - vector_out = %h", vector_out_tb);

    // Estímulo 2
    rerouting_code_tb = 3'b010;
    scalar_tb = 32'h87654321;
    vector_in_tb = 128'h5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A;
    #10;

    // Mostrar resultados del estímulo 2
    $display("Estímulo 2 - vector_out = %h", vector_out_tb);

    // Estímulo 3
    rerouting_code_tb = 3'b111;
    scalar_tb = 32'hABCDEF01;
    vector_in_tb = 128'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    #10;

    // Mostrar resultados del estímulo 3
    $display("Estímulo 3 - vector_out = %h", vector_out_tb);

    // Terminar la simulación
    $finish;
  end

endmodule