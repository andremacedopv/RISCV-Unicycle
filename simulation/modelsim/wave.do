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
add wave -noupdate -childformat {{/riscv_tb/riscv_tb/BREGISTERS/breg(0) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(1) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(2) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(3) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(4) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(5) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(6) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(7) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(8) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(9) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(10) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(11) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(12) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(13) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(14) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(15) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(16) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(17) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(18) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(19) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(20) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(21) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(22) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(23) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(24) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(25) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(26) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(27) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(28) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(29) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(30) -radix decimal} {/riscv_tb/riscv_tb/BREGISTERS/breg(31) -radix decimal}} -expand -subitemconfig {/riscv_tb/riscv_tb/BREGISTERS/breg(0) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(1) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(2) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(3) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(4) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(5) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(6) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(7) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(8) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(9) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(10) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(11) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(12) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(13) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(14) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(15) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(16) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(17) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(18) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(19) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(20) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(21) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(22) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(23) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(24) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(25) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(26) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(27) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(28) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(29) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(30) {-radix decimal} /riscv_tb/riscv_tb/BREGISTERS/breg(31) {-radix decimal}} /riscv_tb/riscv_tb/BREGISTERS/breg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {499495 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {371550 ps} {627550 ps}
