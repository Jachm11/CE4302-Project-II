module tb_regfile_vector_32x128_vN;

    // Parámetros de entrada
    reg write_enable;
    reg [4:0] read_addr_1, read_addr_2, write_addr;
    reg [127:0] write_data;

    // Señales de entrada del reloj y reinicio asincrónico
    reg clock;
    reg async_reset;

    // Parámetros de salida
    wire [127:0] read_data_1, read_data_2;

    // Instancia del módulo a probar
    Regfile_vector_32x128_vN dut (
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

    // Inicialización de señales
    initial begin
        // Inicialización de señales
        write_enable = 1;
        read_addr_1 = 5'b00101;  // Dirección 5
        read_addr_2 = 5'b00010;  // Dirección 2
        write_addr = 5'b00011;   // Dirección 3
        write_data = 128'hA5A5_A5A5_A5A5_A5A5_A5A5_A5A5_A5A5_A5A5;

        // Ciclo de reloj
        repeat (10) begin
            #5 clock = ~clock;  // Invertir el reloj cada 5 unidades de tiempo
        end

        // Primer caso de prueba
        async_reset = 1;
        #10;
        async_reset = 0;
        #10;

        // Operación de escritura en el registro 3
        write_addr = 5'b00011;   // Dirección 3
        write_data = 128'h1234_5678_9ABC_DEF0_1122_3344_5566_7788;
        write_enable = 1;
        #10;
        write_enable = 0;

        // Operación de lectura desde los registros 5 y 2
        read_addr_1 = 5'b00101;  // Dirección 5
        read_addr_2 = 5'b00010;  // Dirección 2
        #10;

        // Segundo caso de prueba
        async_reset = 1;
        #5;
        async_reset = 0;
        #5;

        // Operación de escritura en el registro 2
        write_addr = 5'b00010;   // Dirección 2
        write_data = 128'h9876_5432_10FE_DCBA_9988_7766_5544_3322;
        write_enable = 1;
        #10;
        write_enable = 0;

        // Operación de lectura desde los registros 3 y 5
        read_addr_1 = 5'b00011;  // Dirección 3
        read_addr_2 = 5'b00101;  // Dirección 5
        #10;


        // Finalizar la simulación
        $finish;
    end

endmodule