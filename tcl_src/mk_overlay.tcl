add_files ./project_1/overlay_syn.dcp
add_files ./project_1/dfx1.dcp
set_property SCOPED_TO_CELLS {design_1_i/axis_ip_top_0/inst}  [get_files ./project_1/dfx1.dcp]
link_design -mode default -part xczu9eg-ffvb1156-2-e  -reconfig_partitions {design_1_i/axis_ip_top_0/inst} -top design_1_wrapper
