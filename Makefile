ifndef XILINX_VIVADO
  $(error Environment variable XILINX_VIVADO is required and should point to Vitis install area)
endif

#all:./project_1/design_1_wrapper.xsa
all:./project_1/dfx2.bit

./project_1/dfx2.bit:./tcl_src/impl_page_v2.tcl ./project_1/dfx_abs.dcp ./project_1/dfx2.dcp
	vivado -mode batch -source $<

./project_1/dfx_abs.dcp:./tcl_src/mk_overlay.tcl ./project_1/overlay_syn.dcp ./project_1/dfx1.dcp
	vivado -mode batch -source $<

./project_1/overlay_syn.dcp:./tcl_src/project_gen.tcl
	vivado -mode batch -source $<

./project_1/dfx1.dcp:./tcl_src/syn_page.tcl
	vivado -mode batch -source $<

./project_1/dfx2.dcp:./tcl_src/syn_page_v2.tcl
	vivado -mode batch -source $<


clean:
	rm -rf project_1
	rm -rf vivado*
	rm -rf .Xil
	rm -rf hd_visual
