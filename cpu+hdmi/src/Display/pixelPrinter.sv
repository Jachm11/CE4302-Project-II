module pixelPrinter(
	input  logic vgaClk,
	input  logic rst,
	input  logic videoOn,
	input  logic [7:0] color_index,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue
);

	// RGB constants
	localparam BLACK = 8'h00;
	
	logic [23:0] palette [0:9];
	logic [23:0] rgb;

	always @(posedge vgaClk) begin
		if(~videoOn) begin
			red   <= BLACK;
			green <= BLACK;
			blue  <= BLACK;
		end
		else begin
			rgb   <= palette[color_index];
			red   <= rgb[23:16];
			green <= rgb[15:8];
			blue  <= rgb[7:0];
		end
	end
	
//	initial begin
//    $readmemb("image.mem", memory); // Initialize memory from the .mem file
//	end
	
	initial begin
    $readmemh("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/graphics/palette.mem", palette); // Initialize palette from the .mem file
	end
	
endmodule