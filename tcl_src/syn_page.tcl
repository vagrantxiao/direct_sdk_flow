
add_files -norecurse verilog_src/axis_ip.v
set_param general.maxThreads  8
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set logFileId [open ./project_1_dfx1.log "w"]
set start_time [clock seconds]
set_param general.maxThreads  8 
synth_design -top axis_ip_top -part xczu9eg-ffvb1156-2-e -mode out_of_context
write_checkpoint -force project_1/dfx1.dcp
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "syn: $total_seconds seconds"
report_utilization -hierarchical > ./project_1/dfx1_utilization.rpt

