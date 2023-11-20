module Regfile_file_32x32_vN
(
	input logic write_enable,
	input logic [4:0] read_addr_1, read_addr_2, write_addr,
	input logic [31:0] write_data,

	input logic clock,
	input logic async_reset,

	output logic [31:0] read_data_1, read_data_2
);

	logic [31:1][31:0] rf;

	always_ff @(negedge clock or negedge async_reset)
	begin
		if(!async_reset)
		begin
			rf = {32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0};
		end
		else
		begin
			if(write_enable)
			begin
				if(write_addr != 5'd0)
					rf[write_addr] = write_data;
			end
		end
	end

	assign read_data_1 = (read_addr_1 != 5'd0) ? rf[read_addr_1] : 32'd0;
	assign read_data_2 = (read_addr_2 != 5'd0) ? rf[read_addr_2] : 32'd0;

endmodule
