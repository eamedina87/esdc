
################################################################
# This is a generated script based on design: hardware_lab1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2014.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source hardware_lab1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1
#    set_property BOARD_PART digilentinc.com:zybo:part0:1.0 [current_project]


# CHANGE DESIGN NAME HERE
set design_name hardware_lab1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}


# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set btns_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 btns_4bits ]
  set leds_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 leds_4bits ]

  # Create ports
  set vga_b [ create_bd_port -dir O -from 4 -to 0 vga_b ]
  set vga_g [ create_bd_port -dir O -from 5 -to 0 vga_g ]
  set vga_hs [ create_bd_port -dir O vga_hs ]
  set vga_r [ create_bd_port -dir O -from 4 -to 0 vga_r ]
  set vga_vs [ create_bd_port -dir O vga_vs ]

  # Create instance: VGA_SYNC_0, and set properties
  set VGA_SYNC_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:VGA_SYNC:1.0 VGA_SYNC_0 ]

  # Create instance: buttons, and set properties
  set buttons [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 buttons ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {4} CONFIG.GPIO_BOARD_INTERFACE {btns_4bits} CONFIG.USE_BOARD_FLOW {true}  ] $buttons

  # Create instance: leds, and set properties
  set leds [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 leds ]
  set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_GPIO_WIDTH {4} CONFIG.GPIO_BOARD_INTERFACE {leds_4bits} CONFIG.USE_BOARD_FLOW {true}  ] $leds

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {650} CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {50.000000} CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} CONFIG.PCW_ENET0_RESET_ENABLE {0} CONFIG.PCW_EN_CLK1_PORT {1} CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {25} CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} CONFIG.PCW_MIO_0_PULLUP {enabled} CONFIG.PCW_MIO_10_PULLUP {enabled} CONFIG.PCW_MIO_11_PULLUP {enabled} CONFIG.PCW_MIO_12_PULLUP {enabled} CONFIG.PCW_MIO_16_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_16_PULLUP {disabled} CONFIG.PCW_MIO_16_SLEW {fast} CONFIG.PCW_MIO_17_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_17_PULLUP {disabled} CONFIG.PCW_MIO_17_SLEW {fast} CONFIG.PCW_MIO_18_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_18_PULLUP {disabled} CONFIG.PCW_MIO_18_SLEW {fast} CONFIG.PCW_MIO_19_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_19_PULLUP {disabled} CONFIG.PCW_MIO_19_SLEW {fast} CONFIG.PCW_MIO_1_PULLUP {disabled} CONFIG.PCW_MIO_1_SLEW {fast} CONFIG.PCW_MIO_20_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_20_PULLUP {disabled} CONFIG.PCW_MIO_20_SLEW {fast} CONFIG.PCW_MIO_21_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_21_PULLUP {disabled} CONFIG.PCW_MIO_21_SLEW {fast} CONFIG.PCW_MIO_22_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_22_PULLUP {disabled} CONFIG.PCW_MIO_22_SLEW {fast} CONFIG.PCW_MIO_23_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_23_PULLUP {disabled} CONFIG.PCW_MIO_23_SLEW {fast} CONFIG.PCW_MIO_24_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_24_PULLUP {disabled} CONFIG.PCW_MIO_24_SLEW {fast} CONFIG.PCW_MIO_25_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_25_PULLUP {disabled} CONFIG.PCW_MIO_25_SLEW {fast} CONFIG.PCW_MIO_26_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_26_PULLUP {disabled} CONFIG.PCW_MIO_26_SLEW {fast} CONFIG.PCW_MIO_27_IOTYPE {HSTL 1.8V} CONFIG.PCW_MIO_27_PULLUP {disabled} CONFIG.PCW_MIO_27_SLEW {fast} CONFIG.PCW_MIO_28_PULLUP {disabled} CONFIG.PCW_MIO_28_SLEW {fast} CONFIG.PCW_MIO_29_PULLUP {disabled} CONFIG.PCW_MIO_29_SLEW {fast} CONFIG.PCW_MIO_2_SLEW {fast} CONFIG.PCW_MIO_30_PULLUP {disabled} CONFIG.PCW_MIO_30_SLEW {fast} CONFIG.PCW_MIO_31_PULLUP {disabled} CONFIG.PCW_MIO_31_SLEW {fast} CONFIG.PCW_MIO_32_PULLUP {disabled} CONFIG.PCW_MIO_32_SLEW {fast} CONFIG.PCW_MIO_33_PULLUP {disabled} CONFIG.PCW_MIO_33_SLEW {fast} CONFIG.PCW_MIO_34_PULLUP {disabled} CONFIG.PCW_MIO_34_SLEW {fast} CONFIG.PCW_MIO_35_PULLUP {disabled} CONFIG.PCW_MIO_35_SLEW {fast} CONFIG.PCW_MIO_36_PULLUP {disabled} CONFIG.PCW_MIO_36_SLEW {fast} CONFIG.PCW_MIO_37_PULLUP {disabled} CONFIG.PCW_MIO_37_SLEW {fast} CONFIG.PCW_MIO_38_PULLUP {disabled} CONFIG.PCW_MIO_38_SLEW {fast} CONFIG.PCW_MIO_39_PULLUP {disabled} CONFIG.PCW_MIO_39_SLEW {fast} CONFIG.PCW_MIO_3_SLEW {fast} CONFIG.PCW_MIO_40_PULLUP {disabled} CONFIG.PCW_MIO_40_SLEW {fast} CONFIG.PCW_MIO_41_PULLUP {disabled} CONFIG.PCW_MIO_41_SLEW {fast} CONFIG.PCW_MIO_42_PULLUP {disabled} CONFIG.PCW_MIO_42_SLEW {fast} CONFIG.PCW_MIO_43_PULLUP {disabled} CONFIG.PCW_MIO_43_SLEW {fast} CONFIG.PCW_MIO_44_PULLUP {disabled} CONFIG.PCW_MIO_44_SLEW {fast} CONFIG.PCW_MIO_45_PULLUP {disabled} CONFIG.PCW_MIO_45_SLEW {fast} CONFIG.PCW_MIO_47_PULLUP {disabled} CONFIG.PCW_MIO_48_PULLUP {disabled} CONFIG.PCW_MIO_49_PULLUP {disabled} CONFIG.PCW_MIO_4_SLEW {fast} CONFIG.PCW_MIO_50_DIRECTION {inout} CONFIG.PCW_MIO_50_PULLUP {disabled} CONFIG.PCW_MIO_51_DIRECTION {inout} CONFIG.PCW_MIO_51_PULLUP {disabled} CONFIG.PCW_MIO_52_PULLUP {disabled} CONFIG.PCW_MIO_52_SLEW {slow} CONFIG.PCW_MIO_53_PULLUP {disabled} CONFIG.PCW_MIO_53_SLEW {slow} CONFIG.PCW_MIO_5_SLEW {fast} CONFIG.PCW_MIO_6_SLEW {fast} CONFIG.PCW_MIO_8_SLEW {fast} CONFIG.PCW_MIO_9_PULLUP {enabled} CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} CONFIG.PCW_SD0_GRP_CD_ENABLE {1} CONFIG.PCW_SD0_GRP_CD_IO {MIO 47} CONFIG.PCW_SD0_GRP_WP_ENABLE {1} CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.176} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.159} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.162} CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.187} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.073} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {-0.034} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {-0.03} CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {-0.082} CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {525} CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K128M16 JT-125} CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} CONFIG.PCW_USB0_RESET_ENABLE {1} CONFIG.PCW_USB0_RESET_IO {MIO 46} CONFIG.preset {Default*}  ] $processing_system7_0

  # Create instance: processing_system7_0_axi_periph, and set properties
  set processing_system7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 processing_system7_0_axi_periph ]
  set_property -dict [ list CONFIG.NUM_MI {5}  ] $processing_system7_0_axi_periph

  # Create instance: readCol, and set properties
  set readCol [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 readCol ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_ALL_OUTPUTS {0} CONFIG.C_GPIO_WIDTH {5}  ] $readCol

  # Create instance: readRow, and set properties
  set readRow [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 readRow ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} CONFIG.C_GPIO_WIDTH {5}  ] $readRow

  # Create instance: rgb, and set properties
  set rgb [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 rgb ]
  set_property -dict [ list CONFIG.C_ALL_OUTPUTS {1} CONFIG.C_GPIO_WIDTH {3}  ] $rgb

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: slice_col, and set properties
  set slice_col [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 slice_col ]
  set_property -dict [ list CONFIG.DIN_FROM {9} CONFIG.DIN_TO {5} CONFIG.DIN_WIDTH {10} CONFIG.DOUT_WIDTH {5}  ] $slice_col

  # Create instance: slice_row, and set properties
  set slice_row [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 slice_row ]
  set_property -dict [ list CONFIG.DIN_FROM {9} CONFIG.DIN_TO {5} CONFIG.DIN_WIDTH {10} CONFIG.DOUT_WIDTH {5}  ] $slice_row

  # Create interface connections
  connect_bd_intf_net -intf_net buttons_GPIO [get_bd_intf_ports btns_4bits] [get_bd_intf_pins buttons/GPIO]
  connect_bd_intf_net -intf_net leds_GPIO [get_bd_intf_ports leds_4bits] [get_bd_intf_pins leds/GPIO]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins processing_system7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins buttons/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M01_AXI [get_bd_intf_pins leds/S_AXI] [get_bd_intf_pins processing_system7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M02_AXI] [get_bd_intf_pins rgb/S_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M03_AXI] [get_bd_intf_pins readCol/S_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M04_AXI [get_bd_intf_pins processing_system7_0_axi_periph/M04_AXI] [get_bd_intf_pins readRow/S_AXI]

  # Create port connections
  connect_bd_net -net VGA_SYNC_0_pixel_column [get_bd_pins VGA_SYNC_0/pixel_column] [get_bd_pins slice_col/Din]
  connect_bd_net -net VGA_SYNC_0_pixel_row [get_bd_pins VGA_SYNC_0/pixel_row] [get_bd_pins slice_row/Din]
  connect_bd_net -net VGA_SYNC_0_vga_b [get_bd_ports vga_b] [get_bd_pins VGA_SYNC_0/vga_b]
  connect_bd_net -net VGA_SYNC_0_vga_g [get_bd_ports vga_g] [get_bd_pins VGA_SYNC_0/vga_g]
  connect_bd_net -net VGA_SYNC_0_vga_hs [get_bd_ports vga_hs] [get_bd_pins VGA_SYNC_0/vga_hs]
  connect_bd_net -net VGA_SYNC_0_vga_r [get_bd_ports vga_r] [get_bd_pins VGA_SYNC_0/vga_r]
  connect_bd_net -net VGA_SYNC_0_vga_vs [get_bd_ports vga_vs] [get_bd_pins VGA_SYNC_0/vga_vs]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins buttons/s_axi_aclk] [get_bd_pins leds/s_axi_aclk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0_axi_periph/ACLK] [get_bd_pins processing_system7_0_axi_periph/M00_ACLK] [get_bd_pins processing_system7_0_axi_periph/M01_ACLK] [get_bd_pins processing_system7_0_axi_periph/M02_ACLK] [get_bd_pins processing_system7_0_axi_periph/M03_ACLK] [get_bd_pins processing_system7_0_axi_periph/M04_ACLK] [get_bd_pins processing_system7_0_axi_periph/S00_ACLK] [get_bd_pins readCol/s_axi_aclk] [get_bd_pins readRow/s_axi_aclk] [get_bd_pins rgb/s_axi_aclk] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins VGA_SYNC_0/clock_25Mhz] [get_bd_pins processing_system7_0/FCLK_CLK1]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in]
  connect_bd_net -net rgb_gpio_io_o [get_bd_pins VGA_SYNC_0/color_in] [get_bd_pins rgb/gpio_io_o]
  connect_bd_net -net rst_processing_system7_0_100M_interconnect_aresetn [get_bd_pins processing_system7_0_axi_periph/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_100M_peripheral_aresetn [get_bd_pins buttons/s_axi_aresetn] [get_bd_pins leds/s_axi_aresetn] [get_bd_pins processing_system7_0_axi_periph/M00_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M01_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M02_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M03_ARESETN] [get_bd_pins processing_system7_0_axi_periph/M04_ARESETN] [get_bd_pins processing_system7_0_axi_periph/S00_ARESETN] [get_bd_pins readCol/s_axi_aresetn] [get_bd_pins readRow/s_axi_aresetn] [get_bd_pins rgb/s_axi_aresetn] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn]
  connect_bd_net -net slice_col_Dout [get_bd_pins readCol/gpio_io_i] [get_bd_pins slice_col/Dout]
  connect_bd_net -net slice_row_Dout [get_bd_pins readRow/gpio_io_i] [get_bd_pins slice_row/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs buttons/S_AXI/Reg] SEG_buttons_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41210000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs leds/S_AXI/Reg] SEG_leds_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41230000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs readCol/S_AXI/Reg] SEG_readCol_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41240000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs readRow/S_AXI/Reg] SEG_readRow_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41220000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs rgb/S_AXI/Reg] SEG_rgb_Reg
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


