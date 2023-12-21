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
// File name : hsp_hpdf
// Version : v1.1
// Description :
// Simulator : NC Verilog
// Created by : bhoh
// Date : 2023-12-04  9:56
//==============================================================================

module hsp_hpdf (
    input   [  1:  0]  i_pll2551_mode,
    input              i_clk_xtal_y,
    input   [  5:  0]  t_hsp_pll_p,
    input   [  9:  0]  t_hsp_pll_m,
    input   [  2:  0]  t_hsp_pll_s,
    input   [  1:  0]  t_hsp_pll_lock_con_in,
    input   [  1:  0]  t_hsp_pll_lock_con_out,
    input   [  1:  0]  t_hsp_pll_lock_con_dly,
    input   [  1:  0]  t_hsp_pll_lock_con_rev,
    input   [  4:  0]  t_hsp_pll_tst_afc,
    input   [  1:  0]  t_hsp_pll_icp,
    input              t_hsp_pll_resetb,
    input              t_hsp_pll_bypass,
    input              t_hsp_pll_tst_en,
    input              t_hsp_pll_fsel,
    input              t_hsp_pll_feed_en,
    input              t_hsp_pll_lock_en,
    input              t_hsp_pll_afcini_sel,
    input              t_hsp_pll_vcoini_en,
    input              t_hsp_pll_fout_mask,
    input              t_hsp_pll_pbias_ctrl,
    input              t_hsp_pll_pbias_ctrl_en,
    input   [  5:  0]  sr_hsp_pll_p,
    input   [  9:  0]  sr_hsp_pll_m,
    input   [  2:  0]  sr_hsp_pll_s,
    output             t_hsp_pll_feed_out,
    output             t_hsp_pll_lock,
    output             t_hsp_pll_fout,
    output             t_hsp_pll_sync_m_clk_out,
    output  [  4:  0]  t_hsp_pll_afc_code,
    input              i_test_bypass,
    input              i_rstn_peri2hsp,
    input              i_clk_peri2hsp,
    input              i_clk_hsp2main,
    input              i_clk_gmac_tx_y,
    input              i_clk_gmac_rx_y,
    output             o_clk_gmac_rmii_a,
    output             o_clk_phy_refclk_a,
    output             o_clk_gmac_tx_a,
    output             o_clk_gmac_rx_a,
    output             o_clk_gmac_rx_oe,
    output             o_clk_gmac_tx_oe,
    input              i_scan_clk,
    input              i_scan_mode,
    input              i_test_rstn,
    output             o_gmac_mdc_a,
    input              i_gmac_mdio_y,
    output             o_gmac_mdio_a,
    output             o_gmac_mdio_oe,
    input   [  2:  0]  i_gmac_phy_intf_sel_y,
    output             o_gmac_tx_en_a,
    output             o_gmac_tx_er_a,
    output  [  7:  0]  o_gmac_txd_a,
    input              i_gmac_crs_y,
    input              i_gmac_col_y,
    input              i_gmac_rx_dv_y,
    input              i_gmac_rx_er_y,
    input   [  7:  0]  i_gmac_rxd_y,
    output             o_irq_gmac_sbd,
    output             o_irq_gmac_sbd_perch_tx,
    output             o_irq_gmac_sbd_perch_rx,
    output             o_irq_gmac_lpi,
    output             o_irq_gmac_pmt,
    output             o_irq_jpeg_wdma,
    output             o_irq_jpeg_rdma_err,
    output             o_irq_jpeg_rdma_done,
    output             o_irq_jpeg,
    input   [ 38:  0]  i_ema,
    output  [  1:  0]  o_hsp2main_awuser,
    output  [  1:  0]  o_hsp2main_aruser,
    input              i_test_mode,
    input              i_pselx_peri2hsp,
    input              i_penable_peri2hsp,
    input              i_pwrite_peri2hsp,
    input   [ 31:  0]  i_paddr_peri2hsp,
    input   [ 31:  0]  i_pwdata_peri2hsp,
    output  [ 31:  0]  o_prdata_peri2hsp,
    output             o_pready_peri2hsp,
    output             o_pslverr_peri2hsp,
    output  [  3:  0]  o_hsp2main_awid,
    output  [ 31:  0]  o_hsp2main_awaddr,
    output  [  7:  0]  o_hsp2main_awlen,
    output  [  2:  0]  o_hsp2main_awsize,
    output  [  1:  0]  o_hsp2main_awburst,
    output             o_hsp2main_awlock,
    output  [  3:  0]  o_hsp2main_awcache,
    output  [  2:  0]  o_hsp2main_awprot,
    output             o_hsp2main_awvalid,
    input              i_hsp2main_awready,
    output  [127:  0]  o_hsp2main_wdata,
    output  [ 15:  0]  o_hsp2main_wstrb,
    output             o_hsp2main_wlast,
    output             o_hsp2main_wvalid,
    input              i_hsp2main_wready,
    input   [  3:  0]  i_hsp2main_bid,
    input   [  1:  0]  i_hsp2main_bresp,
    input              i_hsp2main_bvalid,
    output             o_hsp2main_bready,
    output  [  3:  0]  o_hsp2main_arid,
    output  [ 31:  0]  o_hsp2main_araddr,
    output  [  7:  0]  o_hsp2main_arlen,
    output  [  2:  0]  o_hsp2main_arsize,
    output  [  1:  0]  o_hsp2main_arburst,
    output             o_hsp2main_arlock,
    output  [  3:  0]  o_hsp2main_arcache,
    output  [  2:  0]  o_hsp2main_arprot,
    output             o_hsp2main_arvalid,
    input              i_hsp2main_arready,
    input   [  3:  0]  i_hsp2main_rid,
    input   [127:  0]  i_hsp2main_rdata,
    input   [  1:  0]  i_hsp2main_rresp,
    input              i_hsp2main_rlast,
    input              i_hsp2main_rvalid,
    output             o_hsp2main_rready
);

    wire            hsp_pll_o_feed_out;
    wire            hsp_pll_o_lock;
    wire            hsp_pll_o_fout;
    wire            hsp_pll_o_sync_m_clk_out;
    wire    [ 4:0]  hsp_pll_o_afc_code;
    wire            hsp_crm_o_pll_resetb;
    wire            hsp_crm_o_pll_bypass;
    wire    [ 5:0]  hsp_crm_o_pll_p;
    wire    [ 9:0]  hsp_crm_o_pll_m;
    wire    [ 2:0]  hsp_crm_o_pll_s;
    wire            hsp_crm_o_pll_lock_en;
    wire    [ 1:0]  hsp_crm_o_pll_lock_con_in;
    wire    [ 1:0]  hsp_crm_o_pll_lock_con_out;
    wire    [ 1:0]  hsp_crm_o_pll_lock_con_dly;
    wire    [ 1:0]  hsp_crm_o_pll_lock_con_rev;
    wire            hsp_crm_o_pll_feed_en;
    wire            hsp_crm_o_pll_fsel;
    wire            hsp_crm_o_pll_tst_en;
    wire    [ 4:0]  hsp_crm_o_pll_tst_afc;
    wire            hsp_crm_o_pll_afcini_sel;
    wire            hsp_crm_o_pll_vcoini_en;
    wire            hsp_crm_o_pll_fout_mask;
    wire            hsp_crm_o_pll_pbias_ctrl;
    wire            hsp_crm_o_pll_pbias_ctrl_en;
    wire    [ 1:0]  hsp_crm_o_pll_icp;
    wire            hsp_crm_o_clk_peri2hsp;
    wire            hsp_crm_o_rstn_peri2hsp;
    wire            hsp_crm_o_sclk_jpeg;
    wire            hsp_crm_o_srstn_jpeg;
    wire            hsp_crm_o_clk_hsp2main;
    wire            hsp_crm_o_rstn_hsp2main;
    wire            hsp_crm_o_clk_gmac;
    wire            hsp_crm_o_rstn_gmac;
    wire            hsp_crm_o_mclk_jpeg;
    wire            hsp_crm_o_mrstn_jpeg;
    wire            hsp_crm_o_clk_jpeg_core;
    wire            hsp_crm_o_rstn_jpeg_core;
    wire            hsp_crm_o_clk_gmac_rmii;
    wire            hsp_crm_o_clk_gmac_tx;
    wire            hsp_crm_o_clk_gmac_tx_inv;
    wire            hsp_crm_o_clk_gmac_rx;
    wire            hsp_crm_o_clk_gmac_rx_inv;
    wire            hsp_sub_o_crm_apb_psel;
    wire            hsp_sub_o_crm_apb_penable;
    wire            hsp_sub_o_crm_apb_pwrite;
    wire    [11:0]  hsp_sub_o_crm_apb_paddr;
    wire    [31:0]  hsp_sub_o_crm_apb_pwdata;
    wire    [31:0]  hsp_sub_i_crm_apb_prdata;
    wire            hsp_sub_o_sbd_tx_clk_gating_ctrl;

    assign  o_clk_gmac_rmii_a = hsp_crm_o_clk_gmac_rmii;
    assign  o_clk_gmac_rx_a = hsp_crm_o_clk_gmac_rx;
    assign  o_clk_gmac_tx_a = hsp_crm_o_clk_gmac_tx;
    assign  t_hsp_pll_afc_code[4:0] = hsp_pll_o_afc_code[4:0];
    assign  t_hsp_pll_feed_out = hsp_pll_o_feed_out;
    assign  t_hsp_pll_fout = hsp_pll_o_fout;
    assign  t_hsp_pll_lock = hsp_pll_o_lock;
    assign  t_hsp_pll_sync_m_clk_out = hsp_pll_o_sync_m_clk_out;

    tmux_sf_pll2551x_ln28lpp_5000 u_hsp_pll (
        .i_tmode                    (i_pll2551_mode),
        .i_norm_p                   (hsp_crm_o_pll_p),
        .i_norm_m                   (hsp_crm_o_pll_m),
        .i_norm_s                   (hsp_crm_o_pll_s),
        .i_norm_lock_con_in         (hsp_crm_o_pll_lock_con_in),
        .i_norm_lock_con_out        (hsp_crm_o_pll_lock_con_out),
        .i_norm_lock_con_dly        (hsp_crm_o_pll_lock_con_dly),
        .i_norm_lock_con_rev        (hsp_crm_o_pll_lock_con_rev),
        .i_norm_tst_afc             (hsp_crm_o_pll_tst_afc),
        .i_norm_icp                 (hsp_crm_o_pll_icp),
        .i_norm_fin                 (i_clk_xtal_y),
        .i_norm_resetb              (hsp_crm_o_pll_resetb),
        .i_norm_bypass              (hsp_crm_o_pll_bypass),
        .i_norm_tst_en              (hsp_crm_o_pll_tst_en),
        .i_norm_fsel                (hsp_crm_o_pll_fsel),
        .i_norm_feed_en             (hsp_crm_o_pll_feed_en),
        .i_norm_lock_en             (hsp_crm_o_pll_lock_en),
        .i_norm_afcini_sel          (hsp_crm_o_pll_afcini_sel),
        .i_norm_vcoini_en           (hsp_crm_o_pll_vcoini_en),
        .i_norm_fout_mask           (hsp_crm_o_pll_fout_mask),
        .i_norm_pbias_ctrl          (hsp_crm_o_pll_pbias_ctrl),
        .i_norm_pbias_ctrl_en       (hsp_crm_o_pll_pbias_ctrl_en),
        .i_test0_p                  (t_hsp_pll_p),
        .i_test0_m                  (t_hsp_pll_m),
        .i_test0_s                  (t_hsp_pll_s),
        .i_test0_lock_con_in        (t_hsp_pll_lock_con_in),
        .i_test0_lock_con_out       (t_hsp_pll_lock_con_out),
        .i_test0_lock_con_dly       (t_hsp_pll_lock_con_dly),
        .i_test0_lock_con_rev       (t_hsp_pll_lock_con_rev),
        .i_test0_tst_afc            (t_hsp_pll_tst_afc),
        .i_test0_icp                (t_hsp_pll_icp),
        .i_test0_fin                (i_clk_xtal_y),
        .i_test0_resetb             (t_hsp_pll_resetb),
        .i_test0_bypass             (t_hsp_pll_bypass),
        .i_test0_tst_en             (t_hsp_pll_tst_en),
        .i_test0_fsel               (t_hsp_pll_fsel),
        .i_test0_feed_en            (t_hsp_pll_feed_en),
        .i_test0_lock_en            (t_hsp_pll_lock_en),
        .i_test0_afcini_sel         (t_hsp_pll_afcini_sel),
        .i_test0_vcoini_en          (t_hsp_pll_vcoini_en),
        .i_test0_fout_mask          (t_hsp_pll_fout_mask),
        .i_test0_pbias_ctrl         (t_hsp_pll_pbias_ctrl),
        .i_test0_pbias_ctrl_en      (t_hsp_pll_pbias_ctrl_en),
        .i_test1_p                  (sr_hsp_pll_p),
        .i_test1_m                  (sr_hsp_pll_m),
        .i_test1_s                  (sr_hsp_pll_s),
        .i_test1_lock_con_in        (2'h3),
        .i_test1_lock_con_out       (2'h3),
        .i_test1_lock_con_dly       (2'h3),
        .i_test1_lock_con_rev       (2'h0),
        .i_test1_tst_afc            (5'h0),
        .i_test1_icp                (2'h0),
        .i_test1_fin                (i_clk_xtal_y),
        .i_test1_resetb             (t_hsp_pll_resetb),
        .i_test1_bypass             (1'h0),
        .i_test1_tst_en             (1'h0),
        .i_test1_fsel               (1'h0),
        .i_test1_feed_en            (1'h0),
        .i_test1_lock_en            (1'h1),
        .i_test1_afcini_sel         (1'h0),
        .i_test1_vcoini_en          (1'h1),
        .i_test1_fout_mask          (1'h0),
        .i_test1_pbias_ctrl         (1'h0),
        .i_test1_pbias_ctrl_en      (1'h0),
        .o_feed_out                 (hsp_pll_o_feed_out),
        .o_lock                     (hsp_pll_o_lock),
        .o_fout                     (hsp_pll_o_fout),
        .o_sync_m_clk_out           (hsp_pll_o_sync_m_clk_out),
        .o_afc_code                 (hsp_pll_o_afc_code)
    );

    mvp_crm_hsp u_hsp_crm (
        .i_test_bypass              (i_test_bypass),
        .i_rstn_hsp                 (i_rstn_peri2hsp),
        .i_apb_pclk                 (i_clk_peri2hsp),
        .i_apb_prstn                (i_rstn_peri2hsp),
        .i_apb_psel                 (hsp_sub_o_crm_apb_psel),
        .i_apb_penable              (hsp_sub_o_crm_apb_penable),
        .i_apb_pwrite               (hsp_sub_o_crm_apb_pwrite),
        .i_apb_paddr                (hsp_sub_o_crm_apb_paddr),
        .i_apb_pwdata               (hsp_sub_o_crm_apb_pwdata),
        .o_apb_prdata               (hsp_sub_i_crm_apb_prdata),
        .o_pll_resetb               (hsp_crm_o_pll_resetb),
        .o_pll_bypass               (hsp_crm_o_pll_bypass),
        .o_pll_p                    (hsp_crm_o_pll_p),
        .o_pll_m                    (hsp_crm_o_pll_m),
        .o_pll_s                    (hsp_crm_o_pll_s),
        .i_pll_lock                 (hsp_pll_o_lock),
        .i_pll_feed_out             (hsp_pll_o_feed_out),
        .i_pll_sync_m_clk_out       (hsp_pll_o_sync_m_clk_out),
        .i_pll_afc_code             (hsp_pll_o_afc_code),
        .o_pll_lock_en              (hsp_crm_o_pll_lock_en),
        .o_pll_lock_con_in          (hsp_crm_o_pll_lock_con_in),
        .o_pll_lock_con_out         (hsp_crm_o_pll_lock_con_out),
        .o_pll_lock_con_dly         (hsp_crm_o_pll_lock_con_dly),
        .o_pll_lock_con_rev         (hsp_crm_o_pll_lock_con_rev),
        .o_pll_feed_en              (hsp_crm_o_pll_feed_en),
        .o_pll_fsel                 (hsp_crm_o_pll_fsel),
        .o_pll_tst_en               (hsp_crm_o_pll_tst_en),
        .o_pll_tst_afc              (hsp_crm_o_pll_tst_afc),
        .o_pll_afcini_sel           (hsp_crm_o_pll_afcini_sel),
        .o_pll_vcoini_en            (hsp_crm_o_pll_vcoini_en),
        .o_pll_fout_mask            (hsp_crm_o_pll_fout_mask),
        .o_pll_pbias_ctrl           (hsp_crm_o_pll_pbias_ctrl),
        .o_pll_pbias_ctrl_en        (hsp_crm_o_pll_pbias_ctrl_en),
        .o_pll_icp                  (hsp_crm_o_pll_icp),
        .i_clk_peri2hsp             (i_clk_peri2hsp),
        .i_clk_hsp2main             (i_clk_hsp2main),
        .i_pll_gmac                 (hsp_pll_o_fout),
        .i_clk_gmac_tx_y            (i_clk_gmac_tx_y),
        .i_clk_gmac_rx_y            (i_clk_gmac_rx_y),
        .o_clk_peri2hsp             (hsp_crm_o_clk_peri2hsp),
        .o_rstn_peri2hsp            (hsp_crm_o_rstn_peri2hsp),
        .o_sclk_jpeg                (hsp_crm_o_sclk_jpeg),
        .o_srstn_jpeg               (hsp_crm_o_srstn_jpeg),
        .o_clk_hsp2main             (hsp_crm_o_clk_hsp2main),
        .o_rstn_hsp2main            (hsp_crm_o_rstn_hsp2main),
        .o_clk_gmac                 (hsp_crm_o_clk_gmac),
        .o_rstn_gmac                (hsp_crm_o_rstn_gmac),
        .o_mclk_jpeg                (hsp_crm_o_mclk_jpeg),
        .o_mrstn_jpeg               (hsp_crm_o_mrstn_jpeg),
        .o_clk_jpeg_core            (hsp_crm_o_clk_jpeg_core),
        .o_rstn_jpeg_core           (hsp_crm_o_rstn_jpeg_core),
        .o_clk_gmac_rmii            (hsp_crm_o_clk_gmac_rmii),
        .o_clk_phy_refclk           (o_clk_phy_refclk_a),
        .o_clk_gmac_tx              (hsp_crm_o_clk_gmac_tx),
        .o_clk_gmac_tx_inv          (hsp_crm_o_clk_gmac_tx_inv),
        .o_clk_gmac_rx              (hsp_crm_o_clk_gmac_rx),
        .o_clk_gmac_rx_inv          (hsp_crm_o_clk_gmac_rx_inv),
        .o_clk_gmac_rx_oe           (o_clk_gmac_rx_oe),
        .o_clk_gmac_tx_oe           (o_clk_gmac_tx_oe),
        .i_sbd_tx_clk_gating        (hsp_sub_o_sbd_tx_clk_gating_ctrl),
        .i_scan_clk                 (i_scan_clk),
        .i_scan_mode                (i_scan_mode),
        .i_scan_rstn                (i_test_rstn)
    );

    hsp_sub u_hsp_sub (
        .i_clk_peri2hsp             (hsp_crm_o_clk_peri2hsp),
        .i_rstn_peri2hsp            (hsp_crm_o_rstn_peri2hsp),
        .i_clk_hsp2main             (hsp_crm_o_clk_hsp2main),
        .i_rstn_hsp2main            (hsp_crm_o_rstn_hsp2main),
        .i_clk_gmac                 (hsp_crm_o_clk_gmac),
        .i_rstn_gmac                (hsp_crm_o_rstn_gmac),
        .i_clk_gmac_tx              (hsp_crm_o_clk_gmac_tx),
        .i_clk_gmac_rx              (hsp_crm_o_clk_gmac_rx),
        .i_clk_gmac_tx_inv          (hsp_crm_o_clk_gmac_tx_inv),
        .i_clk_gmac_rx_inv          (hsp_crm_o_clk_gmac_rx_inv),
        .i_clk_gmac_rmii            (hsp_crm_o_clk_gmac_rmii),
        .i_mclk_jpeg                (hsp_crm_o_mclk_jpeg),
        .i_mrstn_jpeg               (hsp_crm_o_mrstn_jpeg),
        .i_sclk_jpeg                (hsp_crm_o_sclk_jpeg),
        .i_srstn_jpeg               (hsp_crm_o_srstn_jpeg),
        .i_clk_jpeg_core            (hsp_crm_o_clk_jpeg_core),
        .i_rstn_jpeg_core           (hsp_crm_o_rstn_jpeg_core),
        .o_crm_apb_psel             (hsp_sub_o_crm_apb_psel),
        .o_crm_apb_penable          (hsp_sub_o_crm_apb_penable),
        .o_crm_apb_pwrite           (hsp_sub_o_crm_apb_pwrite),
        .o_crm_apb_paddr            (hsp_sub_o_crm_apb_paddr),
        .o_crm_apb_pwdata           (hsp_sub_o_crm_apb_pwdata),
        .i_crm_apb_prdata           (hsp_sub_i_crm_apb_prdata),
        .i_pselx_peri2hsp           (i_pselx_peri2hsp),
        .i_penable_peri2hsp         (i_penable_peri2hsp),
        .i_pwrite_peri2hsp          (i_pwrite_peri2hsp),
        .i_paddr_peri2hsp           (i_paddr_peri2hsp),
        .i_pwdata_peri2hsp          (i_pwdata_peri2hsp),
        .o_prdata_peri2hsp          (o_prdata_peri2hsp),
        .o_pready_peri2hsp          (o_pready_peri2hsp),
        .o_pslverr_peri2hsp         (o_pslverr_peri2hsp),
        .o_hsp2main_awid            (o_hsp2main_awid),
        .o_hsp2main_awaddr          (o_hsp2main_awaddr),
        .o_hsp2main_awlen           (o_hsp2main_awlen),
        .o_hsp2main_awsize          (o_hsp2main_awsize),
        .o_hsp2main_awburst         (o_hsp2main_awburst),
        .o_hsp2main_awlock          (o_hsp2main_awlock),
        .o_hsp2main_awcache         (o_hsp2main_awcache),
        .o_hsp2main_awprot          (o_hsp2main_awprot),
        .o_hsp2main_awvalid         (o_hsp2main_awvalid),
        .i_hsp2main_awready         (i_hsp2main_awready),
        .o_hsp2main_wdata           (o_hsp2main_wdata),
        .o_hsp2main_wstrb           (o_hsp2main_wstrb),
        .o_hsp2main_wlast           (o_hsp2main_wlast),
        .o_hsp2main_wvalid          (o_hsp2main_wvalid),
        .i_hsp2main_wready          (i_hsp2main_wready),
        .i_hsp2main_bid             (i_hsp2main_bid),
        .i_hsp2main_bresp           (i_hsp2main_bresp),
        .i_hsp2main_bvalid          (i_hsp2main_bvalid),
        .o_hsp2main_bready          (o_hsp2main_bready),
        .o_hsp2main_arid            (o_hsp2main_arid),
        .o_hsp2main_araddr          (o_hsp2main_araddr),
        .o_hsp2main_arlen           (o_hsp2main_arlen),
        .o_hsp2main_arsize          (o_hsp2main_arsize),
        .o_hsp2main_arburst         (o_hsp2main_arburst),
        .o_hsp2main_arlock          (o_hsp2main_arlock),
        .o_hsp2main_arcache         (o_hsp2main_arcache),
        .o_hsp2main_arprot          (o_hsp2main_arprot),
        .o_hsp2main_arvalid         (o_hsp2main_arvalid),
        .i_hsp2main_arready         (i_hsp2main_arready),
        .i_hsp2main_rid             (i_hsp2main_rid),
        .i_hsp2main_rdata           (i_hsp2main_rdata),
        .i_hsp2main_rresp           (i_hsp2main_rresp),
        .i_hsp2main_rlast           (i_hsp2main_rlast),
        .i_hsp2main_rvalid          (i_hsp2main_rvalid),
        .o_hsp2main_rready          (o_hsp2main_rready),
        .o_gmac_mdc_a               (o_gmac_mdc_a),
        .i_gmac_mdio_y              (i_gmac_mdio_y),
        .o_gmac_mdio_a              (o_gmac_mdio_a),
        .o_gmac_mdio_oe             (o_gmac_mdio_oe),
        .i_gmac_phy_intf_sel_y      (i_gmac_phy_intf_sel_y),
        .o_gmac_tx_en_a             (o_gmac_tx_en_a),
        .o_gmac_tx_er_a             (o_gmac_tx_er_a),
        .o_gmac_txd_a               (o_gmac_txd_a),
        .i_gmac_crs_y               (i_gmac_crs_y),
        .i_gmac_col_y               (i_gmac_col_y),
        .i_gmac_rx_dv_y             (i_gmac_rx_dv_y),
        .i_gmac_rx_er_y             (i_gmac_rx_er_y),
        .i_gmac_rxd_y               (i_gmac_rxd_y),
        .o_irq_gmac_sbd             (o_irq_gmac_sbd),
        .o_irq_gmac_sbd_perch_tx    (o_irq_gmac_sbd_perch_tx),
        .o_irq_gmac_sbd_perch_rx    (o_irq_gmac_sbd_perch_rx),
        .o_irq_gmac_lpi             (o_irq_gmac_lpi),
        .o_irq_gmac_pmt             (o_irq_gmac_pmt),
        .o_irq_wdma                 (o_irq_jpeg_wdma),
        .o_irq_rdma_err             (o_irq_jpeg_rdma_err),
        .o_irq_rdma_done            (o_irq_jpeg_rdma_done),
        .o_irq_jpeg                 (o_irq_jpeg),
        .o_sbd_tx_clk_gating_ctrl   (hsp_sub_o_sbd_tx_clk_gating_ctrl),
        .i_ema                      (i_ema),
        .o_selddr_hsp_awuser        (o_hsp2main_awuser),
        .o_selddr_hsp_aruser        (o_hsp2main_aruser),
        .i_test_mode                (i_test_mode)
    );

endmodule