
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z010clg400-1
#    set_property BOARD_PART digilentinc.com:zybo:part0:1.0 [current_project]


# CHANGE DESIGN NAME HERE
set design_name design_1

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

  # Create ports
  set btn [ create_bd_port -dir I -from 3 -to 0 btn ]
  set clkin [ create_bd_port -dir I clkin ]
  set led [ create_bd_port -dir O -from 3 -to 0 led ]
  set sw [ create_bd_port -dir I -from 3 -to 0 sw ]
  set vga_b [ create_bd_port -dir O -from 4 -to 0 vga_b ]
  set vga_g [ create_bd_port -dir O -from 5 -to 0 vga_g ]
  set vga_hs [ create_bd_port -dir O vga_hs ]
  set vga_r [ create_bd_port -dir O -from 4 -to 0 vga_r ]
  set vga_vs [ create_bd_port -dir O vga_vs ]

  # Create instance: VGA_SYNC_0, and set properties
  set VGA_SYNC_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:VGA_SYNC:1.0 VGA_SYNC_0 ]

  # Create instance: comparator_0, and set properties
  set comparator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:comparator:1.0 comparator_0 ]

  # Create instance: f_div5_0, and set properties
  set f_div5_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:f_div5:1.0 f_div5_0 ]

  # Create instance: session3_0, and set properties
  set session3_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:session3:1.0 session3_0 ]

  # Create port connections
  connect_bd_net -net VGA_SYNC_0_pixel_column [get_bd_pins VGA_SYNC_0/pixel_column] [get_bd_pins comparator_0/pixel_column]
  connect_bd_net -net VGA_SYNC_0_pixel_row [get_bd_pins VGA_SYNC_0/pixel_row] [get_bd_pins comparator_0/pixel_row]
  connect_bd_net -net VGA_SYNC_0_vga_b [get_bd_ports vga_b] [get_bd_pins VGA_SYNC_0/vga_b]
  connect_bd_net -net VGA_SYNC_0_vga_g [get_bd_ports vga_g] [get_bd_pins VGA_SYNC_0/vga_g]
  connect_bd_net -net VGA_SYNC_0_vga_hs [get_bd_ports vga_hs] [get_bd_pins VGA_SYNC_0/vga_hs]
  connect_bd_net -net VGA_SYNC_0_vga_r [get_bd_ports vga_r] [get_bd_pins VGA_SYNC_0/vga_r]
  connect_bd_net -net VGA_SYNC_0_vga_vs [get_bd_ports vga_vs] [get_bd_pins VGA_SYNC_0/vga_vs] [get_bd_pins session3_0/vga_vs]
  connect_bd_net -net btn_1 [get_bd_ports btn] [get_bd_pins session3_0/btn]
  connect_bd_net -net clkin_1 [get_bd_ports clkin] [get_bd_pins f_div5_0/clkin]
  connect_bd_net -net comparator_0_pixel_color [get_bd_pins VGA_SYNC_0/color_in] [get_bd_pins comparator_0/pixel_color]
  connect_bd_net -net f_div5_0_clkout [get_bd_pins VGA_SYNC_0/clock_25Mhz] [get_bd_pins comparator_0/clk_25] [get_bd_pins f_div5_0/clkout] [get_bd_pins session3_0/clk_25]
  connect_bd_net -net session3_0_led [get_bd_ports led] [get_bd_pins session3_0/led]
  connect_bd_net -net session3_0_xpos_MAX [get_bd_pins comparator_0/cx_max] [get_bd_pins session3_0/xpos_MAX]
  connect_bd_net -net session3_0_xpos_min [get_bd_pins comparator_0/cx_min] [get_bd_pins session3_0/xpos_min]
  connect_bd_net -net session3_0_ypos_MAX [get_bd_pins comparator_0/cy_max] [get_bd_pins session3_0/ypos_MAX]
  connect_bd_net -net session3_0_ypos_min [get_bd_pins comparator_0/cy_min] [get_bd_pins session3_0/ypos_min]
  connect_bd_net -net sw_1 [get_bd_ports sw] [get_bd_pins session3_0/sw]

  # Create address segments
  

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


