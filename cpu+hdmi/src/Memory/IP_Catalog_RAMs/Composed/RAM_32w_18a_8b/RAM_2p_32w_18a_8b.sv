module RAM_2p_32w_18a_8b
(
	input logic [17:0] address_1,
	input logic [31:0] data_in_1,
	input logic [3:0] byte_enablers_1,
	input logic write_enable_1,

	input logic [17:0] address_2,
	input logic [31:0] data_in_2,
	input logic [3:0] byte_enablers_2,
	input logic write_enable_2,
	
	input logic clock,
	
	output logic [31:0] data_out_1,
	output logic [31:0] data_out_2
);
	logic [1:0] offset_1;
	logic [15:0] effective_address_1;
	assign {effective_address_1, offset_1} = address_1;

	logic [1:0] offset_2;
	logic [15:0] effective_address_2;
	assign {effective_address_2, offset_2} = address_2;


	logic [15:0] address_0_1;
	logic [15:0] address_1_1;
	logic [15:0] address_2_1;
	logic [15:0] address_3_1;
	
	logic [7:0] byte_in_0_1;
	logic [7:0] byte_in_1_1;
	logic [7:0] byte_in_2_1;
	logic [7:0] byte_in_3_1;
	
	logic enabler_aux_0_1;
	logic enabler_aux_1_1;
	logic enabler_aux_2_1;
	logic enabler_aux_3_1;

	logic enabler_0_1;
	logic enabler_1_1;
	logic enabler_2_1;
	logic enabler_3_1;

	logic [7:0] byte_out_0_1;
	logic [7:0] byte_out_1_1;
	logic [7:0] byte_out_2_1;
	logic [7:0] byte_out_3_1;
	

	logic [15:0] address_0_2;
	logic [15:0] address_1_2;
	logic [15:0] address_2_2;
	logic [15:0] address_3_2;
	
	logic [7:0] byte_in_0_2;
	logic [7:0] byte_in_1_2;
	logic [7:0] byte_in_2_2;
	logic [7:0] byte_in_3_2;
	
	logic enabler_aux_0_2;
	logic enabler_aux_1_2;
	logic enabler_aux_2_2;
	logic enabler_aux_3_2;

	logic enabler_0_2;
	logic enabler_1_2;
	logic enabler_2_2;
	logic enabler_3_2;

	logic [7:0] byte_out_0_2;
	logic [7:0] byte_out_1_2;
	logic [7:0] byte_out_2_2;
	logic [7:0] byte_out_3_2;


	Address_Offset address_offset_1(
		effective_address_1, offset_1,
		address_0_1, address_1_1, address_2_1, address_3_1);

	Address_Offset address_offset_2(
		effective_address_2, offset_2,
		address_0_2, address_1_2, address_2_2, address_3_2);

	Byte_Rotator_Left BRL_1(
		offset_1,
		data_in_1[7:0],
		data_in_1[15:8],
		data_in_1[23:16],
		data_in_1[31:24],
		
		byte_in_0_1,
		byte_in_1_1,
		byte_in_2_1,
		byte_in_3_1);

	Byte_Rotator_Left BRL_2(
		offset_2,
		data_in_2[7:0],
		data_in_2[15:8],
		data_in_2[23:16],
		data_in_2[31:24],
		
		byte_in_0_2,
		byte_in_1_2,
		byte_in_2_2,
		byte_in_3_2);

	_4_Bit_Rotator_Left bRL_1(
		offset_1, byte_enablers_1,
		enabler_aux_0_1, enabler_aux_1_1, enabler_aux_2_1, enabler_aux_3_1);

	_4_Bit_Rotator_Left bRL_2(
		offset_2, byte_enablers_2,
		enabler_aux_0_2, enabler_aux_1_2, enabler_aux_2_2, enabler_aux_3_2);

	Enabler_N #(.N(4)) en_1(
		{enabler_aux_3_1, enabler_aux_2_1, enabler_aux_1_1, enabler_aux_0_1},
		write_enable_1,
		{enabler_3_1, enabler_2_1, enabler_1_1, enabler_0_1});

	Enabler_N #(.N(4)) en_2(
		{enabler_aux_3_2, enabler_aux_2_2, enabler_aux_1_2, enabler_aux_0_2},
		write_enable_2,
		{enabler_3_2, enabler_2_2, enabler_1_2, enabler_0_2});


	RAM_2p_8w_16a_8b_from_file #(.PATH("C:/Users/aleja/OneDrive/Documents/D/Files/program_works/quartus/arqui_2_proyecto_2_procesador_vectorial/Modules/Memory/Mifs/data_null/sub_ram_0.mif")) sub_RAM_0	
	(
		address_0_1,
		address_0_2,
		clock,
		byte_in_0_1,
		byte_in_0_2,
		enabler_0_1,
		enabler_0_2,

		byte_out_0_1,
		byte_out_0_2);


	RAM_2p_8w_16a_8b_from_file #(.PATH("C:/Users/aleja/OneDrive/Documents/D/Files/program_works/quartus/arqui_2_proyecto_2_procesador_vectorial/Modules/Memory/Mifs/data_null/sub_ram_1.mif")) sub_RAM_1	
	(
		address_1_1,
		address_1_2,
		clock,
		byte_in_1_1,
		byte_in_1_2,
		enabler_1_1,
		enabler_1_2,
		
		byte_out_1_1,
		byte_out_1_2);


	RAM_2p_8w_16a_8b_from_file #(.PATH("C:/Users/aleja/OneDrive/Documents/D/Files/program_works/quartus/arqui_2_proyecto_2_procesador_vectorial/Modules/Memory/Mifs/data_null/sub_ram_2.mif")) sub_RAM_2	
	(
		address_2_1,
		address_2_2,
		clock,
		byte_in_2_1,
		byte_in_2_2,
		enabler_2_1,
		enabler_2_2,
		
		byte_out_2_1,
		byte_out_2_2);


	RAM_2p_8w_16a_8b_from_file #(.PATH("C:/Users/aleja/OneDrive/Documents/D/Files/program_works/quartus/arqui_2_proyecto_2_procesador_vectorial/Modules/Memory/Mifs/data_null/sub_ram_3.mif")) sub_RAM_3	
	(
		address_3_1,
		address_3_2,
		clock,
		byte_in_3_1,
		byte_in_3_2,
		enabler_3_1,
		enabler_3_2,
		
		byte_out_3_1,
		byte_out_3_2);
		

	Byte_Rotator_Right BRR_1
	(
		offset_1,
		byte_out_0_1,
		byte_out_1_1,
		byte_out_2_1,
		byte_out_3_1,
		
		data_out_1[7:0],
		data_out_1[15:8],
		data_out_1[23:16],
		data_out_1[31:24]
	);

	Byte_Rotator_Right BRR_2
	(
		offset_2,
		byte_out_0_2,
		byte_out_1_2,
		byte_out_2_2,
		byte_out_3_2,
		
		data_out_2[7:0],
		data_out_2[15:8],
		data_out_2[23:16],
		data_out_2[31:24]
	);

endmodule
