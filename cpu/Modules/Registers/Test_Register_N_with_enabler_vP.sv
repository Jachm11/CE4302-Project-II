module Test_Register_N_with_enabler_vP();

	logic [7-1:0] d;
	logic enabler;
	
	logic clock;
	logic reset;
	
	logic [7-1:0] q;

	
	Register_N_with_enabler_vP #(7) register(d, enabler, clock, reset, q);

	initial
	begin		
		clock=0; reset=0; d=7'd1; enabler=1'b0;	#10;
					reset=1;									#10;
		
		
		d=7'd2; #10;
		d=7'd3; #10;
		enabler=1'b1; #10
		
		d=7'd4; #10;
		d=7'd5; #10;
		
		reset=0; #10
		reset=1; #10		
		
		d=7'd1; #10;		
		enabler=1'b0; #10
		
		d=7'd2; #10;
		enabler=1'b1; #10

		d=7'd3; #10;
		enabler=1'b0; #10

		d=7'd4; #10;
		enabler=1'b1; #10

		d=7'd5; #10;		
	end
	
	always #5 clock = ~clock;//#10 = un ciclo

endmodule
