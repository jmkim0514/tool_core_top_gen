module mvp_crm_main (
    input              i_test_bypass,
    input              i_apb_pclk,
    input              i_apb_prstn,
    input              i_apb_psel,
    input              i_apb_penable,
    input              i_apb_pwrite,
    input   [ 11:  0]  i_apb_paddr,
    input   [ 31:  0]  i_apb_pwdata,
    output  [ 31:  0]  o_apb_prdata,
    output             o_norm_resetb,
    output             o_norm_bypass,
    output  [  5:  0]  o_norm_p,
    output  [  9:  0]  o_norm_m,
    output  [  2:  0]  o_norm_s,
    input              i_lock,
    input              i_feed_out,
    input              i_sync_m_clk_out,
    input   [  4:  0]  i_afc_code,
    output             o_norm_lock_en,
    output  [  1:  0]  o_norm_lock_con_in,
    output  [  1:  0]  o_norm_lock_con_out,
    output  [  1:  0]  o_norm_lock_con_dly,
    output  [  1:  0]  o_norm_lock_con_rev,
    output             o_norm_feed_en,
    output             o_norm_fsel,
    output             o_norm_tst_en,
    output  [  4:  0]  o_norm_tst_afc,
    output             o_norm_afcini_sel,
    output             o_norm_vcoini_en,
    output             o_norm_fout_mask,
    output             o_norm_pbias_ctrl,
    output             o_norm_pbias_ctrl_en,
    output  [  1:  0]  o_norm_icp,
    input              i_clk_xtal_y,
    input              i_por,
    input              i_reset,
    input              i_por_sel,
    input              i_rstn_sw,
    input              i_rstn_wdt,
    output             o_rstn_wdt,
    input              i_pll_sys,
    output             o_clk_cpu,
    output             o_clk_hsp2main,
    output             o_rstn_hsp2main,
    output             o_clk_main_bus,
    output             o_rstn_main_bus,
    output             o_clk_cpu2main,
    output             o_rstn_cpu2main,
    output             o_clk_mna2main,
    output             o_rstn_mna2main,
    output             o_clk_keti2main,
    output             o_rstn_keti2main,
    output             o_clk_mvp2main,
    output             o_rstn_mvp2main,
    output             o_clk_main2ddr,
    output             o_rstn_main2ddr,
    output             o_clk_cpu_peri,
    output             o_rstn_cpu_peri,
    output             o_clk_cpu2peri,
    output             o_rstn_cpu2peri,
    output             o_clk_peri2keti,
    output             o_rstn_peri2keti,
    output             o_clk_peri2mna,
    output             o_rstn_peri2mna,
    output             o_clk_peri2ddr,
    output             o_rstn_peri2ddr,
    output             o_clk_peri2hsp,
    output             o_rstn_peri2hsp,
    output             o_clk_peri2main,
    output             o_rstn_peri2main,
    output             o_clk_main_system,
    output             o_rstn_main_system,
    output             o_clk_cpu2mvp,
    output             o_rstn_cpu2mvp,
    output             o_clk_fcon,
    output             o_rstn_fcon,
    output             o_step1,
    output             o_rstn_mem,
    output             o_rstn_ip,
    output             o_rstn_bus,
    output             o_rstn_core,
    output             o_test_clk200,
    output             o_test_clk100,
    input              i_no_scan,
    input              i_scan_clk,
    input              i_scan_mode,
    input              i_scan_rstn
);

    wire           rstseq_o_step0;
    wire           _rstseq_o_step0;
    wire           w6_o_clk;
    wire           w7_o_clk;
    wire           w8_o_clk;
    wire           w9_o_clk;
    wire           w10_o_out;
    wire           w11_o_out;
    wire           w12_o_out;
    wire           reg_o_u_src_pll_sys_sel;
    wire           reg_o_clken_u_crg_hsp2main;
    wire           reg_o_clken_u_crg_main_bus;
    wire           reg_o_clken_u_crg_cpu2main;
    wire           reg_o_clken_u_crg_mna2main;
    wire           reg_o_clken_u_crg_keti2main;
    wire           reg_o_clken_u_crg_mvp2main;
    wire           reg_o_clken_u_crg_main2ddr;
    wire           reg_o_clken_u_crg_cpu2peri;
    wire           reg_o_clken_u_crg_peri2keti;
    wire           reg_o_clken_u_crg_peri2mna;
    wire           reg_o_clken_u_crg_peri2ddr;
    wire           reg_o_clken_u_crg_peri2hsp;
    wire           reg_o_clken_u_crg_peri2main;
    wire           reg_o_clken_u_crg_cpu2mvp;
    wire           reg_o_clken_u_crg_fcon;
    wire           reg_o_rsten_u_crg_hsp2main;
    wire           reg_o_rsten_u_crg_main_bus;
    wire           reg_o_rsten_u_crg_cpu2main;
    wire           reg_o_rsten_u_crg_mna2main;
    wire           reg_o_rsten_u_crg_keti2main;
    wire           reg_o_rsten_u_crg_mvp2main;
    wire           reg_o_rsten_u_crg_main2ddr;
    wire           reg_o_rsten_u_crg_cpu2peri;
    wire           reg_o_rsten_u_crg_peri2keti;
    wire           reg_o_rsten_u_crg_peri2mna;
    wire           reg_o_rsten_u_crg_peri2ddr;
    wire           reg_o_rsten_u_crg_peri2hsp;
    wire           reg_o_rsten_u_crg_peri2main;
    wire           reg_o_rsten_u_crg_cpu2mvp;
    wire           reg_o_rsten_u_crg_fcon;

    wire _w6_o_clk;

    assign  o_test_clk100 = w9_o_clk;
    assign  o_test_clk200 = w8_o_clk;

    alp_crm_sequencer
        #(.DELAY_COUNT0(1000), .DELAY_COUNT1(100), .DELAY_COUNT2(100), .DELAY_COUNT3(100), .DELAY_COUNT4(100), .DELAY_COUNT5(100))
    u_alp_crm_sequencer (
        .i_xtal                    (i_clk_xtal_y),
        .i_por                     (i_por),
        .i_reset                   (i_reset),
        .i_por_sel                 (i_por_sel),
        .i_rstn_sw                 (i_rstn_sw),
        .i_rstn_wdt                (i_rstn_wdt),
        .o_rstn_wdt                (o_rstn_wdt),
        .o_step0                   (rstseq_o_step0),
        .o_step1                   (o_step1),
        .o_step2                   (o_rstn_mem),
        .o_step3                   (o_rstn_ip),
        .o_step4                   (o_rstn_bus),
        .o_step5                   (o_rstn_core)
    );

    alp_crm_mux2 u_test_mux1 (
        .i_sel  (i_test_bypass),
        .i_in0  (rstseq_o_step0),
        .i_in1  (i_reset),
        .o_out  (_rstseq_o_step0)
    );

    alp_clk_mxgl2 u_src_pll_sys (
        .i_rstn                    (_rstseq_o_step0),
        .i_sel                     (reg_o_u_src_pll_sys_sel),
        .i_clk0                    (i_clk_xtal_y),
        .i_clk1                    (i_pll_sys),
        .o_clk                     (w6_o_clk)
    );

    alp_clk_mux2 u_test_mux0 (
        .i_sel                       (i_test_bypass),
        .i_clk0                      (w6_o_clk),
        .i_clk1                      (i_pll_sys),
        .o_clk                       (_w6_o_clk)
    );

    alp_clk_div2 u_div2_src_pll_sys (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (_w6_o_clk),
        .o_clk                     (w7_o_clk)
    );

    alp_clk_divu
        #(.HIGH(1), .LOW(2))
    u_div3_src_pll_sys (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (_w6_o_clk),
        .o_clk                     (w8_o_clk)
    );

    alp_clk_divu
        #(.HIGH(2), .LOW(5))
    u_div6_src_pll_sys (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (_w6_o_clk),
        .o_clk                     (w9_o_clk)
    );

    alp_clk_buf u_occ_point0 (
        .i_in                      (w8_o_clk),
        .o_out                     (w10_o_out)
    );

    alp_clk_buf u_occ_point1 (
        .i_in                      (w7_o_clk),
        .o_out                     (w11_o_out)
    );

    alp_clk_buf u_occ_point2 (
        .i_in                      (w9_o_clk),
        .o_out                     (w12_o_out)
    );

    alp_clk_crg_clock u_crg_cpu (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w10_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (1'h1),
        .o_clk                     (o_clk_cpu),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_hsp2main (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w10_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_hsp2main),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_hsp2main),
        .o_clk                     (o_clk_hsp2main),
        .o_rstn                    (o_rstn_hsp2main),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_main_bus (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w11_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_main_bus),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_main_bus),
        .o_clk                     (o_clk_main_bus),
        .o_rstn                    (o_rstn_main_bus),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_cpu2main (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w11_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_cpu2main),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_cpu2main),
        .o_clk                     (o_clk_cpu2main),
        .o_rstn                    (o_rstn_cpu2main),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_mna2main (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w11_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_mna2main),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_mna2main),
        .o_clk                     (o_clk_mna2main),
        .o_rstn                    (o_rstn_mna2main),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_keti2main (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w11_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_keti2main),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_keti2main),
        .o_clk                     (o_clk_keti2main),
        .o_rstn                    (o_rstn_keti2main),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_mvp2main (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w11_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_mvp2main),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_mvp2main),
        .o_clk                     (o_clk_mvp2main),
        .o_rstn                    (o_rstn_mvp2main),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_main2ddr (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w11_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_main2ddr),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_main2ddr),
        .o_clk                     (o_clk_main2ddr),
        .o_rstn                    (o_rstn_main2ddr),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_cpu_peri (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (1'h1),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (1'h1),
        .o_clk                     (o_clk_cpu_peri),
        .o_rstn                    (o_rstn_cpu_peri),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_cpu2peri (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_cpu2peri),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_cpu2peri),
        .o_clk                     (o_clk_cpu2peri),
        .o_rstn                    (o_rstn_cpu2peri),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_peri2keti (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_peri2keti),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_peri2keti),
        .o_clk                     (o_clk_peri2keti),
        .o_rstn                    (o_rstn_peri2keti),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_peri2mna (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_peri2mna),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_peri2mna),
        .o_clk                     (o_clk_peri2mna),
        .o_rstn                    (o_rstn_peri2mna),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_peri2ddr (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_peri2ddr),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_peri2ddr),
        .o_clk                     (o_clk_peri2ddr),
        .o_rstn                    (o_rstn_peri2ddr),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_peri2hsp (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_peri2hsp),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_peri2hsp),
        .o_clk                     (o_clk_peri2hsp),
        .o_rstn                    (o_rstn_peri2hsp),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_peri2main (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_peri2main),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_peri2main),
        .o_clk                     (o_clk_peri2main),
        .o_rstn                    (o_rstn_peri2main),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_main_system (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (1'h1),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (1'h1),
        .o_clk                     (o_clk_main_system),
        .o_rstn                    (o_rstn_main_system),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_cpu2mvp (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_cpu2mvp),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_cpu2mvp),
        .o_clk                     (o_clk_cpu2mvp),
        .o_rstn                    (o_rstn_cpu2mvp),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_no_scan),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    alp_clk_crg u_crg_fcon (
        .i_rstn                    (_rstseq_o_step0),
        .i_clk                     (w12_o_out),
        .i_clken0                  (1'h1),
        .i_clken1                  (1'h1),
        .i_clken2                  (reg_o_clken_u_crg_fcon),
        .i_rsten0                  (1'h1),
        .i_rsten1                  (1'h1),
        .i_rsten2                  (reg_o_rsten_u_crg_fcon),
        .o_clk                     (o_clk_fcon),
        .o_rstn                    (o_rstn_fcon),
        .i_scan_mode               (i_scan_mode),
        .i_scan_clk                (i_scan_clk),
        .i_scan_rstn               (i_scan_rstn),
        .i_test_bypass             (i_test_bypass)
    );

    regmap_mvp_crm_main u_regmap_mvp_crm_main (
        .i_apb_pclk                (i_apb_pclk),
        .i_apb_prstn               (i_apb_prstn),
        .i_apb_psel                (i_apb_psel),
        .i_apb_penable             (i_apb_penable),
        .i_apb_pwrite              (i_apb_pwrite),
        .i_apb_paddr               (i_apb_paddr),
        .i_apb_pwdata              (i_apb_pwdata),
        .o_apb_prdata              (o_apb_prdata),
        .o_norm_resetb             (o_norm_resetb),
        .o_norm_bypass             (o_norm_bypass),
        .o_norm_p                  (o_norm_p),
        .o_norm_m                  (o_norm_m),
        .o_norm_s                  (o_norm_s),
        .i_lock                    (i_lock),
        .i_feed_out                (i_feed_out),
        .i_sync_m_clk_out          (i_sync_m_clk_out),
        .i_afc_code                (i_afc_code),
        .o_norm_lock_en            (o_norm_lock_en),
        .o_norm_lock_con_in        (o_norm_lock_con_in),
        .o_norm_lock_con_out       (o_norm_lock_con_out),
        .o_norm_lock_con_dly       (o_norm_lock_con_dly),
        .o_norm_lock_con_rev       (o_norm_lock_con_rev),
        .o_norm_feed_en            (o_norm_feed_en),
        .o_norm_fsel               (o_norm_fsel),
        .o_norm_tst_en             (o_norm_tst_en),
        .o_norm_tst_afc            (o_norm_tst_afc),
        .o_norm_afcini_sel         (o_norm_afcini_sel),
        .o_norm_vcoini_en          (o_norm_vcoini_en),
        .o_norm_fout_mask          (o_norm_fout_mask),
        .o_norm_pbias_ctrl         (o_norm_pbias_ctrl),
        .o_norm_pbias_ctrl_en      (o_norm_pbias_ctrl_en),
        .o_norm_icp                (o_norm_icp),
        .o_u_src_pll_sys_sel       (reg_o_u_src_pll_sys_sel),
        .o_clken_u_crg_hsp2main    (reg_o_clken_u_crg_hsp2main),
        .o_clken_u_crg_main_bus    (reg_o_clken_u_crg_main_bus),
        .o_clken_u_crg_cpu2main    (reg_o_clken_u_crg_cpu2main),
        .o_clken_u_crg_mna2main    (reg_o_clken_u_crg_mna2main),
        .o_clken_u_crg_keti2main   (reg_o_clken_u_crg_keti2main),
        .o_clken_u_crg_mvp2main    (reg_o_clken_u_crg_mvp2main),
        .o_clken_u_crg_main2ddr    (reg_o_clken_u_crg_main2ddr),
        .o_clken_u_crg_cpu2peri    (reg_o_clken_u_crg_cpu2peri),
        .o_clken_u_crg_peri2keti   (reg_o_clken_u_crg_peri2keti),
        .o_clken_u_crg_peri2mna    (reg_o_clken_u_crg_peri2mna),
        .o_clken_u_crg_peri2ddr    (reg_o_clken_u_crg_peri2ddr),
        .o_clken_u_crg_peri2hsp    (reg_o_clken_u_crg_peri2hsp),
        .o_clken_u_crg_peri2main   (reg_o_clken_u_crg_peri2main),
        .o_clken_u_crg_cpu2mvp     (reg_o_clken_u_crg_cpu2mvp),
        .o_clken_u_crg_fcon        (reg_o_clken_u_crg_fcon),
        .o_rsten_u_crg_hsp2main    (reg_o_rsten_u_crg_hsp2main),
        .o_rsten_u_crg_main_bus    (reg_o_rsten_u_crg_main_bus),
        .o_rsten_u_crg_cpu2main    (reg_o_rsten_u_crg_cpu2main),
        .o_rsten_u_crg_mna2main    (reg_o_rsten_u_crg_mna2main),
        .o_rsten_u_crg_keti2main   (reg_o_rsten_u_crg_keti2main),
        .o_rsten_u_crg_mvp2main    (reg_o_rsten_u_crg_mvp2main),
        .o_rsten_u_crg_main2ddr    (reg_o_rsten_u_crg_main2ddr),
        .o_rsten_u_crg_cpu2peri    (reg_o_rsten_u_crg_cpu2peri),
        .o_rsten_u_crg_peri2keti   (reg_o_rsten_u_crg_peri2keti),
        .o_rsten_u_crg_peri2mna    (reg_o_rsten_u_crg_peri2mna),
        .o_rsten_u_crg_peri2ddr    (reg_o_rsten_u_crg_peri2ddr),
        .o_rsten_u_crg_peri2hsp    (reg_o_rsten_u_crg_peri2hsp),
        .o_rsten_u_crg_peri2main   (reg_o_rsten_u_crg_peri2main),
        .o_rsten_u_crg_cpu2mvp     (reg_o_rsten_u_crg_cpu2mvp),
        .o_rsten_u_crg_fcon        (reg_o_rsten_u_crg_fcon)
    );

endmodule
