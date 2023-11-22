//M channels
//of N bits per channel
module Multiplexer_with_enabler_MxN #(parameter M=4, N=8)
(
	input [bit_lenght()-1:0] select,
	input [M-1:0][N-1:0] channels,
	input enabler,
	
	output [N-1:0] channel_out
);
	assign channel_out = enabler ? channels[select] : {(N){1'b0}};
	
	// Function to get the roundup of log2 of M (bits to represent channels quantity)
	function int bit_lenght();
		if(0<M && M<=2)
		begin
			return 1;
		end
		if(2<M && M<=4)
		begin
			return 2;
		end
		if(4<M && M<=8)
		begin
			return 3;
		end
		if(8<M && M<=16)
		begin
			return 4;
		end
		if(16<M && M<=32)
		begin
			return 5;
		end
		if(32<M && M<=64)
		begin
			return 6;
		end
		if(64<M && M<=128)
		begin
			return 7;
		end
	endfunction

endmodule