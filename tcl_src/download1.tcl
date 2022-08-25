open_hw
connect_hw_server
open_hw_target
current_hw_device [get_hw_devices xczu9_0]

set_property PROBES.FILE {} [get_hw_devices xczu9_0]
set_property FULL_PROBES.FILE {} [get_hw_devices xczu9_0]
set_property PROGRAM.FILE {./project_1/overlay.bit} [get_hw_devices xczu9_0]
program_hw_devices [get_hw_devices xczu9_0]
refresh_hw_device [lindex [get_hw_devices xczu9_0]]

set_property PROBES.FILE {} [get_hw_devices xczu9_0]
set_property FULL_PROBES.FILE {} [get_hw_devices xczu9_0]
set_property PROGRAM.FILE {./project_1/dfx1.bit} [get_hw_devices xczu9_0]
program_hw_devices [get_hw_devices xczu9_0]
refresh_hw_device [lindex [get_hw_devices xczu9_0]]




