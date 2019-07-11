transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/RVfmt_pkg.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/RV_pkg.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/BregRV.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/Data_RAM.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/ins_RAM.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/RVcontrol.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/BRANCHcontrol.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/RISCV.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/genImm32.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/ulaRV.vhd}
vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/ULAcontrol.vhd}

vcom -93 -work work {C:/altera/13.0/projects/RISCV-Unicycle/RISCV_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  RISCV_tb

do C:/altera/13.0/projects/RISCV-Unicycle/simulation/modelsim/my_custom_view.do
