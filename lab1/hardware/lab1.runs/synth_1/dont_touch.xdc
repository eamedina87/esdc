# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: C:/Users/erick.medina/Documents/ESDC/esdc/lab1/hardware/zyboVGA.xdc

# Block Designs: bd/hardware_lab1/hardware_lab1.bd
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1 || ORIG_REF_NAME==hardware_lab1}]

# IP: bd/hardware_lab1/ip/hardware_lab1_processing_system7_0_0/hardware_lab1_processing_system7_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_processing_system7_0_0 || ORIG_REF_NAME==hardware_lab1_processing_system7_0_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_VGA_SYNC_0_0/hardware_lab1_VGA_SYNC_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_VGA_SYNC_0_0 || ORIG_REF_NAME==hardware_lab1_VGA_SYNC_0_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_0_0/hardware_lab1_axi_gpio_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_0_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_0_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_1_0/hardware_lab1_axi_gpio_1_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_1_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_1_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_2_0/hardware_lab1_axi_gpio_2_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_2_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_2_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_3_0/hardware_lab1_axi_gpio_3_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_3_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_3_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_xlslice_0_0/hardware_lab1_xlslice_0_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_xlslice_0_0 || ORIG_REF_NAME==hardware_lab1_xlslice_0_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_xlslice_1_0/hardware_lab1_xlslice_1_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_xlslice_1_0 || ORIG_REF_NAME==hardware_lab1_xlslice_1_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_4_0/hardware_lab1_axi_gpio_4_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_4_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_4_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_processing_system7_0_axi_periph_0/hardware_lab1_processing_system7_0_axi_periph_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_processing_system7_0_axi_periph_0 || ORIG_REF_NAME==hardware_lab1_processing_system7_0_axi_periph_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_rst_processing_system7_0_100M_0/hardware_lab1_rst_processing_system7_0_100M_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_rst_processing_system7_0_100M_0 || ORIG_REF_NAME==hardware_lab1_rst_processing_system7_0_100M_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_xbar_0/hardware_lab1_xbar_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_xbar_0 || ORIG_REF_NAME==hardware_lab1_xbar_0}]

# IP: bd/hardware_lab1/ip/hardware_lab1_auto_pc_0/hardware_lab1_auto_pc_0.xci
set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_auto_pc_0 || ORIG_REF_NAME==hardware_lab1_auto_pc_0}]

# XDC: bd/hardware_lab1/ip/hardware_lab1_processing_system7_0_0/hardware_lab1_processing_system7_0_0.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_processing_system7_0_0 || ORIG_REF_NAME==hardware_lab1_processing_system7_0_0}] {/inst }]/inst ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_0_0/hardware_lab1_axi_gpio_0_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_0_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_0_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_0_0/hardware_lab1_axi_gpio_0_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_0_0/hardware_lab1_axi_gpio_0_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_0_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_0_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_1_0/hardware_lab1_axi_gpio_1_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_1_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_1_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_1_0/hardware_lab1_axi_gpio_1_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_1_0/hardware_lab1_axi_gpio_1_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_1_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_1_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_2_0/hardware_lab1_axi_gpio_2_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_2_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_2_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_2_0/hardware_lab1_axi_gpio_2_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_2_0/hardware_lab1_axi_gpio_2_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_2_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_2_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_3_0/hardware_lab1_axi_gpio_3_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_3_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_3_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_3_0/hardware_lab1_axi_gpio_3_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_3_0/hardware_lab1_axi_gpio_3_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_3_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_3_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_4_0/hardware_lab1_axi_gpio_4_0_board.xdc
set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_4_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_4_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_4_0/hardware_lab1_axi_gpio_4_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_axi_gpio_4_0/hardware_lab1_axi_gpio_4_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells [split [join [get_cells -hier -filter {REF_NAME==hardware_lab1_axi_gpio_4_0 || ORIG_REF_NAME==hardware_lab1_axi_gpio_4_0}] {/U0 }]/U0 ]]

# XDC: bd/hardware_lab1/ip/hardware_lab1_rst_processing_system7_0_100M_0/hardware_lab1_rst_processing_system7_0_100M_0_board.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_rst_processing_system7_0_100M_0 || ORIG_REF_NAME==hardware_lab1_rst_processing_system7_0_100M_0}]

# XDC: bd/hardware_lab1/ip/hardware_lab1_rst_processing_system7_0_100M_0/hardware_lab1_rst_processing_system7_0_100M_0.xdc
#dup# set_property DONT_TOUCH TRUE [get_cells -hier -filter {REF_NAME==hardware_lab1_rst_processing_system7_0_100M_0 || ORIG_REF_NAME==hardware_lab1_rst_processing_system7_0_100M_0}]

# XDC: bd/hardware_lab1/ip/hardware_lab1_rst_processing_system7_0_100M_0/hardware_lab1_rst_processing_system7_0_100M_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_xbar_0/hardware_lab1_xbar_0_ooc.xdc

# XDC: bd/hardware_lab1/ip/hardware_lab1_auto_pc_0/hardware_lab1_auto_pc_0_ooc.xdc

# XDC: bd/hardware_lab1/hardware_lab1_ooc.xdc