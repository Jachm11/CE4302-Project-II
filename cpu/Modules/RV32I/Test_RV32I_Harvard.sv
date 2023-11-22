`timescale 1ns/100ps
module Test_RV32I_Harvard
();
	logic clock;
	logic async_reset;
	
	RV32I_Harvard rvh
	(
		.clock(clock),
		.async_reset(async_reset)
	);

	initial
	begin
	// Importante esperar 1 ciclo completo de reset en 0 para que la ROM syncronica le de tiempo de establecer el primer dato
		clock=0; async_reset=0;	#13;	/*auto clock*/	async_reset=1;
	end
	/*Auto clock*/
	always #5 clock = ~clock;//#10 = un ciclo
	
endmodule