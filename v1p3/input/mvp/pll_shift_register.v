module pll_shift_register (
    input           t_sr_ctrl_clk, 
    input           t_sr_ctrl_rst, 
    input           t_sr_ctrl_in,  
    output   [5:0]  t_sr_ctrl_hsp_pll_p,       
    output   [9:0]  t_sr_ctrl_hsp_pll_m,       
    output   [2:0]  t_sr_ctrl_hsp_pll_s,       
    output   [5:0]  t_sr_ctrl_tg_pll_p,       
    output   [9:0]  t_sr_ctrl_tg_pll_m,       
    output   [2:0]  t_sr_ctrl_tg_pll_s,       
    output   [5:0]  t_sr_ctrl_isp0_pll_p,       
    output   [9:0]  t_sr_ctrl_isp0_pll_m,       
    output   [2:0]  t_sr_ctrl_isp0_pll_s,       
    output   [5:0]  t_sr_ctrl_isp1_pll_p,       
    output   [9:0]  t_sr_ctrl_isp1_pll_m,       
    output   [2:0]  t_sr_ctrl_isp1_pll_s,       
    output   [5:0]  t_sr_ctrl_main_pll_p,       
    output   [9:0]  t_sr_ctrl_main_pll_m,       
    output   [2:0]  t_sr_ctrl_main_pll_s,       
    output   [5:0]  t_sr_ctrl_ddr_pll_p,       
    output   [8:0]  t_sr_ctrl_ddr_pll_m,       
    output   [2:0]  t_sr_ctrl_ddr_pll_s,       
    output   [15:0]  t_sr_ctrl_ddr_pll_k       
);
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_p0 ( .D(t_sr_ctrl_hsp_pll_p[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_p[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_p1 ( .D(t_sr_ctrl_hsp_pll_p[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_p[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_p2 ( .D(t_sr_ctrl_hsp_pll_p[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_p[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_p3 ( .D(t_sr_ctrl_hsp_pll_p[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_p[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_p4 ( .D(t_sr_ctrl_hsp_pll_p[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_p[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_p5 ( .D(t_sr_ctrl_hsp_pll_m[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_p[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m0 ( .D(t_sr_ctrl_hsp_pll_m[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m1 ( .D(t_sr_ctrl_hsp_pll_m[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m2 ( .D(t_sr_ctrl_hsp_pll_m[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m3 ( .D(t_sr_ctrl_hsp_pll_m[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m4 ( .D(t_sr_ctrl_hsp_pll_m[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m5 ( .D(t_sr_ctrl_hsp_pll_m[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m6 ( .D(t_sr_ctrl_hsp_pll_m[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m7 ( .D(t_sr_ctrl_hsp_pll_m[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m8 ( .D(t_sr_ctrl_hsp_pll_m[9]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_m9 ( .D(t_sr_ctrl_hsp_pll_s[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_m[9]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_s0 ( .D(t_sr_ctrl_hsp_pll_s[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_s[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_s1 ( .D(t_sr_ctrl_hsp_pll_s[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_s[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_hsp_pll_s2 ( .D(t_sr_ctrl_tg_pll_p[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_hsp_pll_s[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_p0 ( .D(t_sr_ctrl_tg_pll_p[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_p[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_p1 ( .D(t_sr_ctrl_tg_pll_p[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_p[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_p2 ( .D(t_sr_ctrl_tg_pll_p[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_p[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_p3 ( .D(t_sr_ctrl_tg_pll_p[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_p[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_p4 ( .D(t_sr_ctrl_tg_pll_p[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_p[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_p5 ( .D(t_sr_ctrl_tg_pll_m[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_p[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m0 ( .D(t_sr_ctrl_tg_pll_m[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m1 ( .D(t_sr_ctrl_tg_pll_m[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m2 ( .D(t_sr_ctrl_tg_pll_m[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m3 ( .D(t_sr_ctrl_tg_pll_m[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m4 ( .D(t_sr_ctrl_tg_pll_m[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m5 ( .D(t_sr_ctrl_tg_pll_m[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m6 ( .D(t_sr_ctrl_tg_pll_m[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m7 ( .D(t_sr_ctrl_tg_pll_m[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m8 ( .D(t_sr_ctrl_tg_pll_m[9]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_m9 ( .D(t_sr_ctrl_tg_pll_s[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_m[9]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_s0 ( .D(t_sr_ctrl_tg_pll_s[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_s[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_s1 ( .D(t_sr_ctrl_tg_pll_s[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_s[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_tg_pll_s2 ( .D(t_sr_ctrl_isp0_pll_p[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_tg_pll_s[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_p0 ( .D(t_sr_ctrl_isp0_pll_p[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_p[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_p1 ( .D(t_sr_ctrl_isp0_pll_p[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_p[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_p2 ( .D(t_sr_ctrl_isp0_pll_p[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_p[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_p3 ( .D(t_sr_ctrl_isp0_pll_p[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_p[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_p4 ( .D(t_sr_ctrl_isp0_pll_p[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_p[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_p5 ( .D(t_sr_ctrl_isp0_pll_m[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_p[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m0 ( .D(t_sr_ctrl_isp0_pll_m[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m1 ( .D(t_sr_ctrl_isp0_pll_m[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m2 ( .D(t_sr_ctrl_isp0_pll_m[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m3 ( .D(t_sr_ctrl_isp0_pll_m[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m4 ( .D(t_sr_ctrl_isp0_pll_m[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m5 ( .D(t_sr_ctrl_isp0_pll_m[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m6 ( .D(t_sr_ctrl_isp0_pll_m[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m7 ( .D(t_sr_ctrl_isp0_pll_m[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m8 ( .D(t_sr_ctrl_isp0_pll_m[9]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_m9 ( .D(t_sr_ctrl_isp0_pll_s[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_m[9]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_s0 ( .D(t_sr_ctrl_isp0_pll_s[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_s[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_s1 ( .D(t_sr_ctrl_isp0_pll_s[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_s[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp0_pll_s2 ( .D(t_sr_ctrl_isp1_pll_p[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp0_pll_s[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_p0 ( .D(t_sr_ctrl_isp1_pll_p[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_p[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_p1 ( .D(t_sr_ctrl_isp1_pll_p[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_p[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_p2 ( .D(t_sr_ctrl_isp1_pll_p[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_p[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_p3 ( .D(t_sr_ctrl_isp1_pll_p[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_p[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_p4 ( .D(t_sr_ctrl_isp1_pll_p[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_p[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_p5 ( .D(t_sr_ctrl_isp1_pll_m[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_p[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m0 ( .D(t_sr_ctrl_isp1_pll_m[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m1 ( .D(t_sr_ctrl_isp1_pll_m[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m2 ( .D(t_sr_ctrl_isp1_pll_m[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m3 ( .D(t_sr_ctrl_isp1_pll_m[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m4 ( .D(t_sr_ctrl_isp1_pll_m[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m5 ( .D(t_sr_ctrl_isp1_pll_m[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m6 ( .D(t_sr_ctrl_isp1_pll_m[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m7 ( .D(t_sr_ctrl_isp1_pll_m[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m8 ( .D(t_sr_ctrl_isp1_pll_m[9]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_m9 ( .D(t_sr_ctrl_isp1_pll_s[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_m[9]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_s0 ( .D(t_sr_ctrl_isp1_pll_s[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_s[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_s1 ( .D(t_sr_ctrl_isp1_pll_s[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_s[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_isp1_pll_s2 ( .D(t_sr_ctrl_main_pll_p[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_isp1_pll_s[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_p0 ( .D(t_sr_ctrl_main_pll_p[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_p[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_p1 ( .D(t_sr_ctrl_main_pll_p[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_p[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_p2 ( .D(t_sr_ctrl_main_pll_p[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_p[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_p3 ( .D(t_sr_ctrl_main_pll_p[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_p[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_p4 ( .D(t_sr_ctrl_main_pll_p[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_p[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_p5 ( .D(t_sr_ctrl_main_pll_m[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_p[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m0 ( .D(t_sr_ctrl_main_pll_m[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m1 ( .D(t_sr_ctrl_main_pll_m[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m2 ( .D(t_sr_ctrl_main_pll_m[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m3 ( .D(t_sr_ctrl_main_pll_m[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m4 ( .D(t_sr_ctrl_main_pll_m[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m5 ( .D(t_sr_ctrl_main_pll_m[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m6 ( .D(t_sr_ctrl_main_pll_m[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m7 ( .D(t_sr_ctrl_main_pll_m[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m8 ( .D(t_sr_ctrl_main_pll_m[9]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_m9 ( .D(t_sr_ctrl_main_pll_s[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_m[9]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_s0 ( .D(t_sr_ctrl_main_pll_s[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_s[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_s1 ( .D(t_sr_ctrl_main_pll_s[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_s[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_main_pll_s2 ( .D(t_sr_ctrl_ddr_pll_p[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_main_pll_s[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_p0 ( .D(t_sr_ctrl_ddr_pll_p[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_p[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_p1 ( .D(t_sr_ctrl_ddr_pll_p[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_p[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_p2 ( .D(t_sr_ctrl_ddr_pll_p[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_p[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_p3 ( .D(t_sr_ctrl_ddr_pll_p[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_p[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_p4 ( .D(t_sr_ctrl_ddr_pll_p[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_p[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_p5 ( .D(t_sr_ctrl_ddr_pll_m[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_p[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m0 ( .D(t_sr_ctrl_ddr_pll_m[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m1 ( .D(t_sr_ctrl_ddr_pll_m[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m2 ( .D(t_sr_ctrl_ddr_pll_m[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m3 ( .D(t_sr_ctrl_ddr_pll_m[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m4 ( .D(t_sr_ctrl_ddr_pll_m[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m5 ( .D(t_sr_ctrl_ddr_pll_m[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m6 ( .D(t_sr_ctrl_ddr_pll_m[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m7 ( .D(t_sr_ctrl_ddr_pll_m[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_m8 ( .D(t_sr_ctrl_ddr_pll_s[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_m[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_s0 ( .D(t_sr_ctrl_ddr_pll_s[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_s[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_s1 ( .D(t_sr_ctrl_ddr_pll_s[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_s[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_s2 ( .D(t_sr_ctrl_ddr_pll_k[0]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_s[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k0 ( .D(t_sr_ctrl_ddr_pll_k[1]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[0]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k1 ( .D(t_sr_ctrl_ddr_pll_k[2]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[1]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k2 ( .D(t_sr_ctrl_ddr_pll_k[3]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[2]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k3 ( .D(t_sr_ctrl_ddr_pll_k[4]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[3]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k4 ( .D(t_sr_ctrl_ddr_pll_k[5]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[4]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k5 ( .D(t_sr_ctrl_ddr_pll_k[6]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[5]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k6 ( .D(t_sr_ctrl_ddr_pll_k[7]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[6]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k7 ( .D(t_sr_ctrl_ddr_pll_k[8]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[7]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k8 ( .D(t_sr_ctrl_ddr_pll_k[9]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[8]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k9 ( .D(t_sr_ctrl_ddr_pll_k[10]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[9]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k10 ( .D(t_sr_ctrl_ddr_pll_k[11]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[10]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k11 ( .D(t_sr_ctrl_ddr_pll_k[12]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[11]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k12 ( .D(t_sr_ctrl_ddr_pll_k[13]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[12]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k13 ( .D(t_sr_ctrl_ddr_pll_k[14]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[13]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k14 ( .D(t_sr_ctrl_ddr_pll_k[15]), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[14]));
    DFFRPQ_X0P5M_A9TR_C34 u_DONT_TOUCH_reg_ddr_pll_k15 ( .D(t_sr_ctrl_in), .CK(t_sr_ctrl_clk), .R(t_sr_ctrl_rst), .Q(t_sr_ctrl_ddr_pll_k[15]));

endmodule
