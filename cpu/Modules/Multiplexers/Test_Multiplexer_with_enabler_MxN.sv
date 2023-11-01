module Test_Multiplexer_with_enabler_MxN();

	logic [2:0] select;
	
	logic [4:0] ch1;
	logic [4:0] ch2;
	logic [4:0] ch3;
	logic [4:0] ch4;
	logic [4:0] ch5;
	logic [4:0] ch6;
	logic [4:0] ch7;
	logic [4:0] ch8;
	
	logic enabler;
	
	logic [4:0] o;
	
	Multiplexer_with_enabler_MxN #(.M(8), .N(5)) mux(select, {ch8, ch7, ch6, ch5, ch4, ch3, ch2, ch1}, enabler, o);
	
	initial begin
		//$display($bits(select));
		ch1 = 5'b00001;
		ch2 = 5'b00010;
		ch3 = 5'b00011;
		ch4 = 5'b00100;
		ch5 = 5'b00101;
		ch6 = 5'b00110;
		ch7 = 5'b00111;
		ch8 = 5'b01000;
		
		enabler = 1'b1;
		
		select=3'b000; #10;
		select=3'b001; #10;
		select=3'b010; #10;
		select=3'b011; #10;
		select=3'b100; #10;
		select=3'b101; #10;
		select=3'b110; #10;
		select=3'b111; #10;

		enabler = 1'b0;
		
		select=3'b000; #10;
		select=3'b001; #10;
		select=3'b010; #10;
		select=3'b011; #10;
		select=3'b100; #10;
		select=3'b101; #10;
		select=3'b110; #10;
		select=3'b111; #10;

	end
	
endmodule
