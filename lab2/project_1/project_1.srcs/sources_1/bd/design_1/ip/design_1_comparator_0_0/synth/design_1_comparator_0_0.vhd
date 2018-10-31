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

-- IP VLNV: xilinx.com:ip:comparator:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_comparator_0_0 IS
  PORT (
    cx_min : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    cx_max : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    cy_min : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    cy_max : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    pixel_row : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    clk_25 : IN STD_LOGIC;
    pixel_color : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END design_1_comparator_0_0;

ARCHITECTURE design_1_comparator_0_0_arch OF design_1_comparator_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_comparator_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT comparator IS
    PORT (
      cx_min : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      cx_max : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      cy_min : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      cy_max : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      pixel_row : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      pixel_column : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      clk_25 : IN STD_LOGIC;
      pixel_color : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
  END COMPONENT comparator;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_comparator_0_0_arch: ARCHITECTURE IS "comparator,Vivado 2014.3.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_comparator_0_0_arch : ARCHITECTURE IS "design_1_comparator_0_0,comparator,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_comparator_0_0_arch: ARCHITECTURE IS "design_1_comparator_0_0,comparator,{x_ipProduct=Vivado 2014.3.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=comparator,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG}";
BEGIN
  U0 : comparator
    PORT MAP (
      cx_min => cx_min,
      cx_max => cx_max,
      cy_min => cy_min,
      cy_max => cy_max,
      pixel_row => pixel_row,
      pixel_column => pixel_column,
      clk_25 => clk_25,
      pixel_color => pixel_color
    );
END design_1_comparator_0_0_arch;