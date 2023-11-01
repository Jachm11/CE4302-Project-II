module Test_Adder_N();
	logic [4:0] A;
	logic [4:0] B;
	
	logic [4:0] O;
	
	
	Adder_N #(.N(5)) adder(A, B, O);
	
	initial
	begin
	A=1; B=1; #10;
	A=2; B=2; #10;
	A=3; B=3; #10;
	A=4; B=4; #10;
	A=5; B=5; #10;
	A=6; B=6; #10;
	A=7; B=7; #10;
	A=8; B=8; #10;
	A=9; B=9; #10;
/*
	Ci=0; A=1; B=1; #10;
	Ci=0; A=2; B=2; #10;
	Ci=0; A=3; B=3; #10;
	Ci=0; A=4; B=4; #10;
	Ci=0; A=5; B=5; #10;
	Ci=1; A=6; B=6; #10;
	Ci=1; A=7; B=7; #10;
	Ci=1; A=8; B=8; #10;
	Ci=1; A=9; B=9; #10;
*/
	end
	
endmodule
/*
module Test_Adder_N();
	logic Ci;
	logic [4:0] A;
	logic [4:0] B;
	
	logic [4:0] O;
	
	
	Adder_N #(.N(5)) adder(Ci, A, B, O);
	
	initial
	begin
	Ci=0; A=1; B=1; #10;
	Ci=0; A=2; B=2; #10;
	Ci=0; A=3; B=3; #10;
	Ci=0; A=4; B=4; #10;
	Ci=0; A=5; B=5; #10;
	Ci=1; A=6; B=6; #10;
	Ci=1; A=7; B=7; #10;
	Ci=1; A=8; B=8; #10;
	Ci=1; A=9; B=9; #10;
	end
	
endmodule
*/