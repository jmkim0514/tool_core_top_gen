// ==========================================================
//
// (C) COPYRIGHT 2022 Alpha-Holdings INC. ALL RIGHT RESERVED
//
// User : jmkim
// Time : 2022/3/13/10/28/28
// File : core_top.v
//
// ==========================================================

module core_top (
    input              P_XTAL,
    input              P_RESET,
    output             P_NAND_CS,
    output             P_NAND_ADDR_0,
    output             P_NAND_ADDR_1,
    output             P_NAND_WDATA_0,
    output             P_NAND_WDATA_1,
    input              P_NAND_RDATA_0,
    input              P_NAND_RDATA_1,
    input              P_TEST
);

    wire    [ 1:0]  u0_nand_wdata_o;
    wire    [ 1:0]  u0_nand_addr_o;
    wire    [ 1:0]  u0_nand_rdata_i;
    wire            u0_nand_cs_o;
    wire            u0_reset_i;
    wire            u0_test_i;
    wire            u0_xtal_i;
    wire    [ 9:0]  u0_control_DS0;
    wire    [ 9:0]  u0_control_DS1;
    wire    [ 9:0]  u0_control_PE;
    wire    [ 9:0]  u0_control_PS;
    wire    [ 9:0]  u0_control_IS;
    wire    [ 9:0]  u0_control_SR;
    wire    [20:0]  u0_func_sel;
    wire    [40:0]  u0_test_sel;
    wire    [10:0]  u0_func_test_sel;
    wire            u1_P_XTAL_A;
    wire            u1_P_XTAL_Y;
    wire            u1_P_XTAL_IE;
    wire            u1_P_XTAL_OE;
    wire            u1_P_RESET_A;
    wire            u1_P_RESET_Y;
    wire            u1_P_RESET_IE;
    wire            u1_P_RESET_OE;
    wire            u1_P_NAND_CS_A;
    wire            u1_P_NAND_CS_Y;
    wire            u1_P_NAND_CS_IE;
    wire            u1_P_NAND_CS_OE;
    wire            u1_P_NAND_ADDR_0_A;
    wire            u1_P_NAND_ADDR_0_Y;
    wire            u1_P_NAND_ADDR_0_IE;
    wire            u1_P_NAND_ADDR_0_OE;
    wire            u1_P_NAND_ADDR_1_A;
    wire            u1_P_NAND_ADDR_1_Y;
    wire            u1_P_NAND_ADDR_1_IE;
    wire            u1_P_NAND_ADDR_1_OE;
    wire            u1_P_NAND_WDATA_0_A;
    wire            u1_P_NAND_WDATA_0_Y;
    wire            u1_P_NAND_WDATA_0_IE;
    wire            u1_P_NAND_WDATA_0_OE;
    wire            u1_P_NAND_WDATA_1_A;
    wire            u1_P_NAND_WDATA_1_Y;
    wire            u1_P_NAND_WDATA_1_IE;
    wire            u1_P_NAND_WDATA_1_OE;
    wire            u1_P_NAND_RDATA_0_A;
    wire            u1_P_NAND_RDATA_0_Y;
    wire            u1_P_NAND_RDATA_0_IE;
    wire            u1_P_NAND_RDATA_0_OE;
    wire            u1_P_NAND_RDATA_1_A;
    wire            u1_P_NAND_RDATA_1_Y;
    wire            u1_P_NAND_RDATA_1_IE;
    wire            u1_P_NAND_RDATA_1_OE;
    wire            u1_P_TEST_A;
    wire            u1_P_TEST_Y;
    wire            u1_P_TEST_IE;
    wire            u1_P_TEST_OE;


    core u_core (
        .nand_wdata_o        (u0_nand_wdata_o),
        .nand_addr_o         (u0_nand_addr_o),
        .nand_rdata_i        (u0_nand_rdata_i),
        .nand_cs_o           (u0_nand_cs_o),
        .reset_i             (u0_reset_i),
        .test_i              (u0_test_i),
        .xtal_i              (u0_xtal_i),
        .control_DS0         (u0_control_DS0),
        .control_DS1         (u0_control_DS1),
        .control_PE          (u0_control_PE),
        .control_PS          (u0_control_PS),
        .control_IS          (u0_control_IS),
        .control_SR          (u0_control_SR),
        .func_sel            (u0_func_sel),
        .test_sel            (u0_test_sel),
        .func_test_sel       (u0_func_test_sel)
    );

    mux_top u_mux_top (
        .nand_wdata_o        (u0_nand_wdata_o),
        .nand_addr_o         (u0_nand_addr_o),
        .nand_rdata_i        (u0_nand_rdata_i),
        .nand_cs_o           (u0_nand_cs_o),
        .reset_i             (u0_reset_i),
        .test_i              (u0_test_i),
        .xtal_i              (u0_xtal_i),
        .func_sel            (u0_func_sel),
        .test_sel            (u0_test_sel),
        .func_test_sel       (u0_func_test_sel),
        .P_XTAL_A            (u1_P_XTAL_A),
        .P_XTAL_Y            (u1_P_XTAL_Y),
        .P_XTAL_IE           (u1_P_XTAL_IE),
        .P_XTAL_OE           (u1_P_XTAL_OE),
        .P_RESET_A           (u1_P_RESET_A),
        .P_RESET_Y           (u1_P_RESET_Y),
        .P_RESET_IE          (u1_P_RESET_IE),
        .P_RESET_OE          (u1_P_RESET_OE),
        .P_NAND_CS_A         (u1_P_NAND_CS_A),
        .P_NAND_CS_Y         (u1_P_NAND_CS_Y),
        .P_NAND_CS_IE        (u1_P_NAND_CS_IE),
        .P_NAND_CS_OE        (u1_P_NAND_CS_OE),
        .P_NAND_ADDR_0_A     (u1_P_NAND_ADDR_0_A),
        .P_NAND_ADDR_0_Y     (u1_P_NAND_ADDR_0_Y),
        .P_NAND_ADDR_0_IE    (u1_P_NAND_ADDR_0_IE),
        .P_NAND_ADDR_0_OE    (u1_P_NAND_ADDR_0_OE),
        .P_NAND_ADDR_1_A     (u1_P_NAND_ADDR_1_A),
        .P_NAND_ADDR_1_Y     (u1_P_NAND_ADDR_1_Y),
        .P_NAND_ADDR_1_IE    (u1_P_NAND_ADDR_1_IE),
        .P_NAND_ADDR_1_OE    (u1_P_NAND_ADDR_1_OE),
        .P_NAND_WDATA_0_A    (u1_P_NAND_WDATA_0_A),
        .P_NAND_WDATA_0_Y    (u1_P_NAND_WDATA_0_Y),
        .P_NAND_WDATA_0_IE   (u1_P_NAND_WDATA_0_IE),
        .P_NAND_WDATA_0_OE   (u1_P_NAND_WDATA_0_OE),
        .P_NAND_WDATA_1_A    (u1_P_NAND_WDATA_1_A),
        .P_NAND_WDATA_1_Y    (u1_P_NAND_WDATA_1_Y),
        .P_NAND_WDATA_1_IE   (u1_P_NAND_WDATA_1_IE),
        .P_NAND_WDATA_1_OE   (u1_P_NAND_WDATA_1_OE),
        .P_NAND_RDATA_0_A    (u1_P_NAND_RDATA_0_A),
        .P_NAND_RDATA_0_Y    (u1_P_NAND_RDATA_0_Y),
        .P_NAND_RDATA_0_IE   (u1_P_NAND_RDATA_0_IE),
        .P_NAND_RDATA_0_OE   (u1_P_NAND_RDATA_0_OE),
        .P_NAND_RDATA_1_A    (u1_P_NAND_RDATA_1_A),
        .P_NAND_RDATA_1_Y    (u1_P_NAND_RDATA_1_Y),
        .P_NAND_RDATA_1_IE   (u1_P_NAND_RDATA_1_IE),
        .P_NAND_RDATA_1_OE   (u1_P_NAND_RDATA_1_OE),
        .P_TEST_A            (u1_P_TEST_A),
        .P_TEST_Y            (u1_P_TEST_Y),
        .P_TEST_IE           (u1_P_TEST_IE),
        .P_TEST_OE           (u1_P_TEST_OE)
    );

    pad_top u_pad_top (
        .P_XTAL              (P_XTAL),
        .P_RESET             (P_RESET),
        .P_NAND_CS           (P_NAND_CS),
        .P_NAND_ADDR_0       (P_NAND_ADDR_0),
        .P_NAND_ADDR_1       (P_NAND_ADDR_1),
        .P_NAND_WDATA_0      (P_NAND_WDATA_0),
        .P_NAND_WDATA_1      (P_NAND_WDATA_1),
        .P_NAND_RDATA_0      (P_NAND_RDATA_0),
        .P_NAND_RDATA_1      (P_NAND_RDATA_1),
        .P_TEST              (P_TEST),
        .P_XTAL_A            (u1_P_XTAL_A),
        .P_XTAL_Y            (u1_P_XTAL_Y),
        .P_XTAL_IE           (u1_P_XTAL_IE),
        .P_XTAL_OE           (u1_P_XTAL_OE),
        .P_RESET_A           (u1_P_RESET_A),
        .P_RESET_Y           (u1_P_RESET_Y),
        .P_RESET_IE          (u1_P_RESET_IE),
        .P_RESET_OE          (u1_P_RESET_OE),
        .P_NAND_CS_A         (u1_P_NAND_CS_A),
        .P_NAND_CS_Y         (u1_P_NAND_CS_Y),
        .P_NAND_CS_IE        (u1_P_NAND_CS_IE),
        .P_NAND_CS_OE        (u1_P_NAND_CS_OE),
        .P_NAND_ADDR_0_A     (u1_P_NAND_ADDR_0_A),
        .P_NAND_ADDR_0_Y     (u1_P_NAND_ADDR_0_Y),
        .P_NAND_ADDR_0_IE    (u1_P_NAND_ADDR_0_IE),
        .P_NAND_ADDR_0_OE    (u1_P_NAND_ADDR_0_OE),
        .P_NAND_ADDR_1_A     (u1_P_NAND_ADDR_1_A),
        .P_NAND_ADDR_1_Y     (u1_P_NAND_ADDR_1_Y),
        .P_NAND_ADDR_1_IE    (u1_P_NAND_ADDR_1_IE),
        .P_NAND_ADDR_1_OE    (u1_P_NAND_ADDR_1_OE),
        .P_NAND_WDATA_0_A    (u1_P_NAND_WDATA_0_A),
        .P_NAND_WDATA_0_Y    (u1_P_NAND_WDATA_0_Y),
        .P_NAND_WDATA_0_IE   (u1_P_NAND_WDATA_0_IE),
        .P_NAND_WDATA_0_OE   (u1_P_NAND_WDATA_0_OE),
        .P_NAND_WDATA_1_A    (u1_P_NAND_WDATA_1_A),
        .P_NAND_WDATA_1_Y    (u1_P_NAND_WDATA_1_Y),
        .P_NAND_WDATA_1_IE   (u1_P_NAND_WDATA_1_IE),
        .P_NAND_WDATA_1_OE   (u1_P_NAND_WDATA_1_OE),
        .P_NAND_RDATA_0_A    (u1_P_NAND_RDATA_0_A),
        .P_NAND_RDATA_0_Y    (u1_P_NAND_RDATA_0_Y),
        .P_NAND_RDATA_0_IE   (u1_P_NAND_RDATA_0_IE),
        .P_NAND_RDATA_0_OE   (u1_P_NAND_RDATA_0_OE),
        .P_NAND_RDATA_1_A    (u1_P_NAND_RDATA_1_A),
        .P_NAND_RDATA_1_Y    (u1_P_NAND_RDATA_1_Y),
        .P_NAND_RDATA_1_IE   (u1_P_NAND_RDATA_1_IE),
        .P_NAND_RDATA_1_OE   (u1_P_NAND_RDATA_1_OE),
        .P_TEST_A            (u1_P_TEST_A),
        .P_TEST_Y            (u1_P_TEST_Y),
        .P_TEST_IE           (u1_P_TEST_IE),
        .P_TEST_OE           (u1_P_TEST_OE),
        .control_DS0         (u0_control_DS0),
        .control_DS1         (u0_control_DS1),
        .control_PE          (u0_control_PE),
        .control_PS          (u0_control_PS),
        .control_IS          (u0_control_IS),
        .control_SR          (u0_control_SR)
    );

endmodule