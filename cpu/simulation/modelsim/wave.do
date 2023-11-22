onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/PC_source_E
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/PC_plus_4_E
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/ALU_result_0_E
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/enable_fetch
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/branch_prediction_D
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/predicted_PC_D
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/clock
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/async_reset
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/PC_F
add wave -noupdate -radix hexadecimal /Test_Fetch_stage/PC_plus_4_F
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16634 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 227
configure wave -valuecolwidth 218
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {60879 ps}
