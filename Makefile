ifndef XILINX_VIVADO
  $(error Environment variable XILINX_VIVADO is required and should point to Vitis install area)
endif

all:./project_1/design_1_wrapper.xsa


./project_1/design_1_wrapper.xsa:./project_gen.tcl
	vivado -mode batch -source $<


clean:
	rm -rf ./project_1
	rm -rf ./vivado*
	rm -rf .Xil
