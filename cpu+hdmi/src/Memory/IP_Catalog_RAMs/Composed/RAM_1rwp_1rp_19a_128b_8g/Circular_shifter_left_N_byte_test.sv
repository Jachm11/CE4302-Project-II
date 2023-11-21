module Circular_shifter_left_N_byte_test;

    // Parámetros
    parameter N = 128;

    // Señales de entrada
    logic [N-1:0] shifting;
    logic [3:0] shift_amount;

    // Señales de salida
    logic [N-1:0] shifted;

    // Instancia del módulo bajo prueba
    Circular_shifter_left_byte_N #(N) cslb
	 (
        .shifting(shifting),
        .shift_amount(shift_amount),
		  
        .shifted(shifted)
    );

    // Test
    initial begin
        // Asigna valores de prueba a las señales de entrada
        shifting = 128'hFFEEDDCCBBAA99887766554433221100;
        shift_amount = 4'b0011;
		  
        #10;
		  
        $display("shifting = %h", shifting);
        $display("shift_amount = %h", shift_amount);
        $display("shifted = %h", shifted);
    end
endmodule
