module Instruction_decoder_RV32I
(
	input logic [6:0] opcode,
	
	output logic r,
	output logic i_arithmetic_logic,
	output logic i_load,
	output logic store,
	output logic branch,
	output logic jump,
	output logic i_jump,
	output logic u,
	output logic u_pc,
	output logic i_transfer,

	output logic vector_r,
	output logic scalar_to_vector,
	output logic vector_to_scalar,
	output logic store_vector,
	output logic load_vector,
	output logic vector_absolute
);
	
	logic [15:0] o_aux;
	always_comb
	begin
		case(opcode)
			// 51
			7'd51: o_aux =		16'b0000000000000001; // R
			
			// 19 = 001 0011
			7'd19: o_aux =		16'b0000000000000010; // I arithmetic logic
			
			// 3 = 000 0011
			7'd3: o_aux =		16'b0000000000000100; // I load
			
			// 35 = 010 0011
			7'd35: o_aux =		16'b0000000000001000; // Store
			
			// 99 = 110 0011
			7'd99: o_aux =		16'b0000000000010000; // Branch
			
			// 111 = 110 1111
			7'd111: o_aux =	16'b0000000000100000; // Jump
			
			// 103 = 110 0111
			7'd103: o_aux =	16'b0000000001000000; // I jump
			
			// 55 = 011 0111
			7'd55: o_aux =		16'b0000000010000000; // U
			
			// 23 = 001 0111
			7'd23: o_aux =		16'b0000000100000000; // U pc
			
			// 115 = 1110011
			7'd115: o_aux =	16'b0000001000000000; // I transfer

			// 120 = 111 1000
			7'd120: o_aux =	16'b0000010000000000; // Vector R
			
			// 121 = 111 1001
			7'd121: o_aux =	16'b0000100000000000; // Scalar to Vector
			
			// 122 = 111 1010
			7'd122: o_aux =	16'b0001000000000000; // Vector to Scalar
			
			// 123 = 111 1011
			7'd123: o_aux =	16'b0010000000000000; // Store Vector
			
			// 124 = 111 1100
			7'd124: o_aux =	16'b0100000000000000; // Load Vector
			
			// 125 = 111 1101
			7'd125: o_aux =	16'b1000000000000000; // Vector Absolute
						
			default:o_aux = 16'd0;
		endcase
	end
	assign {vector_absolute, load_vector, store_vector, vector_to_scalar, scalar_to_vector, vector_r, i_transfer, u_pc, u, i_jump, jump, branch, store, i_load, i_arithmetic_logic, r} = o_aux;
endmodule
