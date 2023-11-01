`timescale 1ns/100ps
module Test_RV32I_Harvard
();
	logic clock;
	logic async_reset;

	logic memory_transaction;
	logic mem_write;
	logic [31:0] alu_result;
	logic [31:0] data_out;
	logic [3:0] byte_enablers;
	logic [31:0] pc;
	
	RV32I_Harvard rvh
	(
		clock, async_reset,
		memory_transaction, mem_write, alu_result, data_out, byte_enablers, pc
	);

	initial
	begin
	// Importante esperar 1 ciclo completo de reset en 0 para que la ROM syncronica le de tiempo de establecer el primer dato
		clock=0; async_reset=0;	#13;	/*auto clock*/	async_reset=1;
	end
	/*Auto clock*/
	always #5 clock = ~clock;//#10 = un ciclo
	
endmodule