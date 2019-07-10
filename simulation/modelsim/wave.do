onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /riscv_tb/clock
add wave -noupdate /riscv_tb/branchOUT
add wave -noupdate /riscv_tb/MemReadOUT
add wave -noupdate /riscv_tb/MemWriteOUT
add wave -noupdate /riscv_tb/ALUSrcOUT
add wave -noupdate /riscv_tb/RegWriteOUT
add wave -noupdate /riscv_tb/MemToRegOUT
add wave -noupdate /riscv_tb/ALUOpOUT
add wave -noupdate /riscv_tb/ALUSelectOUT
add wave -noupdate -radix decimal /riscv_tb/PCout
add wave -noupdate -radix hexadecimal /riscv_tb/instrOut
add wave -noupdate -childformat {{/riscv_tb/riscv_tb/BREGISTERS/breg(0) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(1) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(2) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(3) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(4) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(5) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(6) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(7) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(8) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(9) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(10) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(11) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(12) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(13) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(14) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(15) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(16) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(17) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(18) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(19) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(20) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(21) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(22) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(23) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(24) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(25) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(26) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(27) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(28) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(29) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(30) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(31) -radix decimal}} -subitemconfig {/riscv_tb/riscv_tb/BREGISTERS/breg(0) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(1) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(2) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(3) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(4) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(5) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(6) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(7) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(8) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(9) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(10) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(11) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(12) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(13) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(14) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(15) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(16) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(17) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(18) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(19) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(20) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(21) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(22) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(23) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(24) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(25) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(26) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(27) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(28) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(29) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(30) {-height 15 -radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(31) {-height 15 -radix decimal}} /riscv_tb/riscv_tb/BREGISTERS/breg
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/clk
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/wren
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/rst
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/rs1
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/rs2
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/rd
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/data
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/ro1
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/ro2
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/breg
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/out1
add wave -noupdate -radix hexadecimal /riscv_tb/riscv_tb/BREGISTERS/out2
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59463 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 231
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {236657 ps}
