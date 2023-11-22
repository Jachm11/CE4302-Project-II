module tb_ALU_RV32I;

  reg [3:0] op;
  reg [3:0] a;
  reg [3:0] b;
  wire [3:0] o;

  ALU_RV32I #(4) uut (
    .op(op),
    .a(a),
    .b(b),
    .o(o)
  );

  // Establecer valores de entrada
  initial begin
    // Operación de suma
    op = 4'b0000;
    a = 4'b0010;
    b = 4'b0011;
    #10 $display("Operación: %b, A: %b, B: %b, Resultado: %b", op, a, b, o);

    // Operación de resta
    op = 4'b0001;
    a = 4'b0100;
    b = 4'b0011;
    #10 $display("Operación: %b, A: %b, B: %b, Resultado: %b", op, a, b, o);

    // Operación de multiplicación
    op = 4'b0010;
    a = 4'b0011;
    b = 4'b0010;
    #10 $display("Operación: %b, A: %b, B: %b, Resultado: %b", op, a, b, o);


    // Terminar la simulación
    #10 $finish;
  end

endmodule
