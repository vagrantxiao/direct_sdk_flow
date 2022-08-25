# load abstract and dfx version 2 netlist
add_files ./project_1/dfx_abs.dcp
add_files ./project_1/dfx2.dcp

# link overlay and dfx version 2 netlist together
set_property SCOPED_TO_CELLS {design_1_i/axis_ip_top_0/inst}  [get_files ./project_1/dfx2.dcp]
link_design -mode default -part xczu9eg-ffvb1156-2-e  -reconfig_partitions {design_1_i/axis_ip_top_0/inst} -top design_1_wrapper

# implement the version 2 for DFX region
opt_design
place_design
phys_opt_design
route_design
write_checkpoint -force ./project_1/dfx2_route.dcp
report_timing_summary > ./project_1/dfx2_timing.rpt


# write overlay bitstream
write_bitstream  -force -cell design_1_i/axis_ip_top_0/inst ./project_1/dfx2.bit


