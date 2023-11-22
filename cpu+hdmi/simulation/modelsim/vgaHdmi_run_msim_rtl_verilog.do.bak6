transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {/home/jachm/intelFPGA_lite/22.1std/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/pll {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/pll/pll_25.vo}
vlib pll_25
vmap pll_25 pll_25
vlog -vlog01compat -work pll_25 +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/pll {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/pll/pll_25.v}
vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Display {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Display/vgaHdmi.v}
vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/i2c {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/i2c/I2C_Controller.v}
vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/i2c {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/i2c/I2C_HDMI_Config.v}
vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/i2c {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/i2c/I2C_WRITE_WDATA.v}
vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Primitive/RAM_1p_8w_16a_8b_from_file {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Primitive/RAM_1p_8w_16a_8b_from_file/RAM_1p_8w_16a_8b_from_file.v}
vlog -vlog01compat -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_ROMs/Primitive/ROM_1p_32w_8a_32b {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_ROMs/Primitive/ROM_1p_32w_8a_32b/ROM_1p_32w_8a_32b.v}
vlog -vlog01compat -work pll_25 +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/pll/pll_25 {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/pll/pll_25/pll_25_0002.v}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/TopModule.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Complements {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Complements/A1_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Decoders {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Decoders/Decoder_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Decoders {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Decoders/Encoder_15x4.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Decoders {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Decoders/Encoder_5x3.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Handlers {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Handlers/Exception.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer\ Arithmetic {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer Arithmetic/Absolute_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer\ Arithmetic {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer Arithmetic/Adder_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer\ Arithmetic {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer Arithmetic/Adder_Subtractor_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer\ Arithmetic {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer Arithmetic/Adder_with_carries_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer\ Arithmetic {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer Arithmetic/Adder_with_carry_in_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer\ Arithmetic {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Integer Arithmetic/SLT_U_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed/Address_offset_16_byte.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed/Circular_shifter_left_byte_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed/Circular_shifter_right_byte_N.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Memory/IP_Catalog_RAMs/Composed/RAM_1p_8g_20a_128b.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Multiplexers {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Multiplexers/Multiplexer_MxN.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Multiplexers {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Multiplexers/Test_Multiplexer_with_enabler_MxN.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Registers {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Registers/Register_N_vP.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Registers {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Registers/Register_N_with_enabler_vP.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/ALU_decoder_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/ALU_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Branch_condition_decoder_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Comparator_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Comparison_unit_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Decode_stage.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Decoder_f7_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Execute_stage.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Fetch_stage.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Hazard_unit_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Input_byte_handler_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Instruction_decoder_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Instruction_splitter_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Load_store_width_decoder_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Main_decoder.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/MT_FSM.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Output_byte_handler_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Pipe_decode_vP.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Pipe_execute_vP.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Pipe_memory_vP.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Pipe_writeback_vP.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Regfile_32x32_vN.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Regfile_vector_32x128_vN.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Rerouting_decoder_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Result_source_decoder_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Router_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/Sign_extend_RV32I.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/RV32I/VALU_4xN.sv}
vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Display {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Display/pixelPrinter.sv}

vlog -sv -work work +incdir+/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src {/home/jachm/Documents/Repos/CE4302-Project-II/cpu+hdmi/src/Test_TopModule.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -L pll_25 -voptargs="+acc"  TopModule

add wave *
view structure
view signals
run -all
