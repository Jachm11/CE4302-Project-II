module Sign_extend_RV32I
(
	input [2:0] immediate_type,
	input logic immediate_i_exception,
	input [24:0] raw_immediate,

	output [31:0] immediate
);
	logic [31:0] i_imm_without_changes;
	logic [31:0] i_imm_aux;

	logic [31:0] i_imm;
	logic [31:0] s_imm;
	logic [31:0] b_imm;
	logic [31:0] u_imm;
	logic [31:0] j_imm;
	
	assign i_imm_without_changes = {{21{raw_immediate[24]}}, raw_immediate[23:13]};
	assign i_imm_aux = {{27{1'b0}} ,i_imm_without_changes[4:0]};

	Multiplexer_MxN #(.M(2), .N(32)) mux_i
	(
		.select(immediate_i_exception),
		.channels({i_imm_aux, i_imm_without_changes}),
		
		.channel_out(i_imm)
	);
	
	assign s_imm = {{21{raw_immediate[24]}}, raw_immediate[23:18], raw_immediate[4:0]};
	assign b_imm = {{20{raw_immediate[24]}}, raw_immediate[0], raw_immediate[23:18], raw_immediate[4:1], 1'b0};
	assign u_imm = {raw_immediate[24:5], {12{1'b0}}};
	assign j_imm = {{12{raw_immediate[24]}}, raw_immediate[12:5], raw_immediate[13], raw_immediate[23:14], 1'b0};
	
	Multiplexer_MxN #(.M(8), .N(32)) mux_o
	(
		.select(immediate_type),
		.channels({32'd0, 32'd0, 32'd0, j_imm, u_imm, b_imm, s_imm, i_imm}),
		
		.channel_out(immediate)
	);
endmodule

