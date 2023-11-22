module Test_DFF_Tri_Latch_vP();

	logic d;
	
	logic clock;
	logic reset;
	
	logic q;

	
	DFF_Tri_Latch_vP dfft(d, clock, reset, q);

	initial
	begin		
		clock=0; reset=0; d=1'd1;	#10;
					reset=1;				#10;
		
					#10;
		d=1'd0; 	#10;
		d=1'd1; 	#10;
					#10;
		
		reset=0; #10
		reset=1; #10		
		
					#10;
		d=1'd0; 	#10;
					#10;
		d=1'd1;	#10;
					#10;
	end
	
	always #5 clock = ~clock;//#10 = un ciclo

endmodule
