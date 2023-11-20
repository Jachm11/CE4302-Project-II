module RAM_1p_32w_18a_8b
(
	input logic [17:0] address,
	input logic [31:0] data_in,
	input logic [3:0] byte_enablers,
	input logic write_enable,
	
	input logic clock,
	
	output logic [31:0] data_out
);
	logic [1:0] offset;
	logic [15:0] effective_address;
	assign {effective_address, offset} = address;

	logic [15:0] address_0;
	logic [15:0] address_1;
	logic [15:0] address_2;
	logic [15:0] address_3;
	
	logic [7:0] byte_in_0;
	logic [7:0] byte_in_1;
	logic [7:0] byte_in_2;
	logic [7:0] byte_in_3;
	
	logic enabler_aux_0;
	logic enabler_aux_1;
	logic enabler_aux_2;
	logic enabler_aux_3;

	logic enabler_0;
	logic enabler_1;
	logic enabler_2;
	logic enabler_3;

	
	logic [7:0] byte_out_0;
	logic [7:0] byte_out_1;
	logic [7:0] byte_out_2;
	logic [7:0] byte_out_3;
	
	

	Address_Offset address_offset(
		effective_address, offset,
		address_0, address_1, address_2, address_3);

	Byte_Rotator_Left BRL(
		offset,
		data_in[7:0],
		data_in[15:8],
		data_in[23:16],
		data_in[31:24],
		
		byte_in_0,
		byte_in_1,
		byte_in_2,
		byte_in_3);
		
	_4_Bit_Rotator_Left bRL(
		offset, byte_enablers,
		enabler_aux_0, enabler_aux_1, enabler_aux_2, enabler_aux_3);

	Enabler_N #(.N(4)) en(
		{enabler_aux_3, enabler_aux_2, enabler_aux_1, enabler_aux_0},
		write_enable,
		{enabler_3, enabler_2, enabler_1, enabler_0});

		
	RAM_1p_8w_16a_8b_from_file #(.PATH("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/data_null/sub_ram_0.mif")) sub_RAM_0(
		address_0, clock, byte_in_0, enabler_0,
		byte_out_0);

	RAM_1p_8w_16a_8b_from_file #(.PATH("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/data_null/sub_ram_1.mif")) sub_RAM_1(
		address_1, clock, byte_in_1, enabler_1,
		byte_out_1);

	RAM_1p_8w_16a_8b_from_file #(.PATH("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/data_null/sub_ram_2.mif")) sub_RAM_2(
		address_2, clock, byte_in_2, enabler_2,
		byte_out_2);

	RAM_1p_8w_16a_8b_from_file #(.PATH("/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/data_null/sub_ram_3.mif")) sub_RAM_3(
		address_3, clock, byte_in_3, enabler_3,
		byte_out_3);
		
	Byte_Rotator_Right BRR(
		offset,
		byte_out_0,
		byte_out_1,
		byte_out_2,
		byte_out_3,
		
		data_out[7:0],
		data_out[15:8],
		data_out[23:16],
		data_out[31:24]);

endmodule





































/*
module RAM_18a_32b
(
	input logic [17:0] address,
	input logic [31:0] data_in,
	input logic [3:0] byte_enablers,
	input logic write_enabler,
	
	input logic clock,
	
	output logic [31:0] data_out
);
	logic [1:0] offset;
	logic [15:0] effective_address;
	assign {effective_address, offset} = address;

	logic [15:0] address_0;
	logic [15:0] address_1;
	logic [15:0] address_2;
	logic [15:0] address_3;
	
	logic [7:0] byte_in_0;
	logic [7:0] byte_in_1;
	logic [7:0] byte_in_2;
	logic [7:0] byte_in_3;
	
	logic enabler_0;
	logic enabler_1;
	logic enabler_2;
	logic enabler_3;
	
	logic [7:0] byte_out_0;
	logic [7:0] byte_out_1;
	logic [7:0] byte_out_2;
	logic [7:0] byte_out_3;
	
	

	Sub_IP_Catalog_1_Port_RAM_16a_32b_Address_Offset address_offset(
		effective_address, offset,
		address_0, address_1, address_2, address_3);

	Byte_Rotator_Left BRL(
		offset,
		data_in[7:0],
		data_in[15:8],
		data_in[23:16],
		data_in[31:24],
		
		byte_in_0,
		byte_in_1,
		byte_in_2,
		byte_in_3);

	_4_Bit_Rotator_Left bRL(
		offset, byte_enablers,
		enabler_0, enabler_1, enabler_2, enabler_3);

		
	IP_Catalog_1_Port_RAM_16a_8b sub_RAM_0(
		address_0, clock, byte_in_0, (write_enabler && enabler_0),
		byte_out_0);

	IP_Catalog_1_Port_RAM_16a_8b sub_RAM_1(
		address_1, clock, byte_in_1, (write_enabler && enabler_1),
		byte_out_1);

	IP_Catalog_1_Port_RAM_16a_8b sub_RAM_2(
		address_2, clock, byte_in_2, (write_enabler && enabler_2),
		byte_out_2);

	IP_Catalog_1_Port_RAM_16a_8b sub_RAM_3(
		address_3, clock, byte_in_3, (write_enabler && enabler_3),
		byte_out_3);
		
	Byte_Rotator_Right BRR(
		offset,
		byte_out_0,
		byte_out_1,
		byte_out_2,
		byte_out_3,
		
		data_out[7:0],
		data_out[15:8],
		data_out[23:16],
		data_out[31:24]);

endmodule
*/