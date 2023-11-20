module Comparator_RV32I
(
	input logic [31:0] a,
	input logic [31:0] b,
	
	output logic eq,
	output logic neq,
	output logic lt,
	output logic ge,
	output logic ltu,
	output logic geu
);
	logic [31:0] adder_o;
	logic adder_co;
	
	Adder_with_carries_N #(.N(32)) add(1'b1, a, ~b, adder_o, adder_co);

	logic nor_adder_o;
	//assign nor_adder_o = !(|adder_o);
	//assign nor_adder_o = (adder_o == 0) ? 1'b1 : 1'b0;
	assign nor_adder_o = (adder_o == 0);


	assign eq = nor_adder_o;
	assign neq = !eq;
	assign lt = !nor_adder_o && adder_o[31];
	assign ge = !lt;
	assign ltu = !adder_co;
	assign geu = !ltu;

endmodule