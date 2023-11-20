module Circular_shifter_left_byte_N #(parameter N = 128) //N representa la cantidad de bits del valor a rotar
(
	input logic [N-1:0] shifting,
	input logic [log_2()-1-3:0] shift_amount,
	
	output logic [N-1:0] shifted
);
	
	logic [log_2()-1:0] shift_amount_aux;
	assign shift_amount_aux = {shift_amount, 3'b0};
	
	assign shifted = (shifting << shift_amount_aux) | (shifting >> (N - shift_amount_aux));

	// Function to get the roundup of log2 of M (bits to represent channels quantity)
	function int log_2();
		if(0<N && N<=2)
		begin
			return 1;
		end
		if(2<N && N<=4)
		begin
			return 2;
		end
		if(4<N && N<=8)
		begin
			return 3;
		end
		if(8<N && N<=16)
		begin
			return 4;
		end
		if(16<N && N<=32)
		begin
			return 5;
		end
		if(32<N && N<=64)
		begin
			return 6;
		end
		if(64<N && N<=128)
		begin
			return 7;
		end
	endfunction

endmodule