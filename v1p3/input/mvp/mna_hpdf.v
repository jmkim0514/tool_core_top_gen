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
// File name : mna_hpdf
// Version : v1.1
// Description :
// Simulator : NC Verilog
// Created by : dhki
// Date : 2023-09-21  17:32
//==============================================================================

module mna_hpdf (
    input              i_test_bypass,
    input              i_rstn_peri2mna,
    input              i_clk_peri2mna,
    input              i_clk_mna,
    input              i_scan_clk,
    input              i_scan_mode,
    input              i_test_rstn,
    input   [ 38:  0]  i_ema,
    input              i_test_mode,
    output             o_irq_mna,
    output             o_irq_err_irdma,
    output             o_irq_done_irdma,
    output             o_irq_err_prdma,
    output             o_irq_done_prdma,
    output             o_irq_err_wrdma,
    output             o_irq_done_wrdma,
    output             o_irq_err_owdma,
    output             o_irq_done_owdma,
    input              i_psel_peri2mna,
    input              i_penable_peri2mna,
    input              i_pwrite_peri2mna,
    input   [ 31:  0]  i_paddr_peri2mna,
    input   [ 31:  0]  i_pwdata_peri2mna,
    output             o_pready_peri2mna,
    output  [ 31:  0]  o_prdata_peri2mna,
    output             o_pslverr_peri2mna,
    output  [  1:  0]  o_arid_mna2main,
    output  [  7:  0]  o_arlen_mna2main,
    output  [  2:  0]  o_arsize_mna2main,
    output  [  1:  0]  o_arburst_mna2main,
    output             o_arlock_mna2main,
    output  [  3:  0]  o_arcache_mna2main,
    output  [  2:  0]  o_arprot_mna2main,
    output  [ 31:  0]  o_araddr_mna2main,
    output             o_arvalid_mna2main,
    input              i_arready_mna2main,
    input   [  1:  0]  i_rid_mna2main,
    input              i_rvalid_mna2main,
    input   [127:  0]  i_rdata_mna2main,
    input              i_rlast_mna2main,
    output             o_rready_mna2main,
    input   [  1:  0]  i_rresp_mna2main,
    output  [  1:  0]  o_awid_mna2main,
    output  [  7:  0]  o_awlen_mna2main,
    output  [  2:  0]  o_awsize_mna2main,
    output  [  1:  0]  o_awburst_mna2main,
    output             o_awlock_mna2main,
    output  [  3:  0]  o_awcache_mna2main,
    output  [  2:  0]  o_awprot_mna2main,
    output  [ 31:  0]  o_awaddr_mna2main,
    output             o_awvalid_mna2main,
    input              i_awready_mna2main,
    output  [127:  0]  o_wdata_mna2main,
    output  [ 15:  0]  o_wstrb_mna2main,
    output             o_wlast_mna2main,
    output             o_wvalid_mna2main,
    input              i_wready_mna2main,
    input   [  1:  0]  i_bid_mna2main,
    input   [  1:  0]  i_bresp_mna2main,
    input              i_bvalid_mna2main,
    output             o_bready_mna2main,
    output  [  1:  0]  o_awuser_mna2main,
    output  [  1:  0]  o_aruser_mna2main
);

    wire            mna_crm_o_sclk_mna;
    wire            mna_crm_o_srstn_mna;
    wire            mna_crm_o_sclk_alpdma;
    wire            mna_crm_o_srstn_alpdma;
    wire            mna_crm_o_clk_mna_bus;
    wire            mna_crm_o_rstn_mna_bus;
    wire            mna_crm_o_mclk_mna;
    wire            mna_crm_o_mrstn_mna;
    wire            mna_crm_o_mclk_alpdma;
    wire            mna_crm_o_mrstn_alpdma;
    wire            mna_sub_o_crm_apb_psel;
    wire            mna_sub_o_crm_apb_penable;
    wire            mna_sub_o_crm_apb_pwrite;
    wire    [11:0]  mna_sub_o_crm_apb_paddr;
    wire    [31:0]  mna_sub_o_crm_apb_pwdata;
    wire    [31:0]  mna_sub_i_crm_apb_prdata;


    mvp_crm_mna u_mna_crm (
        .i_test_bypass        (i_test_bypass),
        .i_rstn_mna           (i_rstn_peri2mna),
        .i_apb_pclk           (i_clk_peri2mna),
        .i_apb_prstn          (i_rstn_peri2mna),
        .i_apb_psel           (mna_sub_o_crm_apb_psel),
        .i_apb_penable        (mna_sub_o_crm_apb_penable),
        .i_apb_pwrite         (mna_sub_o_crm_apb_pwrite),
        .i_apb_paddr          (mna_sub_o_crm_apb_paddr),
        .i_apb_pwdata         (mna_sub_o_crm_apb_pwdata),
        .o_apb_prdata         (mna_sub_i_crm_apb_prdata),
        .i_clk_peri2mna       (i_clk_peri2mna),
        .i_clk_mna            (i_clk_mna),
        .o_sclk_mna           (mna_crm_o_sclk_mna),
        .o_srstn_mna          (mna_crm_o_srstn_mna),
        .o_sclk_alpdma        (mna_crm_o_sclk_alpdma),
        .o_srstn_alpdma       (mna_crm_o_srstn_alpdma),
        .o_clk_mna_bus        (mna_crm_o_clk_mna_bus),
        .o_rstn_mna_bus       (mna_crm_o_rstn_mna_bus),
        .o_mclk_mna           (mna_crm_o_mclk_mna),
        .o_mrstn_mna          (mna_crm_o_mrstn_mna),
        .o_mclk_alpdma        (mna_crm_o_mclk_alpdma),
        .o_mrstn_alpdma       (mna_crm_o_mrstn_alpdma),
        .i_scan_clk           (i_scan_clk),
        .i_scan_mode          (i_scan_mode),
        .i_scan_rstn          (i_test_rstn)
    );

    mna_sub u_mna_sub (
        .i_ema                (i_ema),
        .i_mclk_mna           (mna_crm_o_mclk_mna),
        .i_mrstn_mna          (mna_crm_o_mrstn_mna),
        .i_sclk_mna           (mna_crm_o_sclk_mna),
        .i_srstn_mna          (mna_crm_o_srstn_mna),
        .i_mclk_alpdma        (mna_crm_o_mclk_alpdma),
        .i_mrstn_alpdma       (mna_crm_o_mrstn_alpdma),
        .i_sclk_alpdma        (mna_crm_o_sclk_alpdma),
        .i_srstn_alpdma       (mna_crm_o_srstn_alpdma),
        .i_clk_mna_bus        (mna_crm_o_clk_mna_bus),
        .i_rstn_mna_bus       (mna_crm_o_rstn_mna_bus),
        .i_stmode             (i_test_mode),
        .o_irq_mna            (o_irq_mna),
        .o_irq_err_irdma      (o_irq_err_irdma),
        .o_irq_done_irdma     (o_irq_done_irdma),
        .o_irq_err_prdma      (o_irq_err_prdma),
        .o_irq_done_prdma     (o_irq_done_prdma),
        .o_irq_err_wrdma      (o_irq_err_wrdma),
        .o_irq_done_wrdma     (o_irq_done_wrdma),
        .o_irq_err_owdma      (o_irq_err_owdma),
        .o_irq_done_owdma     (o_irq_done_owdma),
        .i_psel_peri2mna      (i_psel_peri2mna),
        .i_penable_peri2mna   (i_penable_peri2mna),
        .i_pwrite_peri2mna    (i_pwrite_peri2mna),
        .i_paddr_peri2mna     (i_paddr_peri2mna),
        .i_pwdata_peri2mna    (i_pwdata_peri2mna),
        .o_pready_peri2mna    (o_pready_peri2mna),
        .o_prdata_peri2mna    (o_prdata_peri2mna),
        .o_pslverr_peri2mna   (o_pslverr_peri2mna),
        .o_arid_mna2main      (o_arid_mna2main),
        .o_arlen_mna2main     (o_arlen_mna2main),
        .o_arsize_mna2main    (o_arsize_mna2main),
        .o_arburst_mna2main   (o_arburst_mna2main),
        .o_arlock_mna2main    (o_arlock_mna2main),
        .o_arcache_mna2main   (o_arcache_mna2main),
        .o_arprot_mna2main    (o_arprot_mna2main),
        .o_araddr_mna2main    (o_araddr_mna2main),
        .o_arvalid_mna2main   (o_arvalid_mna2main),
        .i_arready_mna2main   (i_arready_mna2main),
        .i_rid_mna2main       (i_rid_mna2main),
        .i_rvalid_mna2main    (i_rvalid_mna2main),
        .i_rdata_mna2main     (i_rdata_mna2main),
        .i_rlast_mna2main     (i_rlast_mna2main),
        .o_rready_mna2main    (o_rready_mna2main),
        .i_rresp_mna2main     (i_rresp_mna2main),
        .o_awid_mna2main      (o_awid_mna2main),
        .o_awlen_mna2main     (o_awlen_mna2main),
        .o_awsize_mna2main    (o_awsize_mna2main),
        .o_awburst_mna2main   (o_awburst_mna2main),
        .o_awlock_mna2main    (o_awlock_mna2main),
        .o_awcache_mna2main   (o_awcache_mna2main),
        .o_awprot_mna2main    (o_awprot_mna2main),
        .o_awaddr_mna2main    (o_awaddr_mna2main),
        .o_awvalid_mna2main   (o_awvalid_mna2main),
        .i_awready_mna2main   (i_awready_mna2main),
        .o_wdata_mna2main     (o_wdata_mna2main),
        .o_wstrb_mna2main     (o_wstrb_mna2main),
        .o_wlast_mna2main     (o_wlast_mna2main),
        .o_wvalid_mna2main    (o_wvalid_mna2main),
        .i_wready_mna2main    (i_wready_mna2main),
        .i_bid_mna2main       (i_bid_mna2main),
        .i_bresp_mna2main     (i_bresp_mna2main),
        .i_bvalid_mna2main    (i_bvalid_mna2main),
        .o_bready_mna2main    (o_bready_mna2main),
        .o_crm_apb_psel       (mna_sub_o_crm_apb_psel),
        .o_crm_apb_penable    (mna_sub_o_crm_apb_penable),
        .o_crm_apb_pwrite     (mna_sub_o_crm_apb_pwrite),
        .o_crm_apb_paddr      (mna_sub_o_crm_apb_paddr),
        .o_crm_apb_pwdata     (mna_sub_o_crm_apb_pwdata),
        .i_crm_apb_prdata     (mna_sub_i_crm_apb_prdata),
        .o_awuser_mna2main    (o_awuser_mna2main),
        .o_aruser_mna2main    (o_aruser_mna2main)
    );

endmodule