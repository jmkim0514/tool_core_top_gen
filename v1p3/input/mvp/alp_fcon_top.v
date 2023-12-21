module alp_fcon_top (
    //fcon
    input  wire         i_pix0_fstart,    // From MVP0_HPDF o_fcon_fstart0
    input  wire         i_pix1_fstart,    // From MVP0_HPDF o_fcon_fstart1
    input  wire         i_pix2_fstart,    // From MVP0_HPDF o_fcon_fstart2
    input  wire         i_pix3_fstart,    // From MVP0_HPDF o_fcon_fstart3
    input  wire         i_pix4_fstart,    // From MVP1_HPDF o_fcon_fstart0
    input  wire         i_pix5_fstart,    // From MVP1_HPDF o_fcon_fstart1
    input  wire         i_pix6_fstart,    // From MVP1_HPDF o_fcon_fstart2
    input  wire         i_pix7_fstart,    // From MVP1_HPDF o_fcon_fstart3
    output wire         o_pix0_mask,      // To MVP0_HPDF   i_fcon_mask0
    output wire         o_pix1_mask,      // To MVP0_HPDF   i_fcon_mask1
    output wire         o_pix2_mask,      // To MVP0_HPDF   i_fcon_mask2
    output wire         o_pix3_mask,      // To MVP0_HPDF   i_fcon_mask3
    output wire         o_pix4_mask,      // To MVP1_HPDF   i_fcon_mask0
    output wire         o_pix5_mask,      // To MVP1_HPDF   i_fcon_mask1
    output wire         o_pix6_mask,      // To MVP1_HPDF   i_fcon_mask2
    output wire         o_pix7_mask,      // To MVP1_HPDF   i_fcon_mask3

    output wire         o_irq_rate,

    //apb
    input  wire         i_pclk,
    input  wire         i_presetn,
    input  wire         i_psel,
    input  wire         i_penable,
    input  wire         i_pwrite,
    input  wire [7:0]   i_paddr,
    input  wire [31:0]  i_pwdata,
    output wire [31:0]  o_prdata,
    output wire         o_pready,
    output wire         o_pslverr
);
    //-------------------------------------------------------------------------
    // wire
    //-------------------------------------------------------------------------
    wire            run_rate        ;
    wire            run_rate_use0   ;
    wire            run_rate_use1   ;
    wire            run_rate_use2   ;
    wire            run_rate_use3   ;
    wire            run_rate_use4   ;
    wire            run_rate_use5   ;
    wire            run_rate_use6   ;
    wire            run_rate_use7   ;

    wire            run_fcon_sync   ;
    wire            clr_fcon_sync   ;
    wire  [4:0]     reg_max_rate    ;
    wire  [2:0]     reg_sensor_use  ;
    wire  [31:0]    reg_sync_map    ;
    wire  [31:0]    reg_rate_ctrl   ;
    wire  [31:0]    reg_rate_int    ;
    wire  [19:0]    reg_sync_max    ;
    wire  [7:0]     reg_sync_prd    ;

    wire            mux_pix0_fstart;
    wire            mux_pix1_fstart;
    wire            mux_pix2_fstart;
    wire            mux_pix3_fstart;
    wire            mux_pix4_fstart;
    wire            mux_pix5_fstart;
    wire            mux_pix6_fstart;
    wire            mux_pix7_fstart;

    wire  [4:0]     rate_cnt0;
    wire  [4:0]     rate_cnt1;
    wire  [4:0]     rate_cnt2;
    wire  [4:0]     rate_cnt3;
    wire  [4:0]     rate_cnt4;
    wire  [4:0]     rate_cnt5;
    wire  [4:0]     rate_cnt6;
    wire  [4:0]     rate_cnt7;

    wire            apb0_mask;
    wire            apb1_mask;
    wire            apb2_mask;
    wire            apb3_mask;
    wire            apb4_mask;
    wire            apb5_mask;
    wire            apb6_mask;
    wire            apb7_mask;
    wire            frc0_mask;
    wire            frc1_mask;
    wire            frc2_mask;
    wire            frc3_mask;
    wire            frc4_mask;
    wire            frc5_mask;
    wire            frc6_mask;
    wire            frc7_mask;
    wire            fcs0_mask;
    wire            fcs1_mask;
    wire            fcs2_mask;
    wire            fcs3_mask;
    wire            fcs4_mask;
    wire            fcs5_mask;
    wire            fcs6_mask;
    wire            fcs7_mask;
    wire            irq_rate0;
    wire            irq_rate1;
    wire            irq_rate2;
    wire            irq_rate3;
    wire            irq_rate4;
    wire            irq_rate5;
    wire            irq_rate6;
    wire            irq_rate7;

//    //-------------------------------------------------------------------------
//    // fstart mask 
//    //-------------------------------------------------------------------------
//
//    assign  o_pix0_mask = (frc0_mask | fcs0_mask) ;
//    assign  o_pix1_mask = (frc1_mask | fcs1_mask) ;
//    assign  o_pix2_mask = (frc2_mask | fcs2_mask) ;
//    assign  o_pix3_mask = (frc3_mask | fcs3_mask) ;
//    assign  o_pix4_mask = (frc4_mask | fcs4_mask) ;
//    assign  o_pix5_mask = (frc5_mask | fcs5_mask) ;
//    assign  o_pix6_mask = (frc6_mask | fcs6_mask) ;
//    assign  o_pix7_mask = (frc7_mask | fcs7_mask) ;

    //-------------------------------------------------------------------------
    // apb
    //-------------------------------------------------------------------------
    alp_fcon_apb u_alp_fcon_apb (
        .i_pclk                 (i_pclk             ),
        .i_prstn                (i_presetn          ),
        .i_psel                 (i_psel             ),
        .i_penable              (i_penable          ),
        .i_pwrite               (i_pwrite           ),
        .i_paddr                (i_paddr            ),
        .i_pwdata               (i_pwdata           ),
        .o_prdata               (o_prdata           ),
        .o_pready               (o_pready           ),
        .o_pslverr              (o_pslverr          ),
        // interrupt
        .i_irq_rate0            (irq_rate0          ),
        .i_irq_rate1            (irq_rate1          ),
        .i_irq_rate2            (irq_rate2          ),
        .i_irq_rate3            (irq_rate3          ),
        .i_irq_rate4            (irq_rate4          ),
        .i_irq_rate5            (irq_rate5          ),
        .i_irq_rate6            (irq_rate6          ),
        .i_irq_rate7            (irq_rate7          ),
        .o_irq_rate             (o_irq_rate         ),
        // Register
        .o_run_rate             (run_rate           ),
        .o_run_sync             (run_fcon_sync      ),   
        .o_rstn_fcon            (clr_fcon_sync      ),   
        .o_reg_max_rate         (reg_max_rate       ),
        .o_reg_sensor_use       (reg_sensor_use     ),
        .o_reg_sync_map         (reg_sync_map       ),
        .i_reg_rate_cnt_fs0     (rate_cnt0          ),
        .i_reg_rate_cnt_fs1     (rate_cnt1          ),
        .i_reg_rate_cnt_fs2     (rate_cnt2          ),
        .i_reg_rate_cnt_fs3     (rate_cnt3          ),
        .i_reg_rate_cnt_fs4     (rate_cnt4          ),
        .i_reg_rate_cnt_fs5     (rate_cnt5          ),
        .i_reg_rate_cnt_fs6     (rate_cnt6          ),
        .i_reg_rate_cnt_fs7     (rate_cnt7          ),
        .o_reg_rate_ctrl        (reg_rate_ctrl      ),
        .o_reg_rate_int         (reg_rate_int       ),
        .o_reg_sync_max         (reg_sync_max       ),
        .o_reg_sync_prd         (reg_sync_prd       )
    );

    //-------------------------------------------------------------------------
    // alp_rate - @mark
    //-------------------------------------------------------------------------
    alp_fcon_mux u_alp_fcon_mux (
        .i_clk           (i_pclk),
        .i_rstn          (i_presetn),
        .i_sync_map      (reg_sync_map),
        .i_pix0_fstart   (i_pix0_fstart),
        .i_pix1_fstart   (i_pix1_fstart),
        .i_pix2_fstart   (i_pix2_fstart),
        .i_pix3_fstart   (i_pix3_fstart),
        .i_pix4_fstart   (i_pix4_fstart),
        .i_pix5_fstart   (i_pix5_fstart),
        .i_pix6_fstart   (i_pix6_fstart),
        .i_pix7_fstart   (i_pix7_fstart),
        .o_pix0_fstart   (mux_pix0_fstart),
        .o_pix1_fstart   (mux_pix1_fstart),
        .o_pix2_fstart   (mux_pix2_fstart),
        .o_pix3_fstart   (mux_pix3_fstart),
        .o_pix4_fstart   (mux_pix4_fstart),
        .o_pix5_fstart   (mux_pix5_fstart),
        .o_pix6_fstart   (mux_pix6_fstart),
        .o_pix7_fstart   (mux_pix7_fstart)
    );

    //-------------------------------------------------------------------------
    // alp_rate - @mark
    //-------------------------------------------------------------------------
    assign run_rate_use0 = run_rate;
    assign run_rate_use1 = run_rate;
    assign run_rate_use2 = run_rate & (reg_sensor_use >= 2'd1 );
    assign run_rate_use3 = run_rate & (reg_sensor_use >= 2'd1 );
    assign run_rate_use4 = run_rate & (reg_sensor_use >= 2'd2 );
    assign run_rate_use5 = run_rate & (reg_sensor_use >= 2'd2 );
    assign run_rate_use6 = run_rate & (reg_sensor_use >= 2'd3 );
    assign run_rate_use7 = run_rate & (reg_sensor_use >= 2'd3 );
    
    
    alp_rate u_alp_rate0 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix0_fstart),
        .o_mask         (frc0_mask),
        .o_mask_fcs     (apb0_mask),
        .o_intenb       (irq_rate0),
        .i_reg_run      (run_rate_use0),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt0)
    );

    alp_rate u_alp_rate1 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix1_fstart),
        .o_mask         (frc1_mask),
        .o_mask_fcs     (apb1_mask),
        .o_intenb       (irq_rate1),
        .i_reg_run      (run_rate_use1),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt1)
    );

    alp_rate u_alp_rate2 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix2_fstart),
        .o_mask         (frc2_mask),
        .o_mask_fcs     (apb2_mask),
        .o_intenb       (irq_rate2),
        .i_reg_run      (run_rate_use2),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt2)
    );

    alp_rate u_alp_rate3 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix3_fstart),
        .o_mask         (frc3_mask),
        .o_mask_fcs     (apb3_mask),
        .o_intenb       (irq_rate3),
        .i_reg_run      (run_rate_use3),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt3)
    );

    alp_rate u_alp_rate4 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix4_fstart),
        .o_mask         (frc4_mask),
        .o_mask_fcs     (apb4_mask),
        .o_intenb       (irq_rate4),
        .i_reg_run      (run_rate_use4),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt4)
    );

    alp_rate u_alp_rate5 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix5_fstart),
        .o_mask         (frc5_mask),
        .o_mask_fcs     (apb5_mask),
        .o_intenb       (irq_rate5),
        .i_reg_run      (run_rate_use5),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt5)
    );

    alp_rate u_alp_rate6 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix6_fstart),
        .o_mask         (frc6_mask),
        .o_mask_fcs     (apb6_mask),
        .o_intenb       (irq_rate6),
        .i_reg_run      (run_rate_use6),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt6)
    );

    alp_rate u_alp_rate7 (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_fstart       (mux_pix7_fstart),
        .o_mask         (frc7_mask),
        .o_mask_fcs     (apb7_mask),
        .o_intenb       (irq_rate7),
        .i_reg_run      (run_rate_use7),
        .i_reg_max_rate (reg_max_rate),
        .i_reg_rate_enb (reg_rate_ctrl),
        .i_reg_rate_int (reg_rate_int),
        .o_rate_cnt     (rate_cnt7)
    );


    wire    fcs0_fstart = (apb0_mask)? 1'b0 : mux_pix0_fstart;
    wire    fcs1_fstart = (apb1_mask)? 1'b0 : mux_pix1_fstart;
    wire    fcs2_fstart = (apb2_mask)? 1'b0 : mux_pix2_fstart;
    wire    fcs3_fstart = (apb3_mask)? 1'b0 : mux_pix3_fstart;
    wire    fcs4_fstart = (apb4_mask)? 1'b0 : mux_pix4_fstart;
    wire    fcs5_fstart = (apb5_mask)? 1'b0 : mux_pix5_fstart;
    wire    fcs6_fstart = (apb6_mask)? 1'b0 : mux_pix6_fstart;
    wire    fcs7_fstart = (apb7_mask)? 1'b0 : mux_pix7_fstart;

    alp_fcon_sync u_alp_fcon_sync (
        .i_clk          (i_pclk),
        .i_rstn         (i_presetn),
        .i_clrenb       (clr_fcon_sync),
        .i_pix0_fstart  (fcs0_fstart) ,
        .i_pix1_fstart  (fcs1_fstart) ,
        .i_pix2_fstart  (fcs2_fstart) ,
        .i_pix3_fstart  (fcs3_fstart) ,
        .i_pix4_fstart  (fcs4_fstart) ,
        .i_pix5_fstart  (fcs5_fstart) ,
        .i_pix6_fstart  (fcs6_fstart) ,
        .i_pix7_fstart  (fcs7_fstart) ,
        .o_pix0_mask    (fcs0_mask  ) ,
        .o_pix1_mask    (fcs1_mask  ) ,
        .o_pix2_mask    (fcs2_mask  ) ,
        .o_pix3_mask    (fcs3_mask  ) ,
        .o_pix4_mask    (fcs4_mask  ) ,
        .o_pix5_mask    (fcs5_mask  ) ,
        .o_pix6_mask    (fcs6_mask  ) ,
        .o_pix7_mask    (fcs7_mask  ) ,
        .i_reg_run      (run_fcon_sync),    
        .i_reg_map_sel  (reg_sensor_use[1:0]),
        .i_reg_cnt_max  (reg_sync_max),
        .i_reg_cnt_prd  (reg_sync_prd)
    );

    alp_fcon_demux u_alp_fcon_demux (
        .i_clk             (i_pclk),
        .i_rstn            (i_presetn),
        .i_sync_map        (reg_sync_map),
        .i_rate0_mask      (frc0_mask),
        .i_rate1_mask      (frc1_mask),
        .i_rate2_mask      (frc2_mask),
        .i_rate3_mask      (frc3_mask),
        .i_rate4_mask      (frc4_mask),
        .i_rate5_mask      (frc5_mask),
        .i_rate6_mask      (frc6_mask),
        .i_rate7_mask      (frc7_mask),
        .i_sync0_mask      (fcs0_mask),
        .i_sync1_mask      (fcs1_mask),
        .i_sync2_mask      (fcs2_mask),
        .i_sync3_mask      (fcs3_mask),
        .i_sync4_mask      (fcs4_mask),
        .i_sync5_mask      (fcs5_mask),
        .i_sync6_mask      (fcs6_mask),
        .i_sync7_mask      (fcs7_mask),
        .o_pix0_mask       (o_pix0_mask),
        .o_pix1_mask       (o_pix1_mask),
        .o_pix2_mask       (o_pix2_mask),
        .o_pix3_mask       (o_pix3_mask),
        .o_pix4_mask       (o_pix4_mask),
        .o_pix5_mask       (o_pix5_mask),
        .o_pix6_mask       (o_pix6_mask),
        .o_pix7_mask       (o_pix7_mask)
    );

endmodule

 
