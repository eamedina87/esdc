//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.3.1 (win64) Build 1056140 Thu Oct 30 17:03:40 MDT 2014
//Date        : Thu Oct 25 13:47:29 2018
//Host        : c4d7 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,da_ps7_cnt=1}" *) 
module design_1
   (btn,
    clkin,
    led,
    sw,
    vga_b,
    vga_g,
    vga_hs,
    vga_r,
    vga_vs);
  input [3:0]btn;
  input clkin;
  output [3:0]led;
  input [3:0]sw;
  output [4:0]vga_b;
  output [5:0]vga_g;
  output vga_hs;
  output [4:0]vga_r;
  output vga_vs;

  wire [9:0]VGA_SYNC_0_pixel_column;
  wire [9:0]VGA_SYNC_0_pixel_row;
  wire [4:0]VGA_SYNC_0_vga_b;
  wire [5:0]VGA_SYNC_0_vga_g;
  wire VGA_SYNC_0_vga_hs;
  wire [4:0]VGA_SYNC_0_vga_r;
  wire VGA_SYNC_0_vga_vs;
  wire [3:0]btn_1;
  wire clkin_1;
  wire [2:0]comparator_0_pixel_color;
  wire f_div5_0_clkout;
  wire [3:0]session3_0_led;
  wire [9:0]session3_0_xpos_MAX;
  wire [9:0]session3_0_xpos_min;
  wire [9:0]session3_0_ypos_MAX;
  wire [9:0]session3_0_ypos_min;
  wire [3:0]sw_1;

  assign btn_1 = btn[3:0];
  assign clkin_1 = clkin;
  assign led[3:0] = session3_0_led;
  assign sw_1 = sw[3:0];
  assign vga_b[4:0] = VGA_SYNC_0_vga_b;
  assign vga_g[5:0] = VGA_SYNC_0_vga_g;
  assign vga_hs = VGA_SYNC_0_vga_hs;
  assign vga_r[4:0] = VGA_SYNC_0_vga_r;
  assign vga_vs = VGA_SYNC_0_vga_vs;
design_1_VGA_SYNC_0_1 VGA_SYNC_0
       (.clock_25Mhz(f_div5_0_clkout),
        .color_in(comparator_0_pixel_color),
        .pixel_column(VGA_SYNC_0_pixel_column),
        .pixel_row(VGA_SYNC_0_pixel_row),
        .vga_b(VGA_SYNC_0_vga_b),
        .vga_g(VGA_SYNC_0_vga_g),
        .vga_hs(VGA_SYNC_0_vga_hs),
        .vga_r(VGA_SYNC_0_vga_r),
        .vga_vs(VGA_SYNC_0_vga_vs));
design_1_comparator_0_0 comparator_0
       (.clk_25(f_div5_0_clkout),
        .cx_max(session3_0_xpos_MAX),
        .cx_min(session3_0_xpos_min),
        .cy_max(session3_0_ypos_MAX),
        .cy_min(session3_0_ypos_min),
        .pixel_color(comparator_0_pixel_color),
        .pixel_column(VGA_SYNC_0_pixel_column),
        .pixel_row(VGA_SYNC_0_pixel_row));
design_1_f_div5_0_0 f_div5_0
       (.clkin(clkin_1),
        .clkout(f_div5_0_clkout));
design_1_session3_0_0 session3_0
       (.btn(btn_1),
        .clk_25(f_div5_0_clkout),
        .led(session3_0_led),
        .sw(sw_1),
        .vga_vs(VGA_SYNC_0_vga_vs),
        .xpos_MAX(session3_0_xpos_MAX),
        .xpos_min(session3_0_xpos_min),
        .ypos_MAX(session3_0_ypos_MAX),
        .ypos_min(session3_0_ypos_min));
endmodule
