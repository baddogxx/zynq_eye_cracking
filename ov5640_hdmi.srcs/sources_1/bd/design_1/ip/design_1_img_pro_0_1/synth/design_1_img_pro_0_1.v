// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:img_pro:1.0
// IP Revision: 14

(* X_CORE_INFO = "img_pro,Vivado 2018.3" *)
(* CHECK_LICENSE_TYPE = "design_1_img_pro_0_1,img_pro,{}" *)
(* CORE_GENERATION_INFO = "design_1_img_pro_0_1,img_pro,{x_ipProduct=Vivado 2018.3,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=img_pro,x_ipVersion=1.0,x_ipCoreRevision=14,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_img_pro_0_1 (
  clk,
  rst_n,
  img_vs_in,
  img_clken_in,
  data_valid_in,
  img_data_in,
  img_vs_out,
  img_clken_out,
  data_valid_out,
  img_data_out
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_ov5640_capture_data_0_1_cmos_frame_clk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 img_in VSYNC" *)
input wire img_vs_in;
input wire img_clken_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 img_in ACTIVE_VIDEO" *)
input wire data_valid_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 img_in DATA" *)
input wire [23 : 0] img_data_in;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 img_out VSYNC" *)
output wire img_vs_out;
output wire img_clken_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 img_out ACTIVE_VIDEO" *)
output wire data_valid_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:vid_io:1.0 img_out DATA" *)
output wire [23 : 0] img_data_out;

  img_pro inst (
    .clk(clk),
    .rst_n(rst_n),
    .img_vs_in(img_vs_in),
    .img_clken_in(img_clken_in),
    .data_valid_in(data_valid_in),
    .img_data_in(img_data_in),
    .img_vs_out(img_vs_out),
    .img_clken_out(img_clken_out),
    .data_valid_out(data_valid_out),
    .img_data_out(img_data_out)
  );
endmodule
