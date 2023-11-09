module Exception
(
	input logic required,
	input logic exception,
	
	output logic o
);
	assign o = required && !exception;

endmodule