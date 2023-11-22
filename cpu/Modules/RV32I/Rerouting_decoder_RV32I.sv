module Rerouting_decoder_RV32I
(
	input logic STV,
	input logic VTS,

	input logic f7_eq_0x1,
	input logic f7_eq_0x2,
	input logic f7_eq_0x3,


	output logic rerouting_select,
	output logic [2:0] rerouting_code
);
	assign rerouting_select = STV || VTS;
	
	assign rerouting_code[0] = f7_eq_0x1 || f7_eq_0x3;
	assign rerouting_code[1] = f7_eq_0x2 || f7_eq_0x3;
	assign rerouting_code[2] = VTS;
endmodule
/*
S: Scalar value
V[i]: Vector value


-- Scalar to Vector --

Rerouting code = 0 =>
0 = S
1 = V[1]
2 = V[2]
3 = V[3]

Rerouting code = 1 =>
0 = V[0]
1 = S
2 = V[2]
3 = V[3]

Rerouting code = 2 =>
0 = V[0]
1 = V[1]
2 = S
3 = V[3]

Rerouting code = 3 =>
0 = V[0]
1 = V[1]
2 = V[2]
3 = S


-- Vector to Scalar --

Rerouting code = 4 =>
0 = V[0]
1 = V[1]
2 = V[2]
3 = V[3]

Rerouting code = 5 =>
0 = V[1]
1 = V[1]
2 = V[2]
3 = V[3]

Rerouting code = 6 =>
0 = V[2]
1 = V[1]
2 = V[2]
3 = V[3]

Rerouting code = 7 =>
0 = V[3]
1 = V[1]
2 = V[2]
3 = V[3]

*/