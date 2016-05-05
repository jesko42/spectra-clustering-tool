-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
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

-- IP VLNV: SystemberatungSchwarzer:AFAProcess:AFAProcess_HW:0.5
-- IP Revision: 1605051144

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT SBD_AFAProcess_HW_1_0
  PORT (
    s_axi_INTERFACE_AXILITE_SLAVE_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_AWVALID : IN STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_AWREADY : OUT STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_WVALID : IN STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_WREADY : OUT STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_BVALID : OUT STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_BREADY : IN STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_ARVALID : IN STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_ARREADY : OUT STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_INTERFACE_AXILITE_SLAVE_RVALID : OUT STD_LOGIC;
    s_axi_INTERFACE_AXILITE_SLAVE_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC;
    param_Clk_A : OUT STD_LOGIC;
    param_Rst_A : OUT STD_LOGIC;
    param_EN_A : OUT STD_LOGIC;
    param_WEN_A : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    param_Addr_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    param_Din_A : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    param_Dout_A : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : SBD_AFAProcess_HW_1_0
  PORT MAP (
    s_axi_INTERFACE_AXILITE_SLAVE_AWADDR => s_axi_INTERFACE_AXILITE_SLAVE_AWADDR,
    s_axi_INTERFACE_AXILITE_SLAVE_AWVALID => s_axi_INTERFACE_AXILITE_SLAVE_AWVALID,
    s_axi_INTERFACE_AXILITE_SLAVE_AWREADY => s_axi_INTERFACE_AXILITE_SLAVE_AWREADY,
    s_axi_INTERFACE_AXILITE_SLAVE_WDATA => s_axi_INTERFACE_AXILITE_SLAVE_WDATA,
    s_axi_INTERFACE_AXILITE_SLAVE_WSTRB => s_axi_INTERFACE_AXILITE_SLAVE_WSTRB,
    s_axi_INTERFACE_AXILITE_SLAVE_WVALID => s_axi_INTERFACE_AXILITE_SLAVE_WVALID,
    s_axi_INTERFACE_AXILITE_SLAVE_WREADY => s_axi_INTERFACE_AXILITE_SLAVE_WREADY,
    s_axi_INTERFACE_AXILITE_SLAVE_BRESP => s_axi_INTERFACE_AXILITE_SLAVE_BRESP,
    s_axi_INTERFACE_AXILITE_SLAVE_BVALID => s_axi_INTERFACE_AXILITE_SLAVE_BVALID,
    s_axi_INTERFACE_AXILITE_SLAVE_BREADY => s_axi_INTERFACE_AXILITE_SLAVE_BREADY,
    s_axi_INTERFACE_AXILITE_SLAVE_ARADDR => s_axi_INTERFACE_AXILITE_SLAVE_ARADDR,
    s_axi_INTERFACE_AXILITE_SLAVE_ARVALID => s_axi_INTERFACE_AXILITE_SLAVE_ARVALID,
    s_axi_INTERFACE_AXILITE_SLAVE_ARREADY => s_axi_INTERFACE_AXILITE_SLAVE_ARREADY,
    s_axi_INTERFACE_AXILITE_SLAVE_RDATA => s_axi_INTERFACE_AXILITE_SLAVE_RDATA,
    s_axi_INTERFACE_AXILITE_SLAVE_RRESP => s_axi_INTERFACE_AXILITE_SLAVE_RRESP,
    s_axi_INTERFACE_AXILITE_SLAVE_RVALID => s_axi_INTERFACE_AXILITE_SLAVE_RVALID,
    s_axi_INTERFACE_AXILITE_SLAVE_RREADY => s_axi_INTERFACE_AXILITE_SLAVE_RREADY,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    interrupt => interrupt,
    m_axi_gmem_AWADDR => m_axi_gmem_AWADDR,
    m_axi_gmem_AWLEN => m_axi_gmem_AWLEN,
    m_axi_gmem_AWSIZE => m_axi_gmem_AWSIZE,
    m_axi_gmem_AWBURST => m_axi_gmem_AWBURST,
    m_axi_gmem_AWLOCK => m_axi_gmem_AWLOCK,
    m_axi_gmem_AWREGION => m_axi_gmem_AWREGION,
    m_axi_gmem_AWCACHE => m_axi_gmem_AWCACHE,
    m_axi_gmem_AWPROT => m_axi_gmem_AWPROT,
    m_axi_gmem_AWQOS => m_axi_gmem_AWQOS,
    m_axi_gmem_AWVALID => m_axi_gmem_AWVALID,
    m_axi_gmem_AWREADY => m_axi_gmem_AWREADY,
    m_axi_gmem_WDATA => m_axi_gmem_WDATA,
    m_axi_gmem_WSTRB => m_axi_gmem_WSTRB,
    m_axi_gmem_WLAST => m_axi_gmem_WLAST,
    m_axi_gmem_WVALID => m_axi_gmem_WVALID,
    m_axi_gmem_WREADY => m_axi_gmem_WREADY,
    m_axi_gmem_BRESP => m_axi_gmem_BRESP,
    m_axi_gmem_BVALID => m_axi_gmem_BVALID,
    m_axi_gmem_BREADY => m_axi_gmem_BREADY,
    m_axi_gmem_ARADDR => m_axi_gmem_ARADDR,
    m_axi_gmem_ARLEN => m_axi_gmem_ARLEN,
    m_axi_gmem_ARSIZE => m_axi_gmem_ARSIZE,
    m_axi_gmem_ARBURST => m_axi_gmem_ARBURST,
    m_axi_gmem_ARLOCK => m_axi_gmem_ARLOCK,
    m_axi_gmem_ARREGION => m_axi_gmem_ARREGION,
    m_axi_gmem_ARCACHE => m_axi_gmem_ARCACHE,
    m_axi_gmem_ARPROT => m_axi_gmem_ARPROT,
    m_axi_gmem_ARQOS => m_axi_gmem_ARQOS,
    m_axi_gmem_ARVALID => m_axi_gmem_ARVALID,
    m_axi_gmem_ARREADY => m_axi_gmem_ARREADY,
    m_axi_gmem_RDATA => m_axi_gmem_RDATA,
    m_axi_gmem_RRESP => m_axi_gmem_RRESP,
    m_axi_gmem_RLAST => m_axi_gmem_RLAST,
    m_axi_gmem_RVALID => m_axi_gmem_RVALID,
    m_axi_gmem_RREADY => m_axi_gmem_RREADY,
    param_Clk_A => param_Clk_A,
    param_Rst_A => param_Rst_A,
    param_EN_A => param_EN_A,
    param_WEN_A => param_WEN_A,
    param_Addr_A => param_Addr_A,
    param_Din_A => param_Din_A,
    param_Dout_A => param_Dout_A
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

