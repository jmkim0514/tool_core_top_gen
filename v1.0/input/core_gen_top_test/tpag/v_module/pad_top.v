// ==========================================================
//
// (C) COPYRIGHT 2022 Alpha-Holdings INC. ALL RIGHT RESERVED
//
// User : jmkim
// Time : 2022/3/13/10/28/28
// File : pad_top.v
//
// ==========================================================

module pad_top (
    input              P_XTAL,
    input              P_RESET,
    output             P_NAND_CS,
    output             P_NAND_ADDR_0,
    output             P_NAND_ADDR_1,
    output             P_NAND_WDATA_0,
    output             P_NAND_WDATA_1,
    input              P_NAND_RDATA_0,
    input              P_NAND_RDATA_1,
    input              P_TEST,
    input              P_XTAL_A,
    output             P_XTAL_Y,
    input              P_XTAL_IE,
    input              P_XTAL_OE,
    input              P_RESET_A,
    output             P_RESET_Y,
    input              P_RESET_IE,
    input              P_RESET_OE,
    input              P_NAND_CS_A,
    output             P_NAND_CS_Y,
    input              P_NAND_CS_IE,
    input              P_NAND_CS_OE,
    input              P_NAND_ADDR_0_A,
    output             P_NAND_ADDR_0_Y,
    input              P_NAND_ADDR_0_IE,
    input              P_NAND_ADDR_0_OE,
    input              P_NAND_ADDR_1_A,
    output             P_NAND_ADDR_1_Y,
    input              P_NAND_ADDR_1_IE,
    input              P_NAND_ADDR_1_OE,
    input              P_NAND_WDATA_0_A,
    output             P_NAND_WDATA_0_Y,
    input              P_NAND_WDATA_0_IE,
    input              P_NAND_WDATA_0_OE,
    input              P_NAND_WDATA_1_A,
    output             P_NAND_WDATA_1_Y,
    input              P_NAND_WDATA_1_IE,
    input              P_NAND_WDATA_1_OE,
    input              P_NAND_RDATA_0_A,
    output             P_NAND_RDATA_0_Y,
    input              P_NAND_RDATA_0_IE,
    input              P_NAND_RDATA_0_OE,
    input              P_NAND_RDATA_1_A,
    output             P_NAND_RDATA_1_Y,
    input              P_NAND_RDATA_1_IE,
    input              P_NAND_RDATA_1_OE,
    input              P_TEST_A,
    output             P_TEST_Y,
    input              P_TEST_IE,
    input              P_TEST_OE,
    input   [  9:  0]  control_DS0,
    input   [  9:  0]  control_DS1,
    input   [  9:  0]  control_PE,
    input   [  9:  0]  control_PS,
    input   [  9:  0]  control_IS,
    input   [  9:  0]  control_SR
);

    wire    [9:0]  NC_in;
    wire    [9:0]  NC_out;


    PBIDIR_E33_33_NT_DR u_P_XTAL (
        .A     (P_XTAL_A),
        .OE    (P_XTAL_OE),
        .DS0   (control_DS0[0]),
        .DS1   (control_DS1[0]),
        .PE    (control_PE[0]),
        .PS    (control_PS[0]),
        .IE    (P_XTAL_IE),
        .IS    (control_IS[0]),
        .SR    (control_SR[0]),
        .POE   (NC_in[0]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_XTAL_Y),
        .PO    (NC_out[0]),
        .PAD   (P_XTAL),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_RESET (
        .A     (P_RESET_A),
        .OE    (P_RESET_OE),
        .DS0   (control_DS0[1]),
        .DS1   (control_DS1[1]),
        .PE    (control_PE[1]),
        .PS    (control_PS[1]),
        .IE    (P_RESET_IE),
        .IS    (control_IS[1]),
        .SR    (control_SR[1]),
        .POE   (NC_in[1]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_RESET_Y),
        .PO    (NC_out[1]),
        .PAD   (P_RESET),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_CS (
        .A     (P_NAND_CS_A),
        .OE    (P_NAND_CS_OE),
        .DS0   (control_DS0[2]),
        .DS1   (control_DS1[2]),
        .PE    (control_PE[2]),
        .PS    (control_PS[2]),
        .IE    (P_NAND_CS_IE),
        .IS    (control_IS[2]),
        .SR    (control_SR[2]),
        .POE   (NC_in[2]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_CS_Y),
        .PO    (NC_out[2]),
        .PAD   (P_NAND_CS),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_ADDR_0 (
        .A     (P_NAND_ADDR_0_A),
        .OE    (P_NAND_ADDR_0_OE),
        .DS0   (control_DS0[3]),
        .DS1   (control_DS1[3]),
        .PE    (control_PE[3]),
        .PS    (control_PS[3]),
        .IE    (P_NAND_ADDR_0_IE),
        .IS    (control_IS[3]),
        .SR    (control_SR[3]),
        .POE   (NC_in[3]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_ADDR_0_Y),
        .PO    (NC_out[3]),
        .PAD   (P_NAND_ADDR_0),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_ADDR_1 (
        .A     (P_NAND_ADDR_1_A),
        .OE    (P_NAND_ADDR_1_OE),
        .DS0   (control_DS0[4]),
        .DS1   (control_DS1[4]),
        .PE    (control_PE[4]),
        .PS    (control_PS[4]),
        .IE    (P_NAND_ADDR_1_IE),
        .IS    (control_IS[4]),
        .SR    (control_SR[4]),
        .POE   (NC_in[4]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_ADDR_1_Y),
        .PO    (NC_out[4]),
        .PAD   (P_NAND_ADDR_1),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_WDATA_0 (
        .A     (P_NAND_WDATA_0_A),
        .OE    (P_NAND_WDATA_0_OE),
        .DS0   (control_DS0[5]),
        .DS1   (control_DS1[5]),
        .PE    (control_PE[5]),
        .PS    (control_PS[5]),
        .IE    (P_NAND_WDATA_0_IE),
        .IS    (control_IS[5]),
        .SR    (control_SR[5]),
        .POE   (NC_in[5]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_WDATA_0_Y),
        .PO    (NC_out[5]),
        .PAD   (P_NAND_WDATA_0),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_WDATA_1 (
        .A     (P_NAND_WDATA_1_A),
        .OE    (P_NAND_WDATA_1_OE),
        .DS0   (control_DS0[6]),
        .DS1   (control_DS1[6]),
        .PE    (control_PE[6]),
        .PS    (control_PS[6]),
        .IE    (P_NAND_WDATA_1_IE),
        .IS    (control_IS[6]),
        .SR    (control_SR[6]),
        .POE   (NC_in[6]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_WDATA_1_Y),
        .PO    (NC_out[6]),
        .PAD   (P_NAND_WDATA_1),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_RDATA_0 (
        .A     (P_NAND_RDATA_0_A),
        .OE    (P_NAND_RDATA_0_OE),
        .DS0   (control_DS0[7]),
        .DS1   (control_DS1[7]),
        .PE    (control_PE[7]),
        .PS    (control_PS[7]),
        .IE    (P_NAND_RDATA_0_IE),
        .IS    (control_IS[7]),
        .SR    (control_SR[7]),
        .POE   (NC_in[7]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_RDATA_0_Y),
        .PO    (NC_out[7]),
        .PAD   (P_NAND_RDATA_0),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_NAND_RDATA_1 (
        .A     (P_NAND_RDATA_1_A),
        .OE    (P_NAND_RDATA_1_OE),
        .DS0   (control_DS0[8]),
        .DS1   (control_DS1[8]),
        .PE    (control_PE[8]),
        .PS    (control_PS[8]),
        .IE    (P_NAND_RDATA_1_IE),
        .IS    (control_IS[8]),
        .SR    (control_SR[8]),
        .POE   (NC_in[8]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_NAND_RDATA_1_Y),
        .PO    (NC_out[8]),
        .PAD   (P_NAND_RDATA_1),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

    PBIDIR_E33_33_NT_DR u_P_TEST (
        .A     (P_TEST_A),
        .OE    (P_TEST_OE),
        .DS0   (control_DS0[9]),
        .DS1   (control_DS1[9]),
        .PE    (control_PE[9]),
        .PS    (control_PS[9]),
        .IE    (P_TEST_IE),
        .IS    (control_IS[9]),
        .SR    (control_SR[9]),
        .POE   (NC_in[9]),
        .SNS   (1'h1),
        .RTO   (1'h1),
        .Y     (P_TEST_Y),
        .PO    (NC_out[9]),
        .PAD   (P_TEST),
        .V18   (1'h0),
        .V25   (1'h0),
        .VB0   (1'h0),
        .VB1   (1'h0)
    );

endmodule