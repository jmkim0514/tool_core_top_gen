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
// File name : peri_hpdf
// Version : v1.0
// Description :
// Simulator : NC Verilog
// Created by : SoC Designer
// Date : 2022-04-19  20:21
//==============================================================================

module cpu_hpdf (
    input         i_uart0_txdmasreq,
    input         i_uart0_rxdmasreq,
    input         i_uart0_txdmabreq,
    input         i_uart0_rxdmabreq,
    output        o_uart0_txdmaclr,
    output        o_uart0_rxdmaclr,
    input         o_test_txdamsreq,
    input         o_test_rxdmasreq,
    input         o_test_txdmabreq,
    input         o_test_rxdmabreq,
    output        o_ssp1_txdmaclr,
    output        o_ssp1_rxdmaclr,
    input         i_test_clk,
    input   [  4:  0]  i_wid_m4_cpu2_peri,
    input   [ 31:  0]  i_waddr_m4_cpu2_peri,
    input   [  7:  0]  i_wlen_m4_cpu2_peri,
    input   [  2:  0]  i_wsize_m4_cpu2_peri,
    input   [  1:  0]  i_wburst_m4_cpu2_peri,
    input              i_wlock_m4_cpu2_peri,
    input   [  3:  0]  i_wcache_m4_cpu2_peri,
    input   [  2:  0]  i_wprot_m4_cpu2_peri,
    input              i_wvalid_m4_cpu2_peri,
    output             o_wready_m4_cpu2_peri,
    input   [  4:  0]  i_rid_m4_cpu2_peri,
    input   [ 31:  0]  i_raddr_m4_cpu2_peri,
    input   [  7:  0]  i_rlen_m4_cpu2_peri,
    input   [  2:  0]  i_rsize_m4_cpu2_peri,
    input   [  1:  0]  i_rburst_m4_cpu2_peri,
    input              i_rlock_m4_cpu2_peri,
    input   [  3:  0]  i_rcache_m4_cpu2_peri,
    input   [  2:  0]  i_rprot_m4_cpu2_peri,
    input              i_rvalid_m4_cpu2_peri,
    output             o_rready_m4_cpu2_peri,
    input   [ 31:  0]  i_data_m4_cpu2_peri,
    input   [  3:  0]  i_strb_m4_cpu2_peri,
    input              i_last_m4_cpu2_peri,
    input              i_valid_m4_cpu2_peri,
    output             o_ready_m4_cpu2_peri,
    output  [  4:  0]  o_id_m4_cpu2_peri,
    output  [  1:  0]  o_resp_m4_cpu2_peri,
    output             o_valid_m4_cpu2_peri,
    input              i_ready_m4_cpu2_peri
);



endmodule