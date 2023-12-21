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
// File name : cpu_hpdf
// Version : v1.1
// Description :
// Simulator : NC Verilog
// Created by : bhoh
// Date : 2023-10-20  14:46
//==============================================================================

module cpu_hpdf (
    output  [  4:  0]  o_awid_cpu2main_m6,
    output  [ 31:  0]  o_awaddr_cpu2main_m6,
    output  [  7:  0]  o_awlen_cpu2main_m6,
    output  [  2:  0]  o_awsize_cpu2main_m6,
    output  [  1:  0]  o_awburst_cpu2main_m6,
    output             o_awlock_cpu2main_m6,
    output  [  3:  0]  o_awcache_cpu2main_m6,
    output  [  2:  0]  o_awprot_cpu2main_m6,
    output             o_awvalid_cpu2main_m6,
    input              i_awready_cpu2main_m6,
    output  [127:  0]  o_wdata_cpu2main_m6,
    output  [ 15:  0]  o_wstrb_cpu2main_m6,
    output             o_wlast_cpu2main_m6,
    output             o_wvalid_cpu2main_m6,
    input              i_wready_cpu2main_m6,
    input   [  4:  0]  i_bid_cpu2main_m6,
    input   [  1:  0]  i_bresp_cpu2main_m6,
    input              i_bvalid_cpu2main_m6,
    output             o_bready_cpu2main_m6,
    output  [  4:  0]  o_arid_cpu2main_m6,
    output  [ 31:  0]  o_araddr_cpu2main_m6,
    output  [  7:  0]  o_arlen_cpu2main_m6,
    output  [  2:  0]  o_arsize_cpu2main_m6,
    output  [  1:  0]  o_arburst_cpu2main_m6,
    output             o_arlock_cpu2main_m6,
    output  [  3:  0]  o_arcache_cpu2main_m6,
    output  [  2:  0]  o_arprot_cpu2main_m6,
    output             o_arvalid_cpu2main_m6,
    input              i_arready_cpu2main_m6,
    input   [  4:  0]  i_rid_cpu2main_m6,
    input   [127:  0]  i_rdata_cpu2main_m6,
    input   [  1:  0]  i_rresp_cpu2main_m6,
    input              i_rlast_cpu2main_m6,
    input              i_rvalid_cpu2main_m6,
    output             o_rready_cpu2main_m6,
    output  [  1:  0]  o_awuser_cpu2main_m6,
    output  [  1:  0]  o_aruser_cpu2main_m6,
    output  [ 31:  0]  o_paddr_cpu2mvp_m5,
    output             o_pselx_cpu2mvp_m5,
    output             o_penable_cpu2mvp_m5,
    output             o_pwrite_cpu2mvp_m5,
    input   [ 31:  0]  i_prdata_cpu2mvp_m5,
    output  [ 31:  0]  o_pwdata_cpu2mvp_m5,
    input              i_pready_cpu2mvp_m5,
    input              i_pslverr_cpu2mvp_m5,
    output  [  4:  0]  o_awid_cpu2peri_m7,
    output  [ 31:  0]  o_awaddr_cpu2peri_m7,
    output  [  7:  0]  o_awlen_cpu2peri_m7,
    output  [  2:  0]  o_awsize_cpu2peri_m7,
    output  [  1:  0]  o_awburst_cpu2peri_m7,
    output             o_awlock_cpu2peri_m7,
    output  [  3:  0]  o_awcache_cpu2peri_m7,
    output  [  2:  0]  o_awprot_cpu2peri_m7,
    output             o_awvalid_cpu2peri_m7,
    input              i_awready_cpu2peri_m7,
    output  [ 31:  0]  o_wdata_cpu2peri_m7,
    output  [  3:  0]  o_wstrb_cpu2peri_m7,
    output             o_wlast_cpu2peri_m7,
    output             o_wvalid_cpu2peri_m7,
    input              i_wready_cpu2peri_m7,
    input   [  4:  0]  i_bid_cpu2peri_m7,
    input   [  1:  0]  i_bresp_cpu2peri_m7,
    input              i_bvalid_cpu2peri_m7,
    output             o_bready_cpu2peri_m7,
    output  [  4:  0]  o_arid_cpu2peri_m7,
    output  [ 31:  0]  o_araddr_cpu2peri_m7,
    output  [  7:  0]  o_arlen_cpu2peri_m7,
    output  [  2:  0]  o_arsize_cpu2peri_m7,
    output  [  1:  0]  o_arburst_cpu2peri_m7,
    output             o_arlock_cpu2peri_m7,
    output  [  3:  0]  o_arcache_cpu2peri_m7,
    output  [  2:  0]  o_arprot_cpu2peri_m7,
    output             o_arvalid_cpu2peri_m7,
    input              i_arready_cpu2peri_m7,
    input   [  4:  0]  i_rid_cpu2peri_m7,
    input   [ 31:  0]  i_rdata_cpu2peri_m7,
    input   [  1:  0]  i_rresp_cpu2peri_m7,
    input              i_rlast_cpu2peri_m7,
    input              i_rvalid_cpu2peri_m7,
    output             o_rready_cpu2peri_m7,
    output  [ 31:  0]  o_paddr_main_peri_m4,
    output             o_pselx_main_peri_m4,
    output             o_penable_main_peri_m4,
    output             o_pwrite_main_peri_m4,
    input   [ 31:  0]  i_prdata_main_peri_m4,
    output  [ 31:  0]  o_pwdata_main_peri_m4,
    input              i_pready_main_peri_m4,
    input              i_pslverr_main_peri_m4,
    input              i_test_bypass,
    input              i_rstn_cpu_peri,
    input              i_clk_cpu_peri,
    input              i_clk_cpu,
    input              i_clk_cpu2peri,
    input              i_clk_main_system,
    input              i_clk_cpu2mvp,
    input              i_clk_cpu2main,
    input              i_sfmc_sclk_y,
    input              i_clk_xtal_y,
    input              i_test_clk200,
    input              i_test_clk100,
    input              i_rstn_mem,
    input              i_rstn_bus,
    input              i_rstn_ip,
    input              i_scan_clk,
    input              i_scan_mode,
    input              i_test_rstn,
    input              i_rstn_core,
    input   [ 38:  0]  i_ema,
    input   [  1:  0]  i_boot_sel_y,
    input              i_test_mode,
    input              t_jtag_tck,
    input              i_jtag_tck_y,
    input              i_jtag_tmms_y,
    input              i_jtag_ntrst_y,
    output             o_jtag_tmms_a,
    output             o_jtag_tmms_oe,
    input              i_jtag_tdi_y,
    output             o_jtag_tdo_a,
    output             o_jtag_tdo_oe,
    input   [239:  0]  i_irq_cpu,
    output             o_cm3_traceclk_a,
    output  [  3:  0]  o_cm3_tracedata_a,
    input              i_nfc_cfgadvflash_y,
    input              i_nfc_cfgaddrcycle_y,
    input              i_nfc_cfgpagesize_y,
    output             o_irq_nfc_rnb,
    output             o_irq_nfc,
    input   [  7:  0]  i_nfc_data_y,
    output  [  7:  0]  o_nfc_data_a,
    output  [  7:  0]  o_nfc_data_oe,
    input              i_nfc_rnb_y,
    output             o_nfc_cle_a,
    output             o_nfc_ale_a,
    output             o_nfc_nce_a,
    output             o_nfc_nre_a,
    output             o_nfc_nwe_a,
    output             o_irq_sfmc,
    output             o_sfmc_sclk_a,
    output             o_sfmc_sclk_oe,
    output             o_sfmc_csn_a,
    input   [  3:  0]  i_sfmc_data_y,
    output  [  3:  0]  o_sfmc_data_a,
    output  [  3:  0]  o_sfmc_data_oe,
    input   [ 19:  0]  i_dmac_breq,
    input   [ 19:  0]  i_dmac_sreq,
    input   [ 19:  0]  i_dmac_lbreq,
    input   [ 19:  0]  i_dmac_lsreq,
    output  [ 19:  0]  o_dmac_clr,
    output  [ 19:  0]  o_dmac_tc,
    output             o_irq_dmac0,
    output             o_irq_dmac1,
    output             o_irq_dmac2,
    output             o_irq_dmac3,
    output             o_irq_dmac4,
    output             o_irq_dmac5,
    output             o_irq_dmac6,
    output             o_irq_dmac7,
    output             o_irq_abort_dmac
);

    wire    [ 31:0]  cpu_bus_haddr_cpu2mat_m0;
    wire    [  2:0]  cpu_bus_hburst_cpu2mat_m0;
    wire    [  3:0]  cpu_bus_hprot_cpu2mat_m0;
    wire    [  2:0]  cpu_bus_hsize_cpu2mat_m0;
    wire    [  1:0]  cpu_bus_htrans_cpu2mat_m0;
    wire    [ 31:0]  cpu_bus_hwdata_cpu2mat_m0;
    wire             cpu_bus_hwrite_cpu2mat_m0;
    wire    [ 31:0]  cpu_bus_hrdata_cpu2mat_m0;
    wire             cpu_bus_hresp_cpu2mat_m0;
    wire             cpu_bus_hready_cpu2mat_m0;
    wire    [ 31:0]  cpu_bus_paddr_cpu_peri0_m1;
    wire             cpu_bus_pselx_cpu_peri0_m1;
    wire             cpu_bus_penable_cpu_peri0_m1;
    wire             cpu_bus_pwrite_cpu_peri0_m1;
    wire    [ 31:0]  cpu_bus_prdata_cpu_peri0_m1;
    wire    [ 31:0]  cpu_bus_pwdata_cpu_peri0_m1;
    wire             cpu_bus_pready_cpu_peri0_m1;
    wire             cpu_bus_pslverr_cpu_peri0_m1;
    wire    [ 31:0]  cpu_bus_haddr_cpu_peri1_m2;
    wire    [  2:0]  cpu_bus_hburst_cpu_peri1_m2;
    wire    [  3:0]  cpu_bus_hprot_cpu_peri1_m2;
    wire    [  2:0]  cpu_bus_hsize_cpu_peri1_m2;
    wire    [  1:0]  cpu_bus_htrans_cpu_peri1_m2;
    wire    [ 31:0]  cpu_bus_hwdata_cpu_peri1_m2;
    wire             cpu_bus_hwrite_cpu_peri1_m2;
    wire    [ 31:0]  cpu_bus_hrdata_cpu_peri1_m2;
    wire             cpu_bus_hresp_cpu_peri1_m2;
    wire             cpu_bus_hready_cpu_peri1_m2;
    wire    [ 31:0]  cpu_bus_haddr_sfmc_auto_m3;
    wire    [  2:0]  cpu_bus_hburst_sfmc_auto_m3;
    wire    [  3:0]  cpu_bus_hprot_sfmc_auto_m3;
    wire    [  2:0]  cpu_bus_hsize_sfmc_auto_m3;
    wire    [  1:0]  cpu_bus_htrans_sfmc_auto_m3;
    wire    [ 31:0]  cpu_bus_hwdata_sfmc_auto_m3;
    wire             cpu_bus_hwrite_sfmc_auto_m3;
    wire    [ 31:0]  cpu_bus_hrdata_sfmc_auto_m3;
    wire             cpu_bus_hresp_sfmc_auto_m3;
    wire             cpu_bus_hready_sfmc_auto_m3;
    wire             cpu_crm_o_clk_cpu;
    wire             cpu_crm_o_rstn_cpu;
    wire             cpu_crm_o_clk_cpu_bus;
    wire             cpu_crm_o_rstn_cpu_bus;
    wire             cpu_crm_o_clk_sram;
    wire             cpu_crm_o_rstn_sram;
    wire             cpu_crm_o_clk_rom;
    wire             cpu_crm_o_rstn_rom;
    wire             cpu_crm_o_mclk_dma;
    wire             cpu_crm_o_rstn_mclk_dma;
    wire             cpu_crm_o_sclk_dma;
    wire             cpu_crm_o_rstn_sclk_dma;
    wire             cpu_crm_o_clk_cpu_peri;
    wire             cpu_crm_o_rstn_cpu_peri;
    wire             cpu_crm_o_clk_nfc;
    wire             cpu_crm_o_rstn_nfc;
    wire             cpu_crm_o_clk_sfmc;
    wire             cpu_crm_o_rstn_sfmc;
    wire             cpu_crm_o_clk_sfmc_flash;
    wire             cpu_crm_o_rstn_sfmc_flash;
    wire             cpu_crm_o_clk_tracein;
    wire             cpu_crm_o_clk_cpu2peri;
    wire             cpu_crm_o_rstn_cpu2peri;
    wire             cpu_crm_o_clk_main_system;
    wire             cpu_crm_o_rstn_main_system;
    wire             cpu_crm_o_clk_cpu2mvp;
    wire             cpu_crm_o_rstn_cpu2mvp;
    wire             cpu_crm_o_clk_cpu2main;
    wire             cpu_crm_o_rstn_cpu2main;
    wire             cpu_crm_o_clk_sfmc_pad;
    wire             cpu_crm_o_clken_dma330;
    wire             cpu_crm_o_cpu_stclk;
    wire             cpu_sub_o_rstn_core;
    wire             cpu_sub_o_crm_apb_psel;
    wire             cpu_sub_o_crm_apb_penable;
    wire             cpu_sub_o_crm_apb_pwrite;
    wire    [ 11:0]  cpu_sub_o_crm_apb_paddr;
    wire    [ 31:0]  cpu_sub_o_crm_apb_pwdata;
    wire    [ 31:0]  cpu_sub_i_crm_apb_prdata;
    wire    [ 31:0]  cpu_sub_o_haddr_mat2cpu_s0;
    wire    [  2:0]  cpu_sub_o_hburst_mat2cpu_s0;
    wire    [  3:0]  cpu_sub_o_hprot_mat2cpu_s0;
    wire    [  2:0]  cpu_sub_o_hsize_mat2cpu_s0;
    wire    [  1:0]  cpu_sub_o_htrans_mat2cpu_s0;
    wire    [ 31:0]  cpu_sub_o_hwdata_mat2cpu_s0;
    wire             cpu_sub_o_hwrite_mat2cpu_s0;
    wire    [ 31:0]  cpu_sub_i_hrdata_mat2cpu_s0;
    wire             cpu_sub_i_hreadyout_mat2cpu_s0;
    wire             cpu_sub_i_hresp_mat2cpu_s0;
    wire             cpu_sub_o_hselx_mat2cpu_s0;
    wire             cpu_sub_o_hready_mat2cpu_s0;
    wire    [  1:0]  cpu_sub_o_hauser_mat2cpu_s0;
    wire    [  3:0]  cpu_sub_o_awid_dma330_s1;
    wire    [ 31:0]  cpu_sub_o_awaddr_dma330_s1;
    wire    [  3:0]  cpu_sub_o_awlen_dma330_s1;
    wire    [  2:0]  cpu_sub_o_awsize_dma330_s1;
    wire    [  1:0]  cpu_sub_o_awburst_dma330_s1;
    wire    [  1:0]  cpu_sub_o_awlock_dma330_s1;
    wire    [  3:0]  cpu_sub_o_awcache_dma330_s1;
    wire    [  2:0]  cpu_sub_o_awprot_dma330_s1;
    wire             cpu_sub_o_awvalid_dma330_s1;
    wire             cpu_sub_i_awready_dma330_s1;
    wire    [  3:0]  cpu_sub_o_wid_dma330_s1;
    wire    [127:0]  cpu_sub_o_wdata_dma330_s1;
    wire    [ 15:0]  cpu_sub_o_wstrb_dma330_s1;
    wire             cpu_sub_o_wlast_dma330_s1;
    wire             cpu_sub_o_wvalid_dma330_s1;
    wire             cpu_sub_i_wready_dma330_s1;
    wire    [  3:0]  cpu_sub_i_bid_dma330_s1;
    wire    [  1:0]  cpu_sub_i_bresp_dma330_s1;
    wire             cpu_sub_i_bvalid_dma330_s1;
    wire             cpu_sub_o_bready_dma330_s1;
    wire    [  3:0]  cpu_sub_o_arid_dma330_s1;
    wire    [ 31:0]  cpu_sub_o_araddr_dma330_s1;
    wire    [  3:0]  cpu_sub_o_arlen_dma330_s1;
    wire    [  2:0]  cpu_sub_o_arsize_dma330_s1;
    wire    [  1:0]  cpu_sub_o_arburst_dma330_s1;
    wire    [  1:0]  cpu_sub_o_arlock_dma330_s1;
    wire    [  3:0]  cpu_sub_o_arcache_dma330_s1;
    wire    [  2:0]  cpu_sub_o_arprot_dma330_s1;
    wire             cpu_sub_o_arvalid_dma330_s1;
    wire             cpu_sub_i_arready_dma330_s1;
    wire    [  3:0]  cpu_sub_i_rid_dma330_s1;
    wire    [127:0]  cpu_sub_i_rdata_dma330_s1;
    wire    [  1:0]  cpu_sub_i_rresp_dma330_s1;
    wire             cpu_sub_i_rlast_dma330_s1;
    wire             cpu_sub_i_rvalid_dma330_s1;
    wire             cpu_sub_o_rready_dma330_s1;
    wire    [  1:0]  cpu_sub_o_aruser_dma330_s1;
    wire    [  1:0]  cpu_sub_o_awuser_dma330_s1;


    nic400_cpu_bus_r0p06 u_cpu_bus (
        .awid_cpu2main_m6         (o_awid_cpu2main_m6),
        .awaddr_cpu2main_m6       (o_awaddr_cpu2main_m6),
        .awlen_cpu2main_m6        (o_awlen_cpu2main_m6),
        .awsize_cpu2main_m6       (o_awsize_cpu2main_m6),
        .awburst_cpu2main_m6      (o_awburst_cpu2main_m6),
        .awlock_cpu2main_m6       (o_awlock_cpu2main_m6),
        .awcache_cpu2main_m6      (o_awcache_cpu2main_m6),
        .awprot_cpu2main_m6       (o_awprot_cpu2main_m6),
        .awvalid_cpu2main_m6      (o_awvalid_cpu2main_m6),
        .awready_cpu2main_m6      (i_awready_cpu2main_m6),
        .wdata_cpu2main_m6        (o_wdata_cpu2main_m6),
        .wstrb_cpu2main_m6        (o_wstrb_cpu2main_m6),
        .wlast_cpu2main_m6        (o_wlast_cpu2main_m6),
        .wvalid_cpu2main_m6       (o_wvalid_cpu2main_m6),
        .wready_cpu2main_m6       (i_wready_cpu2main_m6),
        .bid_cpu2main_m6          (i_bid_cpu2main_m6),
        .bresp_cpu2main_m6        (i_bresp_cpu2main_m6),
        .bvalid_cpu2main_m6       (i_bvalid_cpu2main_m6),
        .bready_cpu2main_m6       (o_bready_cpu2main_m6),
        .arid_cpu2main_m6         (o_arid_cpu2main_m6),
        .araddr_cpu2main_m6       (o_araddr_cpu2main_m6),
        .arlen_cpu2main_m6        (o_arlen_cpu2main_m6),
        .arsize_cpu2main_m6       (o_arsize_cpu2main_m6),
        .arburst_cpu2main_m6      (o_arburst_cpu2main_m6),
        .arlock_cpu2main_m6       (o_arlock_cpu2main_m6),
        .arcache_cpu2main_m6      (o_arcache_cpu2main_m6),
        .arprot_cpu2main_m6       (o_arprot_cpu2main_m6),
        .arvalid_cpu2main_m6      (o_arvalid_cpu2main_m6),
        .arready_cpu2main_m6      (i_arready_cpu2main_m6),
        .rid_cpu2main_m6          (i_rid_cpu2main_m6),
        .rdata_cpu2main_m6        (i_rdata_cpu2main_m6),
        .rresp_cpu2main_m6        (i_rresp_cpu2main_m6),
        .rlast_cpu2main_m6        (i_rlast_cpu2main_m6),
        .rvalid_cpu2main_m6       (i_rvalid_cpu2main_m6),
        .rready_cpu2main_m6       (o_rready_cpu2main_m6),
        .awuser_cpu2main_m6       (o_awuser_cpu2main_m6),
        .aruser_cpu2main_m6       (o_aruser_cpu2main_m6),
        .paddr_cpu2mvp_m5         (o_paddr_cpu2mvp_m5),
        .pselx_cpu2mvp_m5         (o_pselx_cpu2mvp_m5),
        .penable_cpu2mvp_m5       (o_penable_cpu2mvp_m5),
        .pwrite_cpu2mvp_m5        (o_pwrite_cpu2mvp_m5),
        .prdata_cpu2mvp_m5        (i_prdata_cpu2mvp_m5),
        .pwdata_cpu2mvp_m5        (o_pwdata_cpu2mvp_m5),
        .pready_cpu2mvp_m5        (i_pready_cpu2mvp_m5),
        .pslverr_cpu2mvp_m5       (i_pslverr_cpu2mvp_m5),
        .awid_cpu2peri_m7         (o_awid_cpu2peri_m7),
        .awaddr_cpu2peri_m7       (o_awaddr_cpu2peri_m7),
        .awlen_cpu2peri_m7        (o_awlen_cpu2peri_m7),
        .awsize_cpu2peri_m7       (o_awsize_cpu2peri_m7),
        .awburst_cpu2peri_m7      (o_awburst_cpu2peri_m7),
        .awlock_cpu2peri_m7       (o_awlock_cpu2peri_m7),
        .awcache_cpu2peri_m7      (o_awcache_cpu2peri_m7),
        .awprot_cpu2peri_m7       (o_awprot_cpu2peri_m7),
        .awvalid_cpu2peri_m7      (o_awvalid_cpu2peri_m7),
        .awready_cpu2peri_m7      (i_awready_cpu2peri_m7),
        .wdata_cpu2peri_m7        (o_wdata_cpu2peri_m7),
        .wstrb_cpu2peri_m7        (o_wstrb_cpu2peri_m7),
        .wlast_cpu2peri_m7        (o_wlast_cpu2peri_m7),
        .wvalid_cpu2peri_m7       (o_wvalid_cpu2peri_m7),
        .wready_cpu2peri_m7       (i_wready_cpu2peri_m7),
        .bid_cpu2peri_m7          (i_bid_cpu2peri_m7),
        .bresp_cpu2peri_m7        (i_bresp_cpu2peri_m7),
        .bvalid_cpu2peri_m7       (i_bvalid_cpu2peri_m7),
        .bready_cpu2peri_m7       (o_bready_cpu2peri_m7),
        .arid_cpu2peri_m7         (o_arid_cpu2peri_m7),
        .araddr_cpu2peri_m7       (o_araddr_cpu2peri_m7),
        .arlen_cpu2peri_m7        (o_arlen_cpu2peri_m7),
        .arsize_cpu2peri_m7       (o_arsize_cpu2peri_m7),
        .arburst_cpu2peri_m7      (o_arburst_cpu2peri_m7),
        .arlock_cpu2peri_m7       (o_arlock_cpu2peri_m7),
        .arcache_cpu2peri_m7      (o_arcache_cpu2peri_m7),
        .arprot_cpu2peri_m7       (o_arprot_cpu2peri_m7),
        .arvalid_cpu2peri_m7      (o_arvalid_cpu2peri_m7),
        .arready_cpu2peri_m7      (i_arready_cpu2peri_m7),
        .rid_cpu2peri_m7          (i_rid_cpu2peri_m7),
        .rdata_cpu2peri_m7        (i_rdata_cpu2peri_m7),
        .rresp_cpu2peri_m7        (i_rresp_cpu2peri_m7),
        .rlast_cpu2peri_m7        (i_rlast_cpu2peri_m7),
        .rvalid_cpu2peri_m7       (i_rvalid_cpu2peri_m7),
        .rready_cpu2peri_m7       (o_rready_cpu2peri_m7),
        .haddr_cpu2mat_m0         (cpu_bus_haddr_cpu2mat_m0),
        .hburst_cpu2mat_m0        (cpu_bus_hburst_cpu2mat_m0),
        .hprot_cpu2mat_m0         (cpu_bus_hprot_cpu2mat_m0),
        .hsize_cpu2mat_m0         (cpu_bus_hsize_cpu2mat_m0),
        .htrans_cpu2mat_m0        (cpu_bus_htrans_cpu2mat_m0),
        .hwdata_cpu2mat_m0        (cpu_bus_hwdata_cpu2mat_m0),
        .hwrite_cpu2mat_m0        (cpu_bus_hwrite_cpu2mat_m0),
        .hrdata_cpu2mat_m0        (cpu_bus_hrdata_cpu2mat_m0),
        .hresp_cpu2mat_m0         (cpu_bus_hresp_cpu2mat_m0),
        .hready_cpu2mat_m0        (cpu_bus_hready_cpu2mat_m0),
        .awid_dma330_s1           (cpu_sub_o_awid_dma330_s1),
        .awaddr_dma330_s1         (cpu_sub_o_awaddr_dma330_s1),
        .awlen_dma330_s1          (cpu_sub_o_awlen_dma330_s1),
        .awsize_dma330_s1         (cpu_sub_o_awsize_dma330_s1),
        .awburst_dma330_s1        (cpu_sub_o_awburst_dma330_s1),
        .awlock_dma330_s1         (cpu_sub_o_awlock_dma330_s1),
        .awcache_dma330_s1        (cpu_sub_o_awcache_dma330_s1),
        .awprot_dma330_s1         (cpu_sub_o_awprot_dma330_s1),
        .awvalid_dma330_s1        (cpu_sub_o_awvalid_dma330_s1),
        .awready_dma330_s1        (cpu_sub_i_awready_dma330_s1),
        .wid_dma330_s1            (cpu_sub_o_wid_dma330_s1),
        .wdata_dma330_s1          (cpu_sub_o_wdata_dma330_s1),
        .wstrb_dma330_s1          (cpu_sub_o_wstrb_dma330_s1),
        .wlast_dma330_s1          (cpu_sub_o_wlast_dma330_s1),
        .wvalid_dma330_s1         (cpu_sub_o_wvalid_dma330_s1),
        .wready_dma330_s1         (cpu_sub_i_wready_dma330_s1),
        .bid_dma330_s1            (cpu_sub_i_bid_dma330_s1),
        .bresp_dma330_s1          (cpu_sub_i_bresp_dma330_s1),
        .bvalid_dma330_s1         (cpu_sub_i_bvalid_dma330_s1),
        .bready_dma330_s1         (cpu_sub_o_bready_dma330_s1),
        .arid_dma330_s1           (cpu_sub_o_arid_dma330_s1),
        .araddr_dma330_s1         (cpu_sub_o_araddr_dma330_s1),
        .arlen_dma330_s1          (cpu_sub_o_arlen_dma330_s1),
        .arsize_dma330_s1         (cpu_sub_o_arsize_dma330_s1),
        .arburst_dma330_s1        (cpu_sub_o_arburst_dma330_s1),
        .arlock_dma330_s1         (cpu_sub_o_arlock_dma330_s1),
        .arcache_dma330_s1        (cpu_sub_o_arcache_dma330_s1),
        .arprot_dma330_s1         (cpu_sub_o_arprot_dma330_s1),
        .arvalid_dma330_s1        (cpu_sub_o_arvalid_dma330_s1),
        .arready_dma330_s1        (cpu_sub_i_arready_dma330_s1),
        .rid_dma330_s1            (cpu_sub_i_rid_dma330_s1),
        .rdata_dma330_s1          (cpu_sub_i_rdata_dma330_s1),
        .rresp_dma330_s1          (cpu_sub_i_rresp_dma330_s1),
        .rlast_dma330_s1          (cpu_sub_i_rlast_dma330_s1),
        .rvalid_dma330_s1         (cpu_sub_i_rvalid_dma330_s1),
        .rready_dma330_s1         (cpu_sub_o_rready_dma330_s1),
        .awuser_dma330_s1         (cpu_sub_o_awuser_dma330_s1),
        .aruser_dma330_s1         (cpu_sub_o_aruser_dma330_s1),
        .haddr_mat2cpu_s0         (cpu_sub_o_haddr_mat2cpu_s0),
        .hburst_mat2cpu_s0        (cpu_sub_o_hburst_mat2cpu_s0),
        .hprot_mat2cpu_s0         (cpu_sub_o_hprot_mat2cpu_s0),
        .hsize_mat2cpu_s0         (cpu_sub_o_hsize_mat2cpu_s0),
        .htrans_mat2cpu_s0        (cpu_sub_o_htrans_mat2cpu_s0),
        .hwdata_mat2cpu_s0        (cpu_sub_o_hwdata_mat2cpu_s0),
        .hwrite_mat2cpu_s0        (cpu_sub_o_hwrite_mat2cpu_s0),
        .hrdata_mat2cpu_s0        (cpu_sub_i_hrdata_mat2cpu_s0),
        .hreadyout_mat2cpu_s0     (cpu_sub_i_hreadyout_mat2cpu_s0),
        .hresp_mat2cpu_s0         (cpu_sub_i_hresp_mat2cpu_s0),
        .hselx_mat2cpu_s0         (cpu_sub_o_hselx_mat2cpu_s0),
        .hready_mat2cpu_s0        (cpu_sub_o_hready_mat2cpu_s0),
        .hauser_mat2cpu_s0        (cpu_sub_o_hauser_mat2cpu_s0),
        .paddr_cpu_peri0_m1       (cpu_bus_paddr_cpu_peri0_m1),
        .pselx_cpu_peri0_m1       (cpu_bus_pselx_cpu_peri0_m1),
        .penable_cpu_peri0_m1     (cpu_bus_penable_cpu_peri0_m1),
        .pwrite_cpu_peri0_m1      (cpu_bus_pwrite_cpu_peri0_m1),
        .prdata_cpu_peri0_m1      (cpu_bus_prdata_cpu_peri0_m1),
        .pwdata_cpu_peri0_m1      (cpu_bus_pwdata_cpu_peri0_m1),
        .pready_cpu_peri0_m1      (cpu_bus_pready_cpu_peri0_m1),
        .pslverr_cpu_peri0_m1     (cpu_bus_pslverr_cpu_peri0_m1),
        .haddr_cpu_peri1_m2       (cpu_bus_haddr_cpu_peri1_m2),
        .hburst_cpu_peri1_m2      (cpu_bus_hburst_cpu_peri1_m2),
        .hprot_cpu_peri1_m2       (cpu_bus_hprot_cpu_peri1_m2),
        .hsize_cpu_peri1_m2       (cpu_bus_hsize_cpu_peri1_m2),
        .htrans_cpu_peri1_m2      (cpu_bus_htrans_cpu_peri1_m2),
        .hwdata_cpu_peri1_m2      (cpu_bus_hwdata_cpu_peri1_m2),
        .hwrite_cpu_peri1_m2      (cpu_bus_hwrite_cpu_peri1_m2),
        .hrdata_cpu_peri1_m2      (cpu_bus_hrdata_cpu_peri1_m2),
        .hresp_cpu_peri1_m2       (cpu_bus_hresp_cpu_peri1_m2),
        .hready_cpu_peri1_m2      (cpu_bus_hready_cpu_peri1_m2),
        .haddr_sfmc_auto_m3       (cpu_bus_haddr_sfmc_auto_m3),
        .hburst_sfmc_auto_m3      (cpu_bus_hburst_sfmc_auto_m3),
        .hprot_sfmc_auto_m3       (cpu_bus_hprot_sfmc_auto_m3),
        .hsize_sfmc_auto_m3       (cpu_bus_hsize_sfmc_auto_m3),
        .htrans_sfmc_auto_m3      (cpu_bus_htrans_sfmc_auto_m3),
        .hwdata_sfmc_auto_m3      (cpu_bus_hwdata_sfmc_auto_m3),
        .hwrite_sfmc_auto_m3      (cpu_bus_hwrite_sfmc_auto_m3),
        .hrdata_sfmc_auto_m3      (cpu_bus_hrdata_sfmc_auto_m3),
        .hresp_sfmc_auto_m3       (cpu_bus_hresp_sfmc_auto_m3),
        .hready_sfmc_auto_m3      (cpu_bus_hready_sfmc_auto_m3),
        .paddr_main_peri_m4       (o_paddr_main_peri_m4),
        .pselx_main_peri_m4       (o_pselx_main_peri_m4),
        .penable_main_peri_m4     (o_penable_main_peri_m4),
        .pwrite_main_peri_m4      (o_pwrite_main_peri_m4),
        .prdata_main_peri_m4      (i_prdata_main_peri_m4),
        .pwdata_main_peri_m4      (o_pwdata_main_peri_m4),
        .pready_main_peri_m4      (i_pready_main_peri_m4),
        .pslverr_main_peri_m4     (i_pslverr_main_peri_m4),
        .i_cpu2mainclk            (cpu_crm_o_clk_cpu2main),
        .i_cpu2mainresetn         (cpu_crm_o_rstn_cpu2main),
        .i_cpu2mvpclk             (cpu_crm_o_clk_cpu2mvp),
        .i_cpu2mvpclken           (1'h1),
        .i_cpu2mvpresetn          (cpu_crm_o_rstn_cpu2mvp),
        .i_cpu2periclk            (cpu_crm_o_clk_cpu2peri),
        .i_cpu2periresetn         (cpu_crm_o_rstn_cpu2peri),
        .i_cpu_busclk             (cpu_crm_o_clk_cpu_bus),
        .i_cpu_busclken           (1'h1),
        .i_cpu_busresetn          (cpu_crm_o_rstn_cpu_bus),
        .i_cpu_periclk            (cpu_crm_o_clk_cpu_peri),
        .i_cpu_periclken          (1'h1),
        .i_cpu_periresetn         (cpu_crm_o_rstn_cpu_peri),
        .i_main_systemclk         (cpu_crm_o_clk_main_system),
        .i_main_systemclken       (1'h1),
        .i_main_systemresetn      (cpu_crm_o_rstn_main_system),
        .mainclk                  (cpu_crm_o_clk_cpu_bus),
        .mainclk_r                (cpu_crm_o_clk_cpu_bus),
        .mainresetn               (cpu_crm_o_rstn_cpu_bus),
        .mainresetn_r             (cpu_crm_o_rstn_cpu_bus)
    );

    mvp_crm_cpu u_cpu_crm (
        .i_test_bypass            (i_test_bypass),
        .i_rstn_peri              (i_rstn_cpu_peri),
        .i_apb_pclk               (i_clk_cpu_peri),
        .i_apb_prstn              (i_rstn_cpu_peri),
        .i_apb_psel               (cpu_sub_o_crm_apb_psel),
        .i_apb_penable            (cpu_sub_o_crm_apb_penable),
        .i_apb_pwrite             (cpu_sub_o_crm_apb_pwrite),
        .i_apb_paddr              (cpu_sub_o_crm_apb_paddr),
        .i_apb_pwdata             (cpu_sub_o_crm_apb_pwdata),
        .o_apb_prdata             (cpu_sub_i_crm_apb_prdata),
        .i_clk_cpu                (i_clk_cpu),
        .i_clk_cpu_peri           (i_clk_cpu_peri),
        .i_clk_cpu2peri           (i_clk_cpu2peri),
        .i_clk_main_system        (i_clk_main_system),
        .i_clk_cpu2mvp            (i_clk_cpu2mvp),
        .i_clk_cpu2main           (i_clk_cpu2main),
        .i_clk_sfmc_pad_y         (i_sfmc_sclk_y),
        .i_clk_xtal_y             (i_clk_xtal_y),
        .i_test_clk200            (i_test_clk200),
        .i_test_clk100            (i_test_clk100),
        .o_clk_cpu                (cpu_crm_o_clk_cpu),
        .o_rstn_cpu               (cpu_crm_o_rstn_cpu),
        .o_clk_cpu_bus            (cpu_crm_o_clk_cpu_bus),
        .o_rstn_cpu_bus           (cpu_crm_o_rstn_cpu_bus),
        .o_clk_sram               (cpu_crm_o_clk_sram),
        .o_rstn_sram              (cpu_crm_o_rstn_sram),
        .o_clk_rom                (cpu_crm_o_clk_rom),
        .o_rstn_rom               (cpu_crm_o_rstn_rom),
        .o_mclk_dma               (cpu_crm_o_mclk_dma),
        .o_rstn_mclk_dma          (cpu_crm_o_rstn_mclk_dma),
        .o_sclk_dma               (cpu_crm_o_sclk_dma),
        .o_rstn_sclk_dma          (cpu_crm_o_rstn_sclk_dma),
        .o_clk_cpu_peri           (cpu_crm_o_clk_cpu_peri),
        .o_rstn_cpu_peri          (cpu_crm_o_rstn_cpu_peri),
        .o_clk_nfc                (cpu_crm_o_clk_nfc),
        .o_rstn_nfc               (cpu_crm_o_rstn_nfc),
        .o_clk_sfmc               (cpu_crm_o_clk_sfmc),
        .o_rstn_sfmc              (cpu_crm_o_rstn_sfmc),
        .o_clk_sfmc_flash         (cpu_crm_o_clk_sfmc_flash),
        .o_rstn_sfmc_flash        (cpu_crm_o_rstn_sfmc_flash),
        .o_clk_tracein            (cpu_crm_o_clk_tracein),
        .o_clk_cpu2peri           (cpu_crm_o_clk_cpu2peri),
        .o_rstn_cpu2peri          (cpu_crm_o_rstn_cpu2peri),
        .o_clk_main_system        (cpu_crm_o_clk_main_system),
        .o_rstn_main_system       (cpu_crm_o_rstn_main_system),
        .o_clk_cpu2mvp            (cpu_crm_o_clk_cpu2mvp),
        .o_rstn_cpu2mvp           (cpu_crm_o_rstn_cpu2mvp),
        .o_clk_cpu2main           (cpu_crm_o_clk_cpu2main),
        .o_rstn_cpu2main          (cpu_crm_o_rstn_cpu2main),
        .o_clk_sfmc_pad           (cpu_crm_o_clk_sfmc_pad),
        .o_clken_dma330           (cpu_crm_o_clken_dma330),
        .o_cpu_stclk              (cpu_crm_o_cpu_stclk),
        .i_rstn_mem               (i_rstn_mem),
        .i_rstn_bus               (i_rstn_bus),
        .i_rstn_ip                (i_rstn_ip),
        .i_rstn_core              (cpu_sub_o_rstn_core),
        .i_scan_clk               (i_scan_clk),
        .i_scan_mode              (i_scan_mode),
        .i_scan_rstn              (i_test_rstn)
    );

    cpu_sub
        #(.PDMA_CH(20))
    u_cpu_sub (
        .i_clk_cpu                (cpu_crm_o_clk_cpu),
        .i_rstn_cpu               (cpu_crm_o_rstn_cpu),
        .i_clk_sram               (cpu_crm_o_clk_sram),
        .i_rstn_sram              (cpu_crm_o_rstn_sram),
        .i_clk_rom                (cpu_crm_o_clk_rom),
        .i_rstn_rom               (cpu_crm_o_rstn_rom),
        .i_clk_mclk_dma           (cpu_crm_o_mclk_dma),
        .i_rstn_mclk_dma          (cpu_crm_o_rstn_mclk_dma),
        .i_clk_sclk_dma           (cpu_crm_o_sclk_dma),
        .i_rstn_sclk_dma          (cpu_crm_o_rstn_sclk_dma),
        .i_clken_dma330           (cpu_crm_o_clken_dma330),
        .i_clk_bus_m0             (cpu_crm_o_clk_cpu_peri),
        .i_rstn_bus_m0            (cpu_crm_o_rstn_cpu_peri),
        .i_clk_nfc                (cpu_crm_o_clk_nfc),
        .i_rstn_nfc               (cpu_crm_o_rstn_nfc),
        .i_clk_sfmc               (cpu_crm_o_clk_sfmc),
        .i_rstn_sfmc              (cpu_crm_o_rstn_sfmc),
        .i_clk_sfmc_flash         (cpu_crm_o_clk_sfmc_flash),
        .i_rstn_sfmc_flash        (cpu_crm_o_rstn_sfmc_flash),
        .i_clk_tracein            (cpu_crm_o_clk_tracein),
        .i_clk_cpu_stclk          (cpu_crm_o_cpu_stclk),
        .i_rstn_core              (i_rstn_core),
        .o_rstn_core              (cpu_sub_o_rstn_core),
        .o_crm_apb_psel           (cpu_sub_o_crm_apb_psel),
        .o_crm_apb_penable        (cpu_sub_o_crm_apb_penable),
        .o_crm_apb_pwrite         (cpu_sub_o_crm_apb_pwrite),
        .o_crm_apb_paddr          (cpu_sub_o_crm_apb_paddr),
        .o_crm_apb_pwdata         (cpu_sub_o_crm_apb_pwdata),
        .i_crm_apb_prdata         (cpu_sub_i_crm_apb_prdata),
        .o_haddr_mat2cpu_s0       (cpu_sub_o_haddr_mat2cpu_s0),
        .o_hburst_mat2cpu_s0      (cpu_sub_o_hburst_mat2cpu_s0),
        .o_hprot_mat2cpu_s0       (cpu_sub_o_hprot_mat2cpu_s0),
        .o_hsize_mat2cpu_s0       (cpu_sub_o_hsize_mat2cpu_s0),
        .o_htrans_mat2cpu_s0      (cpu_sub_o_htrans_mat2cpu_s0),
        .o_hwdata_mat2cpu_s0      (cpu_sub_o_hwdata_mat2cpu_s0),
        .o_hwrite_mat2cpu_s0      (cpu_sub_o_hwrite_mat2cpu_s0),
        .i_hrdata_mat2cpu_s0      (cpu_sub_i_hrdata_mat2cpu_s0),
        .i_hreadyout_mat2cpu_s0   (cpu_sub_i_hreadyout_mat2cpu_s0),
        .i_hresp_mat2cpu_s0       (cpu_sub_i_hresp_mat2cpu_s0),
        .o_hselx_mat2cpu_s0       (cpu_sub_o_hselx_mat2cpu_s0),
        .o_hready_mat2cpu_s0      (cpu_sub_o_hready_mat2cpu_s0),
        .o_hauser_mat2cpu_s0      (cpu_sub_o_hauser_mat2cpu_s0),
        .o_awid_dma330_s1         (cpu_sub_o_awid_dma330_s1),
        .o_awaddr_dma330_s1       (cpu_sub_o_awaddr_dma330_s1),
        .o_awlen_dma330_s1        (cpu_sub_o_awlen_dma330_s1),
        .o_awsize_dma330_s1       (cpu_sub_o_awsize_dma330_s1),
        .o_awburst_dma330_s1      (cpu_sub_o_awburst_dma330_s1),
        .o_awlock_dma330_s1       (cpu_sub_o_awlock_dma330_s1),
        .o_awcache_dma330_s1      (cpu_sub_o_awcache_dma330_s1),
        .o_awprot_dma330_s1       (cpu_sub_o_awprot_dma330_s1),
        .o_awvalid_dma330_s1      (cpu_sub_o_awvalid_dma330_s1),
        .i_awready_dma330_s1      (cpu_sub_i_awready_dma330_s1),
        .o_wid_dma330_s1          (cpu_sub_o_wid_dma330_s1),
        .o_wdata_dma330_s1        (cpu_sub_o_wdata_dma330_s1),
        .o_wstrb_dma330_s1        (cpu_sub_o_wstrb_dma330_s1),
        .o_wlast_dma330_s1        (cpu_sub_o_wlast_dma330_s1),
        .o_wvalid_dma330_s1       (cpu_sub_o_wvalid_dma330_s1),
        .i_wready_dma330_s1       (cpu_sub_i_wready_dma330_s1),
        .i_bid_dma330_s1          (cpu_sub_i_bid_dma330_s1),
        .i_bresp_dma330_s1        (cpu_sub_i_bresp_dma330_s1),
        .i_bvalid_dma330_s1       (cpu_sub_i_bvalid_dma330_s1),
        .o_bready_dma330_s1       (cpu_sub_o_bready_dma330_s1),
        .o_arid_dma330_s1         (cpu_sub_o_arid_dma330_s1),
        .o_araddr_dma330_s1       (cpu_sub_o_araddr_dma330_s1),
        .o_arlen_dma330_s1        (cpu_sub_o_arlen_dma330_s1),
        .o_arsize_dma330_s1       (cpu_sub_o_arsize_dma330_s1),
        .o_arburst_dma330_s1      (cpu_sub_o_arburst_dma330_s1),
        .o_arlock_dma330_s1       (cpu_sub_o_arlock_dma330_s1),
        .o_arcache_dma330_s1      (cpu_sub_o_arcache_dma330_s1),
        .o_arprot_dma330_s1       (cpu_sub_o_arprot_dma330_s1),
        .o_arvalid_dma330_s1      (cpu_sub_o_arvalid_dma330_s1),
        .i_arready_dma330_s1      (cpu_sub_i_arready_dma330_s1),
        .i_rid_dma330_s1          (cpu_sub_i_rid_dma330_s1),
        .i_rdata_dma330_s1        (cpu_sub_i_rdata_dma330_s1),
        .i_rresp_dma330_s1        (cpu_sub_i_rresp_dma330_s1),
        .i_rlast_dma330_s1        (cpu_sub_i_rlast_dma330_s1),
        .i_rvalid_dma330_s1       (cpu_sub_i_rvalid_dma330_s1),
        .o_rready_dma330_s1       (cpu_sub_o_rready_dma330_s1),
        .o_aruser_dma330_s1       (cpu_sub_o_aruser_dma330_s1),
        .o_awuser_dma330_s1       (cpu_sub_o_awuser_dma330_s1),
        .i_htrans_cpu2mat_m0      (cpu_bus_htrans_cpu2mat_m0),
        .i_haddr_cpu2mat_m0       (cpu_bus_haddr_cpu2mat_m0),
        .i_hprot_cpu2mat_m0       (cpu_bus_hprot_cpu2mat_m0),
        .i_hwrite_cpu2mat_m0      (cpu_bus_hwrite_cpu2mat_m0),
        .i_hsize_cpu2mat_m0       (cpu_bus_hsize_cpu2mat_m0),
        .i_hburst_cpu2mat_m0      (cpu_bus_hburst_cpu2mat_m0),
        .i_hwdata_cpu2mat_m0      (cpu_bus_hwdata_cpu2mat_m0),
        .o_hrdata_cpu2mat_m0      (cpu_bus_hrdata_cpu2mat_m0),
        .o_hresp_cpu2mat_m0       (cpu_bus_hresp_cpu2mat_m0),
        .o_hready_cpu2mat_m0      (cpu_bus_hready_cpu2mat_m0),
        .i_pselx_cpu_m1           (cpu_bus_pselx_cpu_peri0_m1),
        .i_penable_cpu_m1         (cpu_bus_penable_cpu_peri0_m1),
        .i_pwrite_cpu_m1          (cpu_bus_pwrite_cpu_peri0_m1),
        .i_paddr_cpu_m1           (cpu_bus_paddr_cpu_peri0_m1),
        .i_pwdata_cpu_m1          (cpu_bus_pwdata_cpu_peri0_m1),
        .o_prdata_cpu_m1          (cpu_bus_prdata_cpu_peri0_m1),
        .o_pready_cpu_m1          (cpu_bus_pready_cpu_peri0_m1),
        .o_pslverr_cpu_m1         (cpu_bus_pslverr_cpu_peri0_m1),
        .i_htrans_cpu_m2          (cpu_bus_htrans_cpu_peri1_m2),
        .i_haddr_cpu_m2           (cpu_bus_haddr_cpu_peri1_m2),
        .i_hprot_cpu_m2           (cpu_bus_hprot_cpu_peri1_m2),
        .i_hwrite_cpu_m2          (cpu_bus_hwrite_cpu_peri1_m2),
        .i_hsize_cpu_m2           (cpu_bus_hsize_cpu_peri1_m2),
        .i_hburst_cpu_m2          (cpu_bus_hburst_cpu_peri1_m2),
        .i_hwdata_cpu_m2          (cpu_bus_hwdata_cpu_peri1_m2),
        .o_hrdata_cpu_m2          (cpu_bus_hrdata_cpu_peri1_m2),
        .o_hready_cpu_m2          (cpu_bus_hready_cpu_peri1_m2),
        .o_hresp_cpu_m2           (cpu_bus_hresp_cpu_peri1_m2),
        .i_htrans_sfmc_m3         (cpu_bus_htrans_sfmc_auto_m3),
        .i_haddr_sfmc_m3          (cpu_bus_haddr_sfmc_auto_m3),
        .i_hprot_sfmc_m3          (cpu_bus_hprot_sfmc_auto_m3),
        .i_hwrite_sfmc_m3         (cpu_bus_hwrite_sfmc_auto_m3),
        .i_hsize_sfmc_m3          (cpu_bus_hsize_sfmc_auto_m3),
        .i_hburst_sfmc_m3         (cpu_bus_hburst_sfmc_auto_m3),
        .i_hwdata_sfmc_m3         (cpu_bus_hwdata_sfmc_auto_m3),
        .o_hready_sfmc_m3         (cpu_bus_hready_sfmc_auto_m3),
        .o_hrdata_sfmc_m3         (cpu_bus_hrdata_sfmc_auto_m3),
        .o_hresp_sfmc_m3          (cpu_bus_hresp_sfmc_auto_m3),
        .i_ema                    (i_ema),
        .i_boot_sel_y             (i_boot_sel_y),
        .i_test_mode              (i_test_mode),
        .t_jtag_tck               (t_jtag_tck),
        .i_jtag_tck_y             (i_jtag_tck_y),
        .i_jtag_tmms_y            (i_jtag_tmms_y),
        .i_jtag_ntrst_y           (i_jtag_ntrst_y),
        .o_jtag_tmms_a            (o_jtag_tmms_a),
        .o_jtag_tmms_oe           (o_jtag_tmms_oe),
        .i_jtag_tdi_y             (i_jtag_tdi_y),
        .o_jtag_tdo_a             (o_jtag_tdo_a),
        .o_jtag_tdo_oe            (o_jtag_tdo_oe),
        .i_irq_cpu                (i_irq_cpu),
        .o_cm3_traceclk_a         (o_cm3_traceclk_a),
        .o_cm3_tracedata_a        (o_cm3_tracedata_a),
        .i_nfc_cfgadvflash_y      (i_nfc_cfgadvflash_y),
        .i_nfc_cfgaddrcycle_y     (i_nfc_cfgaddrcycle_y),
        .i_nfc_cfgpagesize_y      (i_nfc_cfgpagesize_y),
        .o_irq_nfc_rnb            (o_irq_nfc_rnb),
        .o_irq_nfc                (o_irq_nfc),
        .i_nfc_data_y             (i_nfc_data_y),
        .o_nfc_data_a             (o_nfc_data_a),
        .o_nfc_data_oe            (o_nfc_data_oe),
        .i_nfc_rnb_y              (i_nfc_rnb_y),
        .o_nfc_cle_a              (o_nfc_cle_a),
        .o_nfc_ale_a              (o_nfc_ale_a),
        .o_nfc_nce_a              (o_nfc_nce_a),
        .o_nfc_nre_a              (o_nfc_nre_a),
        .o_nfc_nwe_a              (o_nfc_nwe_a),
        .o_irq_sfmc               (o_irq_sfmc),
        .i_sfmc_sclk_y            (cpu_crm_o_clk_sfmc_pad),
        .o_sfmc_sclk_a            (o_sfmc_sclk_a),
        .o_sfmc_sclk_oe           (o_sfmc_sclk_oe),
        .o_sfmc_csn_a             (o_sfmc_csn_a),
        .i_sfmc_data_y            (i_sfmc_data_y),
        .o_sfmc_data_a            (o_sfmc_data_a),
        .o_sfmc_data_oe           (o_sfmc_data_oe),
        .i_dmac_breq              (i_dmac_breq),
        .i_dmac_sreq              (i_dmac_sreq),
        .i_dmac_lbreq             (i_dmac_lbreq),
        .i_dmac_lsreq             (i_dmac_lsreq),
        .o_dmac_clr               (o_dmac_clr),
        .o_dmac_tc                (o_dmac_tc),
        .o_irq_dmac0              (o_irq_dmac0),
        .o_irq_dmac1              (o_irq_dmac1),
        .o_irq_dmac2              (o_irq_dmac2),
        .o_irq_dmac3              (o_irq_dmac3),
        .o_irq_dmac4              (o_irq_dmac4),
        .o_irq_dmac5              (o_irq_dmac5),
        .o_irq_dmac6              (o_irq_dmac6),
        .o_irq_dmac7              (o_irq_dmac7),
        .o_irq_abort_dmac         (o_irq_abort_dmac)
    );

endmodule