module pixelPrinter(
	input  logic vgaClk,
	input  logic rst,
	input  logic videoOn,
	input  logic [9:0] pixelX,
	input  logic [9:0] pixelY,
	input  logic [7:0] color,
	output logic [7:0] red,
	output logic [7:0] green,
	output logic [7:0] blue,
	output logic [18:0] address
);

	// RGB constants
	localparam BLACK = 8'h00;
	
	// Memory constants
	localparam MAX_ADDRESS = 19'd307200;
	
	logic [23:0] palette [0:9];
	logic [2:0] memory [0:307199];  // Assuming a memory size of 3-bit locations
	logic [23:0] rgb;
	logic [2:0] index;

	always @(posedge vgaClk) begin
		address <= (pixelY*640) + pixelX;
		if(~videoOn) begin
			red   <= BLACK;
			green <= BLACK;
			blue  <= BLACK;
		end
		else begin
			index <= memory[address];
			rgb   <= palette[index];
			red   <= rgb[23:16];
			green <= rgb[15:8];
			blue  <= rgb[7:0];
		end
	end
	
//	initial begin
//    $readmemb("image.mem", memory); // Initialize memory from the .mem file
//	end
	
	initial begin
    $readmemh("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/grapichs/palette.mem", palette); // Initialize palette from the .mem file
	end
	
endmodule