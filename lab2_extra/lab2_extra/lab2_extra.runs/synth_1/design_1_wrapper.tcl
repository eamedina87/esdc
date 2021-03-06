# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

create_project -in_memory -part xc7z010clg400-1
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.cache/wt [current_project]
set_property parent.project_path C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
set_property ip_repo_paths {
  C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/add_generator
  C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/session4
  C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/vga_sync
} [current_project]
add_files C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/design_1.bd
set_property used_in_implementation false [get_files -all c:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/design_1_ooc.xdc]
set_property is_locked true [get_files C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/design_1.bd]

read_verilog -library xil_defaultlib C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/sources_1/bd/design_1/hdl/design_1_wrapper.v
read_xdc C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/constrs_1/imports/lab2_extra/zyboVGA.xdc
set_property used_in_implementation false [get_files C:/Users/erick.medina/Documents/ESDC/esdc/lab2_extra/lab2_extra/lab2_extra.srcs/constrs_1/imports/lab2_extra/zyboVGA.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
catch { write_hwdef -file design_1_wrapper.hwdef }
synth_design -top design_1_wrapper -part xc7z010clg400-1
write_checkpoint design_1_wrapper.dcp
catch { report_utilization -file design_1_wrapper_utilization_synth.rpt -pb design_1_wrapper_utilization_synth.pb }
