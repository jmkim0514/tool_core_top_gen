//==============================================================================
//
// Project : MVP
//
// Verilog RTL(Behavioral) model
//
// This confidential and proprietary source code may be used only as authorized
// by a licensing agreement from ALPHAHOLDINGS Limited. The entire notice above
// must be reproduced on all authorized copies and copies may only be made to
// the extent permitted by a licensing agreement from ALPHAHOLDINGS Limited.
//
// COPYRIGHT (C) ALPHAHOLDINGS, inc. 2022
//
//==============================================================================
// File name : main_bus_wrap
// Version : v1.1
// Description :
// Simulator : NC Verilog
// Created by : jhkim 
// Date : 2023-10-04 
//==============================================================================

module main_bus_wrap (
    input              i_clk_cpu2main, 
    input              i_rstn_cpu2main, 
    input              i_clk_hsp2main, 
    input              i_rstn_hsp2main, 
    input              i_clk_keti2main, 
    input              i_rstn_keti2main, 
    input              i_clk_main2ddr, 
    input              i_rstn_main2ddr, 
    input              i_clk_mna2main, 
    input              i_rstn_mna2main, 
    input              i_clk_mvp2main, 
    input              i_rstn_mvp2main, 
    input              i_clk_peri2main, 
    input              i_rstn_peri2main, 
    input              i_clk_main_bus,
    input              i_rstn_main_bus,

    input   [  1:  0]  i_awuser_cpu2main,
    input   [  1:  0]  i_aruser_cpu2main,
    input   [  4:  0]  i_awid_cpu2main,
    input   [ 31:  0]  i_awaddr_cpu2main,
    input   [  7:  0]  i_awlen_cpu2main,
    input   [  2:  0]  i_awsize_cpu2main,
    input   [  1:  0]  i_awburst_cpu2main,
    input              i_awlock_cpu2main,
    input   [  3:  0]  i_awcache_cpu2main,
    input   [  2:  0]  i_awprot_cpu2main,
    input              i_awvalid_cpu2main,
    output             o_awready_cpu2main,
    input   [127:  0]  i_wdata_cpu2main,
    input   [ 15:  0]  i_wstrb_cpu2main,
    input              i_wlast_cpu2main,
    input              i_wvalid_cpu2main,
    output             o_wready_cpu2main,
    output  [  4:  0]  o_bid_cpu2main,
    output  [  1:  0]  o_bresp_cpu2main,
    output             o_bvalid_cpu2main,
    input              i_bready_cpu2main,
    input   [  4:  0]  i_arid_cpu2main,
    input   [ 31:  0]  i_araddr_cpu2main,
    input   [  7:  0]  i_arlen_cpu2main,
    input   [  2:  0]  i_arsize_cpu2main,
    input   [  1:  0]  i_arburst_cpu2main,
    input              i_arlock_cpu2main,
    input   [  3:  0]  i_arcache_cpu2main,
    input   [  2:  0]  i_arprot_cpu2main,
    input              i_arvalid_cpu2main,
    output             o_arready_cpu2main,
    output  [  4:  0]  o_rid_cpu2main,
    output  [127:  0]  o_rdata_cpu2main,
    output  [  1:  0]  o_rresp_cpu2main,
    output             o_rlast_cpu2main,
    output             o_rvalid_cpu2main,
    input              i_rready_cpu2main,

    input   [  1:  0]  i_awuser_hsp2main,
    input   [  1:  0]  i_aruser_hsp2main,
    input   [  3:  0]  i_awid_hsp2main,
    input   [ 31:  0]  i_awaddr_hsp2main,
    input   [  7:  0]  i_awlen_hsp2main,
    input   [  2:  0]  i_awsize_hsp2main,
    input   [  1:  0]  i_awburst_hsp2main,
    input              i_awlock_hsp2main,
    input   [  3:  0]  i_awcache_hsp2main,
    input   [  2:  0]  i_awprot_hsp2main,
    input              i_awvalid_hsp2main,
    output             o_awready_hsp2main,
    input   [127:  0]  i_wdata_hsp2main,
    input   [ 15:  0]  i_wstrb_hsp2main,
    input              i_wlast_hsp2main,
    input              i_wvalid_hsp2main,
    output             o_wready_hsp2main,
    output  [  3:  0]  o_bid_hsp2main,
    output  [  1:  0]  o_bresp_hsp2main,
    output             o_bvalid_hsp2main,
    input              i_bready_hsp2main,
    input   [  3:  0]  i_arid_hsp2main,
    input   [ 31:  0]  i_araddr_hsp2main,
    input   [  7:  0]  i_arlen_hsp2main,
    input   [  2:  0]  i_arsize_hsp2main,
    input   [  1:  0]  i_arburst_hsp2main,
    input              i_arlock_hsp2main,
    input   [  3:  0]  i_arcache_hsp2main,
    input   [  2:  0]  i_arprot_hsp2main,
    input              i_arvalid_hsp2main,
    output             o_arready_hsp2main,
    output  [  3:  0]  o_rid_hsp2main,
    output  [127:  0]  o_rdata_hsp2main,
    output  [  1:  0]  o_rresp_hsp2main,
    output             o_rlast_hsp2main,
    output             o_rvalid_hsp2main,
    input              i_rready_hsp2main,

    input   [  1:  0]  i_awuser_keti2main_0,
    input   [  1:  0]  i_aruser_keti2main_0,
    input   [  1:  0]  i_awid_keti2main_0,
    input   [ 31:  0]  i_awaddr_keti2main_0,
    input   [  7:  0]  i_awlen_keti2main_0,
    input   [  2:  0]  i_awsize_keti2main_0,
    input   [  1:  0]  i_awburst_keti2main_0,
    input              i_awlock_keti2main_0,
    input   [  3:  0]  i_awcache_keti2main_0,
    input   [  2:  0]  i_awprot_keti2main_0,
    input              i_awvalid_keti2main_0,
    output             o_awready_keti2main_0,
    input   [ 63:  0]  i_wdata_keti2main_0,
    input   [  7:  0]  i_wstrb_keti2main_0,
    input              i_wlast_keti2main_0,
    input              i_wvalid_keti2main_0,
    output             o_wready_keti2main_0,
    output  [  1:  0]  o_bid_keti2main_0,
    output  [  1:  0]  o_bresp_keti2main_0,
    output             o_bvalid_keti2main_0,
    input              i_bready_keti2main_0,
    input   [  1:  0]  i_arid_keti2main_0,
    input   [ 31:  0]  i_araddr_keti2main_0,
    input   [  7:  0]  i_arlen_keti2main_0,
    input   [  2:  0]  i_arsize_keti2main_0,
    input   [  1:  0]  i_arburst_keti2main_0,
    input              i_arlock_keti2main_0,
    input   [  3:  0]  i_arcache_keti2main_0,
    input   [  2:  0]  i_arprot_keti2main_0,
    input              i_arvalid_keti2main_0,
    output             o_arready_keti2main_0,
    output  [  1:  0]  o_rid_keti2main_0,
    output  [ 63:  0]  o_rdata_keti2main_0,
    output  [  1:  0]  o_rresp_keti2main_0,
    output             o_rlast_keti2main_0,
    output             o_rvalid_keti2main_0,
    input              i_rready_keti2main_0,

    input   [  1:  0]  i_awuser_keti2main_1,
    input   [  1:  0]  i_aruser_keti2main_1,
    input   [  2:  0]  i_awid_keti2main_1,
    input   [ 31:  0]  i_awaddr_keti2main_1,
    input   [  7:  0]  i_awlen_keti2main_1,
    input   [  2:  0]  i_awsize_keti2main_1,
    input   [  1:  0]  i_awburst_keti2main_1,
    input              i_awlock_keti2main_1,
    input   [  3:  0]  i_awcache_keti2main_1,
    input   [  2:  0]  i_awprot_keti2main_1,
    input              i_awvalid_keti2main_1,
    output             o_awready_keti2main_1,
    input   [127:  0]  i_wdata_keti2main_1,
    input   [ 15:  0]  i_wstrb_keti2main_1,
    input              i_wlast_keti2main_1,
    input              i_wvalid_keti2main_1,
    output             o_wready_keti2main_1,
    output  [  2:  0]  o_bid_keti2main_1,
    output  [  1:  0]  o_bresp_keti2main_1,
    output             o_bvalid_keti2main_1,
    input              i_bready_keti2main_1,
    input   [  2:  0]  i_arid_keti2main_1,
    input   [ 31:  0]  i_araddr_keti2main_1,
    input   [  7:  0]  i_arlen_keti2main_1,
    input   [  2:  0]  i_arsize_keti2main_1,
    input   [  1:  0]  i_arburst_keti2main_1,
    input              i_arlock_keti2main_1,
    input   [  3:  0]  i_arcache_keti2main_1,
    input   [  2:  0]  i_arprot_keti2main_1,
    input              i_arvalid_keti2main_1,
    output             o_arready_keti2main_1,
    output  [  2:  0]  o_rid_keti2main_1,
    output  [127:  0]  o_rdata_keti2main_1,
    output  [  1:  0]  o_rresp_keti2main_1,
    output             o_rlast_keti2main_1,
    output             o_rvalid_keti2main_1,
    input              i_rready_keti2main_1,

    output  [  8:  0]  o_awid_main2ddr0_0,
    output  [ 31:  0]  o_awaddr_main2ddr0_0,
    output  [  7:  0]  o_awlen_main2ddr0_0,
    output  [  2:  0]  o_awsize_main2ddr0_0,
    output  [  1:  0]  o_awburst_main2ddr0_0,
    output             o_awlock_main2ddr0_0,
    output  [  3:  0]  o_awcache_main2ddr0_0,
    output  [  2:  0]  o_awprot_main2ddr0_0,
    output             o_awvalid_main2ddr0_0,
    input              i_awready_main2ddr0_0,
    output  [127:  0]  o_wdata_main2ddr0_0,
    output  [ 15:  0]  o_wstrb_main2ddr0_0,
    output             o_wlast_main2ddr0_0,
    output             o_wvalid_main2ddr0_0,
    input              i_wready_main2ddr0_0,
    input   [  8:  0]  i_bid_main2ddr0_0,
    input   [  1:  0]  i_bresp_main2ddr0_0,
    input              i_bvalid_main2ddr0_0,
    output             o_bready_main2ddr0_0,
    output  [  8:  0]  o_arid_main2ddr0_0,
    output  [ 31:  0]  o_araddr_main2ddr0_0,
    output  [  7:  0]  o_arlen_main2ddr0_0,
    output  [  2:  0]  o_arsize_main2ddr0_0,
    output  [  1:  0]  o_arburst_main2ddr0_0,
    output             o_arlock_main2ddr0_0,
    output  [  3:  0]  o_arcache_main2ddr0_0,
    output  [  2:  0]  o_arprot_main2ddr0_0,
    output             o_arvalid_main2ddr0_0,
    input              i_arready_main2ddr0_0,
    input   [  8:  0]  i_rid_main2ddr0_0,
    input   [127:  0]  i_rdata_main2ddr0_0,
    input   [  1:  0]  i_rresp_main2ddr0_0,
    input              i_rlast_main2ddr0_0,
    input              i_rvalid_main2ddr0_0,
    output             o_rready_main2ddr0_0,

    output  [  8:  0]  o_awid_main2ddr0_1,
    output  [ 31:  0]  o_awaddr_main2ddr0_1,
    output  [  7:  0]  o_awlen_main2ddr0_1,
    output  [  2:  0]  o_awsize_main2ddr0_1,
    output  [  1:  0]  o_awburst_main2ddr0_1,
    output             o_awlock_main2ddr0_1,
    output  [  3:  0]  o_awcache_main2ddr0_1,
    output  [  2:  0]  o_awprot_main2ddr0_1,
    output             o_awvalid_main2ddr0_1,
    input              i_awready_main2ddr0_1,
    output  [127:  0]  o_wdata_main2ddr0_1,
    output  [ 15:  0]  o_wstrb_main2ddr0_1,
    output             o_wlast_main2ddr0_1,
    output             o_wvalid_main2ddr0_1,
    input              i_wready_main2ddr0_1,
    input   [  8:  0]  i_bid_main2ddr0_1,
    input   [  1:  0]  i_bresp_main2ddr0_1,
    input              i_bvalid_main2ddr0_1,
    output             o_bready_main2ddr0_1,
    output  [  8:  0]  o_arid_main2ddr0_1,
    output  [ 31:  0]  o_araddr_main2ddr0_1,
    output  [  7:  0]  o_arlen_main2ddr0_1,
    output  [  2:  0]  o_arsize_main2ddr0_1,
    output  [  1:  0]  o_arburst_main2ddr0_1,
    output             o_arlock_main2ddr0_1,
    output  [  3:  0]  o_arcache_main2ddr0_1,
    output  [  2:  0]  o_arprot_main2ddr0_1,
    output             o_arvalid_main2ddr0_1,
    input              i_arready_main2ddr0_1,
    input   [  8:  0]  i_rid_main2ddr0_1,
    input   [127:  0]  i_rdata_main2ddr0_1,
    input   [  1:  0]  i_rresp_main2ddr0_1,
    input              i_rlast_main2ddr0_1,
    input              i_rvalid_main2ddr0_1,
    output             o_rready_main2ddr0_1,

    output  [  8:  0]  o_awid_main2ddr0_2,
    output  [ 31:  0]  o_awaddr_main2ddr0_2,
    output  [  7:  0]  o_awlen_main2ddr0_2,
    output  [  2:  0]  o_awsize_main2ddr0_2,
    output  [  1:  0]  o_awburst_main2ddr0_2,
    output             o_awlock_main2ddr0_2,
    output  [  3:  0]  o_awcache_main2ddr0_2,
    output  [  2:  0]  o_awprot_main2ddr0_2,
    output             o_awvalid_main2ddr0_2,
    input              i_awready_main2ddr0_2,
    output  [127:  0]  o_wdata_main2ddr0_2,
    output  [ 15:  0]  o_wstrb_main2ddr0_2,
    output             o_wlast_main2ddr0_2,
    output             o_wvalid_main2ddr0_2,
    input              i_wready_main2ddr0_2,
    input   [  8:  0]  i_bid_main2ddr0_2,
    input   [  1:  0]  i_bresp_main2ddr0_2,
    input              i_bvalid_main2ddr0_2,
    output             o_bready_main2ddr0_2,
    output  [  8:  0]  o_arid_main2ddr0_2,
    output  [ 31:  0]  o_araddr_main2ddr0_2,
    output  [  7:  0]  o_arlen_main2ddr0_2,
    output  [  2:  0]  o_arsize_main2ddr0_2,
    output  [  1:  0]  o_arburst_main2ddr0_2,
    output             o_arlock_main2ddr0_2,
    output  [  3:  0]  o_arcache_main2ddr0_2,
    output  [  2:  0]  o_arprot_main2ddr0_2,
    output             o_arvalid_main2ddr0_2,
    input              i_arready_main2ddr0_2,
    input   [  8:  0]  i_rid_main2ddr0_2,
    input   [127:  0]  i_rdata_main2ddr0_2,
    input   [  1:  0]  i_rresp_main2ddr0_2,
    input              i_rlast_main2ddr0_2,
    input              i_rvalid_main2ddr0_2,
    output             o_rready_main2ddr0_2,

    input   [  1:  0]  i_awuser_mna2main,
    input   [  1:  0]  i_aruser_mna2main,
    input   [  1:  0]  i_awid_mna2main,
    input   [ 31:  0]  i_awaddr_mna2main,
    input   [  7:  0]  i_awlen_mna2main,
    input   [  2:  0]  i_awsize_mna2main,
    input   [  1:  0]  i_awburst_mna2main,
    input              i_awlock_mna2main,
    input   [  3:  0]  i_awcache_mna2main,
    input   [  2:  0]  i_awprot_mna2main,
    input              i_awvalid_mna2main,
    output             o_awready_mna2main,
    input   [127:  0]  i_wdata_mna2main,
    input   [ 15:  0]  i_wstrb_mna2main,
    input              i_wlast_mna2main,
    input              i_wvalid_mna2main,
    output             o_wready_mna2main,
    output  [  1:  0]  o_bid_mna2main,
    output  [  1:  0]  o_bresp_mna2main,
    output             o_bvalid_mna2main,
    input              i_bready_mna2main,
    input   [  1:  0]  i_arid_mna2main,
    input   [ 31:  0]  i_araddr_mna2main,
    input   [  7:  0]  i_arlen_mna2main,
    input   [  2:  0]  i_arsize_mna2main,
    input   [  1:  0]  i_arburst_mna2main,
    input              i_arlock_mna2main,
    input   [  3:  0]  i_arcache_mna2main,
    input   [  2:  0]  i_arprot_mna2main,
    input              i_arvalid_mna2main,
    output             o_arready_mna2main,
    output  [  1:  0]  o_rid_mna2main,
    output  [127:  0]  o_rdata_mna2main,
    output  [  1:  0]  o_rresp_mna2main,
    output             o_rlast_mna2main,
    output             o_rvalid_mna2main,
    input              i_rready_mna2main,

    input   [  1:  0]  i_awuser_isp2main_0,
    input   [  1:  0]  i_aruser_isp2main_0,
    input   [  1:  0]  i_awid_isp2main_0,
    input   [ 31:  0]  i_awaddr_isp2main_0,
    input   [  7:  0]  i_awlen_isp2main_0,
    input   [  2:  0]  i_awsize_isp2main_0,
    input   [  1:  0]  i_awburst_isp2main_0,
    input              i_awlock_isp2main_0,
    input   [  3:  0]  i_awcache_isp2main_0,
    input   [  2:  0]  i_awprot_isp2main_0,
    input              i_awvalid_isp2main_0,
    output             o_awready_isp2main_0,
    input   [127:  0]  i_wdata_isp2main_0,
    input   [ 15:  0]  i_wstrb_isp2main_0,
    input              i_wlast_isp2main_0,
    input              i_wvalid_isp2main_0,
    output             o_wready_isp2main_0,
    output  [  1:  0]  o_bid_isp2main_0,
    output  [  1:  0]  o_bresp_isp2main_0,
    output             o_bvalid_isp2main_0,
    input              i_bready_isp2main_0,
    input   [  1:  0]  i_arid_isp2main_0,
    input   [ 31:  0]  i_araddr_isp2main_0,
    input   [  7:  0]  i_arlen_isp2main_0,
    input   [  2:  0]  i_arsize_isp2main_0,
    input   [  1:  0]  i_arburst_isp2main_0,
    input              i_arlock_isp2main_0,
    input   [  3:  0]  i_arcache_isp2main_0,
    input   [  2:  0]  i_arprot_isp2main_0,
    input              i_arvalid_isp2main_0,
    output             o_arready_isp2main_0,
    output  [  1:  0]  o_rid_isp2main_0,
    output  [127:  0]  o_rdata_isp2main_0,
    output  [  1:  0]  o_rresp_isp2main_0,
    output             o_rlast_isp2main_0,
    output             o_rvalid_isp2main_0,
    input              i_rready_isp2main_0,

    input   [  1:  0]  i_awuser_isp2main_1,
    input   [  1:  0]  i_aruser_isp2main_1,
    input   [  1:  0]  i_awid_isp2main_1,
    input   [ 31:  0]  i_awaddr_isp2main_1,
    input   [  7:  0]  i_awlen_isp2main_1,
    input   [  2:  0]  i_awsize_isp2main_1,
    input   [  1:  0]  i_awburst_isp2main_1,
    input              i_awlock_isp2main_1,
    input   [  3:  0]  i_awcache_isp2main_1,
    input   [  2:  0]  i_awprot_isp2main_1,
    input              i_awvalid_isp2main_1,
    output             o_awready_isp2main_1,
    input   [127:  0]  i_wdata_isp2main_1,
    input   [ 15:  0]  i_wstrb_isp2main_1,
    input              i_wlast_isp2main_1,
    input              i_wvalid_isp2main_1,
    output             o_wready_isp2main_1,
    output  [  1:  0]  o_bid_isp2main_1,
    output  [  1:  0]  o_bresp_isp2main_1,
    output             o_bvalid_isp2main_1,
    input              i_bready_isp2main_1,
    input   [  1:  0]  i_arid_isp2main_1,
    input   [ 31:  0]  i_araddr_isp2main_1,
    input   [  7:  0]  i_arlen_isp2main_1,
    input   [  2:  0]  i_arsize_isp2main_1,
    input   [  1:  0]  i_arburst_isp2main_1,
    input              i_arlock_isp2main_1,
    input   [  3:  0]  i_arcache_isp2main_1,
    input   [  2:  0]  i_arprot_isp2main_1,
    input              i_arvalid_isp2main_1,
    output             o_arready_isp2main_1,
    output  [  1:  0]  o_rid_isp2main_1,
    output  [127:  0]  o_rdata_isp2main_1,
    output  [  1:  0]  o_rresp_isp2main_1,
    output             o_rlast_isp2main_1,
    output             o_rvalid_isp2main_1,
    input              i_rready_isp2main_1,

    input   [  1:  0]  i_awuser_rgb2main,
    input   [  1:  0]  i_aruser_rgb2main,
    input   [  1:  0]  i_awid_rgb2main,
    input   [ 31:  0]  i_awaddr_rgb2main,
    input   [  7:  0]  i_awlen_rgb2main,
    input   [  2:  0]  i_awsize_rgb2main,
    input   [  1:  0]  i_awburst_rgb2main,
    input              i_awlock_rgb2main,
    input   [  3:  0]  i_awcache_rgb2main,
    input   [  2:  0]  i_awprot_rgb2main,
    input              i_awvalid_rgb2main,
    output             o_awready_rgb2main,
    input   [127:  0]  i_wdata_rgb2main,
    input   [ 15:  0]  i_wstrb_rgb2main,
    input              i_wlast_rgb2main,
    input              i_wvalid_rgb2main,
    output             o_wready_rgb2main,
    output  [  1:  0]  o_bid_rgb2main,
    output  [  1:  0]  o_bresp_rgb2main,
    output             o_bvalid_rgb2main,
    input              i_bready_rgb2main,
    input   [  1:  0]  i_arid_rgb2main,
    input   [ 31:  0]  i_araddr_rgb2main,
    input   [  7:  0]  i_arlen_rgb2main,
    input   [  2:  0]  i_arsize_rgb2main,
    input   [  1:  0]  i_arburst_rgb2main,
    input              i_arlock_rgb2main,
    input   [  3:  0]  i_arcache_rgb2main,
    input   [  2:  0]  i_arprot_rgb2main,
    input              i_arvalid_rgb2main,
    output             o_arready_rgb2main,
    output  [  1:  0]  o_rid_rgb2main,
    output  [127:  0]  o_rdata_rgb2main,
    output  [  1:  0]  o_rresp_rgb2main,
    output             o_rlast_rgb2main,
    output             o_rvalid_rgb2main,
    input              i_rready_rgb2main,

    input  [31:0]      i_haddr_peri2main,
    input  [2:0]       i_hburst_peri2main,
    input  [3:0]       i_hprot_peri2main,
    input  [2:0]       i_hsize_peri2main,
    input  [1:0]       i_htrans_peri2main,
    input  [31:0]      i_hwdata_peri2main,
    input              i_hwrite_peri2main,
    output [31:0]      o_hrdata_peri2main,
    output             o_hready_peri2main,
    output             o_hresp_peri2main
);

    wire  [ 31:  0]  w_awaddr_main2ddr0_0;
    wire  [ 31:  0]  w_araddr_main2ddr0_0;
    wire  [ 31:  0]  w_awaddr_main2ddr0_1;
    wire  [ 31:  0]  w_araddr_main2ddr0_1;
    wire  [ 31:  0]  w_awaddr_main2ddr0_2;
    wire  [ 31:  0]  w_araddr_main2ddr0_2;

    assign  o_awaddr_main2ddr0_0   = {2'b0,w_awaddr_main2ddr0_0[29:0]} ;
    assign  o_araddr_main2ddr0_0   = {2'b0,w_araddr_main2ddr0_0[29:0]} ;
    assign  o_awaddr_main2ddr0_1   = {2'b0,w_awaddr_main2ddr0_1[29:0]} ;
    assign  o_araddr_main2ddr0_1   = {2'b0,w_araddr_main2ddr0_1[29:0]} ;
    assign  o_awaddr_main2ddr0_2   = {2'b0,w_awaddr_main2ddr0_2[29:0]} ;
    assign  o_araddr_main2ddr0_2   = {2'b0,w_araddr_main2ddr0_2[29:0]} ;

    nic400_main_bus_r0p04 u_main_bus (
        .awid_cpu2main           (i_awid_cpu2main       ), 
        .awaddr_cpu2main         ({i_awuser_cpu2main,!i_awaddr_cpu2main[29],i_awaddr_cpu2main[28:0]}), 
        .awlen_cpu2main          (i_awlen_cpu2main      ), 
        .awsize_cpu2main         (i_awsize_cpu2main     ), 
        .awburst_cpu2main        (i_awburst_cpu2main    ), 
        .awlock_cpu2main         (i_awlock_cpu2main     ), 
        .awcache_cpu2main        (i_awcache_cpu2main    ), 
        .awprot_cpu2main         (i_awprot_cpu2main     ), 
        .awvalid_cpu2main        (i_awvalid_cpu2main    ), 
        .awready_cpu2main        (o_awready_cpu2main    ), 
        .wdata_cpu2main          (i_wdata_cpu2main      ), 
        .wstrb_cpu2main          (i_wstrb_cpu2main      ), 
        .wlast_cpu2main          (i_wlast_cpu2main      ), 
        .wvalid_cpu2main         (i_wvalid_cpu2main     ), 
        .wready_cpu2main         (o_wready_cpu2main     ), 
        .bid_cpu2main            (o_bid_cpu2main        ), 
        .bresp_cpu2main          (o_bresp_cpu2main      ), 
        .bvalid_cpu2main         (o_bvalid_cpu2main     ), 
        .bready_cpu2main         (i_bready_cpu2main     ), 
        .arid_cpu2main           (i_arid_cpu2main       ), 
        .araddr_cpu2main         ({i_aruser_cpu2main,!i_araddr_cpu2main[29],i_araddr_cpu2main[28:0]}), 
        .arlen_cpu2main          (i_arlen_cpu2main      ), 
        .arsize_cpu2main         (i_arsize_cpu2main     ), 
        .arburst_cpu2main        (i_arburst_cpu2main    ), 
        .arlock_cpu2main         (i_arlock_cpu2main     ), 
        .arcache_cpu2main        (i_arcache_cpu2main    ), 
        .arprot_cpu2main         (i_arprot_cpu2main     ), 
        .arvalid_cpu2main        (i_arvalid_cpu2main    ), 
        .arready_cpu2main        (o_arready_cpu2main    ), 
        .rid_cpu2main            (o_rid_cpu2main        ), 
        .rdata_cpu2main          (o_rdata_cpu2main      ), 
        .rresp_cpu2main          (o_rresp_cpu2main      ), 
        .rlast_cpu2main          (o_rlast_cpu2main      ), 
        .rvalid_cpu2main         (o_rvalid_cpu2main     ), 
        .rready_cpu2main         (i_rready_cpu2main     ), 
        .awid_hsp2main           (i_awid_hsp2main       ), 
        .awaddr_hsp2main         ({i_awuser_hsp2main,!i_awaddr_hsp2main[29],i_awaddr_hsp2main[28:0]}), 
        .awlen_hsp2main          (i_awlen_hsp2main      ), 
        .awsize_hsp2main         (i_awsize_hsp2main     ), 
        .awburst_hsp2main        (i_awburst_hsp2main    ), 
        .awlock_hsp2main         (i_awlock_hsp2main     ), 
        .awcache_hsp2main        (i_awcache_hsp2main    ), 
        .awprot_hsp2main         (i_awprot_hsp2main     ), 
        .awvalid_hsp2main        (i_awvalid_hsp2main    ), 
        .awready_hsp2main        (o_awready_hsp2main    ), 
        .wdata_hsp2main          (i_wdata_hsp2main      ), 
        .wstrb_hsp2main          (i_wstrb_hsp2main      ), 
        .wlast_hsp2main          (i_wlast_hsp2main      ), 
        .wvalid_hsp2main         (i_wvalid_hsp2main     ), 
        .wready_hsp2main         (o_wready_hsp2main     ), 
        .bid_hsp2main            (o_bid_hsp2main        ), 
        .bresp_hsp2main          (o_bresp_hsp2main      ), 
        .bvalid_hsp2main         (o_bvalid_hsp2main     ), 
        .bready_hsp2main         (i_bready_hsp2main     ), 
        .arid_hsp2main           (i_arid_hsp2main       ), 
        .araddr_hsp2main         ({i_aruser_hsp2main,!i_araddr_hsp2main[29],i_araddr_hsp2main[28:0]}), 
        .arlen_hsp2main          (i_arlen_hsp2main      ), 
        .arsize_hsp2main         (i_arsize_hsp2main     ), 
        .arburst_hsp2main        (i_arburst_hsp2main    ), 
        .arlock_hsp2main         (i_arlock_hsp2main     ), 
        .arcache_hsp2main        (i_arcache_hsp2main    ), 
        .arprot_hsp2main         (i_arprot_hsp2main     ), 
        .arvalid_hsp2main        (i_arvalid_hsp2main    ), 
        .arready_hsp2main        (o_arready_hsp2main    ), 
        .rid_hsp2main            (o_rid_hsp2main        ), 
        .rdata_hsp2main          (o_rdata_hsp2main      ), 
        .rresp_hsp2main          (o_rresp_hsp2main      ), 
        .rlast_hsp2main          (o_rlast_hsp2main      ), 
        .rvalid_hsp2main         (o_rvalid_hsp2main     ), 
        .rready_hsp2main         (i_rready_hsp2main     ), 
        .awid_keti2main_0        (i_awid_keti2main_0    ), 
        .awaddr_keti2main_0      ({i_awuser_keti2main_0,!i_awaddr_keti2main_0[29],i_awaddr_keti2main_0[28:0]}), 
        .awlen_keti2main_0       (i_awlen_keti2main_0   ), 
        .awsize_keti2main_0      (i_awsize_keti2main_0  ), 
        .awburst_keti2main_0     (i_awburst_keti2main_0 ), 
        .awlock_keti2main_0      (i_awlock_keti2main_0  ), 
        .awcache_keti2main_0     (i_awcache_keti2main_0 ), 
        .awprot_keti2main_0      (i_awprot_keti2main_0  ), 
        .awvalid_keti2main_0     (i_awvalid_keti2main_0 ), 
        .awready_keti2main_0     (o_awready_keti2main_0 ), 
        .wdata_keti2main_0       (i_wdata_keti2main_0   ), 
        .wstrb_keti2main_0       (i_wstrb_keti2main_0   ), 
        .wlast_keti2main_0       (i_wlast_keti2main_0   ), 
        .wvalid_keti2main_0      (i_wvalid_keti2main_0  ), 
        .wready_keti2main_0      (o_wready_keti2main_0  ), 
        .bid_keti2main_0         (o_bid_keti2main_0     ), 
        .bresp_keti2main_0       (o_bresp_keti2main_0   ), 
        .bvalid_keti2main_0      (o_bvalid_keti2main_0  ), 
        .bready_keti2main_0      (i_bready_keti2main_0  ), 
        .arid_keti2main_0        (i_arid_keti2main_0    ), 
        .araddr_keti2main_0      ({i_aruser_keti2main_0,!i_araddr_keti2main_0[29],i_araddr_keti2main_0[28:0]}), 
        .arlen_keti2main_0       (i_arlen_keti2main_0   ), 
        .arsize_keti2main_0      (i_arsize_keti2main_0  ), 
        .arburst_keti2main_0     (i_arburst_keti2main_0 ), 
        .arlock_keti2main_0      (i_arlock_keti2main_0  ), 
        .arcache_keti2main_0     (i_arcache_keti2main_0 ), 
        .arprot_keti2main_0      (i_arprot_keti2main_0  ), 
        .arvalid_keti2main_0     (i_arvalid_keti2main_0 ), 
        .arready_keti2main_0     (o_arready_keti2main_0 ), 
        .rid_keti2main_0         (o_rid_keti2main_0     ), 
        .rdata_keti2main_0       (o_rdata_keti2main_0   ), 
        .rresp_keti2main_0       (o_rresp_keti2main_0   ), 
        .rlast_keti2main_0       (o_rlast_keti2main_0   ), 
        .rvalid_keti2main_0      (o_rvalid_keti2main_0  ), 
        .rready_keti2main_0      (i_rready_keti2main_0  ), 
        .awid_keti2main_1        (i_awid_keti2main_1    ), 
        .awaddr_keti2main_1      ({i_awuser_keti2main_1,!i_awaddr_keti2main_1[29],i_awaddr_keti2main_1[28:0]}), 
        .awlen_keti2main_1       (i_awlen_keti2main_1   ), 
        .awsize_keti2main_1      (i_awsize_keti2main_1  ), 
        .awburst_keti2main_1     (i_awburst_keti2main_1 ), 
        .awlock_keti2main_1      (i_awlock_keti2main_1  ), 
        .awcache_keti2main_1     (i_awcache_keti2main_1 ), 
        .awprot_keti2main_1      (i_awprot_keti2main_1  ), 
        .awvalid_keti2main_1     (i_awvalid_keti2main_1 ), 
        .awready_keti2main_1     (o_awready_keti2main_1 ), 
        .wdata_keti2main_1       (i_wdata_keti2main_1   ), 
        .wstrb_keti2main_1       (i_wstrb_keti2main_1   ), 
        .wlast_keti2main_1       (i_wlast_keti2main_1   ), 
        .wvalid_keti2main_1      (i_wvalid_keti2main_1  ), 
        .wready_keti2main_1      (o_wready_keti2main_1  ), 
        .bid_keti2main_1         (o_bid_keti2main_1     ), 
        .bresp_keti2main_1       (o_bresp_keti2main_1   ), 
        .bvalid_keti2main_1      (o_bvalid_keti2main_1  ), 
        .bready_keti2main_1      (i_bready_keti2main_1  ), 
        .arid_keti2main_1        (i_arid_keti2main_1    ), 
        .araddr_keti2main_1      ({i_aruser_keti2main_1,!i_araddr_keti2main_1[29],i_araddr_keti2main_1[28:0]}), 
        .arlen_keti2main_1       (i_arlen_keti2main_1   ), 
        .arsize_keti2main_1      (i_arsize_keti2main_1  ), 
        .arburst_keti2main_1     (i_arburst_keti2main_1 ), 
        .arlock_keti2main_1      (i_arlock_keti2main_1  ), 
        .arcache_keti2main_1     (i_arcache_keti2main_1 ), 
        .arprot_keti2main_1      (i_arprot_keti2main_1  ), 
        .arvalid_keti2main_1     (i_arvalid_keti2main_1 ), 
        .arready_keti2main_1     (o_arready_keti2main_1 ), 
        .rid_keti2main_1         (o_rid_keti2main_1     ), 
        .rdata_keti2main_1       (o_rdata_keti2main_1   ), 
        .rresp_keti2main_1       (o_rresp_keti2main_1   ), 
        .rlast_keti2main_1       (o_rlast_keti2main_1   ), 
        .rvalid_keti2main_1      (o_rvalid_keti2main_1  ), 
        .rready_keti2main_1      (i_rready_keti2main_1  ), 
        .awid_main2ddr0_0        (o_awid_main2ddr0_0    ), 
        .awaddr_main2ddr0_0      (w_awaddr_main2ddr0_0  ), 
        .awlen_main2ddr0_0       (o_awlen_main2ddr0_0   ), 
        .awsize_main2ddr0_0      (o_awsize_main2ddr0_0  ), 
        .awburst_main2ddr0_0     (o_awburst_main2ddr0_0 ), 
        .awlock_main2ddr0_0      (o_awlock_main2ddr0_0  ), 
        .awcache_main2ddr0_0     (o_awcache_main2ddr0_0 ), 
        .awprot_main2ddr0_0      (o_awprot_main2ddr0_0  ), 
        .awvalid_main2ddr0_0     (o_awvalid_main2ddr0_0 ), 
        .awready_main2ddr0_0     (i_awready_main2ddr0_0 ), 
        .wdata_main2ddr0_0       (o_wdata_main2ddr0_0   ), 
        .wstrb_main2ddr0_0       (o_wstrb_main2ddr0_0   ), 
        .wlast_main2ddr0_0       (o_wlast_main2ddr0_0   ), 
        .wvalid_main2ddr0_0      (o_wvalid_main2ddr0_0  ), 
        .wready_main2ddr0_0      (i_wready_main2ddr0_0  ), 
        .bid_main2ddr0_0         (i_bid_main2ddr0_0     ), 
        .bresp_main2ddr0_0       (i_bresp_main2ddr0_0   ), 
        .bvalid_main2ddr0_0      (i_bvalid_main2ddr0_0  ), 
        .bready_main2ddr0_0      (o_bready_main2ddr0_0  ), 
        .arid_main2ddr0_0        (o_arid_main2ddr0_0    ), 
        .araddr_main2ddr0_0      (w_araddr_main2ddr0_0  ), 
        .arlen_main2ddr0_0       (o_arlen_main2ddr0_0   ), 
        .arsize_main2ddr0_0      (o_arsize_main2ddr0_0  ), 
        .arburst_main2ddr0_0     (o_arburst_main2ddr0_0 ), 
        .arlock_main2ddr0_0      (o_arlock_main2ddr0_0  ), 
        .arcache_main2ddr0_0     (o_arcache_main2ddr0_0 ), 
        .arprot_main2ddr0_0      (o_arprot_main2ddr0_0  ), 
        .arvalid_main2ddr0_0     (o_arvalid_main2ddr0_0 ), 
        .arready_main2ddr0_0     (i_arready_main2ddr0_0 ), 
        .rid_main2ddr0_0         (i_rid_main2ddr0_0     ), 
        .rdata_main2ddr0_0       (i_rdata_main2ddr0_0   ), 
        .rresp_main2ddr0_0       (i_rresp_main2ddr0_0   ), 
        .rlast_main2ddr0_0       (i_rlast_main2ddr0_0   ), 
        .rvalid_main2ddr0_0      (i_rvalid_main2ddr0_0  ), 
        .rready_main2ddr0_0      (o_rready_main2ddr0_0  ), 
        .awid_main2ddr0_1        (o_awid_main2ddr0_1    ), 
        .awaddr_main2ddr0_1      (w_awaddr_main2ddr0_1  ), 
        .awlen_main2ddr0_1       (o_awlen_main2ddr0_1   ), 
        .awsize_main2ddr0_1      (o_awsize_main2ddr0_1  ), 
        .awburst_main2ddr0_1     (o_awburst_main2ddr0_1 ), 
        .awlock_main2ddr0_1      (o_awlock_main2ddr0_1  ), 
        .awcache_main2ddr0_1     (o_awcache_main2ddr0_1 ), 
        .awprot_main2ddr0_1      (o_awprot_main2ddr0_1  ), 
        .awvalid_main2ddr0_1     (o_awvalid_main2ddr0_1 ), 
        .awready_main2ddr0_1     (i_awready_main2ddr0_1 ), 
        .wdata_main2ddr0_1       (o_wdata_main2ddr0_1   ), 
        .wstrb_main2ddr0_1       (o_wstrb_main2ddr0_1   ), 
        .wlast_main2ddr0_1       (o_wlast_main2ddr0_1   ), 
        .wvalid_main2ddr0_1      (o_wvalid_main2ddr0_1  ), 
        .wready_main2ddr0_1      (i_wready_main2ddr0_1  ), 
        .bid_main2ddr0_1         (i_bid_main2ddr0_1     ), 
        .bresp_main2ddr0_1       (i_bresp_main2ddr0_1   ), 
        .bvalid_main2ddr0_1      (i_bvalid_main2ddr0_1  ), 
        .bready_main2ddr0_1      (o_bready_main2ddr0_1  ), 
        .arid_main2ddr0_1        (o_arid_main2ddr0_1    ), 
        .araddr_main2ddr0_1      (w_araddr_main2ddr0_1  ), 
        .arlen_main2ddr0_1       (o_arlen_main2ddr0_1   ), 
        .arsize_main2ddr0_1      (o_arsize_main2ddr0_1  ), 
        .arburst_main2ddr0_1     (o_arburst_main2ddr0_1 ), 
        .arlock_main2ddr0_1      (o_arlock_main2ddr0_1  ), 
        .arcache_main2ddr0_1     (o_arcache_main2ddr0_1 ), 
        .arprot_main2ddr0_1      (o_arprot_main2ddr0_1  ), 
        .arvalid_main2ddr0_1     (o_arvalid_main2ddr0_1 ), 
        .arready_main2ddr0_1     (i_arready_main2ddr0_1 ), 
        .rid_main2ddr0_1         (i_rid_main2ddr0_1     ), 
        .rdata_main2ddr0_1       (i_rdata_main2ddr0_1   ), 
        .rresp_main2ddr0_1       (i_rresp_main2ddr0_1   ), 
        .rlast_main2ddr0_1       (i_rlast_main2ddr0_1   ), 
        .rvalid_main2ddr0_1      (i_rvalid_main2ddr0_1  ), 
        .rready_main2ddr0_1      (o_rready_main2ddr0_1  ), 
        .awid_main2ddr0_2        (o_awid_main2ddr0_2    ), 
        .awaddr_main2ddr0_2      (w_awaddr_main2ddr0_2  ), 
        .awlen_main2ddr0_2       (o_awlen_main2ddr0_2   ), 
        .awsize_main2ddr0_2      (o_awsize_main2ddr0_2  ), 
        .awburst_main2ddr0_2     (o_awburst_main2ddr0_2 ), 
        .awlock_main2ddr0_2      (o_awlock_main2ddr0_2  ), 
        .awcache_main2ddr0_2     (o_awcache_main2ddr0_2 ), 
        .awprot_main2ddr0_2      (o_awprot_main2ddr0_2  ), 
        .awvalid_main2ddr0_2     (o_awvalid_main2ddr0_2 ), 
        .awready_main2ddr0_2     (i_awready_main2ddr0_2 ), 
        .wdata_main2ddr0_2       (o_wdata_main2ddr0_2   ), 
        .wstrb_main2ddr0_2       (o_wstrb_main2ddr0_2   ), 
        .wlast_main2ddr0_2       (o_wlast_main2ddr0_2   ), 
        .wvalid_main2ddr0_2      (o_wvalid_main2ddr0_2  ), 
        .wready_main2ddr0_2      (i_wready_main2ddr0_2  ), 
        .bid_main2ddr0_2         (i_bid_main2ddr0_2     ), 
        .bresp_main2ddr0_2       (i_bresp_main2ddr0_2   ), 
        .bvalid_main2ddr0_2      (i_bvalid_main2ddr0_2  ), 
        .bready_main2ddr0_2      (o_bready_main2ddr0_2  ), 
        .arid_main2ddr0_2        (o_arid_main2ddr0_2    ), 
        .araddr_main2ddr0_2      (w_araddr_main2ddr0_2  ), 
        .arlen_main2ddr0_2       (o_arlen_main2ddr0_2   ), 
        .arsize_main2ddr0_2      (o_arsize_main2ddr0_2  ), 
        .arburst_main2ddr0_2     (o_arburst_main2ddr0_2 ), 
        .arlock_main2ddr0_2      (o_arlock_main2ddr0_2  ), 
        .arcache_main2ddr0_2     (o_arcache_main2ddr0_2 ), 
        .arprot_main2ddr0_2      (o_arprot_main2ddr0_2  ), 
        .arvalid_main2ddr0_2     (o_arvalid_main2ddr0_2 ), 
        .arready_main2ddr0_2     (i_arready_main2ddr0_2 ), 
        .rid_main2ddr0_2         (i_rid_main2ddr0_2     ), 
        .rdata_main2ddr0_2       (i_rdata_main2ddr0_2   ), 
        .rresp_main2ddr0_2       (i_rresp_main2ddr0_2   ), 
        .rlast_main2ddr0_2       (i_rlast_main2ddr0_2   ), 
        .rvalid_main2ddr0_2      (i_rvalid_main2ddr0_2  ), 
        .rready_main2ddr0_2      (o_rready_main2ddr0_2  ), 
        .awid_mna2main           (i_awid_mna2main       ), 
        .awaddr_mna2main         ({i_awuser_mna2main,!i_awaddr_mna2main[29],i_awaddr_mna2main[28:0]}), 
        .awlen_mna2main          (i_awlen_mna2main      ), 
        .awsize_mna2main         (i_awsize_mna2main     ), 
        .awburst_mna2main        (i_awburst_mna2main    ), 
        .awlock_mna2main         (i_awlock_mna2main     ), 
        .awcache_mna2main        (i_awcache_mna2main    ), 
        .awprot_mna2main         (i_awprot_mna2main     ), 
        .awvalid_mna2main        (i_awvalid_mna2main    ), 
        .awready_mna2main        (o_awready_mna2main    ), 
        .wdata_mna2main          (i_wdata_mna2main      ), 
        .wstrb_mna2main          (i_wstrb_mna2main      ), 
        .wlast_mna2main          (i_wlast_mna2main      ), 
        .wvalid_mna2main         (i_wvalid_mna2main     ), 
        .wready_mna2main         (o_wready_mna2main     ), 
        .bid_mna2main            (o_bid_mna2main        ), 
        .bresp_mna2main          (o_bresp_mna2main      ), 
        .bvalid_mna2main         (o_bvalid_mna2main     ), 
        .bready_mna2main         (i_bready_mna2main     ), 
        .arid_mna2main           (i_arid_mna2main       ), 
        .araddr_mna2main         ({i_aruser_mna2main,!i_araddr_mna2main[29],i_araddr_mna2main[28:0]}), 
        .arlen_mna2main          (i_arlen_mna2main      ), 
        .arsize_mna2main         (i_arsize_mna2main     ), 
        .arburst_mna2main        (i_arburst_mna2main    ), 
        .arlock_mna2main         (i_arlock_mna2main     ), 
        .arcache_mna2main        (i_arcache_mna2main    ), 
        .arprot_mna2main         (i_arprot_mna2main     ), 
        .arvalid_mna2main        (i_arvalid_mna2main    ), 
        .arready_mna2main        (o_arready_mna2main    ), 
        .rid_mna2main            (o_rid_mna2main        ), 
        .rdata_mna2main          (o_rdata_mna2main      ), 
        .rresp_mna2main          (o_rresp_mna2main      ), 
        .rlast_mna2main          (o_rlast_mna2main      ), 
        .rvalid_mna2main         (o_rvalid_mna2main     ), 
        .rready_mna2main         (i_rready_mna2main     ), 
        .awid_isp2main_0         (i_awid_isp2main_0     ), 
        .awaddr_isp2main_0       ({i_awuser_isp2main_0,!i_awaddr_isp2main_0[29],i_awaddr_isp2main_0[28:0]}), 
        .awlen_isp2main_0        (i_awlen_isp2main_0    ), 
        .awsize_isp2main_0       (i_awsize_isp2main_0   ), 
        .awburst_isp2main_0      (i_awburst_isp2main_0  ), 
        .awlock_isp2main_0       (i_awlock_isp2main_0   ), 
        .awcache_isp2main_0      (i_awcache_isp2main_0  ), 
        .awprot_isp2main_0       (i_awprot_isp2main_0   ), 
        .awvalid_isp2main_0      (i_awvalid_isp2main_0  ), 
        .awready_isp2main_0      (o_awready_isp2main_0  ), 
        .wdata_isp2main_0        (i_wdata_isp2main_0    ), 
        .wstrb_isp2main_0        (i_wstrb_isp2main_0    ), 
        .wlast_isp2main_0        (i_wlast_isp2main_0    ), 
        .wvalid_isp2main_0       (i_wvalid_isp2main_0   ), 
        .wready_isp2main_0       (o_wready_isp2main_0   ), 
        .bid_isp2main_0          (o_bid_isp2main_0      ), 
        .bresp_isp2main_0        (o_bresp_isp2main_0    ), 
        .bvalid_isp2main_0       (o_bvalid_isp2main_0   ), 
        .bready_isp2main_0       (i_bready_isp2main_0   ), 
        .arid_isp2main_0         (i_arid_isp2main_0     ), 
        .araddr_isp2main_0       ({i_aruser_isp2main_0,!i_araddr_isp2main_0[29],i_araddr_isp2main_0[28:0]}), 
        .arlen_isp2main_0        (i_arlen_isp2main_0    ), 
        .arsize_isp2main_0       (i_arsize_isp2main_0   ), 
        .arburst_isp2main_0      (i_arburst_isp2main_0  ), 
        .arlock_isp2main_0       (i_arlock_isp2main_0   ), 
        .arcache_isp2main_0      (i_arcache_isp2main_0  ), 
        .arprot_isp2main_0       (i_arprot_isp2main_0   ), 
        .arvalid_isp2main_0      (i_arvalid_isp2main_0  ), 
        .arready_isp2main_0      (o_arready_isp2main_0  ), 
        .rid_isp2main_0          (o_rid_isp2main_0      ), 
        .rdata_isp2main_0        (o_rdata_isp2main_0    ), 
        .rresp_isp2main_0        (o_rresp_isp2main_0    ), 
        .rlast_isp2main_0        (o_rlast_isp2main_0    ), 
        .rvalid_isp2main_0       (o_rvalid_isp2main_0   ), 
        .rready_isp2main_0       (i_rready_isp2main_0   ), 
        .awid_isp2main_1         (i_awid_isp2main_1     ), 
        .awaddr_isp2main_1       ({i_awuser_isp2main_1,!i_awaddr_isp2main_1[29],i_awaddr_isp2main_1[28:0]}), 
        .awlen_isp2main_1        (i_awlen_isp2main_1    ), 
        .awsize_isp2main_1       (i_awsize_isp2main_1   ), 
        .awburst_isp2main_1      (i_awburst_isp2main_1  ), 
        .awlock_isp2main_1       (i_awlock_isp2main_1   ), 
        .awcache_isp2main_1      (i_awcache_isp2main_1  ), 
        .awprot_isp2main_1       (i_awprot_isp2main_1   ), 
        .awvalid_isp2main_1      (i_awvalid_isp2main_1  ), 
        .awready_isp2main_1      (o_awready_isp2main_1  ), 
        .wdata_isp2main_1        (i_wdata_isp2main_1    ), 
        .wstrb_isp2main_1        (i_wstrb_isp2main_1    ), 
        .wlast_isp2main_1        (i_wlast_isp2main_1    ), 
        .wvalid_isp2main_1       (i_wvalid_isp2main_1   ), 
        .wready_isp2main_1       (o_wready_isp2main_1   ), 
        .bid_isp2main_1          (o_bid_isp2main_1      ), 
        .bresp_isp2main_1        (o_bresp_isp2main_1    ), 
        .bvalid_isp2main_1       (o_bvalid_isp2main_1   ), 
        .bready_isp2main_1       (i_bready_isp2main_1   ), 
        .arid_isp2main_1         (i_arid_isp2main_1     ), 
        .araddr_isp2main_1       ({i_aruser_isp2main_1,!i_araddr_isp2main_1[29],i_araddr_isp2main_1[28:0]}), 
        .arlen_isp2main_1        (i_arlen_isp2main_1    ), 
        .arsize_isp2main_1       (i_arsize_isp2main_1   ), 
        .arburst_isp2main_1      (i_arburst_isp2main_1  ), 
        .arlock_isp2main_1       (i_arlock_isp2main_1   ), 
        .arcache_isp2main_1      (i_arcache_isp2main_1  ), 
        .arprot_isp2main_1       (i_arprot_isp2main_1   ), 
        .arvalid_isp2main_1      (i_arvalid_isp2main_1  ), 
        .arready_isp2main_1      (o_arready_isp2main_1  ), 
        .rid_isp2main_1          (o_rid_isp2main_1      ), 
        .rdata_isp2main_1        (o_rdata_isp2main_1    ), 
        .rresp_isp2main_1        (o_rresp_isp2main_1    ), 
        .rlast_isp2main_1        (o_rlast_isp2main_1    ), 
        .rvalid_isp2main_1       (o_rvalid_isp2main_1   ), 
        .rready_isp2main_1       (i_rready_isp2main_1   ), 
        .awid_rgb2main           (i_awid_rgb2main       ), 
        .awaddr_rgb2main         ({i_awuser_rgb2main,!i_awaddr_rgb2main[29],i_awaddr_rgb2main[28:0]}), 
        .awlen_rgb2main          (i_awlen_rgb2main      ), 
        .awsize_rgb2main         (i_awsize_rgb2main     ), 
        .awburst_rgb2main        (i_awburst_rgb2main    ), 
        .awlock_rgb2main         (i_awlock_rgb2main     ), 
        .awcache_rgb2main        (i_awcache_rgb2main    ), 
        .awprot_rgb2main         (i_awprot_rgb2main     ), 
        .awvalid_rgb2main        (i_awvalid_rgb2main    ), 
        .awready_rgb2main        (o_awready_rgb2main    ), 
        .wdata_rgb2main          (i_wdata_rgb2main      ), 
        .wstrb_rgb2main          (i_wstrb_rgb2main      ), 
        .wlast_rgb2main          (i_wlast_rgb2main      ), 
        .wvalid_rgb2main         (i_wvalid_rgb2main     ), 
        .wready_rgb2main         (o_wready_rgb2main     ), 
        .bid_rgb2main            (o_bid_rgb2main        ), 
        .bresp_rgb2main          (o_bresp_rgb2main      ), 
        .bvalid_rgb2main         (o_bvalid_rgb2main     ), 
        .bready_rgb2main         (i_bready_rgb2main     ), 
        .arid_rgb2main           (i_arid_rgb2main       ), 
        .araddr_rgb2main         ({i_aruser_rgb2main,!i_araddr_rgb2main[29],i_araddr_rgb2main[28:0]}), 
        .arlen_rgb2main          (i_arlen_rgb2main      ), 
        .arsize_rgb2main         (i_arsize_rgb2main     ), 
        .arburst_rgb2main        (i_arburst_rgb2main    ), 
        .arlock_rgb2main         (i_arlock_rgb2main     ), 
        .arcache_rgb2main        (i_arcache_rgb2main    ), 
        .arprot_rgb2main         (i_arprot_rgb2main     ), 
        .arvalid_rgb2main        (i_arvalid_rgb2main    ), 
        .arready_rgb2main        (o_arready_rgb2main    ), 
        .rid_rgb2main            (o_rid_rgb2main        ), 
        .rdata_rgb2main          (o_rdata_rgb2main      ), 
        .rresp_rgb2main          (o_rresp_rgb2main      ), 
        .rlast_rgb2main          (o_rlast_rgb2main      ), 
        .rvalid_rgb2main         (o_rvalid_rgb2main     ), 
        .rready_rgb2main         (i_rready_rgb2main     ), 
        .haddr_peri2main		 (i_haddr_peri2main     ),
        .hburst_peri2main		 (i_hburst_peri2main    ),
        .hprot_peri2main		 (i_hprot_peri2main     ),
        .hsize_peri2main		 (i_hsize_peri2main     ),
        .htrans_peri2main		 (i_htrans_peri2main    ),
        .hwdata_peri2main		 (i_hwdata_peri2main    ),
        .hwrite_peri2main		 (i_hwrite_peri2main    ),
        .hrdata_peri2main		 (o_hrdata_peri2main    ),
        .hreadyout_peri2main	 (o_hready_peri2main    ),
        .hresp_peri2main		 (o_hresp_peri2main     ),
        .hselx_peri2main		 (1'b1                  ),
        .hready_peri2main		 (o_hready_peri2main    ),
        .i_cpu2mainclk           (i_clk_cpu2main        ),
        .i_cpu2mainresetn        (i_rstn_cpu2main       ),
        .i_hsp2mainclk           (i_clk_hsp2main        ),
        .i_hsp2mainresetn        (i_rstn_hsp2main       ),
        .i_keti2mainclk          (i_clk_keti2main       ),
        .i_keti2mainresetn       (i_rstn_keti2main      ),
        .i_main2ddr0clk          (i_clk_main2ddr        ),
        .i_main2ddr0resetn       (i_rstn_main2ddr       ),
        .i_mna2mainclk           (i_clk_mna2main        ),
        .i_mna2mainresetn        (i_rstn_mna2main       ),
        .i_mvp2mainclk           (i_clk_mvp2main        ),
        .i_mvp2mainresetn        (i_rstn_mvp2main       ),
        .i_peri2mainclk          (i_clk_peri2main       ),
        .i_peri2mainresetn       (i_rstn_peri2main      ),
        .mainclk                 (i_clk_main_bus        ),
        .mainclk_r               (i_clk_main_bus        ),
        .mainresetn              (i_rstn_main_bus       ),
        .mainresetn_r            (i_rstn_main_bus       ) 
    );


`ifdef ENV_MAIN_CAP

`define  APA_WIRE_MACRO(HPDF,IW)                         \
    wire                    cap_aresetn_``HPDF  ;        \
    wire                    cap_aclk_``HPDF     ;        \
    wire                    cap_awvalid_``HPDF  ;        \
    wire                    cap_awready_``HPDF  ;        \
    wire    [``IW-1:  0]    cap_awid_``HPDF     ;        \
    wire    [     7:  0]    cap_awlen_``HPDF    ;        \
    wire    [     2:  0]    cap_awsize_``HPDF   ;        \
    wire    [     2:  0]    cap_awprot_``HPDF   ;        \
    wire    [    31:  0]    cap_awaddr_``HPDF   ;        \
    wire                    cap_wvalid_``HPDF   ;        \
    wire                    cap_wready_``HPDF   ;        \
    wire                    cap_wlast_``HPDF    ;        \
    wire    [    15:  0]    cap_wstrb_``HPDF    ;        \
    wire    [   127:  0]    cap_wdata_``HPDF    ;        \
    wire                    cap_bvalid_``HPDF   ;        \
    wire                    cap_bready_``HPDF   ;        \
    wire    [     1:  0]    cap_bresp_``HPDF    ;        \
    wire    [``IW-1:  0]    cap_bid_``HPDF      ;        \
    wire                    cap_arvalid_``HPDF  ;        \
    wire                    cap_arready_``HPDF  ;        \
    wire    [``IW-1:  0]    cap_arid_``HPDF     ;        \
    wire    [     7:  0]    cap_arlen_``HPDF    ;        \
    wire    [     2:  0]    cap_arsize_``HPDF   ;        \
    wire    [     2:  0]    cap_arprot_``HPDF   ;        \
    wire    [    31:  0]    cap_araddr_``HPDF   ;        \
    wire                    cap_rvalid_``HPDF   ;        \
    wire                    cap_rready_``HPDF   ;        \
    wire    [     1:  0]    cap_rresp_``HPDF    ;        \
    wire    [``IW-1:  0]    cap_rid_``HPDF      ;        \
    wire                    cap_rlast_``HPDF    ;        \
    wire    [   127:  0]    cap_rdata_``HPDF    ;        \
//    assign  cap_aresetn_``HPDF  =  i_rstn_``HPDF    ;    \
//    assign  cap_aclk_``HPDF     =  i_clk_``HPDF     ;    \
    assign  cap_awvalid_``HPDF  =  i_awvalid_``HPDF ;    \
    assign  cap_awready_``HPDF  =  o_awready_``HPDF ;    \
    assign  cap_awid_``HPDF     =  i_awid_``HPDF    ;    \
    assign  cap_awlen_``HPDF    =  i_awlen_``HPDF   ;    \
    assign  cap_awsize_``HPDF   =  i_awsize_``HPDF  ;    \
    assign  cap_awprot_``HPDF   =  i_awprot_``HPDF  ;    \
    assign  cap_awaddr_``HPDF   =  i_awaddr_``HPDF  ;    \
    assign  cap_wvalid_``HPDF   =  i_wvalid_``HPDF  ;    \
    assign  cap_wready_``HPDF   =  o_wready_``HPDF  ;    \
    assign  cap_wlast_``HPDF    =  i_wlast_``HPDF   ;    \
    assign  cap_wstrb_``HPDF    =  i_wstrb_``HPDF   ;    \
    assign  cap_wdata_``HPDF    =  i_wdata_``HPDF   ;    \
    assign  cap_bvalid_``HPDF   =  o_bvalid_``HPDF  ;    \
    assign  cap_bready_``HPDF   =  i_bready_``HPDF  ;    \
    assign  cap_bresp_``HPDF    =  o_bresp_``HPDF   ;    \
    assign  cap_bid_``HPDF      =  o_bid_``HPDF     ;    \
    assign  cap_arvalid_``HPDF  =  i_arvalid_``HPDF ;    \
    assign  cap_arready_``HPDF  =  o_arready_``HPDF ;    \
    assign  cap_arid_``HPDF     =  i_arid_``HPDF    ;    \
    assign  cap_arlen_``HPDF    =  i_arlen_``HPDF   ;    \
    assign  cap_arsize_``HPDF   =  i_arsize_``HPDF  ;    \
    assign  cap_arprot_``HPDF   =  i_arprot_``HPDF  ;    \
    assign  cap_araddr_``HPDF   =  i_araddr_``HPDF  ;    \
    assign  cap_rvalid_``HPDF   =  o_rvalid_``HPDF  ;    \
    assign  cap_rready_``HPDF   =  i_rready_``HPDF  ;    \
    assign  cap_rresp_``HPDF    =  o_rresp_``HPDF   ;    \
    assign  cap_rid_``HPDF      =  o_rid_``HPDF     ;    \
    assign  cap_rlast_``HPDF    =  o_rlast_``HPDF   ;    \
    assign  cap_rdata_``HPDF    =  o_rdata_``HPDF   ;    \

    `define  APA_CAP_MACRO(HPDF,ID)                         \
    apa_capture_axi_r1p00                                   \
    #( .FILE_NAME  (  "./cap/main_bus_axi4.cap" )          ,\
       .IW         (  ``ID                               ) ,\
       .AW         (  32                                 ) ,\
       .LW         (  8                                  ) ,\
       .DW         (  128                                ) ,\
       .AXI_VER    (  4                                  ) )\
    u_cap_``HPDF                                            \
    (                                                       \
        .i_aresetn (                      )                ,\
        .i_aclk    (                      )                ,\
        .i_awvalid ( i_awvalid_``HPDF     )                ,\
        .i_awready ( o_awready_``HPDF     )                ,\
        .i_awid    ( i_awid_``HPDF        )                ,\
        .i_awlen   ( i_awlen_``HPDF       )                ,\
        .i_awsize  ( i_awsize_``HPDF      )                ,\
        .i_awprot  ( i_awprot_``HPDF      )                ,\
        .i_awaddr  ( i_awaddr_``HPDF      )                ,\
        .i_wvalid  ( i_wvalid_``HPDF      )                ,\
        .i_wready  ( o_wready_``HPDF      )                ,\
        .i_wlast   ( i_wlast_``HPDF       )                ,\
        .i_wstrb   ( i_wstrb_``HPDF       )                ,\
        .i_wdata   ( i_wdata_``HPDF       )                ,\
        .i_bvalid  ( o_bvalid_``HPDF      )                ,\
        .i_bready  ( i_bready_``HPDF      )                ,\
        .i_bresp   ( o_bresp_``HPDF       )                ,\
        .i_bid     ( o_bid_``HPDF         )                ,\
        .i_arvalid ( i_arvalid_``HPDF     )                ,\
        .i_arready ( o_arready_``HPDF     )                ,\
        .i_arid    ( i_arid_``HPDF        )                ,\
        .i_arlen   ( i_arlen_``HPDF       )                ,\
        .i_arsize  ( i_arsize_``HPDF      )                ,\
        .i_arprot  ( i_arprot_``HPDF      )                ,\
        .i_araddr  ( i_araddr_``HPDF      )                ,\
        .i_rvalid  ( o_rvalid_``HPDF      )                ,\
        .i_rready  ( i_rready_``HPDF      )                ,\
        .i_rresp   ( o_rresp_``HPDF       )                ,\
        .i_rid     ( o_rid_``HPDF         )                ,\
        .i_rlast   ( o_rlast_``HPDF       )                ,\
        .i_rdata   ( o_rdata_``HPDF       )\
    );  \

    `APA_WIRE_MACRO(hsp2main    ,4)
    `APA_WIRE_MACRO(keti2main_0 ,2)
    `APA_WIRE_MACRO(keti2main_1 ,3)
    `APA_WIRE_MACRO(mna2main    ,2)
    `APA_WIRE_MACRO(isp2main_0  ,2)
    `APA_WIRE_MACRO(isp2main_1  ,2)
    `APA_WIRE_MACRO(rgb2main    ,2)

    `APA_CAP_MACRO(hsp2main    ,4)
    `APA_CAP_MACRO(keti2main_0 ,2)
    `APA_CAP_MACRO(keti2main_1 ,3)
    `APA_CAP_MACRO(mna2main    ,2)
    `APA_CAP_MACRO(isp2main_0  ,2)
    `APA_CAP_MACRO(isp2main_1  ,2)
    `APA_CAP_MACRO(rgb2main    ,2)

    `define  DDR_CAP_MACRO(NUM)                         \
    apa_capture_axi_r1p00                                   \
    #( .FILE_NAME  (  "./cap/ddr_cap_axi4.cap"  )          ,\
       .IW         (  9                                  ) ,\
       .AW         (  32                                 ) ,\
       .LW         (  8                                  ) ,\
       .DW         (  128                                ) ,\
       .AXI_VER    (  4                                  ) )\
    u_ddr_cap_``NUM                                         \
    (                                                       \
        .i_aresetn (                            )          ,\
        .i_aclk    (                            )          ,\
        .i_awvalid ( o_awvalid_main2ddr0_``NUM  )          ,\
        .i_awready ( i_awready_main2ddr0_``NUM  )          ,\
        .i_awid    ( o_awid_main2ddr0_``NUM     )          ,\
        .i_awlen   ( o_awlen_main2ddr0_``NUM    )          ,\
        .i_awsize  ( o_awsize_main2ddr0_``NUM   )          ,\
        .i_awprot  ( o_awprot_main2ddr0_``NUM   )          ,\
        .i_awaddr  ( o_awaddr_main2ddr0_``NUM   )          ,\
        .i_wvalid  ( o_wvalid_main2ddr0_``NUM   )          ,\
        .i_wready  ( i_wready_main2ddr0_``NUM   )          ,\
        .i_wlast   ( o_wlast_main2ddr0_``NUM    )          ,\
        .i_wstrb   ( o_wstrb_main2ddr0_``NUM    )          ,\
        .i_wdata   ( o_wdata_main2ddr0_``NUM    )          ,\
        .i_bvalid  ( i_bvalid_main2ddr0_``NUM   )          ,\
        .i_bready  ( o_bready_main2ddr0_``NUM   )          ,\
        .i_bresp   ( i_bresp_main2ddr0_``NUM    )          ,\
        .i_bid     ( i_bid_main2ddr0_``NUM      )          ,\
        .i_arvalid ( o_arvalid_main2ddr0_``NUM  )          ,\
        .i_arready ( i_arready_main2ddr0_``NUM  )          ,\
        .i_arid    ( o_arid_main2ddr0_``NUM     )          ,\
        .i_arlen   ( o_arlen_main2ddr0_``NUM    )          ,\
        .i_arsize  ( o_arsize_main2ddr0_``NUM   )          ,\
        .i_arprot  ( o_arprot_main2ddr0_``NUM   )          ,\
        .i_araddr  ( o_araddr_main2ddr0_``NUM   )          ,\
        .i_rvalid  ( i_rvalid_main2ddr0_``NUM   )          ,\
        .i_rready  ( o_rready_main2ddr0_``NUM   )          ,\
        .i_rresp   ( i_rresp_main2ddr0_``NUM    )          ,\
        .i_rid     ( i_rid_main2ddr0_``NUM      )          ,\
        .i_rlast   ( i_rlast_main2ddr0_``NUM    )          ,\
        .i_rdata   ( i_rdata_main2ddr0_``NUM    )\
    );\

    `DDR_CAP_MACRO(0)
    `DDR_CAP_MACRO(1)
    `DDR_CAP_MACRO(2)
`endif // ENV_FAKE_MASTER

endmodule
