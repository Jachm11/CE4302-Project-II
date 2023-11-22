module RAM_1rwp_1rp_19a_128b_8g
(
	// 19 bits de direccion => 15 bits para las sub RAMs y 4 bits para tener 16 sub RAMs
	input logic [18:0] address_a,
	input logic [18:0] address_b,
	
	input logic [127:0] data_in,
	input logic [15:0] byte_enablers,
	
	input logic write_enable,
	input logic clock,
	
	output logic [127:0] data_out_a,
	output logic [127:0] data_out_b
);

	localparam PATH = "/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/Mifs/data_null/15a_8g_empty_init_file.mif";

	logic [3:0] offset_a;
	logic [3:0] offset_b;

// Address controller 1
	logic [14:0] address_without_offset_a;
	assign {address_without_offset_a, offset_a} = address_a;
	logic [15:0][14:0] sub_addresses_a;
	Address_offset_16_byte AO_a
	(
		.address_without_offset(address_without_offset_a),
		.offset(offset_a),

		.sub_address_0(sub_addresses_a[0]),
		.sub_address_1(sub_addresses_a[1]),
		.sub_address_2(sub_addresses_a[2]),
		.sub_address_3(sub_addresses_a[3]),
		.sub_address_4(sub_addresses_a[4]),
		.sub_address_5(sub_addresses_a[5]),
		.sub_address_6(sub_addresses_a[6]),
		.sub_address_7(sub_addresses_a[7]),
		.sub_address_8(sub_addresses_a[8]),
		.sub_address_9(sub_addresses_a[9]),
		.sub_address_10(sub_addresses_a[10]),
		.sub_address_11(sub_addresses_a[11]),
		.sub_address_12(sub_addresses_a[12]),
		.sub_address_13(sub_addresses_a[13]),
		.sub_address_14(sub_addresses_a[14]),
		.sub_address_15(sub_addresses_a[15])
	);

// Address controller 2
	logic [14:0] address_without_offset_b;
	assign {address_without_offset_b, offset_b} = address_b;
	logic [15:0][14:0] sub_addresses_b;
	Address_offset_16_byte AO_b
	(
		.address_without_offset(address_without_offset_b),
		.offset(offset_b),

		.sub_address_0(sub_addresses_b[0]),
		.sub_address_1(sub_addresses_b[1]),
		.sub_address_2(sub_addresses_b[2]),
		.sub_address_3(sub_addresses_b[3]),
		.sub_address_4(sub_addresses_b[4]),
		.sub_address_5(sub_addresses_b[5]),
		.sub_address_6(sub_addresses_b[6]),
		.sub_address_7(sub_addresses_b[7]),
		.sub_address_8(sub_addresses_b[8]),
		.sub_address_9(sub_addresses_b[9]),
		.sub_address_10(sub_addresses_b[10]),
		.sub_address_11(sub_addresses_b[11]),
		.sub_address_12(sub_addresses_b[12]),
		.sub_address_13(sub_addresses_b[13]),
		.sub_address_14(sub_addresses_b[14]),
		.sub_address_15(sub_addresses_b[15])
	);


// Data controller
	logic [127:0] shifted_data_in;
	Circular_shifter_left_byte_N #(.N(128)) cslb
	(
		.shifting(data_in),
		.shift_amount(offset_a),

		.shifted(shifted_data_in)
	);
	
	logic [15:0] shifted_byte_enablers;
	assign shifted_byte_enablers = (write_enable) ? (byte_enablers << offset_a) : 16'b0;

	
	
	
	
// Sub RAMs
	logic [127:0] data_out_aux_a;
	logic [127:0] data_out_aux_b;

	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_0	
	(
		.address_a(sub_addresses_a[0]),
		.clock(clock),
		.data_a(shifted_data_in[7:0]),
		.wren_a(shifted_byte_enablers[0]),

		.q_a(data_out_aux_a[7:0]),
		
		// Port b
		.address_b(sub_addresses_b[0]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[7:0])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_1
	(
		.address_a(sub_addresses_a[1]),
		.clock(clock),
		.data_a(shifted_data_in[15:8]),
		.wren_a(shifted_byte_enablers[1]),

		.q_a(data_out_aux_a[15:8]),

		// Port b
		.address_b(sub_addresses_b[1]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[15:8])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_2
	(
		.address_a(sub_addresses_a[2]),
		.clock(clock),
		.data_a(shifted_data_in[23:16]),
		.wren_a(shifted_byte_enablers[2]),

		.q_a(data_out_aux_a[23:16]),
		
		// Port b
		.address_b(sub_addresses_b[2]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[23:16])	
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_3
	(
		.address_a(sub_addresses_a[3]),
		.clock(clock),
		.data_a(shifted_data_in[31:24]),
		.wren_a(shifted_byte_enablers[3]),

		.q_a(data_out_aux_a[31:24]),
		
		// Port b
		.address_b(sub_addresses_b[3]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[31:24])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_4
	(
		.address_a(sub_addresses_a[4]),
		.clock(clock),
		.data_a(shifted_data_in[39:32]),
		.wren_a(shifted_byte_enablers[4]),

		.q_a(data_out_aux_a[39:32]),
		
		// Port b
		.address_b(sub_addresses_b[4]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[39:32])		
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_5
	(
		.address_a(sub_addresses_a[5]),
		.clock(clock),
		.data_a(shifted_data_in[47:40]),
		.wren_a(shifted_byte_enablers[5]),

		.q_a(data_out_aux_a[47:40]),

		// Port b
		.address_b(sub_addresses_b[5]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[47:40])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_6
	(
		.address_a(sub_addresses_a[6]),
		.clock(clock),
		.data_a(shifted_data_in[55:48]),
		.wren_a(shifted_byte_enablers[6]),

		.q_a(data_out_aux_a[55:48]),
		
		// Port b
		.address_b(sub_addresses_b[6]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[55:48])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_7
	(
		.address_a(sub_addresses_a[7]),
		.clock(clock),
		.data_a(shifted_data_in[63:56]),
		.wren_a(shifted_byte_enablers[7]),

		.q_a(data_out_aux_a[63:56]),
		
		// Port b
		.address_b(sub_addresses_b[7]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[63:56])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_8
	(
		.address_a(sub_addresses_a[8]),
		.clock(clock),
		.data_a(shifted_data_in[71:64]),
		.wren_a(shifted_byte_enablers[8]),

		.q_a(data_out_aux_a[71:64]),
		
		// Port b
		.address_b(sub_addresses_b[8]),
		.data_b(8'b0),
		.wren_b(1'b0),
		
		.q_b(data_out_aux_b[71:64])		
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_9
	(
		.address_a(sub_addresses_a[9]),
		.clock(clock),
		.data_a(shifted_data_in[79:72]),
		.wren_a(shifted_byte_enablers[9]),

		.q_a(data_out_aux_a[79:72]),

		// Port b
		.address_b(sub_addresses_b[9]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[79:72])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_10
	(
		.address_a(sub_addresses_a[10]),
		.clock(clock),
		.data_a(shifted_data_in[87:80]),
		.wren_a(shifted_byte_enablers[10]),

		.q_a(data_out_aux_a[87:80]),
		
		// Port b
		.address_b(sub_addresses_b[10]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[87:80])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_11
	(
		.address_a(sub_addresses_a[11]),
		.clock(clock),
		.data_a(shifted_data_in[95:88]),
		.wren_a(shifted_byte_enablers[11]),

		.q_a(data_out_aux_a[95:88]),
		
		// Port b
		.address_b(sub_addresses_b[11]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[95:88])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_12
	(
		.address_a(sub_addresses_a[12]),
		.clock(clock),
		.data_a(shifted_data_in[103:96]),
		.wren_a(shifted_byte_enablers[12]),

		.q_a(data_out_aux_a[103:96]),
		
		// Port b
		.address_b(sub_addresses_b[12]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[103:96])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_13
	(
		.address_a(sub_addresses_a[13]),
		.clock(clock),
		.data_a(shifted_data_in[111:104]),
		.wren_a(shifted_byte_enablers[13]),

		.q_a(data_out_aux_a[111:104]),
		
		// Port b
		.address_b(sub_addresses_b[13]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[111:104])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_14
	(
		.address_a(sub_addresses_a[14]),
		.clock(clock),
		.data_a(shifted_data_in[119:112]),
		.wren_a(shifted_byte_enablers[14]),

		.q_a(data_out_aux_a[119:112]),
		
		// Port b
		.address_b(sub_addresses_b[14]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[119:112])
	);
	RAM_2rwp_15a_8b_8g_from_file
	#(.PATH(PATH))
	sub_RAM_15
	(
		.address_a(sub_addresses_a[15]),
		.clock(clock),
		.data_a(shifted_data_in[127:120]),
		.wren_a(shifted_byte_enablers[15]),

		.q_a(data_out_aux_a[127:120]),
		
		// Port b
		.address_b(sub_addresses_b[15]),
		.data_b(8'b0),
		.wren_b(1'b0),

		.q_b(data_out_aux_b[127:120])
	);

	// Output data controller 1
	Circular_shifter_right_byte_N #(.N(128)) csrb_a
	(
		.shifting(data_out_aux_a),
		.shift_amount(offset_a),

		.shifted(data_out_a)
	);
	
	// Output data controller 2
	Circular_shifter_right_byte_N #(.N(128)) csrb_b
	(
		.shifting(data_out_aux_b),
		.shift_amount(offset_b),

		.shifted(data_out_b)
	);
endmodule
/*
RAM_1rwp_1rp_19a_128b_8g RAM
(
	.address_a(),
	.address_b(),
	.data_in(),
	.byte_enablers(),
	.write_enable(),

	.clock(),

	.data_out_a(),
	.data_out_b()	
);
*/