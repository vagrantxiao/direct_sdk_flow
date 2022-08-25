create_pblock myDFX
add_cells_to_pblock [get_pblocks myDFX] [get_cells -quiet [list design_1_i/axis_ip_top_0/inst]]
resize_pblock [get_pblocks myDFX] -add {CLOCKREGION_X2Y1:CLOCKREGION_X2Y1}
set_property SNAPPING_MODE ON [get_pblocks myDFX]
