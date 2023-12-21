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
// COPYRIGHT (C) ALPHAHOLDINGS, inc. 2023
//
//==============================================================================
// File name    : main_system.v 
// Version      : v1.0
// Description  : main_system module : Decoder & SYS, PAD Control  
// Simulator    : NC Verilog
// Created by   : bhoh
//==============================================================================

module main_system #(parameter P_NUM_PAD = 263)
(
    input                   i_clk_main_system       ,
    input                   i_rstn_main_system      ,
    
    // Decoder SI 
    input       [31:0]      i_paddr_cpu_m4          ,
    input                   i_pselx_cpu_m4          ,
    input                   i_penable_cpu_m4        ,
    input                   i_pwrite_cpu_m4         ,
    output      [31:0]      o_prdata_cpu_m4         ,
    input       [31:0]      i_pwdata_cpu_m4         ,
    output                  o_pready_cpu_m4         ,
    output                  o_pslverr_cpu_m4        ,

    // Main CRM APB I/F      
    output        	        o_psel_main_crm         ,
    output        	        o_penable_main_crm      ,
    output        	        o_pwrite_main_crm       ,
    output      [11:0]	    o_paddr_main_crm        ,
    output      [31:0]	    o_pwdata_main_crm       ,
    input       [31:0]	    i_prdata_main_crm       ,

    // SYS Ctrl Signal 
    output wire  [38:0]     o_ema                   ,
    input  wire             i_pad_nand_advflash     ,
    input  wire             i_pad_nand_addrcycle    ,
    input  wire             i_pad_nand_pagesize     ,
    input  wire [ 1:0]      i_boot_sel_y            ,
    input  wire [ 2:0]      i_boot_cfg_y            ,

    // TEST MODE 
    input  wire             i_TM_2_SCAN,
    input  wire             i_TM_3_BIST,
    input  wire             i_TM_4_PLL,
    input  wire             i_TM_5_DDR_PHY,
    input  wire             i_TM_6_OCC, 

    output  wire [ 1:0]     o_pll2651_mode, 
    output  wire [ 1:0]     o_pll2551_mode, 

    output  wire            o_test_mode, 
    output  wire            o_bypass_mode, 

    input  wire        	    i_clk_fcon,
    input  wire        	    i_rstn_fcon,
    output wire        	    o_alp_fcon_psel,
    output wire        	    o_alp_fcon_penable,
    output wire        	    o_alp_fcon_pwrite,
    output wire [7:0]	    o_alp_fcon_paddr,
    output wire [31:0]	    o_alp_fcon_pwdata,
    input  wire [31:0]	    i_alp_fcon_prdata,
    input  wire        	    i_alp_fcon_pready,
    input  wire        	    i_alp_fcon_pslverr,

    // PAD Ctrl Signal 
    output  [P_NUM_PAD-1:0]         o_core_ps            ,
    output  [P_NUM_PAD-1:0]         o_core_pe            ,
    output  [P_NUM_PAD-1:0]         o_core_ds1           ,
    output  [P_NUM_PAD-1:0]         o_core_ds0           ,
    output  [P_NUM_PAD-1:0]         o_core_sr            ,
    output  [P_NUM_PAD-1:0]         o_core_is            ,
    output  [P_NUM_PAD-1:0]         o_core_enb           ,
    output  [P_NUM_PAD*2-1:0]       o_func_sel
);

    wire         	pad_ctrl_psel       ;
    wire         	pad_ctrl_penable    ;
    wire         	pad_ctrl_pwrite     ;
    wire  [11:0]	pad_ctrl_paddr      ;
    wire  [31:0]	pad_ctrl_pwdata     ;
    wire  [31:0]	pad_ctrl_prdata     ;

    wire         	sys_ctrl_psel       ;
    wire         	sys_ctrl_penable    ;
    wire         	sys_ctrl_pwrite     ;
    wire  [11:0]	sys_ctrl_paddr      ;
    wire  [31:0]	sys_ctrl_pwdata     ;
    wire  [31:0]	sys_ctrl_prdata     ;

    wire         	tie_ctrl_psel       ;
    wire         	tie_ctrl_penable    ;
    wire         	tie_ctrl_pwrite     ;
    wire  [11:0]	tie_ctrl_paddr      ;
    wire  [31:0]	tie_ctrl_pwdata     ;


    wire [38:0]     ema                 ;

    cpu_m4_deco_apb3
    u_cpu_m4_deco_ap3 (
        // SI Clock & Reset
        .i_clk_si                   (i_clk_main_system  ),
        .i_rstn_si                  (i_rstn_main_system ),
        // SI Interface
        .i_si_psel                  (i_pselx_cpu_m4     ),
        .i_si_penable               (i_penable_cpu_m4   ),
        .i_si_pwrite                (i_pwrite_cpu_m4    ),
        .i_si_paddr                 (i_paddr_cpu_m4     ),
        .i_si_pwdata                (i_pwdata_cpu_m4    ),
        .o_si_prdata                (o_prdata_cpu_m4    ),
        .o_si_pready                (o_pready_cpu_m4    ),
        .o_si_pslverr               (o_pslverr_cpu_m4   ),
        // MI_0 - name:main_crm 
        .o_main_crm_psel            (o_psel_main_crm    ),
        .o_main_crm_penable         (o_penable_main_crm ),
        .o_main_crm_pwrite          (o_pwrite_main_crm  ),
        .o_main_crm_paddr           (o_paddr_main_crm   ),
        .o_main_crm_pwdata          (o_pwdata_main_crm  ),
        .i_main_crm_prdata          (i_prdata_main_crm  ),
        .i_main_crm_pready          (1'b1               ),
        .i_main_crm_pslverr         (1'b0               ),
        // MI_1 - name:main_sys 
        .o_main_sys_psel            (sys_ctrl_psel      ),
        .o_main_sys_penable         (sys_ctrl_penable   ),
        .o_main_sys_pwrite          (sys_ctrl_pwrite    ),
        .o_main_sys_paddr           (sys_ctrl_paddr     ),
        .o_main_sys_pwdata          (sys_ctrl_pwdata    ),
        .i_main_sys_prdata          (sys_ctrl_prdata    ),
        .i_main_sys_pready          (1'b1               ),
        .i_main_sys_pslverr         (1'b0               ),
        // MI_2 - name:main_tie 
        .o_main_tie_psel            (tie_ctrl_psel      ),
        .o_main_tie_penable         (tie_ctrl_penable   ),
        .o_main_tie_pwrite          (tie_ctrl_pwrite    ),
        .o_main_tie_paddr           (tie_ctrl_paddr     ),
        .o_main_tie_pwdata          (tie_ctrl_pwdata    ),
        .i_main_tie_prdata          (32'b0              ),
        .i_main_tie_pready          (1'b1               ),
        .i_main_tie_pslverr         (1'b0               ),
        // MI_3 - name:pad_ctrl 
        .o_pad_ctrl_psel            (pad_ctrl_psel	    ),
        .o_pad_ctrl_penable         (pad_ctrl_penable	),
        .o_pad_ctrl_pwrite          (pad_ctrl_pwrite	),
        .o_pad_ctrl_paddr           (pad_ctrl_paddr	    ),
        .o_pad_ctrl_pwdata          (pad_ctrl_pwdata	),
        .i_pad_ctrl_prdata          (pad_ctrl_prdata	),
        .i_pad_ctrl_pready          (1'b1 	            ),
        .i_pad_ctrl_pslverr         (1'b0               ),
        // MI_4 - name:alp_fcon 
        .i_alp_fcon_clk             (i_clk_fcon         ),
        .i_alp_fcon_rstn            (i_rstn_fcon        ),
        .o_alp_fcon_psel            (o_alp_fcon_psel    ),
        .o_alp_fcon_penable         (o_alp_fcon_penable ),
        .o_alp_fcon_pwrite          (o_alp_fcon_pwrite  ),
        .o_alp_fcon_paddr           (o_alp_fcon_paddr   ),
        .o_alp_fcon_pwdata          (o_alp_fcon_pwdata  ),
        .i_alp_fcon_prdata          (i_alp_fcon_prdata  ),
        .i_alp_fcon_pready          (i_alp_fcon_pready  ),
        .i_alp_fcon_pslverr         (i_alp_fcon_pslverr )
);

    wire  [P_NUM_PAD*2-1:0]  core_muxsel ; //428
    wire  [P_NUM_PAD  -1:0]  core_PS     ;
    wire  [P_NUM_PAD  -1:0]  core_PE     ;
    wire  [P_NUM_PAD  -1:0]  core_DS1    ;
    wire  [P_NUM_PAD  -1:0]  core_DS0    ;
    wire  [P_NUM_PAD  -1:0]  core_SR     ;
    wire  [P_NUM_PAD  -1:0]  core_IS     ;


    pad_con u_pad_con(
        .i_apb_pclk			(i_clk_main_system  ),
        .i_apb_prstn		(i_rstn_main_system ),
        .i_apb_psel			(pad_ctrl_psel		),
        .i_apb_penable		(pad_ctrl_penable	),
        .i_apb_pwrite		(pad_ctrl_pwrite	),
        .i_apb_paddr		(pad_ctrl_paddr	    ),
        .i_apb_pwdata		(pad_ctrl_pwdata	),
        .o_apb_prdata		(pad_ctrl_prdata	),
        .o_pad_enb          (o_core_enb         ),
        .o_pad_is			(o_core_is	        ),
        .o_pad_sr			(o_core_sr	        ),
        .o_pad_ds0			(o_core_ds0	        ),
        .o_pad_ds1			(o_core_ds1	        ),
        .o_pad_pe			(o_core_pe	        ),
        .o_pad_ps			(o_core_ps	        ),
        .o_pad_mux          (o_func_sel         )
    );

    main_sys_ctrl
    u_main_sys_ctrl (
        .i_apb_pclk                     (i_clk_main_system      ),
        .i_apb_prstn                    (i_rstn_main_system     ),
        .i_apb_psel                     (sys_ctrl_psel          ),
        .i_apb_penable                  (sys_ctrl_penable       ),
        .i_apb_pwrite                   (sys_ctrl_pwrite        ),
        .i_apb_paddr                    (sys_ctrl_paddr         ),
        .i_apb_pwdata                   (sys_ctrl_pwdata        ),
        .o_apb_prdata                   (sys_ctrl_prdata        ),
        .o_ema                          (ema                    ),
        .i_pad_nand_advflash            (i_pad_nand_advflash    ),
        .i_pad_nand_addrstep            (i_pad_nand_addrcycle   ),
        .i_pad_nand_pagesize            (i_pad_nand_pagesize    ),
        .i_boot_sel_y                   (i_boot_sel_y           ),
        .i_boot_cfg_y                   (i_boot_cfg_y           )
    );

    assign o_test_mode      = i_TM_2_SCAN | i_TM_6_OCC;
    assign o_bypass_mode    = i_TM_3_BIST | i_TM_5_DDR_PHY  | i_TM_6_OCC;
    

    assign o_pll2651_mode[0] = i_TM_4_PLL | i_TM_5_DDR_PHY;
    assign o_pll2651_mode[1] = i_TM_3_BIST | i_TM_6_OCC;



    assign o_pll2551_mode[0] = i_TM_4_PLL;

    assign o_pll2551_mode[1] = i_TM_3_BIST | i_TM_6_OCC;

    assign o_ema = i_TM_6_OCC | i_TM_3_BIST ? 39'h2320842084 : ema;  
endmodule 
