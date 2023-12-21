//==============================================================================
//
// Project : alpha_socbuilder
//
// Verilog File
//
// This confidential and proprietary source code may be used only as authorized
// by a licensing agreement from ALPHAHOLDINGS Limited. The entire notice above
// must be reproduced on all authorized copies and copies may only be made to
// the extent permitted by a licensing agreement from ALPHAHOLDINGS Limited.
//
// COPYRIGHT (C) ALPHAHOLDINGS, inc. 2023
//
//==============================================================================
// File name   : 
// Created by  : jhkim
// Date        : 2023-09-07
// Description : 
// sb_version  :  2023-09-07 16:05:27
//==============================================================================
// History
//------------------------------------------------------------------------------
//==============================================================================
// mvp0	: 0x5500_0000 - 0x55FF_FFFF
// mvp1	: 0x5600_0000 - 0x56FF_FFFF
//==============================================================================

module mvp_main_decoder (
    // SI Clock & Reset
    input  wire        	i_clk_si,
    input  wire        	i_rstn_si,
    // SI Interface
    input  wire        	i_si_psel,
    input  wire        	i_si_penable,
    input  wire         i_si_pwrite,
    input  wire [31:0]	i_si_paddr,
    input  wire [31:0]	i_si_pwdata,
    output wire [31:0]	o_si_prdata,
    output wire        	o_si_pready,
    output wire        	o_si_pslverr,
    // MI_0 - name:mvp0 
    output wire        	o_mvp0_psel,
    output wire        	o_mvp0_penable,
    output wire        	o_mvp0_pwrite,
    output wire [31:0]	o_mvp0_paddr,
    output wire [31:0]	o_mvp0_pwdata,
    input  wire [31:0]	i_mvp0_prdata,
    input  wire        	i_mvp0_pready,
    input  wire        	i_mvp0_pslverr,
    // MI_1 - name:mvp1 
    output wire        	o_mvp1_psel,
    output wire        	o_mvp1_penable,
    output wire        	o_mvp1_pwrite,
    output wire [31:0]	o_mvp1_paddr,
    output wire [31:0]	o_mvp1_pwdata,
    input  wire [31:0]	i_mvp1_prdata,
    input  wire        	i_mvp1_pready,
    input  wire        	i_mvp1_pslverr
);

    //-------------------------------------------------------------------------
    // Wire Declaration
    //-------------------------------------------------------------------------
    reg     [1:0]	pselx;
    wire           	si_psel;
    wire           	si_penable;
    wire           	si_pwrite;
    wire    [31:0]	si_paddr;
    wire    [31:0]	si_pwdata;
    reg     [31:0]	si_prdata;
    reg            	si_pready;
    reg            	si_pslverr;
    wire    [31:0]	mvp0_prdata;
    wire           	mvp0_pready;
    wire           	mvp0_pslverr;
    wire    [31:0]	mvp1_prdata;
    wire           	mvp1_pready;
    wire           	mvp1_pslverr;

    //-------------------------------------------------------------------------
    // SI Interface
    //-------------------------------------------------------------------------
    assign  si_psel      = i_si_psel;
    assign  si_penable   = i_si_penable;
    assign  si_pwrite    = i_si_pwrite;
    assign  si_paddr     = i_si_paddr;
    assign  si_pwdata    = i_si_pwdata;
    assign  o_si_prdata  = si_prdata;
    assign  o_si_pready  = si_pready;
    assign  o_si_pslverr = si_pslverr;


    //-------------------------------------------------------------------------
    // Decoder
    //-------------------------------------------------------------------------
    always @(*) begin
        if(si_paddr[31:24]==8'h55)
            pselx = 1<<0;
        else if(si_paddr[31:24]==8'h56)
            pselx = 1<<1;
        else
            pselx = 0;
    end

    always @(*) begin
        case(1'b1)
        pselx[0]: {si_prdata,si_pslverr,si_pready} = {mvp0_prdata,mvp0_pslverr,mvp0_pready};
        pselx[1]: {si_prdata,si_pslverr,si_pready} = {mvp1_prdata,mvp1_pslverr,mvp1_pready};
        default : {si_prdata,si_pslverr,si_pready} = {32'b0,1'b0,1'b1};
        endcase
    end

    //-------------------------------------------------------------------------
    // MI Interface
    //-------------------------------------------------------------------------
    // MI_0 - name:mvp0 - reglice:sync
    alp_regs_apb3
        #(.AW(32), .DW(32))
    u_alp_regs_apb3_mi_0 (
        .i_clk          (i_clk_si           	),
        .i_rstn         (i_rstn_si           	),
        .i_si_psel      (pselx[0] & si_psel	),
        .i_si_penable   (si_penable          	),
        .i_si_pwrite    (si_pwrite           	),
        .i_si_paddr     (si_paddr[31:0]     	),
        .i_si_pwdata    (si_pwdata[31:0]    	),
        .o_si_prdata    (mvp0_prdata[31:0]   	),
        .o_si_pready    (mvp0_pready          	),
        .o_si_pslverr   (mvp0_pslverr         	),
        .o_mi_psel      (o_mvp0_psel          	),
        .o_mi_penable   (o_mvp0_penable       	),
        .o_mi_pwrite    (o_mvp0_pwrite        	),
        .o_mi_paddr     (o_mvp0_paddr         	),
        .o_mi_pwdata    (o_mvp0_pwdata        	),
        .i_mi_prdata    (i_mvp0_prdata        	),
        .i_mi_pready    (i_mvp0_pready        	),
        .i_mi_pslverr   (i_mvp0_pslverr       	)
    );

    // MI_1 - name:mvp1 - reglice:sync
    alp_regs_apb3
        #(.AW(32), .DW(32))
    u_alp_regs_apb3_mi_1 (
        .i_clk          (i_clk_si           	),
        .i_rstn         (i_rstn_si           	),
        .i_si_psel      (pselx[1] & si_psel	),
        .i_si_penable   (si_penable          	),
        .i_si_pwrite    (si_pwrite           	),
        .i_si_paddr     (si_paddr[31:0]     	),
        .i_si_pwdata    (si_pwdata[31:0]    	),
        .o_si_prdata    (mvp1_prdata[31:0]   	),
        .o_si_pready    (mvp1_pready          	),
        .o_si_pslverr   (mvp1_pslverr         	),
        .o_mi_psel      (o_mvp1_psel          	),
        .o_mi_penable   (o_mvp1_penable       	),
        .o_mi_pwrite    (o_mvp1_pwrite        	),
        .o_mi_paddr     (o_mvp1_paddr         	),
        .o_mi_pwdata    (o_mvp1_pwdata        	),
        .i_mi_prdata    (i_mvp1_prdata        	),
        .i_mi_pready    (i_mvp1_pready        	),
        .i_mi_pslverr   (i_mvp1_pslverr       	)
    );


endmodule

