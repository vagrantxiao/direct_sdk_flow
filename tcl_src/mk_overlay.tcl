
# load overlay and dfx version 1 netlist
add_files ./project_1/overlay_syn.dcp
add_files ./project_1/dfx1.dcp

# link overlay and dfx version 1 netlist together
set_property SCOPED_TO_CELLS {design_1_i/axis_ip_top_0/inst}  [get_files ./project_1/dfx1.dcp]
link_design -mode default -part xczu9eg-ffvb1156-2-e  -reconfig_partitions {design_1_i/axis_ip_top_0/inst} -top design_1_wrapper

# implement the overlay
opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force ./project_1/overlay_route.dcp
report_timing_summary > ./project_1/overlay_timing.rpt

# write overlay bitstream
write_bitstream  -force ./project_1/overlay.bit
write_bitstream  -force -cell design_1_i/axis_ip_top_0/inst ./project_1/dfx1.bit

# write xsa platfrom for Vitis project
write_hw_platform -fixed -include_bit -force -file ./project_1/design_1_wrapper.xsa

# generate abstract shell for the DFX region
update_design -cell design_1_i/axis_ip_top_0/inst -black_box
lock_design -level routing
write_abstract_shell -force -cell design_1_i/axis_ip_top_0/inst ./project_1/dfx_abs.dcp

