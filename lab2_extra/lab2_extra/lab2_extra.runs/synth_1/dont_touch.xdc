# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: imports/lab2_extra/zyboVGA.xdc

# Block Designs: bd/design_1/design_1.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1 || ORIG_REF_NAME==design_1}]

# IP: bd/design_1/ip/design_1_session4_0_0/design_1_session4_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_session4_0_0 || ORIG_REF_NAME==design_1_session4_0_0}]

# IP: bd/design_1/ip/design_1_add_generator_0_0/design_1_add_generator_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_add_generator_0_0 || ORIG_REF_NAME==design_1_add_generator_0_0}]

# IP: bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_blk_mem_gen_0_0 || ORIG_REF_NAME==design_1_blk_mem_gen_0_0}]

# IP: bd/design_1/ip/design_1_VGA_SYNC_0_0/design_1_VGA_SYNC_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_VGA_SYNC_0_0 || ORIG_REF_NAME==design_1_VGA_SYNC_0_0}]

# IP: bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==design_1_clk_wiz_0_0 || ORIG_REF_NAME==design_1_clk_wiz_0_0}]

# XDC: bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_ooc.xdc

# XDC: bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_clk_wiz_0_0 || ORIG_REF_NAME==design_1_clk_wiz_0_0}] {/inst }]/inst ]]

# XDC: bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==design_1_clk_wiz_0_0 || ORIG_REF_NAME==design_1_clk_wiz_0_0}] {/inst }]/inst ]]

# XDC: bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_ooc.xdc

# XDC: bd/design_1/design_1_ooc.xdc
