// ==========================================================
//
// (C) COPYRIGHT 2022 Alpha-Holdings INC. ALL RIGHT RESERVED
//
// User : jmkim
// Time : 2022/3/13/10/28/28
// File : mux_top.v
//
// ==========================================================

module mux_top (
    input   [  1:  0]  nand_wdata_o,
    input   [  1:  0]  nand_addr_o,
    output  [  1:  0]  nand_rdata_i,
    input              nand_cs_o,
    output             reset_i,
    output             test_i,
    output             xtal_i,
    input   [ 20:  0]  func_sel,
    input   [ 40:  0]  test_sel,
    input   [ 10:  0]  func_test_sel,
    output             P_XTAL_A,
    input              P_XTAL_Y,
    output             P_XTAL_IE,
    output             P_XTAL_OE,
    output             P_RESET_A,
    input              P_RESET_Y,
    output             P_RESET_IE,
    output             P_RESET_OE,
    output             P_NAND_CS_A,
    input              P_NAND_CS_Y,
    output             P_NAND_CS_IE,
    output             P_NAND_CS_OE,
    output             P_NAND_ADDR_0_A,
    input              P_NAND_ADDR_0_Y,
    output             P_NAND_ADDR_0_IE,
    output             P_NAND_ADDR_0_OE,
    output             P_NAND_ADDR_1_A,
    input              P_NAND_ADDR_1_Y,
    output             P_NAND_ADDR_1_IE,
    output             P_NAND_ADDR_1_OE,
    output             P_NAND_WDATA_0_A,
    input              P_NAND_WDATA_0_Y,
    output             P_NAND_WDATA_0_IE,
    output             P_NAND_WDATA_0_OE,
    output             P_NAND_WDATA_1_A,
    input              P_NAND_WDATA_1_Y,
    output             P_NAND_WDATA_1_IE,
    output             P_NAND_WDATA_1_OE,
    output             P_NAND_RDATA_0_A,
    input              P_NAND_RDATA_0_Y,
    output             P_NAND_RDATA_0_IE,
    output             P_NAND_RDATA_0_OE,
    output             P_NAND_RDATA_1_A,
    input              P_NAND_RDATA_1_Y,
    output             P_NAND_RDATA_1_IE,
    output             P_NAND_RDATA_1_OE,
    output             P_TEST_A,
    input              P_TEST_Y,
    output             P_TEST_IE,
    output             P_TEST_OE
);

    wire    [  4:0]  NC_in;
    wire    [184:0]  NC_out;


    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_XTAL (
        .o_func_in       ({NC_out[2:0],xtal_i}),
        .i_func_out      ({1'h0,1'h0,1'h0,NC_in[0]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h1}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h0}),
        .func_sel        (func_sel[1:0]),
        .o_test_in       (NC_out[17:3]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[3:0]),
        .func_test_sel   (func_test_sel[0]),
        .i_pad_y         (P_XTAL_Y),
        .o_pad_a         (P_XTAL_A),
        .o_pad_ie        (P_XTAL_IE),
        .o_pad_oe        (P_XTAL_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_RESET (
        .o_func_in       ({NC_out[20:18],reset_i}),
        .i_func_out      ({1'h0,1'h0,1'h0,NC_in[1]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h1}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h0}),
        .func_sel        (func_sel[3:2]),
        .o_test_in       (NC_out[35:21]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[7:4]),
        .func_test_sel   (func_test_sel[1]),
        .i_pad_y         (P_RESET_Y),
        .o_pad_a         (P_RESET_A),
        .o_pad_ie        (P_RESET_IE),
        .o_pad_oe        (P_RESET_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_CS (
        .o_func_in       (NC_out[39:36]),
        .i_func_out      ({1'h0,1'h0,1'h0,nand_cs_o}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h0}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h1}),
        .func_sel        (func_sel[5:4]),
        .o_test_in       (NC_out[54:40]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[11:8]),
        .func_test_sel   (func_test_sel[2]),
        .i_pad_y         (P_NAND_CS_Y),
        .o_pad_a         (P_NAND_CS_A),
        .o_pad_ie        (P_NAND_CS_IE),
        .o_pad_oe        (P_NAND_CS_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_ADDR_0 (
        .o_func_in       (NC_out[58:55]),
        .i_func_out      ({1'h0,1'h0,1'h0,nand_addr_o[0]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h0}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h1}),
        .func_sel        (func_sel[7:6]),
        .o_test_in       (NC_out[73:59]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[15:12]),
        .func_test_sel   (func_test_sel[3]),
        .i_pad_y         (P_NAND_ADDR_0_Y),
        .o_pad_a         (P_NAND_ADDR_0_A),
        .o_pad_ie        (P_NAND_ADDR_0_IE),
        .o_pad_oe        (P_NAND_ADDR_0_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_ADDR_1 (
        .o_func_in       (NC_out[77:74]),
        .i_func_out      ({1'h0,1'h0,1'h0,nand_addr_o[1]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h0}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h1}),
        .func_sel        (func_sel[9:8]),
        .o_test_in       (NC_out[92:78]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[19:16]),
        .func_test_sel   (func_test_sel[4]),
        .i_pad_y         (P_NAND_ADDR_1_Y),
        .o_pad_a         (P_NAND_ADDR_1_A),
        .o_pad_ie        (P_NAND_ADDR_1_IE),
        .o_pad_oe        (P_NAND_ADDR_1_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_WDATA_0 (
        .o_func_in       (NC_out[96:93]),
        .i_func_out      ({1'h0,1'h0,1'h0,nand_wdata_o[0]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h0}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h1}),
        .func_sel        (func_sel[11:10]),
        .o_test_in       (NC_out[111:97]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[23:20]),
        .func_test_sel   (func_test_sel[5]),
        .i_pad_y         (P_NAND_WDATA_0_Y),
        .o_pad_a         (P_NAND_WDATA_0_A),
        .o_pad_ie        (P_NAND_WDATA_0_IE),
        .o_pad_oe        (P_NAND_WDATA_0_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_WDATA_1 (
        .o_func_in       (NC_out[115:112]),
        .i_func_out      ({1'h0,1'h0,1'h0,nand_wdata_o[1]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h0}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h1}),
        .func_sel        (func_sel[13:12]),
        .o_test_in       (NC_out[130:116]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[27:24]),
        .func_test_sel   (func_test_sel[6]),
        .i_pad_y         (P_NAND_WDATA_1_Y),
        .o_pad_a         (P_NAND_WDATA_1_A),
        .o_pad_ie        (P_NAND_WDATA_1_IE),
        .o_pad_oe        (P_NAND_WDATA_1_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_RDATA_0 (
        .o_func_in       ({NC_out[133:131],nand_rdata_i[0]}),
        .i_func_out      ({1'h0,1'h0,1'h0,NC_in[2]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h1}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h0}),
        .func_sel        (func_sel[15:14]),
        .o_test_in       (NC_out[148:134]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[31:28]),
        .func_test_sel   (func_test_sel[7]),
        .i_pad_y         (P_NAND_RDATA_0_Y),
        .o_pad_a         (P_NAND_RDATA_0_A),
        .o_pad_ie        (P_NAND_RDATA_0_IE),
        .o_pad_oe        (P_NAND_RDATA_0_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_NAND_RDATA_1 (
        .o_func_in       ({NC_out[151:149],nand_rdata_i[1]}),
        .i_func_out      ({1'h0,1'h0,1'h0,NC_in[3]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h1}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h0}),
        .func_sel        (func_sel[17:16]),
        .o_test_in       (NC_out[166:152]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[35:32]),
        .func_test_sel   (func_test_sel[8]),
        .i_pad_y         (P_NAND_RDATA_1_Y),
        .o_pad_a         (P_NAND_RDATA_1_A),
        .o_pad_ie        (P_NAND_RDATA_1_IE),
        .o_pad_oe        (P_NAND_RDATA_1_OE)
    );

    alp_mux_top
        #(.FUNC_WIDTH(4), .TEST_WIDTH(15), .FUNC_WIDTH_LOG2(2), .TEST_WIDTH_LOG2(4))
    P_TEST (
        .o_func_in       ({NC_out[169:167],test_i}),
        .i_func_out      ({1'h0,1'h0,1'h0,NC_in[4]}),
        .i_func_ie       ({1'h0,1'h0,1'h0,1'h1}),
        .i_func_oe       ({1'h0,1'h0,1'h0,1'h0}),
        .func_sel        (func_sel[19:18]),
        .o_test_in       (NC_out[184:170]),
        .i_test_out      ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_ie       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .i_test_oe       ({1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0,1'h0}),
        .test_sel        (test_sel[39:36]),
        .func_test_sel   (func_test_sel[9]),
        .i_pad_y         (P_TEST_Y),
        .o_pad_a         (P_TEST_A),
        .o_pad_ie        (P_TEST_IE),
        .o_pad_oe        (P_TEST_OE)
    );

endmodule