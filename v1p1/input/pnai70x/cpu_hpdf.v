//==============================================================================
//
// Project : PNAI70X
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
// File name : cpu_hpdf
// Version : v1.0
// Description :
// Simulator : NC Verilog
// Created by : SoC Designer
// Date : 2022-04-21  15:43
//==============================================================================

module cpu_hpdf (
    input   [ 38:  0]  i_ema,
    input   [479:  0]  i_a7d_irqs,
    input              i_a7d_eventi,
    output             o_a7d_evento,
    output  [  3:  0]  o_a7d_standbywfi,
    output  [  3:  0]  o_a7d_standbywfe,
    output             o_a7d_standbywfil2,
    output  [  3:  0]  o_a7d_dbgpwrupreq,
    output  [  3:  0]  o_a7d_dbgnopwrdwn,
    input              i_rstn_cs_ntrst_y,
    input              i_cs_swclktck_y,
    input              i_cs_tdi_y,
    input              i_cs_swditms_y,
    output             o_cs_tdo_a,
    output             o_cs_ntdoen_oe,
    output             o_cs_swdo_a,
    output             o_cs_swdoen_oe,
    output             o_traceclk_a,
    output  [ 15:  0]  o_tracedata_a,
    output             o_tracectl_a,
    input   [ 19:  0]  i_peri_sub_o_dmac_breq,
    input   [ 19:  0]  i_peri_sub_o_dmac_sreq,
    input   [ 19:  0]  i_peri_sub_o_dmac_lbreq,
    input   [ 19:  0]  i_peri_sub_o_dmac_lsreq,
    output  [ 19:  0]  o_cpu_sub_o_dmac_clr,
    output  [ 19:  0]  o_cpu_sub_o_dmac_tc,
    input              i_dma330_0_boot_from_pc,
    input   [ 31:  0]  i_dma330_0_boot_addr,
    input              i_dma330_0_manager_ns,
    input   [  7:  0]  i_dma330_0_irq_ns,
    input              i_dma330_1_boot_from_pc,
    input   [ 31:  0]  i_dma330_1_boot_addr,
    input              i_dma330_1_manager_ns,
    input   [  7:  0]  i_dma330_1_irq_ns,
    input              i_dma330_2_boot_from_pc,
    input   [ 31:  0]  i_dma330_2_boot_addr,
    input              i_dma330_2_manager_ns,
    input   [  7:  0]  i_dma330_2_irq_ns,
    input   [ 19:  0]  i_dma330_0_periph_ns,
    input   [ 19:  0]  i_dma330_0_enable_tc_on_flush,
    input   [ 19:  0]  i_dma330_1_periph_ns,
    input   [ 19:  0]  i_dma330_1_enable_tc_on_flush,
    output  [  3:  0]  o_ctiirq,
    output  [  7:  0]  o_dma330_0_irq,
    output             o_dma330_0_irq_abort,
    output  [  7:  0]  o_dma330_1_irq,
    output             o_dma330_1_irq_abort,
    output  [  7:  0]  o_dma330_2_irq,
    output             o_dma330_2_irq_abort,
    input   [  2:  0]  i_boot_cfg,
    input              i_clk_xtal,
    input              i_clk_cpu_peri,
    input              i_rstn_cpu_peri,
    input              i_clk_cpu_bus,
    input              i_clk_cpu_rom,
    output             o_pll_cpu_div,
    input              i_rstn_cpu_por,
    input              i_rstn_cpu_core,
    input              i_rstn_cpu_etc,
    input              i_test_clk,
    input              i_test_mode,
    output  [ 10:  0]  o_cpu_awid_m6_cpu2main,
    output  [ 31:  0]  o_cpu_awaddr_m6_cpu2main,
    output  [  7:  0]  o_cpu_awlen_m6_cpu2main,
    output  [  2:  0]  o_cpu_awsize_m6_cpu2main,
    output  [  1:  0]  o_cpu_awburst_m6_cpu2main,
    output             o_cpu_awlock_m6_cpu2main,
    output  [  3:  0]  o_cpu_awcache_m6_cpu2main,
    output  [  2:  0]  o_cpu_awprot_m6_cpu2main,
    output             o_cpu_awvalid_m6_cpu2main,
    input              i_cpu_awready_m6_cpu2main,
    output  [ 10:  0]  o_cpu_arid_m6_cpu2main,
    output  [ 31:  0]  o_cpu_araddr_m6_cpu2main,
    output  [  7:  0]  o_cpu_arlen_m6_cpu2main,
    output  [  2:  0]  o_cpu_arsize_m6_cpu2main,
    output  [  1:  0]  o_cpu_arburst_m6_cpu2main,
    output             o_cpu_arlock_m6_cpu2main,
    output  [  3:  0]  o_cpu_arcache_m6_cpu2main,
    output  [  2:  0]  o_cpu_arprot_m6_cpu2main,
    output             o_cpu_arvalid_m6_cpu2main,
    input              i_cpu_arready_m6_cpu2main,
    output  [127:  0]  o_cpu_wdata_m6_cpu2main,
    output  [ 15:  0]  o_cpu_wstrb_m6_cpu2main,
    output             o_cpu_wlast_m6_cpu2main,
    output             o_cpu_wvalid_m6_cpu2main,
    input              i_cpu_wready_m6_cpu2main,
    input   [ 10:  0]  i_cpu_bid_m6_cpu2main,
    input   [  1:  0]  i_cpu_bresp_m6_cpu2main,
    input              i_cpu_bvalid_m6_cpu2main,
    output             o_cpu_bready_m6_cpu2main,
    input   [ 10:  0]  i_cpu_rid_m6_cpu2main,
    input   [  1:  0]  i_cpu_rresp_m6_cpu2main,
    input   [127:  0]  i_cpu_rdata_m6_cpu2main,
    input              i_cpu_rlast_m6_cpu2main,
    input              i_cpu_rvalid_m6_cpu2main,
    output             o_cpu_rready_m6_cpu2main,
    input   [  7:  0]  i_peri2port_wrap_awid_hsp_hpdf_s6,
    input   [ 31:  0]  i_peri2port_wrap_awaddr_hsp_hpdf_s6,
    input   [  7:  0]  i_peri2port_wrap_awlen_hsp_hpdf_s6,
    input   [  2:  0]  i_peri2port_wrap_awsize_hsp_hpdf_s6,
    input   [  1:  0]  i_peri2port_wrap_awburst_hsp_hpdf_s6,
    input              i_peri2port_wrap_awlock_hsp_hpdf_s6,
    input   [  3:  0]  i_peri2port_wrap_awcache_hsp_hpdf_s6,
    input   [  2:  0]  i_peri2port_wrap_awprot_hsp_hpdf_s6,
    input              i_peri2port_wrap_awvalid_hsp_hpdf_s6,
    output             o_peri2port_wrap_awready_hsp_hpdf_s6,
    input   [  7:  0]  i_peri2port_wrap_arid_hsp_hpdf_s6,
    input   [ 31:  0]  i_peri2port_wrap_araddr_hsp_hpdf_s6,
    input   [  7:  0]  i_peri2port_wrap_arlen_hsp_hpdf_s6,
    input   [  2:  0]  i_peri2port_wrap_arsize_hsp_hpdf_s6,
    input   [  1:  0]  i_peri2port_wrap_arburst_hsp_hpdf_s6,
    input              i_peri2port_wrap_arlock_hsp_hpdf_s6,
    input   [  3:  0]  i_peri2port_wrap_arcache_hsp_hpdf_s6,
    input   [  2:  0]  i_peri2port_wrap_arprot_hsp_hpdf_s6,
    input              i_peri2port_wrap_arvalid_hsp_hpdf_s6,
    output             o_peri2port_wrap_arready_hsp_hpdf_s6,
    input   [ 31:  0]  i_peri2port_wrap_wdata_hsp_hpdf_s6,
    input   [  3:  0]  i_peri2port_wrap_wstrb_hsp_hpdf_s6,
    input              i_peri2port_wrap_wlast_hsp_hpdf_s6,
    input   [ 15:  0]  i_peri2port_wrap_wuser_hsp_hpdf_s6,
    input              i_peri2port_wrap_wvalid_hsp_hpdf_s6,
    output             o_peri2port_wrap_wready_hsp_hpdf_s6,
    output  [  7:  0]  o_peri2port_wrap_bid_hsp_hpdf_s6,
    output  [  1:  0]  o_peri2port_wrap_bresp_hsp_hpdf_s6,
    output             o_peri2port_wrap_bvalid_hsp_hpdf_s6,
    input              i_peri2port_wrap_bready_hsp_hpdf_s6,
    output  [  7:  0]  o_peri2port_wrap_rid_hsp_hpdf_s6,
    output  [  1:  0]  o_peri2port_wrap_rresp_hsp_hpdf_s6,
    output  [ 31:  0]  o_peri2port_wrap_rdata_hsp_hpdf_s6,
    output             o_peri2port_wrap_rlast_hsp_hpdf_s6,
    output             o_peri2port_wrap_rvalid_hsp_hpdf_s6,
    input              i_peri2port_wrap_rready_hsp_hpdf_s6,
    output             o_cpu_pselx_m3_main_peri,
    output             o_cpu_penable_m3_main_peri,
    output  [ 31:  0]  o_cpu_paddr_m3_main_peri,
    output             o_cpu_pwrite_m3_main_peri,
    output  [ 31:  0]  o_cpu_pwdata_m3_main_peri,
    input   [ 31:  0]  i_cpu_prdata_m3_main_peri,
    input              i_cpu_pready_m3_main_peri,
    input              i_cpu_pslverr_m3_main_peri,
    output  [ 10:  0]  o_cpu_awid_m4_cpu2peri,
    output  [ 31:  0]  o_cpu_awaddr_m4_cpu2peri,
    output  [  7:  0]  o_cpu_awlen_m4_cpu2peri,
    output  [  2:  0]  o_cpu_awsize_m4_cpu2peri,
    output  [  1:  0]  o_cpu_awburst_m4_cpu2peri,
    output             o_cpu_awlock_m4_cpu2peri,
    output  [  3:  0]  o_cpu_awcache_m4_cpu2peri,
    output  [  2:  0]  o_cpu_awprot_m4_cpu2peri,
    output             o_cpu_awvalid_m4_cpu2peri,
    input              i_cpu_awready_m4_cpu2peri,
    output  [ 10:  0]  o_cpu_arid_m4_cpu2peri,
    output  [ 31:  0]  o_cpu_araddr_m4_cpu2peri,
    output  [  7:  0]  o_cpu_arlen_m4_cpu2peri,
    output  [  2:  0]  o_cpu_arsize_m4_cpu2peri,
    output  [  1:  0]  o_cpu_arburst_m4_cpu2peri,
    output             o_cpu_arlock_m4_cpu2peri,
    output  [  3:  0]  o_cpu_arcache_m4_cpu2peri,
    output  [  2:  0]  o_cpu_arprot_m4_cpu2peri,
    output             o_cpu_arvalid_m4_cpu2peri,
    input              i_cpu_arready_m4_cpu2peri,
    output  [ 31:  0]  o_cpu_wdata_m4_cpu2peri,
    output  [  3:  0]  o_cpu_wstrb_m4_cpu2peri,
    output             o_cpu_wlast_m4_cpu2peri,
    output             o_cpu_wvalid_m4_cpu2peri,
    input              i_cpu_wready_m4_cpu2peri,
    input   [ 10:  0]  i_cpu_bid_m4_cpu2peri,
    input   [  1:  0]  i_cpu_bresp_m4_cpu2peri,
    input              i_cpu_bvalid_m4_cpu2peri,
    output             o_cpu_bready_m4_cpu2peri,
    input   [ 10:  0]  i_cpu_rid_m4_cpu2peri,
    input   [  1:  0]  i_cpu_rresp_m4_cpu2peri,
    input   [ 31:  0]  i_cpu_rdata_m4_cpu2peri,
    input              i_cpu_rlast_m4_cpu2peri,
    input              i_cpu_rvalid_m4_cpu2peri,
    output             o_cpu_rready_m4_cpu2peri,
    output             o_cpu_pselx_m5_isp_hpdf,
    output             o_cpu_penable_m5_isp_hpdf,
    output  [ 31:  0]  o_cpu_paddr_m5_isp_hpdf,
    output             o_cpu_pwrite_m5_isp_hpdf,
    output  [ 31:  0]  o_cpu_pwdata_m5_isp_hpdf,
    input   [ 31:  0]  i_cpu_prdata_m5_isp_hpdf,
    input              i_cpu_pready_m5_isp_hpdf,
    input              i_cpu_pslverr_m5_isp_hpdf
);

    wire    [ 31:0]  cpu_sub_awaddr_coresight_s1;
    wire    [  7:0]  cpu_sub_awlen_coresight_s1;
    wire    [  2:0]  cpu_sub_awsize_coresight_s1;
    wire    [  1:0]  cpu_sub_awburst_coresight_s1;
    wire             cpu_sub_awlock_coresight_s1;
    wire    [  3:0]  cpu_sub_awcache_coresight_s1;
    wire    [  2:0]  cpu_sub_awprot_coresight_s1;
    wire             cpu_sub_awvalid_coresight_s1;
    wire             cpu_sub_awready_coresight_s1;
    wire    [127:0]  cpu_sub_wdata_coresight_s1;
    wire    [ 15:0]  cpu_sub_wstrb_coresight_s1;
    wire             cpu_sub_wlast_coresight_s1;
    wire             cpu_sub_wvalid_coresight_s1;
    wire             cpu_sub_wready_coresight_s1;
    wire    [  1:0]  cpu_sub_bresp_coresight_s1;
    wire             cpu_sub_bvalid_coresight_s1;
    wire             cpu_sub_bready_coresight_s1;
    wire    [ 31:0]  cpu_sub_araddr_coresight_s1;
    wire    [  7:0]  cpu_sub_arlen_coresight_s1;
    wire    [  2:0]  cpu_sub_arsize_coresight_s1;
    wire    [  1:0]  cpu_sub_arburst_coresight_s1;
    wire             cpu_sub_arlock_coresight_s1;
    wire    [  3:0]  cpu_sub_arcache_coresight_s1;
    wire    [  2:0]  cpu_sub_arprot_coresight_s1;
    wire             cpu_sub_arvalid_coresight_s1;
    wire             cpu_sub_arready_coresight_s1;
    wire    [127:0]  cpu_sub_rdata_coresight_s1;
    wire    [  1:0]  cpu_sub_rresp_coresight_s1;
    wire             cpu_sub_rlast_coresight_s1;
    wire             cpu_sub_rvalid_coresight_s1;
    wire             cpu_sub_rready_coresight_s1;
    wire    [ 15:0]  cpu_sub_wuser_coresight_s1;
    wire    [ 31:0]  cpu_sub_awaddr_trace_s2;
    wire    [  7:0]  cpu_sub_awlen_trace_s2;
    wire    [  2:0]  cpu_sub_awsize_trace_s2;
    wire    [  1:0]  cpu_sub_awburst_trace_s2;
    wire             cpu_sub_awlock_trace_s2;
    wire    [  3:0]  cpu_sub_awcache_trace_s2;
    wire    [  2:0]  cpu_sub_awprot_trace_s2;
    wire             cpu_sub_awvalid_trace_s2;
    wire             cpu_sub_awready_trace_s2;
    wire    [ 31:0]  cpu_sub_wdata_trace_s2;
    wire    [  3:0]  cpu_sub_wstrb_trace_s2;
    wire             cpu_sub_wlast_trace_s2;
    wire             cpu_sub_wvalid_trace_s2;
    wire             cpu_sub_wready_trace_s2;
    wire    [  1:0]  cpu_sub_bresp_trace_s2;
    wire             cpu_sub_bvalid_trace_s2;
    wire             cpu_sub_bready_trace_s2;
    wire    [ 31:0]  cpu_sub_araddr_trace_s2;
    wire    [  7:0]  cpu_sub_arlen_trace_s2;
    wire    [  2:0]  cpu_sub_arsize_trace_s2;
    wire    [  1:0]  cpu_sub_arburst_trace_s2;
    wire             cpu_sub_arlock_trace_s2;
    wire    [  3:0]  cpu_sub_arcache_trace_s2;
    wire    [  2:0]  cpu_sub_arprot_trace_s2;
    wire             cpu_sub_arvalid_trace_s2;
    wire             cpu_sub_arready_trace_s2;
    wire    [ 31:0]  cpu_sub_rdata_trace_s2;
    wire    [  1:0]  cpu_sub_rresp_trace_s2;
    wire             cpu_sub_rlast_trace_s2;
    wire             cpu_sub_rvalid_trace_s2;
    wire             cpu_sub_rready_trace_s2;
    wire    [ 15:0]  cpu_sub_wuser_trace_s2;
    wire    [  5:0]  cpu_sub_awid_cortex_7_s0;
    wire    [ 31:0]  cpu_sub_awaddr_cortex_7_s0;
    wire    [  7:0]  cpu_sub_awlen_cortex_7_s0;
    wire    [  2:0]  cpu_sub_awsize_cortex_7_s0;
    wire    [  1:0]  cpu_sub_awburst_cortex_7_s0;
    wire             cpu_sub_awlock_cortex_7_s0;
    wire    [  3:0]  cpu_sub_awcache_cortex_7_s0;
    wire    [  2:0]  cpu_sub_awprot_cortex_7_s0;
    wire             cpu_sub_awvalid_cortex_7_s0;
    wire             cpu_sub_awready_cortex_7_s0;
    wire    [127:0]  cpu_sub_wdata_cortex_7_s0;
    wire    [ 15:0]  cpu_sub_wstrb_cortex_7_s0;
    wire             cpu_sub_wlast_cortex_7_s0;
    wire             cpu_sub_wvalid_cortex_7_s0;
    wire             cpu_sub_wready_cortex_7_s0;
    wire    [  5:0]  cpu_sub_bid_cortex_7_s0;
    wire    [  1:0]  cpu_sub_bresp_cortex_7_s0;
    wire             cpu_sub_bvalid_cortex_7_s0;
    wire             cpu_sub_bready_cortex_7_s0;
    wire    [  5:0]  cpu_sub_arid_cortex_7_s0;
    wire    [ 31:0]  cpu_sub_araddr_cortex_7_s0;
    wire    [  7:0]  cpu_sub_arlen_cortex_7_s0;
    wire    [  2:0]  cpu_sub_arsize_cortex_7_s0;
    wire    [  1:0]  cpu_sub_arburst_cortex_7_s0;
    wire             cpu_sub_arlock_cortex_7_s0;
    wire    [  3:0]  cpu_sub_arcache_cortex_7_s0;
    wire    [  2:0]  cpu_sub_arprot_cortex_7_s0;
    wire             cpu_sub_arvalid_cortex_7_s0;
    wire             cpu_sub_arready_cortex_7_s0;
    wire    [  5:0]  cpu_sub_rid_cortex_7_s0;
    wire    [127:0]  cpu_sub_rdata_cortex_7_s0;
    wire    [  1:0]  cpu_sub_rresp_cortex_7_s0;
    wire             cpu_sub_rlast_cortex_7_s0;
    wire             cpu_sub_rvalid_cortex_7_s0;
    wire             cpu_sub_rready_cortex_7_s0;
    wire    [ 15:0]  cpu_sub_wuser_cortex_7_s0;
    wire    [  3:0]  cpu_sub_awid_dma_0_s3;
    wire    [ 31:0]  cpu_sub_awaddr_dma_0_s3;
    wire    [  3:0]  cpu_sub_awlen_dma_0_s3;
    wire    [  2:0]  cpu_sub_awsize_dma_0_s3;
    wire    [  1:0]  cpu_sub_awburst_dma_0_s3;
    wire             cpu_sub_awlock_dma_0_s3;
    wire    [  3:0]  cpu_sub_awcache_dma_0_s3;
    wire    [  2:0]  cpu_sub_awprot_dma_0_s3;
    wire             cpu_sub_awvalid_dma_0_s3;
    wire             cpu_sub_awready_dma_0_s3;
    wire    [127:0]  cpu_sub_wdata_dma_0_s3;
    wire    [ 15:0]  cpu_sub_wstrb_dma_0_s3;
    wire             cpu_sub_wlast_dma_0_s3;
    wire             cpu_sub_wvalid_dma_0_s3;
    wire             cpu_sub_wready_dma_0_s3;
    wire    [  3:0]  cpu_sub_bid_dma_0_s3;
    wire    [  1:0]  cpu_sub_bresp_dma_0_s3;
    wire             cpu_sub_bvalid_dma_0_s3;
    wire             cpu_sub_bready_dma_0_s3;
    wire    [  3:0]  cpu_sub_arid_dma_0_s3;
    wire    [ 31:0]  cpu_sub_araddr_dma_0_s3;
    wire    [  3:0]  cpu_sub_arlen_dma_0_s3;
    wire    [  2:0]  cpu_sub_arsize_dma_0_s3;
    wire    [  1:0]  cpu_sub_arburst_dma_0_s3;
    wire             cpu_sub_arlock_dma_0_s3;
    wire    [  3:0]  cpu_sub_arcache_dma_0_s3;
    wire    [  2:0]  cpu_sub_arprot_dma_0_s3;
    wire             cpu_sub_arvalid_dma_0_s3;
    wire             cpu_sub_arready_dma_0_s3;
    wire    [  3:0]  cpu_sub_rid_dma_0_s3;
    wire    [127:0]  cpu_sub_rdata_dma_0_s3;
    wire    [  1:0]  cpu_sub_rresp_dma_0_s3;
    wire             cpu_sub_rlast_dma_0_s3;
    wire             cpu_sub_rvalid_dma_0_s3;
    wire             cpu_sub_rready_dma_0_s3;
    wire    [ 15:0]  cpu_sub_wuser_dma_0_s3;
    wire    [  3:0]  cpu_sub_awid_dma_1_s4;
    wire    [ 31:0]  cpu_sub_awaddr_dma_1_s4;
    wire    [  3:0]  cpu_sub_awlen_dma_1_s4;
    wire    [  2:0]  cpu_sub_awsize_dma_1_s4;
    wire    [  1:0]  cpu_sub_awburst_dma_1_s4;
    wire             cpu_sub_awlock_dma_1_s4;
    wire    [  3:0]  cpu_sub_awcache_dma_1_s4;
    wire    [  2:0]  cpu_sub_awprot_dma_1_s4;
    wire             cpu_sub_awvalid_dma_1_s4;
    wire             cpu_sub_awready_dma_1_s4;
    wire    [127:0]  cpu_sub_wdata_dma_1_s4;
    wire    [ 15:0]  cpu_sub_wstrb_dma_1_s4;
    wire             cpu_sub_wlast_dma_1_s4;
    wire             cpu_sub_wvalid_dma_1_s4;
    wire             cpu_sub_wready_dma_1_s4;
    wire    [  3:0]  cpu_sub_bid_dma_1_s4;
    wire    [  1:0]  cpu_sub_bresp_dma_1_s4;
    wire             cpu_sub_bvalid_dma_1_s4;
    wire             cpu_sub_bready_dma_1_s4;
    wire    [  3:0]  cpu_sub_arid_dma_1_s4;
    wire    [ 31:0]  cpu_sub_araddr_dma_1_s4;
    wire    [  3:0]  cpu_sub_arlen_dma_1_s4;
    wire    [  2:0]  cpu_sub_arsize_dma_1_s4;
    wire    [  1:0]  cpu_sub_arburst_dma_1_s4;
    wire             cpu_sub_arlock_dma_1_s4;
    wire    [  3:0]  cpu_sub_arcache_dma_1_s4;
    wire    [  2:0]  cpu_sub_arprot_dma_1_s4;
    wire             cpu_sub_arvalid_dma_1_s4;
    wire             cpu_sub_arready_dma_1_s4;
    wire    [  3:0]  cpu_sub_rid_dma_1_s4;
    wire    [127:0]  cpu_sub_rdata_dma_1_s4;
    wire    [  1:0]  cpu_sub_rresp_dma_1_s4;
    wire             cpu_sub_rlast_dma_1_s4;
    wire             cpu_sub_rvalid_dma_1_s4;
    wire             cpu_sub_rready_dma_1_s4;
    wire    [ 15:0]  cpu_sub_wuser_dma_1_s4;
    wire    [  3:0]  cpu_sub_awid_dma_2_s5;
    wire    [ 31:0]  cpu_sub_awaddr_dma_2_s5;
    wire    [  3:0]  cpu_sub_awlen_dma_2_s5;
    wire    [  2:0]  cpu_sub_awsize_dma_2_s5;
    wire    [  1:0]  cpu_sub_awburst_dma_2_s5;
    wire             cpu_sub_awlock_dma_2_s5;
    wire    [  3:0]  cpu_sub_awcache_dma_2_s5;
    wire    [  2:0]  cpu_sub_awprot_dma_2_s5;
    wire             cpu_sub_awvalid_dma_2_s5;
    wire             cpu_sub_awready_dma_2_s5;
    wire    [127:0]  cpu_sub_wdata_dma_2_s5;
    wire    [ 15:0]  cpu_sub_wstrb_dma_2_s5;
    wire             cpu_sub_wlast_dma_2_s5;
    wire             cpu_sub_wvalid_dma_2_s5;
    wire             cpu_sub_wready_dma_2_s5;
    wire    [  3:0]  cpu_sub_bid_dma_2_s5;
    wire    [  1:0]  cpu_sub_bresp_dma_2_s5;
    wire             cpu_sub_bvalid_dma_2_s5;
    wire             cpu_sub_bready_dma_2_s5;
    wire    [  3:0]  cpu_sub_arid_dma_2_s5;
    wire    [ 31:0]  cpu_sub_araddr_dma_2_s5;
    wire    [  3:0]  cpu_sub_arlen_dma_2_s5;
    wire    [  2:0]  cpu_sub_arsize_dma_2_s5;
    wire    [  1:0]  cpu_sub_arburst_dma_2_s5;
    wire             cpu_sub_arlock_dma_2_s5;
    wire    [  3:0]  cpu_sub_arcache_dma_2_s5;
    wire    [  2:0]  cpu_sub_arprot_dma_2_s5;
    wire             cpu_sub_arvalid_dma_2_s5;
    wire             cpu_sub_arready_dma_2_s5;
    wire    [  3:0]  cpu_sub_rid_dma_2_s5;
    wire    [127:0]  cpu_sub_rdata_dma_2_s5;
    wire    [  1:0]  cpu_sub_rresp_dma_2_s5;
    wire             cpu_sub_rlast_dma_2_s5;
    wire             cpu_sub_rvalid_dma_2_s5;
    wire             cpu_sub_rready_dma_2_s5;
    wire    [ 15:0]  cpu_sub_wuser_dma_2_s5;
    wire             cpu_sub_o_cpu_hpdf_crm_psel;
    wire             cpu_sub_o_cpu_hpdf_crm_penable;
    wire             cpu_sub_o_cpu_hpdf_crm_pwrite;
    wire    [ 11:0]  cpu_sub_o_cpu_hpdf_crm_paddr;
    wire    [ 31:0]  cpu_sub_o_cpu_hpdf_crm_pwdata;
    wire    [ 31:0]  cpu_sub_i_cpu_hpdf_crm_prdata;
    wire    [ 31:0]  cpu_paddr_m2_cpu_peri;
    wire             cpu_pselx_m2_cpu_peri;
    wire             cpu_penable_m2_cpu_peri;
    wire             cpu_pwrite_m2_cpu_peri;
    wire    [ 31:0]  cpu_prdata_m2_cpu_peri;
    wire    [ 31:0]  cpu_pwdata_m2_cpu_peri;
    wire             cpu_pready_m2_cpu_peri;
    wire             cpu_pslverr_m2_cpu_peri;
    wire    [ 31:0]  cpu_haddr_m1_sram;
    wire    [  2:0]  cpu_hburst_m1_sram;
    wire    [  3:0]  cpu_hprot_m1_sram;
    wire    [  2:0]  cpu_hsize_m1_sram;
    wire    [  1:0]  cpu_htrans_m1_sram;
    wire    [127:0]  cpu_hwdata_m1_sram;
    wire             cpu_hwrite_m1_sram;
    wire    [127:0]  cpu_hrdata_m1_sram;
    wire             cpu_hresp_m1_sram;
    wire             cpu_hready_m1_sram;
    wire    [ 15:0]  cpu_hwuser_m1_sram;
    wire    [ 31:0]  cpu_haddr_m0_rom;
    wire    [  2:0]  cpu_hburst_m0_rom;
    wire    [  3:0]  cpu_hprot_m0_rom;
    wire    [  2:0]  cpu_hsize_m0_rom;
    wire    [  1:0]  cpu_htrans_m0_rom;
    wire    [127:0]  cpu_hwdata_m0_rom;
    wire             cpu_hwrite_m0_rom;
    wire    [127:0]  cpu_hrdata_m0_rom;
    wire             cpu_hresp_m0_rom;
    wire             cpu_hready_m0_rom;
    wire             pll_cpu_o_fout;
    wire             pll_cpu_o_fvco_out;
    wire    [  4:0]  pll_cpu_o_afc_code;
    wire             crm_cpu_o_pll_resetb;
    wire             crm_cpu_o_pll_bypass;
    wire    [  5:0]  crm_cpu_o_pll_p;
    wire    [  8:0]  crm_cpu_o_pll_m;
    wire    [  2:0]  crm_cpu_o_pll_s;
    wire    [ 15:0]  crm_cpu_o_pll_k;
    wire    [  4:0]  crm_cpu_o_pll_extafc;
    wire    [  7:0]  crm_cpu_o_pll_mfr;
    wire    [  5:0]  crm_cpu_o_pll_mrr;
    wire    [  1:0]  crm_cpu_o_pll_sel_pf;
    wire    [  1:0]  crm_cpu_o_pll_icp;
    wire             crm_cpu_o_pll_pbias_ctrl;
    wire             crm_cpu_o_pll_pbias_ctrl_en;
    wire             crm_cpu_o_pll_vco_boost;
    wire             crm_cpu_o_pll_fsel;
    wire             crm_cpu_o_pll_fvco_en;
    wire             crm_cpu_o_pll_sscg_en;
    wire             crm_cpu_o_pll_afc_enb;
    wire             crm_cpu_o_pll_afcinit_sel;
    wire             crm_cpu_o_pll_fout_mask;
    wire             crm_cpu_o_pll_lrd_en;
    wire             crm_cpu_o_clk_cpu_a7_core;
    wire             crm_cpu_o_rstn_cpu_a7_core;
    wire             crm_cpu_o_rstn_ca7d_l2;
    wire             crm_cpu_o_rstn_ca7d_core0;
    wire             crm_cpu_o_rstn_ca7d_core1;
    wire             crm_cpu_o_rstn_ca7d_core0_por;
    wire             crm_cpu_o_rstn_ca7d_core1_por;
    wire             crm_cpu_o_rstn_ca7d_dbg0;
    wire             crm_cpu_o_rstn_ca7d_dbg1;
    wire             crm_cpu_o_rstn_ca7d_etm0;
    wire             crm_cpu_o_rstn_ca7d_etm1;
    wire             crm_cpu_o_rstn_ca7d_socdbg;
    wire             crm_cpu_o_rstn_cs_porrst;
    wire             crm_cpu_o_clk_cpu_cs_atb;
    wire             crm_cpu_o_rstn_cpu_cs_atb;
    wire             crm_cpu_o_clk_cpu_cs_etr;
    wire             crm_cpu_o_rstn_cpu_cs_etr;
    wire             crm_cpu_o_clk_cpu_cs_trace;
    wire             crm_cpu_o_rstn_cpu_cs_trace;
    wire             crm_cpu_o_clk_bus;
    wire             crm_cpu_o_rstn_bus;
    wire             crm_cpu_o_clk_bus_dma0;
    wire             crm_cpu_o_rstn_bus_dma0;
    wire             crm_cpu_o_clk_bus_dma1;
    wire             crm_cpu_o_rstn_bus_dma1;
    wire             crm_cpu_o_clk_bus_dma2;
    wire             crm_cpu_o_rstn_bus_dma2;
    wire             crm_cpu_o_clk_bus_ram;
    wire             crm_cpu_o_rstn_bus_ram;
    wire             crm_cpu_o_clk_rom;
    wire             crm_cpu_o_rstn_rom;
    wire             crm_cpu_o_clk_peri;
    wire             crm_cpu_o_rstn_peri;
    wire             crm_cpu_o_clk_peri_cs_sys_p;
    wire             crm_cpu_o_clk_peri_cs_dap;
    wire             crm_cpu_o_clk_peri_cs_apb_dap;
    wire             crm_cpu_o_clk_peri_dma0;
    wire             crm_cpu_o_rstn_peri_dma0;
    wire             crm_cpu_o_clk_peri_dma1;
    wire             crm_cpu_o_rstn_peri_dma1;
    wire             crm_cpu_o_clk_peri_dma2;
    wire             crm_cpu_o_rstn_peri_dma2;
    wire             crm_cpu_o_clken_cpu_a7_bus;
    wire             crm_cpu_o_clken_cpu_a7_atc;
    wire    [  1:0]  cpu_awlock_dma_0_s3;
    wire    [  1:0]  cpu_arlock_dma_0_s3;
    wire    [  1:0]  cpu_awlock_dma_1_s4;
    wire    [  1:0]  cpu_arlock_dma_1_s4;
    wire    [  1:0]  cpu_awlock_dma_2_s5;
    wire    [  1:0]  cpu_arlock_dma_2_s5;

    assign  cpu_arlock_dma_0_s3[0] = cpu_sub_arlock_dma_0_s3;
    assign  cpu_arlock_dma_0_s3[1] = 1'h0;
    assign  cpu_arlock_dma_1_s4[0] = cpu_sub_arlock_dma_1_s4;
    assign  cpu_arlock_dma_1_s4[1] = 1'h0;
    assign  cpu_arlock_dma_2_s5[0] = cpu_sub_arlock_dma_2_s5;
    assign  cpu_arlock_dma_2_s5[1] = 1'h0;
    assign  cpu_awlock_dma_0_s3[0] = cpu_sub_awlock_dma_0_s3;
    assign  cpu_awlock_dma_0_s3[1] = 1'h0;
    assign  cpu_awlock_dma_1_s4[0] = cpu_sub_awlock_dma_1_s4;
    assign  cpu_awlock_dma_1_s4[1] = 1'h0;
    assign  cpu_awlock_dma_2_s5[0] = cpu_sub_awlock_dma_2_s5;
    assign  cpu_awlock_dma_2_s5[1] = 1'h0;

    cpu_sub u_cpu_sub (
        .i_clk_cpu_a7_core               (crm_cpu_o_clk_cpu_a7_core),
        .i_rstn_cpu_a7_core              (crm_cpu_o_rstn_cpu_a7_core),
        .i_rstn_ca7d_l2                  (crm_cpu_o_rstn_ca7d_l2),
        .i_rstn_ca7d_core0               (crm_cpu_o_rstn_ca7d_core0),
        .i_rstn_ca7d_core1               (crm_cpu_o_rstn_ca7d_core1),
        .i_rstn_ca7d_core0_por           (crm_cpu_o_rstn_ca7d_core0_por),
        .i_rstn_ca7d_core1_por           (crm_cpu_o_rstn_ca7d_core1_por),
        .i_rstn_ca7d_dbg0                (crm_cpu_o_rstn_ca7d_dbg0),
        .i_rstn_ca7d_dbg1                (crm_cpu_o_rstn_ca7d_dbg1),
        .i_rstn_ca7d_etm0                (crm_cpu_o_rstn_ca7d_etm0),
        .i_rstn_ca7d_etm1                (crm_cpu_o_rstn_ca7d_etm1),
        .i_rstn_ca7d_socdbg              (crm_cpu_o_rstn_ca7d_socdbg),
        .i_rstn_cs_porrst                (crm_cpu_o_rstn_cs_porrst),
        .i_clk_cpu_cs_atb                (crm_cpu_o_clk_cpu_cs_atb),
        .i_rstn_cpu_cs_atb               (crm_cpu_o_rstn_cpu_cs_atb),
        .i_clk_cpu_cs_etr                (crm_cpu_o_clk_cpu_cs_etr),
        .i_rstn_cpu_cs_etr               (crm_cpu_o_rstn_cpu_cs_etr),
        .i_clk_cpu_cs_trace              (crm_cpu_o_clk_cpu_cs_trace),
        .i_rstn_cpu_cs_trace             (crm_cpu_o_rstn_cpu_cs_trace),
        .i_clk_bus                       (crm_cpu_o_clk_bus),
        .i_rstn_bus                      (crm_cpu_o_rstn_bus),
        .i_clk_bus_dma0                  (crm_cpu_o_clk_bus_dma0),
        .i_rstn_bus_dma0                 (crm_cpu_o_rstn_bus_dma0),
        .i_clk_bus_dma1                  (crm_cpu_o_clk_bus_dma1),
        .i_rstn_bus_dma1                 (crm_cpu_o_rstn_bus_dma1),
        .i_clk_bus_dma2                  (crm_cpu_o_clk_bus_dma2),
        .i_rstn_bus_dma2                 (crm_cpu_o_rstn_bus_dma2),
        .i_clk_bus_ram                   (crm_cpu_o_clk_bus_ram),
        .i_rstn_bus_ram                  (crm_cpu_o_rstn_bus_ram),
        .i_clk_rom                       (crm_cpu_o_clk_rom),
        .i_rstn_rom                      (crm_cpu_o_rstn_rom),
        .i_clk_peri                      (crm_cpu_o_clk_peri),
        .i_rstn_peri                     (crm_cpu_o_rstn_peri),
        .i_clk_peri_cs_sys_p             (crm_cpu_o_clk_peri_cs_sys_p),
        .i_clk_peri_cs_dap               (crm_cpu_o_clk_peri_cs_dap),
        .i_clk_peri_cs_apb_dap           (crm_cpu_o_clk_peri_cs_apb_dap),
        .i_clk_peri_dma0                 (crm_cpu_o_clk_peri_dma0),
        .i_rstn_peri_dma0                (crm_cpu_o_rstn_peri_dma0),
        .i_clk_peri_dma1                 (crm_cpu_o_clk_peri_dma1),
        .i_rstn_peri_dma1                (crm_cpu_o_rstn_peri_dma1),
        .i_clk_peri_dma2                 (crm_cpu_o_clk_peri_dma2),
        .i_rstn_peri_dma2                (crm_cpu_o_rstn_peri_dma2),
        .i_clken_cpu_a7_bus              (crm_cpu_o_clken_cpu_a7_bus),
        .i_clken_cpu_a7_atc              (crm_cpu_o_clken_cpu_a7_atc),
        .i_ema                           (i_ema),
        .i_a7d_irqs                      (i_a7d_irqs),
        .i_a7d_eventi                    (i_a7d_eventi),
        .o_a7d_evento                    (o_a7d_evento),
        .o_a7d_standbywfi                (o_a7d_standbywfi),
        .o_a7d_standbywfe                (o_a7d_standbywfe),
        .o_a7d_standbywfil2              (o_a7d_standbywfil2),
        .o_a7d_dbgpwrupreq               (o_a7d_dbgpwrupreq),
        .o_a7d_dbgnopwrdwn               (o_a7d_dbgnopwrdwn),
        .i_rstn_cs_ntrst_y               (i_rstn_cs_ntrst_y),
        .i_cs_swclktck_y                 (i_cs_swclktck_y),
        .i_cs_tdi_y                      (i_cs_tdi_y),
        .i_cs_swditms_y                  (i_cs_swditms_y),
        .o_cs_tdo_a                      (o_cs_tdo_a),
        .o_cs_ntdoen_oe                  (o_cs_ntdoen_oe),
        .o_cs_swdo_a                     (o_cs_swdo_a),
        .o_cs_swdoen_oe                  (o_cs_swdoen_oe),
        .o_traceclk_a                    (o_traceclk_a),
        .o_tracedata_a                   (o_tracedata_a),
        .o_tracectl_a                    (o_tracectl_a),
        .i_dmac_0_breq                   (i_peri_sub_o_dmac_breq),
        .i_dmac_0_sreq                   (i_peri_sub_o_dmac_sreq),
        .i_dmac_0_lbreq                  (i_peri_sub_o_dmac_lbreq),
        .i_dmac_0_lsreq                  (i_peri_sub_o_dmac_lsreq),
        .i_dmac_1_breq                   (i_peri_sub_o_dmac_breq),
        .i_dmac_1_sreq                   (i_peri_sub_o_dmac_sreq),
        .i_dmac_1_lbreq                  (i_peri_sub_o_dmac_lbreq),
        .i_dmac_1_lsreq                  (i_peri_sub_o_dmac_lsreq),
        .o_dmac_clr                      (o_cpu_sub_o_dmac_clr),
        .o_dmac_tc                       (o_cpu_sub_o_dmac_tc),
        .i_dma330_0_boot_from_pc         (i_dma330_0_boot_from_pc),
        .i_dma330_0_boot_addr            (i_dma330_0_boot_addr),
        .i_dma330_0_manager_ns           (i_dma330_0_manager_ns),
        .i_dma330_0_irq_ns               (i_dma330_0_irq_ns),
        .i_dma330_1_boot_from_pc         (i_dma330_1_boot_from_pc),
        .i_dma330_1_boot_addr            (i_dma330_1_boot_addr),
        .i_dma330_1_manager_ns           (i_dma330_1_manager_ns),
        .i_dma330_1_irq_ns               (i_dma330_1_irq_ns),
        .i_dma330_2_boot_from_pc         (i_dma330_2_boot_from_pc),
        .i_dma330_2_boot_addr            (i_dma330_2_boot_addr),
        .i_dma330_2_manager_ns           (i_dma330_2_manager_ns),
        .i_dma330_2_irq_ns               (i_dma330_2_irq_ns),
        .i_dma330_0_periph_ns            (i_dma330_0_periph_ns),
        .i_dma330_0_enable_tc_on_flush   (i_dma330_0_enable_tc_on_flush),
        .i_dma330_1_periph_ns            (i_dma330_1_periph_ns),
        .i_dma330_1_enable_tc_on_flush   (i_dma330_1_enable_tc_on_flush),
        .o_ctiirq                        (o_ctiirq),
        .o_dma330_0_irq                  (o_dma330_0_irq),
        .o_dma330_0_irq_abort            (o_dma330_0_irq_abort),
        .o_dma330_1_irq                  (o_dma330_1_irq),
        .o_dma330_1_irq_abort            (o_dma330_1_irq_abort),
        .o_dma330_2_irq                  (o_dma330_2_irq),
        .o_dma330_2_irq_abort            (o_dma330_2_irq_abort),
        .i_boot_cfg                      (i_boot_cfg),
        .awaddr_coresight_s1             (cpu_sub_awaddr_coresight_s1),
        .awlen_coresight_s1              (cpu_sub_awlen_coresight_s1),
        .awsize_coresight_s1             (cpu_sub_awsize_coresight_s1),
        .awburst_coresight_s1            (cpu_sub_awburst_coresight_s1),
        .awlock_coresight_s1             (cpu_sub_awlock_coresight_s1),
        .awcache_coresight_s1            (cpu_sub_awcache_coresight_s1),
        .awprot_coresight_s1             (cpu_sub_awprot_coresight_s1),
        .awvalid_coresight_s1            (cpu_sub_awvalid_coresight_s1),
        .awready_coresight_s1            (cpu_sub_awready_coresight_s1),
        .wdata_coresight_s1              (cpu_sub_wdata_coresight_s1),
        .wstrb_coresight_s1              (cpu_sub_wstrb_coresight_s1),
        .wlast_coresight_s1              (cpu_sub_wlast_coresight_s1),
        .wvalid_coresight_s1             (cpu_sub_wvalid_coresight_s1),
        .wready_coresight_s1             (cpu_sub_wready_coresight_s1),
        .bresp_coresight_s1              (cpu_sub_bresp_coresight_s1),
        .bvalid_coresight_s1             (cpu_sub_bvalid_coresight_s1),
        .bready_coresight_s1             (cpu_sub_bready_coresight_s1),
        .araddr_coresight_s1             (cpu_sub_araddr_coresight_s1),
        .arlen_coresight_s1              (cpu_sub_arlen_coresight_s1),
        .arsize_coresight_s1             (cpu_sub_arsize_coresight_s1),
        .arburst_coresight_s1            (cpu_sub_arburst_coresight_s1),
        .arlock_coresight_s1             (cpu_sub_arlock_coresight_s1),
        .arcache_coresight_s1            (cpu_sub_arcache_coresight_s1),
        .arprot_coresight_s1             (cpu_sub_arprot_coresight_s1),
        .arvalid_coresight_s1            (cpu_sub_arvalid_coresight_s1),
        .arready_coresight_s1            (cpu_sub_arready_coresight_s1),
        .rdata_coresight_s1              (cpu_sub_rdata_coresight_s1),
        .rresp_coresight_s1              (cpu_sub_rresp_coresight_s1),
        .rlast_coresight_s1              (cpu_sub_rlast_coresight_s1),
        .rvalid_coresight_s1             (cpu_sub_rvalid_coresight_s1),
        .rready_coresight_s1             (cpu_sub_rready_coresight_s1),
        .wuser_coresight_s1              (cpu_sub_wuser_coresight_s1),
        .awaddr_trace_s2                 (cpu_sub_awaddr_trace_s2),
        .awlen_trace_s2                  (cpu_sub_awlen_trace_s2),
        .awsize_trace_s2                 (cpu_sub_awsize_trace_s2),
        .awburst_trace_s2                (cpu_sub_awburst_trace_s2),
        .awlock_trace_s2                 (cpu_sub_awlock_trace_s2),
        .awcache_trace_s2                (cpu_sub_awcache_trace_s2),
        .awprot_trace_s2                 (cpu_sub_awprot_trace_s2),
        .awvalid_trace_s2                (cpu_sub_awvalid_trace_s2),
        .awready_trace_s2                (cpu_sub_awready_trace_s2),
        .wdata_trace_s2                  (cpu_sub_wdata_trace_s2),
        .wstrb_trace_s2                  (cpu_sub_wstrb_trace_s2),
        .wlast_trace_s2                  (cpu_sub_wlast_trace_s2),
        .wvalid_trace_s2                 (cpu_sub_wvalid_trace_s2),
        .wready_trace_s2                 (cpu_sub_wready_trace_s2),
        .bresp_trace_s2                  (cpu_sub_bresp_trace_s2),
        .bvalid_trace_s2                 (cpu_sub_bvalid_trace_s2),
        .bready_trace_s2                 (cpu_sub_bready_trace_s2),
        .araddr_trace_s2                 (cpu_sub_araddr_trace_s2),
        .arlen_trace_s2                  (cpu_sub_arlen_trace_s2),
        .arsize_trace_s2                 (cpu_sub_arsize_trace_s2),
        .arburst_trace_s2                (cpu_sub_arburst_trace_s2),
        .arlock_trace_s2                 (cpu_sub_arlock_trace_s2),
        .arcache_trace_s2                (cpu_sub_arcache_trace_s2),
        .arprot_trace_s2                 (cpu_sub_arprot_trace_s2),
        .arvalid_trace_s2                (cpu_sub_arvalid_trace_s2),
        .arready_trace_s2                (cpu_sub_arready_trace_s2),
        .rdata_trace_s2                  (cpu_sub_rdata_trace_s2),
        .rresp_trace_s2                  (cpu_sub_rresp_trace_s2),
        .rlast_trace_s2                  (cpu_sub_rlast_trace_s2),
        .rvalid_trace_s2                 (cpu_sub_rvalid_trace_s2),
        .rready_trace_s2                 (cpu_sub_rready_trace_s2),
        .wuser_trace_s2                  (cpu_sub_wuser_trace_s2),
        .awid_cortex_7_s0                (cpu_sub_awid_cortex_7_s0),
        .awaddr_cortex_7_s0              (cpu_sub_awaddr_cortex_7_s0),
        .awlen_cortex_7_s0               (cpu_sub_awlen_cortex_7_s0),
        .awsize_cortex_7_s0              (cpu_sub_awsize_cortex_7_s0),
        .awburst_cortex_7_s0             (cpu_sub_awburst_cortex_7_s0),
        .awlock_cortex_7_s0              (cpu_sub_awlock_cortex_7_s0),
        .awcache_cortex_7_s0             (cpu_sub_awcache_cortex_7_s0),
        .awprot_cortex_7_s0              (cpu_sub_awprot_cortex_7_s0),
        .awvalid_cortex_7_s0             (cpu_sub_awvalid_cortex_7_s0),
        .awready_cortex_7_s0             (cpu_sub_awready_cortex_7_s0),
        .wdata_cortex_7_s0               (cpu_sub_wdata_cortex_7_s0),
        .wstrb_cortex_7_s0               (cpu_sub_wstrb_cortex_7_s0),
        .wlast_cortex_7_s0               (cpu_sub_wlast_cortex_7_s0),
        .wvalid_cortex_7_s0              (cpu_sub_wvalid_cortex_7_s0),
        .wready_cortex_7_s0              (cpu_sub_wready_cortex_7_s0),
        .bid_cortex_7_s0                 (cpu_sub_bid_cortex_7_s0),
        .bresp_cortex_7_s0               (cpu_sub_bresp_cortex_7_s0),
        .bvalid_cortex_7_s0              (cpu_sub_bvalid_cortex_7_s0),
        .bready_cortex_7_s0              (cpu_sub_bready_cortex_7_s0),
        .arid_cortex_7_s0                (cpu_sub_arid_cortex_7_s0),
        .araddr_cortex_7_s0              (cpu_sub_araddr_cortex_7_s0),
        .arlen_cortex_7_s0               (cpu_sub_arlen_cortex_7_s0),
        .arsize_cortex_7_s0              (cpu_sub_arsize_cortex_7_s0),
        .arburst_cortex_7_s0             (cpu_sub_arburst_cortex_7_s0),
        .arlock_cortex_7_s0              (cpu_sub_arlock_cortex_7_s0),
        .arcache_cortex_7_s0             (cpu_sub_arcache_cortex_7_s0),
        .arprot_cortex_7_s0              (cpu_sub_arprot_cortex_7_s0),
        .arvalid_cortex_7_s0             (cpu_sub_arvalid_cortex_7_s0),
        .arready_cortex_7_s0             (cpu_sub_arready_cortex_7_s0),
        .rid_cortex_7_s0                 (cpu_sub_rid_cortex_7_s0),
        .rdata_cortex_7_s0               (cpu_sub_rdata_cortex_7_s0),
        .rresp_cortex_7_s0               (cpu_sub_rresp_cortex_7_s0),
        .rlast_cortex_7_s0               (cpu_sub_rlast_cortex_7_s0),
        .rvalid_cortex_7_s0              (cpu_sub_rvalid_cortex_7_s0),
        .rready_cortex_7_s0              (cpu_sub_rready_cortex_7_s0),
        .wuser_cortex_7_s0               (cpu_sub_wuser_cortex_7_s0),
        .awid_dma_0_s3                   (cpu_sub_awid_dma_0_s3),
        .awaddr_dma_0_s3                 (cpu_sub_awaddr_dma_0_s3),
        .awlen_dma_0_s3                  (cpu_sub_awlen_dma_0_s3),
        .awsize_dma_0_s3                 (cpu_sub_awsize_dma_0_s3),
        .awburst_dma_0_s3                (cpu_sub_awburst_dma_0_s3),
        .awlock_dma_0_s3                 (cpu_sub_awlock_dma_0_s3),
        .awcache_dma_0_s3                (cpu_sub_awcache_dma_0_s3),
        .awprot_dma_0_s3                 (cpu_sub_awprot_dma_0_s3),
        .awvalid_dma_0_s3                (cpu_sub_awvalid_dma_0_s3),
        .awready_dma_0_s3                (cpu_sub_awready_dma_0_s3),
        .wdata_dma_0_s3                  (cpu_sub_wdata_dma_0_s3),
        .wstrb_dma_0_s3                  (cpu_sub_wstrb_dma_0_s3),
        .wlast_dma_0_s3                  (cpu_sub_wlast_dma_0_s3),
        .wvalid_dma_0_s3                 (cpu_sub_wvalid_dma_0_s3),
        .wready_dma_0_s3                 (cpu_sub_wready_dma_0_s3),
        .bid_dma_0_s3                    (cpu_sub_bid_dma_0_s3),
        .bresp_dma_0_s3                  (cpu_sub_bresp_dma_0_s3),
        .bvalid_dma_0_s3                 (cpu_sub_bvalid_dma_0_s3),
        .bready_dma_0_s3                 (cpu_sub_bready_dma_0_s3),
        .arid_dma_0_s3                   (cpu_sub_arid_dma_0_s3),
        .araddr_dma_0_s3                 (cpu_sub_araddr_dma_0_s3),
        .arlen_dma_0_s3                  (cpu_sub_arlen_dma_0_s3),
        .arsize_dma_0_s3                 (cpu_sub_arsize_dma_0_s3),
        .arburst_dma_0_s3                (cpu_sub_arburst_dma_0_s3),
        .arlock_dma_0_s3                 (cpu_sub_arlock_dma_0_s3),
        .arcache_dma_0_s3                (cpu_sub_arcache_dma_0_s3),
        .arprot_dma_0_s3                 (cpu_sub_arprot_dma_0_s3),
        .arvalid_dma_0_s3                (cpu_sub_arvalid_dma_0_s3),
        .arready_dma_0_s3                (cpu_sub_arready_dma_0_s3),
        .rid_dma_0_s3                    (cpu_sub_rid_dma_0_s3),
        .rdata_dma_0_s3                  (cpu_sub_rdata_dma_0_s3),
        .rresp_dma_0_s3                  (cpu_sub_rresp_dma_0_s3),
        .rlast_dma_0_s3                  (cpu_sub_rlast_dma_0_s3),
        .rvalid_dma_0_s3                 (cpu_sub_rvalid_dma_0_s3),
        .rready_dma_0_s3                 (cpu_sub_rready_dma_0_s3),
        .wuser_dma_0_s3                  (cpu_sub_wuser_dma_0_s3),
        .awid_dma_1_s4                   (cpu_sub_awid_dma_1_s4),
        .awaddr_dma_1_s4                 (cpu_sub_awaddr_dma_1_s4),
        .awlen_dma_1_s4                  (cpu_sub_awlen_dma_1_s4),
        .awsize_dma_1_s4                 (cpu_sub_awsize_dma_1_s4),
        .awburst_dma_1_s4                (cpu_sub_awburst_dma_1_s4),
        .awlock_dma_1_s4                 (cpu_sub_awlock_dma_1_s4),
        .awcache_dma_1_s4                (cpu_sub_awcache_dma_1_s4),
        .awprot_dma_1_s4                 (cpu_sub_awprot_dma_1_s4),
        .awvalid_dma_1_s4                (cpu_sub_awvalid_dma_1_s4),
        .awready_dma_1_s4                (cpu_sub_awready_dma_1_s4),
        .wdata_dma_1_s4                  (cpu_sub_wdata_dma_1_s4),
        .wstrb_dma_1_s4                  (cpu_sub_wstrb_dma_1_s4),
        .wlast_dma_1_s4                  (cpu_sub_wlast_dma_1_s4),
        .wvalid_dma_1_s4                 (cpu_sub_wvalid_dma_1_s4),
        .wready_dma_1_s4                 (cpu_sub_wready_dma_1_s4),
        .bid_dma_1_s4                    (cpu_sub_bid_dma_1_s4),
        .bresp_dma_1_s4                  (cpu_sub_bresp_dma_1_s4),
        .bvalid_dma_1_s4                 (cpu_sub_bvalid_dma_1_s4),
        .bready_dma_1_s4                 (cpu_sub_bready_dma_1_s4),
        .arid_dma_1_s4                   (cpu_sub_arid_dma_1_s4),
        .araddr_dma_1_s4                 (cpu_sub_araddr_dma_1_s4),
        .arlen_dma_1_s4                  (cpu_sub_arlen_dma_1_s4),
        .arsize_dma_1_s4                 (cpu_sub_arsize_dma_1_s4),
        .arburst_dma_1_s4                (cpu_sub_arburst_dma_1_s4),
        .arlock_dma_1_s4                 (cpu_sub_arlock_dma_1_s4),
        .arcache_dma_1_s4                (cpu_sub_arcache_dma_1_s4),
        .arprot_dma_1_s4                 (cpu_sub_arprot_dma_1_s4),
        .arvalid_dma_1_s4                (cpu_sub_arvalid_dma_1_s4),
        .arready_dma_1_s4                (cpu_sub_arready_dma_1_s4),
        .rid_dma_1_s4                    (cpu_sub_rid_dma_1_s4),
        .rdata_dma_1_s4                  (cpu_sub_rdata_dma_1_s4),
        .rresp_dma_1_s4                  (cpu_sub_rresp_dma_1_s4),
        .rlast_dma_1_s4                  (cpu_sub_rlast_dma_1_s4),
        .rvalid_dma_1_s4                 (cpu_sub_rvalid_dma_1_s4),
        .rready_dma_1_s4                 (cpu_sub_rready_dma_1_s4),
        .wuser_dma_1_s4                  (cpu_sub_wuser_dma_1_s4),
        .awid_dma_2_s5                   (cpu_sub_awid_dma_2_s5),
        .awaddr_dma_2_s5                 (cpu_sub_awaddr_dma_2_s5),
        .awlen_dma_2_s5                  (cpu_sub_awlen_dma_2_s5),
        .awsize_dma_2_s5                 (cpu_sub_awsize_dma_2_s5),
        .awburst_dma_2_s5                (cpu_sub_awburst_dma_2_s5),
        .awlock_dma_2_s5                 (cpu_sub_awlock_dma_2_s5),
        .awcache_dma_2_s5                (cpu_sub_awcache_dma_2_s5),
        .awprot_dma_2_s5                 (cpu_sub_awprot_dma_2_s5),
        .awvalid_dma_2_s5                (cpu_sub_awvalid_dma_2_s5),
        .awready_dma_2_s5                (cpu_sub_awready_dma_2_s5),
        .wdata_dma_2_s5                  (cpu_sub_wdata_dma_2_s5),
        .wstrb_dma_2_s5                  (cpu_sub_wstrb_dma_2_s5),
        .wlast_dma_2_s5                  (cpu_sub_wlast_dma_2_s5),
        .wvalid_dma_2_s5                 (cpu_sub_wvalid_dma_2_s5),
        .wready_dma_2_s5                 (cpu_sub_wready_dma_2_s5),
        .bid_dma_2_s5                    (cpu_sub_bid_dma_2_s5),
        .bresp_dma_2_s5                  (cpu_sub_bresp_dma_2_s5),
        .bvalid_dma_2_s5                 (cpu_sub_bvalid_dma_2_s5),
        .bready_dma_2_s5                 (cpu_sub_bready_dma_2_s5),
        .arid_dma_2_s5                   (cpu_sub_arid_dma_2_s5),
        .araddr_dma_2_s5                 (cpu_sub_araddr_dma_2_s5),
        .arlen_dma_2_s5                  (cpu_sub_arlen_dma_2_s5),
        .arsize_dma_2_s5                 (cpu_sub_arsize_dma_2_s5),
        .arburst_dma_2_s5                (cpu_sub_arburst_dma_2_s5),
        .arlock_dma_2_s5                 (cpu_sub_arlock_dma_2_s5),
        .arcache_dma_2_s5                (cpu_sub_arcache_dma_2_s5),
        .arprot_dma_2_s5                 (cpu_sub_arprot_dma_2_s5),
        .arvalid_dma_2_s5                (cpu_sub_arvalid_dma_2_s5),
        .arready_dma_2_s5                (cpu_sub_arready_dma_2_s5),
        .rid_dma_2_s5                    (cpu_sub_rid_dma_2_s5),
        .rdata_dma_2_s5                  (cpu_sub_rdata_dma_2_s5),
        .rresp_dma_2_s5                  (cpu_sub_rresp_dma_2_s5),
        .rlast_dma_2_s5                  (cpu_sub_rlast_dma_2_s5),
        .rvalid_dma_2_s5                 (cpu_sub_rvalid_dma_2_s5),
        .rready_dma_2_s5                 (cpu_sub_rready_dma_2_s5),
        .wuser_dma_2_s5                  (cpu_sub_wuser_dma_2_s5),
        .paddr_m2_cpu_peri               (cpu_paddr_m2_cpu_peri),
        .pselx_m2_cpu_peri               (cpu_pselx_m2_cpu_peri),
        .penable_m2_cpu_peri             (cpu_penable_m2_cpu_peri),
        .pwrite_m2_cpu_peri              (cpu_pwrite_m2_cpu_peri),
        .prdata_m2_cpu_peri              (cpu_prdata_m2_cpu_peri),
        .pwdata_m2_cpu_peri              (cpu_pwdata_m2_cpu_peri),
        .pready_m2_cpu_peri              (cpu_pready_m2_cpu_peri),
        .pslverr_m2_cpu_peri             (cpu_pslverr_m2_cpu_peri),
        .haddr_m1_sram                   (cpu_haddr_m1_sram),
        .hburst_m1_sram                  (cpu_hburst_m1_sram),
        .hprot_m1_sram                   (cpu_hprot_m1_sram),
        .hsize_m1_sram                   (cpu_hsize_m1_sram),
        .htrans_m1_sram                  (cpu_htrans_m1_sram),
        .hwdata_m1_sram                  (cpu_hwdata_m1_sram),
        .hwrite_m1_sram                  (cpu_hwrite_m1_sram),
        .hrdata_m1_sram                  (cpu_hrdata_m1_sram),
        .hresp_m1_sram                   (cpu_hresp_m1_sram),
        .hready_m1_sram                  (cpu_hready_m1_sram),
        .hwuser_m1_sram                  (cpu_hwuser_m1_sram),
        .haddr_m0_rom                    (cpu_haddr_m0_rom),
        .hburst_m0_rom                   (cpu_hburst_m0_rom),
        .hprot_m0_rom                    (cpu_hprot_m0_rom),
        .hsize_m0_rom                    (cpu_hsize_m0_rom),
        .htrans_m0_rom                   (cpu_htrans_m0_rom),
        .hwdata_m0_rom                   (cpu_hwdata_m0_rom),
        .hwrite_m0_rom                   (cpu_hwrite_m0_rom),
        .hrdata_m0_rom                   (cpu_hrdata_m0_rom),
        .hresp_m0_rom                    (cpu_hresp_m0_rom),
        .hready_m0_rom                   (cpu_hready_m0_rom),
        .o_cpu_hpdf_crm_psel             (cpu_sub_o_cpu_hpdf_crm_psel),
        .o_cpu_hpdf_crm_penable          (cpu_sub_o_cpu_hpdf_crm_penable),
        .o_cpu_hpdf_crm_pwrite           (cpu_sub_o_cpu_hpdf_crm_pwrite),
        .o_cpu_hpdf_crm_paddr            (cpu_sub_o_cpu_hpdf_crm_paddr),
        .o_cpu_hpdf_crm_pwdata           (cpu_sub_o_cpu_hpdf_crm_pwdata),
        .i_cpu_hpdf_crm_prdata           (cpu_sub_i_cpu_hpdf_crm_prdata)
    );

    nic400_cpu_bus_r0p00 u_cpu_bus (
        .awid_m6_cpu2main                (o_cpu_awid_m6_cpu2main),
        .awaddr_m6_cpu2main              (o_cpu_awaddr_m6_cpu2main),
        .awlen_m6_cpu2main               (o_cpu_awlen_m6_cpu2main),
        .awsize_m6_cpu2main              (o_cpu_awsize_m6_cpu2main),
        .awburst_m6_cpu2main             (o_cpu_awburst_m6_cpu2main),
        .awlock_m6_cpu2main              (o_cpu_awlock_m6_cpu2main),
        .awcache_m6_cpu2main             (o_cpu_awcache_m6_cpu2main),
        .awprot_m6_cpu2main              (o_cpu_awprot_m6_cpu2main),
        .awvalid_m6_cpu2main             (o_cpu_awvalid_m6_cpu2main),
        .awready_m6_cpu2main             (i_cpu_awready_m6_cpu2main),
        .wdata_m6_cpu2main               (o_cpu_wdata_m6_cpu2main),
        .wstrb_m6_cpu2main               (o_cpu_wstrb_m6_cpu2main),
        .wlast_m6_cpu2main               (o_cpu_wlast_m6_cpu2main),
        .wvalid_m6_cpu2main              (o_cpu_wvalid_m6_cpu2main),
        .wready_m6_cpu2main              (i_cpu_wready_m6_cpu2main),
        .bid_m6_cpu2main                 (i_cpu_bid_m6_cpu2main),
        .bresp_m6_cpu2main               (i_cpu_bresp_m6_cpu2main),
        .bvalid_m6_cpu2main              (i_cpu_bvalid_m6_cpu2main),
        .bready_m6_cpu2main              (o_cpu_bready_m6_cpu2main),
        .arid_m6_cpu2main                (o_cpu_arid_m6_cpu2main),
        .araddr_m6_cpu2main              (o_cpu_araddr_m6_cpu2main),
        .arlen_m6_cpu2main               (o_cpu_arlen_m6_cpu2main),
        .arsize_m6_cpu2main              (o_cpu_arsize_m6_cpu2main),
        .arburst_m6_cpu2main             (o_cpu_arburst_m6_cpu2main),
        .arlock_m6_cpu2main              (o_cpu_arlock_m6_cpu2main),
        .arcache_m6_cpu2main             (o_cpu_arcache_m6_cpu2main),
        .arprot_m6_cpu2main              (o_cpu_arprot_m6_cpu2main),
        .arvalid_m6_cpu2main             (o_cpu_arvalid_m6_cpu2main),
        .arready_m6_cpu2main             (i_cpu_arready_m6_cpu2main),
        .rid_m6_cpu2main                 (i_cpu_rid_m6_cpu2main),
        .rdata_m6_cpu2main               (i_cpu_rdata_m6_cpu2main),
        .rresp_m6_cpu2main               (i_cpu_rresp_m6_cpu2main),
        .rlast_m6_cpu2main               (i_cpu_rlast_m6_cpu2main),
        .rvalid_m6_cpu2main              (i_cpu_rvalid_m6_cpu2main),
        .rready_m6_cpu2main              (o_cpu_rready_m6_cpu2main),
        .awaddr_coresight_s1             (cpu_sub_awaddr_coresight_s1),
        .awlen_coresight_s1              (cpu_sub_awlen_coresight_s1),
        .awsize_coresight_s1             (cpu_sub_awsize_coresight_s1),
        .awburst_coresight_s1            (cpu_sub_awburst_coresight_s1),
        .awlock_coresight_s1             (cpu_sub_awlock_coresight_s1),
        .awcache_coresight_s1            (cpu_sub_awcache_coresight_s1),
        .awprot_coresight_s1             (cpu_sub_awprot_coresight_s1),
        .awvalid_coresight_s1            (cpu_sub_awvalid_coresight_s1),
        .awready_coresight_s1            (cpu_sub_awready_coresight_s1),
        .wdata_coresight_s1              (cpu_sub_wdata_coresight_s1),
        .wstrb_coresight_s1              (cpu_sub_wstrb_coresight_s1),
        .wlast_coresight_s1              (cpu_sub_wlast_coresight_s1),
        .wvalid_coresight_s1             (cpu_sub_wvalid_coresight_s1),
        .wready_coresight_s1             (cpu_sub_wready_coresight_s1),
        .bresp_coresight_s1              (cpu_sub_bresp_coresight_s1),
        .bvalid_coresight_s1             (cpu_sub_bvalid_coresight_s1),
        .bready_coresight_s1             (cpu_sub_bready_coresight_s1),
        .araddr_coresight_s1             (cpu_sub_araddr_coresight_s1),
        .arlen_coresight_s1              (cpu_sub_arlen_coresight_s1),
        .arsize_coresight_s1             (cpu_sub_arsize_coresight_s1),
        .arburst_coresight_s1            (cpu_sub_arburst_coresight_s1),
        .arlock_coresight_s1             (cpu_sub_arlock_coresight_s1),
        .arcache_coresight_s1            (cpu_sub_arcache_coresight_s1),
        .arprot_coresight_s1             (cpu_sub_arprot_coresight_s1),
        .arvalid_coresight_s1            (cpu_sub_arvalid_coresight_s1),
        .arready_coresight_s1            (cpu_sub_arready_coresight_s1),
        .rdata_coresight_s1              (cpu_sub_rdata_coresight_s1),
        .rresp_coresight_s1              (cpu_sub_rresp_coresight_s1),
        .rlast_coresight_s1              (cpu_sub_rlast_coresight_s1),
        .rvalid_coresight_s1             (cpu_sub_rvalid_coresight_s1),
        .rready_coresight_s1             (cpu_sub_rready_coresight_s1),
        .wuser_coresight_s1              (cpu_sub_wuser_coresight_s1),
        .awaddr_trace_s2                 (cpu_sub_awaddr_trace_s2),
        .awlen_trace_s2                  (cpu_sub_awlen_trace_s2),
        .awsize_trace_s2                 (cpu_sub_awsize_trace_s2),
        .awburst_trace_s2                (cpu_sub_awburst_trace_s2),
        .awlock_trace_s2                 (cpu_sub_awlock_trace_s2),
        .awcache_trace_s2                (cpu_sub_awcache_trace_s2),
        .awprot_trace_s2                 (cpu_sub_awprot_trace_s2),
        .awvalid_trace_s2                (cpu_sub_awvalid_trace_s2),
        .awready_trace_s2                (cpu_sub_awready_trace_s2),
        .wdata_trace_s2                  (cpu_sub_wdata_trace_s2),
        .wstrb_trace_s2                  (cpu_sub_wstrb_trace_s2),
        .wlast_trace_s2                  (cpu_sub_wlast_trace_s2),
        .wvalid_trace_s2                 (cpu_sub_wvalid_trace_s2),
        .wready_trace_s2                 (cpu_sub_wready_trace_s2),
        .bresp_trace_s2                  (cpu_sub_bresp_trace_s2),
        .bvalid_trace_s2                 (cpu_sub_bvalid_trace_s2),
        .bready_trace_s2                 (cpu_sub_bready_trace_s2),
        .araddr_trace_s2                 (cpu_sub_araddr_trace_s2),
        .arlen_trace_s2                  (cpu_sub_arlen_trace_s2),
        .arsize_trace_s2                 (cpu_sub_arsize_trace_s2),
        .arburst_trace_s2                (cpu_sub_arburst_trace_s2),
        .arlock_trace_s2                 (cpu_sub_arlock_trace_s2),
        .arcache_trace_s2                (cpu_sub_arcache_trace_s2),
        .arprot_trace_s2                 (cpu_sub_arprot_trace_s2),
        .arvalid_trace_s2                (cpu_sub_arvalid_trace_s2),
        .arready_trace_s2                (cpu_sub_arready_trace_s2),
        .rdata_trace_s2                  (cpu_sub_rdata_trace_s2),
        .rresp_trace_s2                  (cpu_sub_rresp_trace_s2),
        .rlast_trace_s2                  (cpu_sub_rlast_trace_s2),
        .rvalid_trace_s2                 (cpu_sub_rvalid_trace_s2),
        .rready_trace_s2                 (cpu_sub_rready_trace_s2),
        .wuser_trace_s2                  (cpu_sub_wuser_trace_s2),
        .awid_cortex_7_s0                (cpu_sub_awid_cortex_7_s0),
        .awaddr_cortex_7_s0              (cpu_sub_awaddr_cortex_7_s0),
        .awlen_cortex_7_s0               (cpu_sub_awlen_cortex_7_s0),
        .awsize_cortex_7_s0              (cpu_sub_awsize_cortex_7_s0),
        .awburst_cortex_7_s0             (cpu_sub_awburst_cortex_7_s0),
        .awlock_cortex_7_s0              (cpu_sub_awlock_cortex_7_s0),
        .awcache_cortex_7_s0             (cpu_sub_awcache_cortex_7_s0),
        .awprot_cortex_7_s0              (cpu_sub_awprot_cortex_7_s0),
        .awvalid_cortex_7_s0             (cpu_sub_awvalid_cortex_7_s0),
        .awready_cortex_7_s0             (cpu_sub_awready_cortex_7_s0),
        .wdata_cortex_7_s0               (cpu_sub_wdata_cortex_7_s0),
        .wstrb_cortex_7_s0               (cpu_sub_wstrb_cortex_7_s0),
        .wlast_cortex_7_s0               (cpu_sub_wlast_cortex_7_s0),
        .wvalid_cortex_7_s0              (cpu_sub_wvalid_cortex_7_s0),
        .wready_cortex_7_s0              (cpu_sub_wready_cortex_7_s0),
        .bid_cortex_7_s0                 (cpu_sub_bid_cortex_7_s0),
        .bresp_cortex_7_s0               (cpu_sub_bresp_cortex_7_s0),
        .bvalid_cortex_7_s0              (cpu_sub_bvalid_cortex_7_s0),
        .bready_cortex_7_s0              (cpu_sub_bready_cortex_7_s0),
        .arid_cortex_7_s0                (cpu_sub_arid_cortex_7_s0),
        .araddr_cortex_7_s0              (cpu_sub_araddr_cortex_7_s0),
        .arlen_cortex_7_s0               (cpu_sub_arlen_cortex_7_s0),
        .arsize_cortex_7_s0              (cpu_sub_arsize_cortex_7_s0),
        .arburst_cortex_7_s0             (cpu_sub_arburst_cortex_7_s0),
        .arlock_cortex_7_s0              (cpu_sub_arlock_cortex_7_s0),
        .arcache_cortex_7_s0             (cpu_sub_arcache_cortex_7_s0),
        .arprot_cortex_7_s0              (cpu_sub_arprot_cortex_7_s0),
        .arvalid_cortex_7_s0             (cpu_sub_arvalid_cortex_7_s0),
        .arready_cortex_7_s0             (cpu_sub_arready_cortex_7_s0),
        .rid_cortex_7_s0                 (cpu_sub_rid_cortex_7_s0),
        .rdata_cortex_7_s0               (cpu_sub_rdata_cortex_7_s0),
        .rresp_cortex_7_s0               (cpu_sub_rresp_cortex_7_s0),
        .rlast_cortex_7_s0               (cpu_sub_rlast_cortex_7_s0),
        .rvalid_cortex_7_s0              (cpu_sub_rvalid_cortex_7_s0),
        .rready_cortex_7_s0              (cpu_sub_rready_cortex_7_s0),
        .wuser_cortex_7_s0               (cpu_sub_wuser_cortex_7_s0),
        .awid_dma_0_s3                   (cpu_sub_awid_dma_0_s3),
        .awaddr_dma_0_s3                 (cpu_sub_awaddr_dma_0_s3),
        .awlen_dma_0_s3                  (cpu_sub_awlen_dma_0_s3),
        .awsize_dma_0_s3                 (cpu_sub_awsize_dma_0_s3),
        .awburst_dma_0_s3                (cpu_sub_awburst_dma_0_s3),
        .awlock_dma_0_s3                 (cpu_awlock_dma_0_s3),
        .awcache_dma_0_s3                (cpu_sub_awcache_dma_0_s3),
        .awprot_dma_0_s3                 (cpu_sub_awprot_dma_0_s3),
        .awvalid_dma_0_s3                (cpu_sub_awvalid_dma_0_s3),
        .awready_dma_0_s3                (cpu_sub_awready_dma_0_s3),
        .wid_dma_0_s3                    (4'h0),
        .wdata_dma_0_s3                  (cpu_sub_wdata_dma_0_s3),
        .wstrb_dma_0_s3                  (cpu_sub_wstrb_dma_0_s3),
        .wlast_dma_0_s3                  (cpu_sub_wlast_dma_0_s3),
        .wvalid_dma_0_s3                 (cpu_sub_wvalid_dma_0_s3),
        .wready_dma_0_s3                 (cpu_sub_wready_dma_0_s3),
        .bid_dma_0_s3                    (cpu_sub_bid_dma_0_s3),
        .bresp_dma_0_s3                  (cpu_sub_bresp_dma_0_s3),
        .bvalid_dma_0_s3                 (cpu_sub_bvalid_dma_0_s3),
        .bready_dma_0_s3                 (cpu_sub_bready_dma_0_s3),
        .arid_dma_0_s3                   (cpu_sub_arid_dma_0_s3),
        .araddr_dma_0_s3                 (cpu_sub_araddr_dma_0_s3),
        .arlen_dma_0_s3                  (cpu_sub_arlen_dma_0_s3),
        .arsize_dma_0_s3                 (cpu_sub_arsize_dma_0_s3),
        .arburst_dma_0_s3                (cpu_sub_arburst_dma_0_s3),
        .arlock_dma_0_s3                 (cpu_arlock_dma_0_s3),
        .arcache_dma_0_s3                (cpu_sub_arcache_dma_0_s3),
        .arprot_dma_0_s3                 (cpu_sub_arprot_dma_0_s3),
        .arvalid_dma_0_s3                (cpu_sub_arvalid_dma_0_s3),
        .arready_dma_0_s3                (cpu_sub_arready_dma_0_s3),
        .rid_dma_0_s3                    (cpu_sub_rid_dma_0_s3),
        .rdata_dma_0_s3                  (cpu_sub_rdata_dma_0_s3),
        .rresp_dma_0_s3                  (cpu_sub_rresp_dma_0_s3),
        .rlast_dma_0_s3                  (cpu_sub_rlast_dma_0_s3),
        .rvalid_dma_0_s3                 (cpu_sub_rvalid_dma_0_s3),
        .rready_dma_0_s3                 (cpu_sub_rready_dma_0_s3),
        .wuser_dma_0_s3                  (cpu_sub_wuser_dma_0_s3),
        .awid_dma_1_s4                   (cpu_sub_awid_dma_1_s4),
        .awaddr_dma_1_s4                 (cpu_sub_awaddr_dma_1_s4),
        .awlen_dma_1_s4                  (cpu_sub_awlen_dma_1_s4),
        .awsize_dma_1_s4                 (cpu_sub_awsize_dma_1_s4),
        .awburst_dma_1_s4                (cpu_sub_awburst_dma_1_s4),
        .awlock_dma_1_s4                 (cpu_awlock_dma_1_s4),
        .awcache_dma_1_s4                (cpu_sub_awcache_dma_1_s4),
        .awprot_dma_1_s4                 (cpu_sub_awprot_dma_1_s4),
        .awvalid_dma_1_s4                (cpu_sub_awvalid_dma_1_s4),
        .awready_dma_1_s4                (cpu_sub_awready_dma_1_s4),
        .wid_dma_1_s4                    (4'h0),
        .wdata_dma_1_s4                  (cpu_sub_wdata_dma_1_s4),
        .wstrb_dma_1_s4                  (cpu_sub_wstrb_dma_1_s4),
        .wlast_dma_1_s4                  (cpu_sub_wlast_dma_1_s4),
        .wvalid_dma_1_s4                 (cpu_sub_wvalid_dma_1_s4),
        .wready_dma_1_s4                 (cpu_sub_wready_dma_1_s4),
        .bid_dma_1_s4                    (cpu_sub_bid_dma_1_s4),
        .bresp_dma_1_s4                  (cpu_sub_bresp_dma_1_s4),
        .bvalid_dma_1_s4                 (cpu_sub_bvalid_dma_1_s4),
        .bready_dma_1_s4                 (cpu_sub_bready_dma_1_s4),
        .arid_dma_1_s4                   (cpu_sub_arid_dma_1_s4),
        .araddr_dma_1_s4                 (cpu_sub_araddr_dma_1_s4),
        .arlen_dma_1_s4                  (cpu_sub_arlen_dma_1_s4),
        .arsize_dma_1_s4                 (cpu_sub_arsize_dma_1_s4),
        .arburst_dma_1_s4                (cpu_sub_arburst_dma_1_s4),
        .arlock_dma_1_s4                 (cpu_arlock_dma_1_s4),
        .arcache_dma_1_s4                (cpu_sub_arcache_dma_1_s4),
        .arprot_dma_1_s4                 (cpu_sub_arprot_dma_1_s4),
        .arvalid_dma_1_s4                (cpu_sub_arvalid_dma_1_s4),
        .arready_dma_1_s4                (cpu_sub_arready_dma_1_s4),
        .rid_dma_1_s4                    (cpu_sub_rid_dma_1_s4),
        .rdata_dma_1_s4                  (cpu_sub_rdata_dma_1_s4),
        .rresp_dma_1_s4                  (cpu_sub_rresp_dma_1_s4),
        .rlast_dma_1_s4                  (cpu_sub_rlast_dma_1_s4),
        .rvalid_dma_1_s4                 (cpu_sub_rvalid_dma_1_s4),
        .rready_dma_1_s4                 (cpu_sub_rready_dma_1_s4),
        .wuser_dma_1_s4                  (cpu_sub_wuser_dma_1_s4),
        .awid_dma_2_s5                   (cpu_sub_awid_dma_2_s5),
        .awaddr_dma_2_s5                 (cpu_sub_awaddr_dma_2_s5),
        .awlen_dma_2_s5                  (cpu_sub_awlen_dma_2_s5),
        .awsize_dma_2_s5                 (cpu_sub_awsize_dma_2_s5),
        .awburst_dma_2_s5                (cpu_sub_awburst_dma_2_s5),
        .awlock_dma_2_s5                 (cpu_awlock_dma_2_s5),
        .awcache_dma_2_s5                (cpu_sub_awcache_dma_2_s5),
        .awprot_dma_2_s5                 (cpu_sub_awprot_dma_2_s5),
        .awvalid_dma_2_s5                (cpu_sub_awvalid_dma_2_s5),
        .awready_dma_2_s5                (cpu_sub_awready_dma_2_s5),
        .wid_dma_2_s5                    (4'h0),
        .wdata_dma_2_s5                  (cpu_sub_wdata_dma_2_s5),
        .wstrb_dma_2_s5                  (cpu_sub_wstrb_dma_2_s5),
        .wlast_dma_2_s5                  (cpu_sub_wlast_dma_2_s5),
        .wvalid_dma_2_s5                 (cpu_sub_wvalid_dma_2_s5),
        .wready_dma_2_s5                 (cpu_sub_wready_dma_2_s5),
        .bid_dma_2_s5                    (cpu_sub_bid_dma_2_s5),
        .bresp_dma_2_s5                  (cpu_sub_bresp_dma_2_s5),
        .bvalid_dma_2_s5                 (cpu_sub_bvalid_dma_2_s5),
        .bready_dma_2_s5                 (cpu_sub_bready_dma_2_s5),
        .arid_dma_2_s5                   (cpu_sub_arid_dma_2_s5),
        .araddr_dma_2_s5                 (cpu_sub_araddr_dma_2_s5),
        .arlen_dma_2_s5                  (cpu_sub_arlen_dma_2_s5),
        .arsize_dma_2_s5                 (cpu_sub_arsize_dma_2_s5),
        .arburst_dma_2_s5                (cpu_sub_arburst_dma_2_s5),
        .arlock_dma_2_s5                 (cpu_arlock_dma_2_s5),
        .arcache_dma_2_s5                (cpu_sub_arcache_dma_2_s5),
        .arprot_dma_2_s5                 (cpu_sub_arprot_dma_2_s5),
        .arvalid_dma_2_s5                (cpu_sub_arvalid_dma_2_s5),
        .arready_dma_2_s5                (cpu_sub_arready_dma_2_s5),
        .rid_dma_2_s5                    (cpu_sub_rid_dma_2_s5),
        .rdata_dma_2_s5                  (cpu_sub_rdata_dma_2_s5),
        .rresp_dma_2_s5                  (cpu_sub_rresp_dma_2_s5),
        .rlast_dma_2_s5                  (cpu_sub_rlast_dma_2_s5),
        .rvalid_dma_2_s5                 (cpu_sub_rvalid_dma_2_s5),
        .rready_dma_2_s5                 (cpu_sub_rready_dma_2_s5),
        .wuser_dma_2_s5                  (cpu_sub_wuser_dma_2_s5),
        .awid_hsp_hpdf_s6                (i_peri2port_wrap_awid_hsp_hpdf_s6),
        .awaddr_hsp_hpdf_s6              (i_peri2port_wrap_awaddr_hsp_hpdf_s6),
        .awlen_hsp_hpdf_s6               (i_peri2port_wrap_awlen_hsp_hpdf_s6),
        .awsize_hsp_hpdf_s6              (i_peri2port_wrap_awsize_hsp_hpdf_s6),
        .awburst_hsp_hpdf_s6             (i_peri2port_wrap_awburst_hsp_hpdf_s6),
        .awlock_hsp_hpdf_s6              (i_peri2port_wrap_awlock_hsp_hpdf_s6),
        .awcache_hsp_hpdf_s6             (i_peri2port_wrap_awcache_hsp_hpdf_s6),
        .awprot_hsp_hpdf_s6              (i_peri2port_wrap_awprot_hsp_hpdf_s6),
        .awvalid_hsp_hpdf_s6             (i_peri2port_wrap_awvalid_hsp_hpdf_s6),
        .awready_hsp_hpdf_s6             (o_peri2port_wrap_awready_hsp_hpdf_s6),
        .wdata_hsp_hpdf_s6               (i_peri2port_wrap_wdata_hsp_hpdf_s6),
        .wstrb_hsp_hpdf_s6               (i_peri2port_wrap_wstrb_hsp_hpdf_s6),
        .wlast_hsp_hpdf_s6               (i_peri2port_wrap_wlast_hsp_hpdf_s6),
        .wvalid_hsp_hpdf_s6              (i_peri2port_wrap_wvalid_hsp_hpdf_s6),
        .wready_hsp_hpdf_s6              (o_peri2port_wrap_wready_hsp_hpdf_s6),
        .bid_hsp_hpdf_s6                 (o_peri2port_wrap_bid_hsp_hpdf_s6),
        .bresp_hsp_hpdf_s6               (o_peri2port_wrap_bresp_hsp_hpdf_s6),
        .bvalid_hsp_hpdf_s6              (o_peri2port_wrap_bvalid_hsp_hpdf_s6),
        .bready_hsp_hpdf_s6              (i_peri2port_wrap_bready_hsp_hpdf_s6),
        .arid_hsp_hpdf_s6                (i_peri2port_wrap_arid_hsp_hpdf_s6),
        .araddr_hsp_hpdf_s6              (i_peri2port_wrap_araddr_hsp_hpdf_s6),
        .arlen_hsp_hpdf_s6               (i_peri2port_wrap_arlen_hsp_hpdf_s6),
        .arsize_hsp_hpdf_s6              (i_peri2port_wrap_arsize_hsp_hpdf_s6),
        .arburst_hsp_hpdf_s6             (i_peri2port_wrap_arburst_hsp_hpdf_s6),
        .arlock_hsp_hpdf_s6              (i_peri2port_wrap_arlock_hsp_hpdf_s6),
        .arcache_hsp_hpdf_s6             (i_peri2port_wrap_arcache_hsp_hpdf_s6),
        .arprot_hsp_hpdf_s6              (i_peri2port_wrap_arprot_hsp_hpdf_s6),
        .arvalid_hsp_hpdf_s6             (i_peri2port_wrap_arvalid_hsp_hpdf_s6),
        .arready_hsp_hpdf_s6             (o_peri2port_wrap_arready_hsp_hpdf_s6),
        .rid_hsp_hpdf_s6                 (o_peri2port_wrap_rid_hsp_hpdf_s6),
        .rdata_hsp_hpdf_s6               (o_peri2port_wrap_rdata_hsp_hpdf_s6),
        .rresp_hsp_hpdf_s6               (o_peri2port_wrap_rresp_hsp_hpdf_s6),
        .rlast_hsp_hpdf_s6               (o_peri2port_wrap_rlast_hsp_hpdf_s6),
        .rvalid_hsp_hpdf_s6              (o_peri2port_wrap_rvalid_hsp_hpdf_s6),
        .rready_hsp_hpdf_s6              (i_peri2port_wrap_rready_hsp_hpdf_s6),
        .wuser_hsp_hpdf_s6               (i_peri2port_wrap_wuser_hsp_hpdf_s6),
        .paddr_m2_cpu_peri               (cpu_paddr_m2_cpu_peri),
        .pselx_m2_cpu_peri               (cpu_pselx_m2_cpu_peri),
        .penable_m2_cpu_peri             (cpu_penable_m2_cpu_peri),
        .pwrite_m2_cpu_peri              (cpu_pwrite_m2_cpu_peri),
        .prdata_m2_cpu_peri              (cpu_prdata_m2_cpu_peri),
        .pwdata_m2_cpu_peri              (cpu_pwdata_m2_cpu_peri),
        .pready_m2_cpu_peri              (cpu_pready_m2_cpu_peri),
        .pslverr_m2_cpu_peri             (cpu_pslverr_m2_cpu_peri),
        .paddr_m3_main_peri              (o_cpu_paddr_m3_main_peri),
        .pselx_m3_main_peri              (o_cpu_pselx_m3_main_peri),
        .penable_m3_main_peri            (o_cpu_penable_m3_main_peri),
        .pwrite_m3_main_peri             (o_cpu_pwrite_m3_main_peri),
        .prdata_m3_main_peri             (i_cpu_prdata_m3_main_peri),
        .pwdata_m3_main_peri             (o_cpu_pwdata_m3_main_peri),
        .pready_m3_main_peri             (i_cpu_pready_m3_main_peri),
        .pslverr_m3_main_peri            (i_cpu_pslverr_m3_main_peri),
        .awid_m4_cpu2peri                (o_cpu_awid_m4_cpu2peri),
        .awaddr_m4_cpu2peri              (o_cpu_awaddr_m4_cpu2peri),
        .awlen_m4_cpu2peri               (o_cpu_awlen_m4_cpu2peri),
        .awsize_m4_cpu2peri              (o_cpu_awsize_m4_cpu2peri),
        .awburst_m4_cpu2peri             (o_cpu_awburst_m4_cpu2peri),
        .awlock_m4_cpu2peri              (o_cpu_awlock_m4_cpu2peri),
        .awcache_m4_cpu2peri             (o_cpu_awcache_m4_cpu2peri),
        .awprot_m4_cpu2peri              (o_cpu_awprot_m4_cpu2peri),
        .awvalid_m4_cpu2peri             (o_cpu_awvalid_m4_cpu2peri),
        .awready_m4_cpu2peri             (i_cpu_awready_m4_cpu2peri),
        .wdata_m4_cpu2peri               (o_cpu_wdata_m4_cpu2peri),
        .wstrb_m4_cpu2peri               (o_cpu_wstrb_m4_cpu2peri),
        .wlast_m4_cpu2peri               (o_cpu_wlast_m4_cpu2peri),
        .wvalid_m4_cpu2peri              (o_cpu_wvalid_m4_cpu2peri),
        .wready_m4_cpu2peri              (i_cpu_wready_m4_cpu2peri),
        .bid_m4_cpu2peri                 (i_cpu_bid_m4_cpu2peri),
        .bresp_m4_cpu2peri               (i_cpu_bresp_m4_cpu2peri),
        .bvalid_m4_cpu2peri              (i_cpu_bvalid_m4_cpu2peri),
        .bready_m4_cpu2peri              (o_cpu_bready_m4_cpu2peri),
        .arid_m4_cpu2peri                (o_cpu_arid_m4_cpu2peri),
        .araddr_m4_cpu2peri              (o_cpu_araddr_m4_cpu2peri),
        .arlen_m4_cpu2peri               (o_cpu_arlen_m4_cpu2peri),
        .arsize_m4_cpu2peri              (o_cpu_arsize_m4_cpu2peri),
        .arburst_m4_cpu2peri             (o_cpu_arburst_m4_cpu2peri),
        .arlock_m4_cpu2peri              (o_cpu_arlock_m4_cpu2peri),
        .arcache_m4_cpu2peri             (o_cpu_arcache_m4_cpu2peri),
        .arprot_m4_cpu2peri              (o_cpu_arprot_m4_cpu2peri),
        .arvalid_m4_cpu2peri             (o_cpu_arvalid_m4_cpu2peri),
        .arready_m4_cpu2peri             (i_cpu_arready_m4_cpu2peri),
        .rid_m4_cpu2peri                 (i_cpu_rid_m4_cpu2peri),
        .rdata_m4_cpu2peri               (i_cpu_rdata_m4_cpu2peri),
        .rresp_m4_cpu2peri               (i_cpu_rresp_m4_cpu2peri),
        .rlast_m4_cpu2peri               (i_cpu_rlast_m4_cpu2peri),
        .rvalid_m4_cpu2peri              (i_cpu_rvalid_m4_cpu2peri),
        .rready_m4_cpu2peri              (o_cpu_rready_m4_cpu2peri),
        .haddr_m1_sram                   (cpu_haddr_m1_sram),
        .hburst_m1_sram                  (cpu_hburst_m1_sram),
        .hprot_m1_sram                   (cpu_hprot_m1_sram),
        .hsize_m1_sram                   (cpu_hsize_m1_sram),
        .htrans_m1_sram                  (cpu_htrans_m1_sram),
        .hwdata_m1_sram                  (cpu_hwdata_m1_sram),
        .hwrite_m1_sram                  (cpu_hwrite_m1_sram),
        .hrdata_m1_sram                  (cpu_hrdata_m1_sram),
        .hresp_m1_sram                   (cpu_hresp_m1_sram),
        .hready_m1_sram                  (cpu_hready_m1_sram),
        .hwuser_m1_sram                  (cpu_hwuser_m1_sram),
        .haddr_m0_rom                    (cpu_haddr_m0_rom),
        .hburst_m0_rom                   (cpu_hburst_m0_rom),
        .hprot_m0_rom                    (cpu_hprot_m0_rom),
        .hsize_m0_rom                    (cpu_hsize_m0_rom),
        .htrans_m0_rom                   (cpu_htrans_m0_rom),
        .hwdata_m0_rom                   (cpu_hwdata_m0_rom),
        .hwrite_m0_rom                   (cpu_hwrite_m0_rom),
        .hrdata_m0_rom                   (cpu_hrdata_m0_rom),
        .hresp_m0_rom                    (cpu_hresp_m0_rom),
        .hready_m0_rom                   (cpu_hready_m0_rom),
        .paddr_m5_isp_hpdf               (o_cpu_paddr_m5_isp_hpdf),
        .pselx_m5_isp_hpdf               (o_cpu_pselx_m5_isp_hpdf),
        .penable_m5_isp_hpdf             (o_cpu_penable_m5_isp_hpdf),
        .pwrite_m5_isp_hpdf              (o_cpu_pwrite_m5_isp_hpdf),
        .prdata_m5_isp_hpdf              (i_cpu_prdata_m5_isp_hpdf),
        .pwdata_m5_isp_hpdf              (o_cpu_pwdata_m5_isp_hpdf),
        .pready_m5_isp_hpdf              (i_cpu_pready_m5_isp_hpdf),
        .pslverr_m5_isp_hpdf             (i_cpu_pslverr_m5_isp_hpdf),
        .i_bus_bclk                      (crm_cpu_o_clk_bus),
        .i_bus_bresetn                   (crm_cpu_o_rstn_bus),
        .i_coresight_xclk                (crm_cpu_o_clk_cpu_cs_etr),
        .i_coresight_xresetn             (crm_cpu_o_rstn_cpu_cs_etr),
        .i_cpu_xclk                      (crm_cpu_o_clken_cpu_a7_bus),
        .i_cpu_xresetn                   (crm_cpu_o_rstn_cpu_a7_core),
        .i_dma_bclk                      (crm_cpu_o_clk_bus),
        .i_dma_bresetn                   (crm_cpu_o_rstn_bus),
        .i_hsp_hpdfclk                   (crm_cpu_o_clk_rom),
        .i_hsp_hpdfresetn                (crm_cpu_o_rstn_rom),
        .i_peri_sclk                     (crm_cpu_o_clk_peri),
        .i_peri_sclken                   (1'h1),
        .i_peri_sresetn                  (crm_cpu_o_rstn_peri),
        .i_ram_bclk                      (crm_cpu_o_clk_bus),
        .i_ram_bresetn                   (crm_cpu_o_rstn_bus),
        .i_rom_isp_sclk                  (crm_cpu_o_clk_rom),
        .i_rom_isp_sclken                (1'h1),
        .i_rom_isp_sresetn               (crm_cpu_o_rstn_rom),
        .mainclk                         (crm_cpu_o_clk_bus),
        .mainclk_r                       (crm_cpu_o_clk_bus),
        .mainresetn                      (crm_cpu_o_rstn_bus),
        .mainresetn_r                    (crm_cpu_o_rstn_bus)
    );

    pll_top_cpu u_pll_top_cpu (
        .i_fin                           (i_clk_xtal),
        .i_p                             (crm_cpu_o_pll_p),
        .i_m                             (crm_cpu_o_pll_m),
        .i_s                             (crm_cpu_o_pll_s),
        .i_k                             (crm_cpu_o_pll_k),
        .i_extafc                        (crm_cpu_o_pll_extafc),
        .i_mfr                           (crm_cpu_o_pll_mfr),
        .i_mrr                           (crm_cpu_o_pll_mrr),
        .i_sel_pf                        (crm_cpu_o_pll_sel_pf),
        .i_icp                           (crm_cpu_o_pll_icp),
        .i_pbias_ctrl                    (crm_cpu_o_pll_pbias_ctrl),
        .i_pbias_ctrl_en                 (crm_cpu_o_pll_pbias_ctrl_en),
        .i_vco_boost                     (crm_cpu_o_pll_vco_boost),
        .i_resetb                        (crm_cpu_o_pll_resetb),
        .i_fsel                          (crm_cpu_o_pll_fsel),
        .i_fvco_en                       (crm_cpu_o_pll_fvco_en),
        .i_bypass                        (crm_cpu_o_pll_bypass),
        .i_sscg_en                       (crm_cpu_o_pll_sscg_en),
        .i_afc_enb                       (crm_cpu_o_pll_afc_enb),
        .i_afcinit_sel                   (crm_cpu_o_pll_afcinit_sel),
        .i_fout_mask                     (crm_cpu_o_pll_fout_mask),
        .i_lrd_en                        (crm_cpu_o_pll_lrd_en),
        .o_fout                          (pll_cpu_o_fout),
        .o_fvco_out                      (pll_cpu_o_fvco_out),
        .o_afc_code                      (pll_cpu_o_afc_code)
    );

    pnai70x_crm_cpu u_crm_cpu (
        .i_apb_pclk                      (i_clk_cpu_peri),
        .i_apb_prstn                     (i_rstn_cpu_peri),
        .i_apb_psel                      (cpu_sub_o_cpu_hpdf_crm_psel),
        .i_apb_penable                   (cpu_sub_o_cpu_hpdf_crm_penable),
        .i_apb_pwrite                    (cpu_sub_o_cpu_hpdf_crm_pwrite),
        .i_apb_paddr                     (cpu_sub_o_cpu_hpdf_crm_paddr),
        .i_apb_pwdata                    (cpu_sub_o_cpu_hpdf_crm_pwdata),
        .o_apb_prdata                    (cpu_sub_i_cpu_hpdf_crm_prdata),
        .i_rstn_peri                     (i_rstn_cpu_peri),
        .o_pll_resetb                    (crm_cpu_o_pll_resetb),
        .o_pll_bypass                    (crm_cpu_o_pll_bypass),
        .o_pll_p                         (crm_cpu_o_pll_p),
        .o_pll_m                         (crm_cpu_o_pll_m),
        .o_pll_s                         (crm_cpu_o_pll_s),
        .o_pll_k                         (crm_cpu_o_pll_k),
        .o_pll_extafc                    (crm_cpu_o_pll_extafc),
        .o_pll_mfr                       (crm_cpu_o_pll_mfr),
        .o_pll_mrr                       (crm_cpu_o_pll_mrr),
        .o_pll_sel_pf                    (crm_cpu_o_pll_sel_pf),
        .o_pll_icp                       (crm_cpu_o_pll_icp),
        .o_pll_pbias_ctrl                (crm_cpu_o_pll_pbias_ctrl),
        .o_pll_pbias_ctrl_en             (crm_cpu_o_pll_pbias_ctrl_en),
        .o_pll_vco_boost                 (crm_cpu_o_pll_vco_boost),
        .o_pll_fsel                      (crm_cpu_o_pll_fsel),
        .o_pll_fvco_en                   (crm_cpu_o_pll_fvco_en),
        .o_pll_sscg_en                   (crm_cpu_o_pll_sscg_en),
        .o_pll_afc_enb                   (crm_cpu_o_pll_afc_enb),
        .o_pll_afcinit_sel               (crm_cpu_o_pll_afcinit_sel),
        .o_pll_fout_mask                 (crm_cpu_o_pll_fout_mask),
        .o_pll_lrd_en                    (crm_cpu_o_pll_lrd_en),
        .i_pll_fvco_out                  (pll_cpu_o_fvco_out),
        .i_pll_afc_code                  (pll_cpu_o_afc_code),
        .i_clk_xtal                      (i_clk_xtal),
        .i_clk_pll_cpu                   (pll_cpu_o_fout),
        .i_clk_cpu_bus                   (i_clk_cpu_bus),
        .i_clk_cpu_rom                   (i_clk_cpu_rom),
        .i_clk_cpu_peri                  (i_clk_cpu_peri),
        .o_clk_cpu_a7_core               (crm_cpu_o_clk_cpu_a7_core),
        .o_rstn_cpu_a7_core              (crm_cpu_o_rstn_cpu_a7_core),
        .o_rstn_ca7d_l2                  (crm_cpu_o_rstn_ca7d_l2),
        .o_rstn_ca7d_core0               (crm_cpu_o_rstn_ca7d_core0),
        .o_rstn_ca7d_core1               (crm_cpu_o_rstn_ca7d_core1),
        .o_rstn_ca7d_core0_por           (crm_cpu_o_rstn_ca7d_core0_por),
        .o_rstn_ca7d_core1_por           (crm_cpu_o_rstn_ca7d_core1_por),
        .o_rstn_ca7d_dbg0                (crm_cpu_o_rstn_ca7d_dbg0),
        .o_rstn_ca7d_dbg1                (crm_cpu_o_rstn_ca7d_dbg1),
        .o_rstn_ca7d_etm0                (crm_cpu_o_rstn_ca7d_etm0),
        .o_rstn_ca7d_etm1                (crm_cpu_o_rstn_ca7d_etm1),
        .o_rstn_ca7d_socdbg              (crm_cpu_o_rstn_ca7d_socdbg),
        .o_rstn_cs_porrst                (crm_cpu_o_rstn_cs_porrst),
        .o_clk_cpu_cs_atb                (crm_cpu_o_clk_cpu_cs_atb),
        .o_rstn_cpu_cs_atb               (crm_cpu_o_rstn_cpu_cs_atb),
        .o_clk_cpu_cs_etr                (crm_cpu_o_clk_cpu_cs_etr),
        .o_rstn_cpu_cs_etr               (crm_cpu_o_rstn_cpu_cs_etr),
        .o_clk_cpu_cs_trace              (crm_cpu_o_clk_cpu_cs_trace),
        .o_rstn_cpu_cs_trace             (crm_cpu_o_rstn_cpu_cs_trace),
        .o_clk_bus                       (crm_cpu_o_clk_bus),
        .o_rstn_bus                      (crm_cpu_o_rstn_bus),
        .o_clk_bus_dma0                  (crm_cpu_o_clk_bus_dma0),
        .o_rstn_bus_dma0                 (crm_cpu_o_rstn_bus_dma0),
        .o_clk_bus_dma1                  (crm_cpu_o_clk_bus_dma1),
        .o_rstn_bus_dma1                 (crm_cpu_o_rstn_bus_dma1),
        .o_clk_bus_dma2                  (crm_cpu_o_clk_bus_dma2),
        .o_rstn_bus_dma2                 (crm_cpu_o_rstn_bus_dma2),
        .o_clk_bus_ram                   (crm_cpu_o_clk_bus_ram),
        .o_rstn_bus_ram                  (crm_cpu_o_rstn_bus_ram),
        .o_clk_rom                       (crm_cpu_o_clk_rom),
        .o_rstn_rom                      (crm_cpu_o_rstn_rom),
        .o_clk_peri                      (crm_cpu_o_clk_peri),
        .o_rstn_peri                     (crm_cpu_o_rstn_peri),
        .o_clk_peri_cs_sys_p             (crm_cpu_o_clk_peri_cs_sys_p),
        .o_clk_peri_cs_dap               (crm_cpu_o_clk_peri_cs_dap),
        .o_clk_peri_cs_apb_dap           (crm_cpu_o_clk_peri_cs_apb_dap),
        .o_clk_peri_dma0                 (crm_cpu_o_clk_peri_dma0),
        .o_rstn_peri_dma0                (crm_cpu_o_rstn_peri_dma0),
        .o_clk_peri_dma1                 (crm_cpu_o_clk_peri_dma1),
        .o_rstn_peri_dma1                (crm_cpu_o_rstn_peri_dma1),
        .o_clk_peri_dma2                 (crm_cpu_o_clk_peri_dma2),
        .o_rstn_peri_dma2                (crm_cpu_o_rstn_peri_dma2),
        .o_pll_cpu_div                   (o_pll_cpu_div),
        .o_clken_cpu_a7_bus              (crm_cpu_o_clken_cpu_a7_bus),
        .o_clken_cpu_a7_atc              (crm_cpu_o_clken_cpu_a7_atc),
        .i_rstn_cpu_por                  (i_rstn_cpu_por),
        .i_rstn_cpu_core                 (i_rstn_cpu_core),
        .i_rstn_cpu_etc                  (i_rstn_cpu_etc),
        .i_scan_clk                      (i_test_clk),
        .i_scan_mode                     (i_test_mode),
        .i_scan_rstn                     (1'h0)
    );

endmodule