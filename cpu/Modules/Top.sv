module Top
(
);
	logic [1:0] select;
	assign select = 2'b11;
	logic o;
	
	Multiplexer_MxN #(.M(5'd3), .N(5)) mux(select, {{5'h00},{5'h01},{5'h02}}, 1'b1, o);
	
endmodule