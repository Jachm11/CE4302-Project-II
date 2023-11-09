module SLT_U_N #(parameter N=4)
(
	input logic unsigned_,
	input logic [N-1:0] a,
	input logic [N-1:0] b,
	
	output logic [N-1:0] o
);
	logic [N-1:0] adder_o;
	logic co;
	Adder_with_carries_N #(.N(N)) adder
	(
		1'b1,
		a,
		~b,
		
		adder_o,
		co
	);	
	
	logic o_aux;
	assign o_aux = (unsigned_ == 1'b1) ? !co : ((a[N-1] && !b[N-1]) || (!(a[N-1] || b[N-1]) && adder_o[N-1]));

	assign o = {{(N-1){1'b0}}, o_aux};
	
endmodule
