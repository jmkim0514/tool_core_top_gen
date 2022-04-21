// ==========================================================
//
// (C) COPYRIGHT 2022 Alpha-Holdings INC. ALL RIGHT RESERVED
//
// User : jmkim
// Time : 2022/3/13/10/28/28
// File : core.v
//
// ==========================================================

module core (
    output  [  1:  0]  nand_wdata_o,
    output  [  1:  0]  nand_addr_o,
    input   [  1:  0]  nand_rdata_i,
    output             nand_cs_o,
    input              reset_i,
    input              test_i,
    input              xtal_i,
    output  [  9:  0]  control_DS0,
    output  [  9:  0]  control_DS1,
    output  [  9:  0]  control_PE,
    output  [  9:  0]  control_PS,
    output  [  9:  0]  control_IS,
    output  [  9:  0]  control_SR,
    output  [ 20:  0]  func_sel,
    output  [ 40:  0]  test_sel,
    output  [ 10:  0]  func_test_sel
);



endmodule