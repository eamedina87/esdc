-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:screen_object:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY hardware_lab1_screen_object_0_0 IS
  PORT (
    cx : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cy : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pixel_row : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    pixel_color : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END hardware_lab1_screen_object_0_0;

ARCHITECTURE hardware_lab1_screen_object_0_0_arch OF hardware_lab1_screen_object_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF hardware_lab1_screen_object_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT screen_object IS
    PORT (
      cx : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cy : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pixel_row : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      pixel_color : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
  END COMPONENT screen_object;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF hardware_lab1_screen_object_0_0_arch: ARCHITECTURE IS "screen_object,Vivado 2014.3.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF hardware_lab1_screen_object_0_0_arch : ARCHITECTURE IS "hardware_lab1_screen_object_0_0,screen_object,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF hardware_lab1_screen_object_0_0_arch: ARCHITECTURE IS "hardware_lab1_screen_object_0_0,screen_object,{x_ipProduct=Vivado 2014.3.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=screen_object,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG}";
BEGIN
  U0 : screen_object
    PORT MAP (
      cx => cx,
      cy => cy,
      pixel_row => pixel_row,
      pixel_column => pixel_column,
      pixel_color => pixel_color
    );
END hardware_lab1_screen_object_0_0_arch;
