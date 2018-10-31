//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.3.1 (win64) Build 1056140 Thu Oct 30 17:03:40 MDT 2014
//Date        : Thu Oct 25 13:47:29 2018
//Host        : c4d7 running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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

  wire [3:0]btn;
  wire clkin;
  wire [3:0]led;
  wire [3:0]sw;
  wire [4:0]vga_b;
  wire [5:0]vga_g;
  wire vga_hs;
  wire [4:0]vga_r;
  wire vga_vs;

design_1 design_1_i
       (.btn(btn),
        .clkin(clkin),
        .led(led),
        .sw(sw),
        .vga_b(vga_b),
        .vga_g(vga_g),
        .vga_hs(vga_hs),
        .vga_r(vga_r),
        .vga_vs(vga_vs));
endmodule
