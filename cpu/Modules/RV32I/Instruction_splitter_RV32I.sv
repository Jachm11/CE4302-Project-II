module Instruction_splitter_RV32I
(
	input logic [31:0] instruction,
	
	output logic [6:0] opcode,
	output logic [4:0] rd,
	output logic [2:0] f3,
	output logic [4:0] r1,
	output logic [4:0] r2,
	output logic [6:0] f7,
	output logic [24:0] raw_immediate
);
	assign opcode			=	instruction[6:0];
	assign rd				=	instruction[11:7];
	assign f3				=	instruction[14:12];
	assign r1				=	instruction[19:15];
	assign r2				=	instruction[24:20];
	assign f7				=	instruction[31:25];
	assign raw_immediate =	instruction[31:7];

endmodule