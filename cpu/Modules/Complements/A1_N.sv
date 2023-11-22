module A1_N #(parameter N=4)
(
	input logic [N-1:0] a,
	input logic on,
	
	output logic [N-1:0] a1
);	
	assign a1 = (on == 1'b1) ? ~a : a;
	
endmodule
