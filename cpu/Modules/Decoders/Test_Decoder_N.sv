module Test_Decoder_N();

	logic [3:0] code;
	logic [15:0] o;
	
	Decoder_N #(.N(4)) dec(code, o);
	
	initial begin
		//$display($bits(select));

		code = 4'b0000; #10;
		code = 4'b0001; #10;
		code = 4'b0010; #10;
		code = 4'b0011; #10;
		code = 4'b0100; #10;
		code = 4'b0101; #10;
		code = 4'b0110; #10;
		code = 4'b0111; #10;
		code = 4'b1000; #10;
		code = 4'b1001; #10;
		code = 4'b1010; #10;
		code = 4'b1011; #10;
		code = 4'b1100; #10;
		code = 4'b1101; #10;
		code = 4'b1110; #10;
		code = 4'b1111; #10;
	end
	
endmodule
