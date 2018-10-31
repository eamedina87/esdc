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

-- IP VLNV: xilinx.com:ip:session4:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY lab1_extra_session4_0_0 IS
  PORT (
    clk_25 : IN STD_LOGIC;
    vga_vs : IN STD_LOGIC;
    btn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    sw : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    led : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    wr_memo : OUT STD_LOGIC;
    data : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    adr_memo : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
  );
END lab1_extra_session4_0_0;

ARCHITECTURE lab1_extra_session4_0_0_arch OF lab1_extra_session4_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF lab1_extra_session4_0_0_arch: ARCHITECTURE IS "yes";

  COMPONENT session4 IS
    PORT (
      clk_25 : IN STD_LOGIC;
      vga_vs : IN STD_LOGIC;
      btn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      sw : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      led : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      wr_memo : OUT STD_LOGIC;
      data : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      adr_memo : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
    );
  END COMPONENT session4;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF lab1_extra_session4_0_0_arch: ARCHITECTURE IS "session4,Vivado 2014.3.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF lab1_extra_session4_0_0_arch : ARCHITECTURE IS "lab1_extra_session4_0_0,session4,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF lab1_extra_session4_0_0_arch: ARCHITECTURE IS "lab1_extra_session4_0_0,session4,{x_ipProduct=Vivado 2014.3.1,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=session4,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG}";
BEGIN
  U0 : session4
    PORT MAP (
      clk_25 => clk_25,
      vga_vs => vga_vs,
      btn => btn,
      sw => sw,
      led => led,
      wr_memo => wr_memo,
      data => data,
      adr_memo => adr_memo
    );
END lab1_extra_session4_0_0_arch;
