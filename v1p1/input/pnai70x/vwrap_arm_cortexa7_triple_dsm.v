//==============================================================================
// File name   : vwrap_cortexa7_triple_dsm.v
// Description : vbus wrapper for cortexa7 tripple dsm
// Simulator   : NC Verilog
// Created by  : Kim, Jongmin (jimmy@alphachips.com)
// Date        : 2021/01/01
//==============================================================================
// History
//------------------------------------------------------------------------------
// $Id:$
//==============================================================================
`timescale 1ns/10ps

//module vwrap_cortexa7_triple_dsm
module vwrap_arm_cortexa7_triple_dsm
(
    input  wire          i_clk ,
    input  wire          i_rstn,
    input  wire  [3:0]   i_vinithi,
    input  wire  [39:15] i_periphbase,
    input  wire  [479:0] i_irqs,
    input  wire  [3:0]   i_nfiq,
    input  wire  [3:0]   i_nirq,
    input  wire  [3:0]   i_nvfiq,
    input  wire  [3:0]   i_nvirq

);

    //parameter IW = 6;
    wire         #(0.1) arreadym;
    wire         #(0.1) arvalidm;
    wire [39:0]  #(0.1) araddrm;
    wire [7:0]   #(0.1) arlenm;
    wire [2:0]   #(0.1) arsizem;
    wire [1:0]   #(0.1) arburstm;
    wire         #(0.1) arlockm;
    wire [3:0]   #(0.1) arcachem;
    wire [2:0]   #(0.1) arprotm;
    wire [IW-1:0]#(0.1) aridm;
    wire [3:0]   #(0.1) arsnoopm;
    wire [1:0]   #(0.1) ardomainm;
    wire [1:0]   #(0.1) arbarm;
    wire         #(0.1) rvalidm;
    wire         #(0.1) rlastm;
    wire [127:0] #(0.1) rdatam;
    wire [3:0]   #(0.1) rrespm;
    wire [IW-1:0]#(0.1) ridm;
    wire         #(0.1) rreadym;
    wire         #(0.1) awreadym;
    wire         #(0.1) awvalidm;
    wire [39:0]  #(0.1) awaddrm;
    wire [7:0]   #(0.1) awlenm;
    wire [2:0]   #(0.1) awsizem;
    wire [1:0]   #(0.1) awburstm;
    wire         #(0.1) awlockm;
    wire [3:0]   #(0.1) awcachem;
    wire [2:0]   #(0.1) awprotm;
    wire [IW-1:0]#(0.1) awidm;
    wire [2:0]   #(0.1) awsnoopm;
    wire [1:0]   #(0.1) awdomainm;
    wire [1:0]   #(0.1) awbarm;
    wire         #(0.1) wreadym;
    wire         #(0.1) wvalidm;
    wire         #(0.1) wlastm;
    wire [127:0] #(0.1) wdatam;
    wire [15:0]  #(0.1) wstrbm;
    wire [4:0]   #(0.1) widm;
    wire         #(0.1) bvalidm;
    wire [1:0]   #(0.1) brespm;
    wire [IW-1:0]#(0.1) bidm;
    wire         #(0.1) breadym;

    assign  awidm[5] = 1'b0;
    assign  bidm[5] = 1'b0;

    assign  rrespm[3:2] = 2'b0;

    //--------------------------------------------------------------------------
    // cortexa7_triple_dsm - @mark
    //--------------------------------------------------------------------------

    CORTEXA7TRIPLE_WRAP    u_cortexa7_triple
    (
        // clock
        .CLKIN                    (i_clk            ),
        
        // reset
        .nCOREPORESET             ({3'b0,i_rstn}        ),
        .nCORERESET               ({3'b0,i_rstn}        ),
        .nDBGRESET                ({3'b0,i_rstn}        ),
        .nL2RESET                 (i_rstn             ),
        
        .L1RSTDISABLE             (4'b0               ),
        .L2RSTDISABLE             (1'b0               ),
        // configuration signal
        .CFGEND                   (4'b0               ),
        .VINITHI                  (i_vinithi          ),
        .CFGTE                    (4'b0               ),
        .CLUSTERID                (4'b0        ),
        .CP15SDISABLE             (4'b0        ),
        .SMPnAMP                  (            ),
        // generic int. ctrl.
        .CFGSDISABLE              (1'b0               ),
        .IRQS                     (i_irqs             ),
        .nFIQ                     (i_nfiq             ),
        .nIRQ                     (i_nirq             ),
        .nFIQOUT                  (                   ),
        .nIRQOUT                  (                   ),
        .nVFIQ                    (i_nvfiq            ),
        .nVIRQ                    (i_nvirq            ),
        .PERIPHBASE               (i_periphbase       ),
        // generic timers i/f
        .nCNTHPIRQ                (                   ),
        .nCNTPNSIRQ               (                   ),
        .nCNTPSIRQ                (                   ),
        .nCNTVIRQ                 (                   ),
        .CNTVALUEB                (64'b0              ),
        // power control signals
        .EVENTI                   (1'b0           ),
        .EVENTO                   (                   ),
        .STANDBYWFI               (                   ),
        .STANDBYWFE               (                   ),
        .STANDBYWFIL2             (                   ),
        .DBGNOPWRDWN              (                   ),
        .DBGPWRUPREQ              (                   ),
        // ace: clock & config
        .ACLKENM                  (i_clk              ),
        .ACINACTM                 (1'b0               ),
        .BROADCASTINNER           (1'b0               ),
        .BROADCASTOUTER           (1'b0               ),
        .BROADCASTCACHEMAINT      (1'b0               ),
        .SYSBARDISABLE            (1'b1               ),
        // ace: async
        .nAXIERRIRQ               (                   ),
        // ace: write address ch
        .AWADDRM                  (  awaddrm          ),
        .AWBARM                   (  awbarm           ),
        .AWBURSTM                 (  awburstm         ),
        .AWCACHEM                 (  awcachem         ),
        .AWDOMAINM                (  awdomainm        ),
        .AWIDM                    (  awidm[4:0]       ),
        .AWLENM                   (  awlenm           ),
        .AWLOCKM                  (  awlockm          ),
        .AWPROTM                  (  awprotm          ),
        .AWREADYM                 (  awreadym         ),
        .AWSIZEM                  (  awsizem          ),
        .AWSNOOPM                 (  awsnoopm         ),
        .AWVALIDM                 (  awvalidm         ),
        // ace: write data ch
        .WDATAM                   (  wdatam           ),
        .WIDM                     (  widm             ),
        .WLASTM                   (  wlastm           ),
        .WREADYM                  (  wreadym          ),
        .WSTRBM                   (  wstrbm           ),
        .WVALIDM                  (  wvalidm          ),
        // ace: write data resp ch
        .BIDM                     (  bidm[4:0]        ),
        .BREADYM                  (  breadym          ),
        .BRESPM                   (  brespm           ),
        .BVALIDM                  (  bvalidm          ),
        // ace: read address ch
        .ARADDRM                  (  araddrm          ),
        .ARBARM                   (  arbarm           ),
        .ARBURSTM                 (  arburstm         ),
        .ARCACHEM                 (  arcachem         ),
        .ARDOMAINM                (  ardomainm        ),
        .ARIDM                    (  aridm            ),
        .ARLENM                   (  arlenm           ),
        .ARLOCKM                  (  arlockm          ),
        .ARPROTM                  (  arprotm          ),
        .ARREADYM                 (  arreadym         ),
        .ARSIZEM                  (  arsizem          ),
        .ARSNOOPM                 (  arsnoopm         ),
        .ARVALIDM                 (  arvalidm         ),
        // ace: read data ch
        .RDATAM                   (  rdatam           ),
        .RIDM                     (  ridm             ),
        .RLASTM                   (  rlastm           ),
        .RREADYM                  (  rreadym          ),
        .RRESPM                   (  rrespm           ),
        .RVALIDM                  (  rvalidm          ),
        // ace: snoop adress ch
        .ACADDRM                  (40'h0                ),
        .ACPROTM                  (3'b000               ),
        .ACREADYM                 (                     ),
        .ACSNOOPM                 (4'b0000              ),
        .ACVALIDM                 (1'b0                 ),
        // ace: snoop resp ch
        .CRREADYM                 (1'b1                 ),
        .CRVALIDM                 (                     ),
        .CRRESPM                  (                     ),
        // snoop data channel signal
        .CDDATAM                  (                     ),
        .CDLASTM                  (                     ),
        .CDREADYM                 (1'b1                 ),
        .CDVALIDM                 (                     ),
        // ace: r/w ack
        .RACKM                    (                     ),
        .WACKM                    (                     ),
        // ext. debug: apb i/f
        .PADDRDBG                 (15'b0  ),
        .PADDRDBG31               (1'b0   ),
        .PCLKENDBG                (1'b0        ),
        .PENABLEDBG               (1'b0   ),
        .PRDATADBG                (       ),
        .PREADYDBG                (       ),
        .PSELDBG                  (1'b0   ),
        .PSLVERRDBG               (       ),
        .PWDATADBG                (32'b0  ),
        .PWRITEDBG                (1'b0   ),
        // ext. debug: auth
        .DBGEN                    (4'hF          ),
        .NIDEN                    (4'hF          ),
        .SPIDEN                   (4'hF          ),
        .SPNIDEN                  (4'hF          ),
        // ext. debug: misc
        .COMMRX                   (              ),
        .COMMTX                   (              ),
        .DBGACK                   (              ),
        .DBGSWENABLE              (4'hF          ),
        .EDBGRQ                   (4'b0          ),
        .DBGROMADDR               (28'b0         ),
        .DBGROMADDRV              (1'b0          ),
        .DBGSELFADDR              (23'b0         ),
        .DBGSELFADDRV             (1'b0          ),
        .DBGRESTART               (4'b0          ),
        .DBGRESTARTED             (              ),
        .DBGTRIGGER               (              ),
        // etm
        // pmu
        .nPMUIRQ                  (              ),
        // dft: i/f
        .DFTSE                    (1'b0          ),
        .DFTRSTDISABLE            (1'b0          ),
        .DFTRAMHOLD               (1'b0          ),
        // dft: mbist
        //---------------------------------------------------------------------
        // not exist in CORTEXA7
        //---------------------------------------------------------------------
        // clock and reset signals
        .ATCLKEN                  (1'b1               ),
        .nETMRESET                ({3'b0,i_rstn}      ),
        .nSOCDBGRESET             (i_rstn             ),
        // power control
        .DBGPWRDUP                ({3'b0,i_rstn}        ),
        // timer
        .TSVALUEB                 (64'b0              ),
        // etm
        .ETMEN                    (                   ),
        .ETMPWRUPREQ              (                   ),
        .ETMSTANDBYWFX            (                   ),
        .ETMFIFOPEEK0             (                   ),
        .ETMFIFOPEEK1             (                   ),
        .ETMFIFOPEEK2             (                   ),
        .ETMFIFOPEEK3             (                   ),
        .ETMASICCTL0              (                   ),
        .ETMASICCTL1              (                   ),
        .ETMASICCTL2              (                   ),
        .ETMASICCTL3              (                   ),
        .ETMPWRUP                 (                   ),
        .ETMEXTOUT0               (                   ),
        .ETMEXTOUT1               (                   ),
        .ETMEXTOUT2               (                   ),
        .ETMEXTOUT3               (                   ),
        .PMUEVENT0                (                   ),
        .PMUEVENT1                (                   ),
        .PMUEVENT2                (                   ),
        .PMUEVENT3                (                   ),
        // coresight(funnel) <-> cortex
        .ATVALIDM0                (        ),
        .ATVALIDM1                (        ),
        .ATVALIDM2                (        ),
        .ATVALIDM3                (        ),
        .ATREADYM0                (1'b1    ),
        .ATREADYM1                (1'b1    ),
        .ATREADYM2                (1'b1    ),
        .ATREADYM3                (1'b1    ),
        .ATDATAM0                 (        ),
        .ATDATAM1                 (        ),
        .ATDATAM2                 (        ),
        .ATDATAM3                 (        ),
        .ATBYTESM0                (        ),
        .ATBYTESM1                (        ),
        .ATBYTESM2                (        ),
        .ATBYTESM3                (        ),
        .ATIDM0                   (        ),
        .ATIDM1                   (        ),
        .ATIDM2                   (        ),
        .ATIDM3                   (        ),
        .AFVALIDM0                (1'b0    ),
        .AFVALIDM1                (1'b0    ),
        .AFVALIDM2                (1'b0    ),
        .AFVALIDM3                (1'b0    ),
        .AFREADYM0                (        ),
        .AFREADYM1                (        ),
        .AFREADYM2                (        ),
        .AFREADYM3                (        ),
        // coresight(ctisync) <-> cortex
        .CTICHIN                  (4'b0    ),
        .CTICHOUTACK              (4'b0    ),
        .CTICHOUT                 (        ),
        .CTICHINACK               (        ),
        .CIHSBYPASS               (4'b0000 ),
        .CISBYPASS                (1'b0    ),
        .CTIASICCTL0              (        ),
        .CTIASICCTL1              (        ),
        .CTIASICCTL2              (        ),
        .CTIASICCTL3              (        ),
        .CTIEXTTRIGACK            (4'b0000 ),
        .CTIEXTTRIG               (        ),
        .nCTIIRQ                  (        ),
        .MAXEXTIN                 (3'b000  ),
        .MAXEXTOUT                (2'b00   ),
        .TSCLKCHANGE              (1'b0    ),
        .SYNCREQ                  (4'b0000 ),
        // MBIST Interface
        .nMBISTRESET    (1'b1),
        .MBISTREQ       (1'b0),
//`ifdef __RTL_FUNC_SIMULATION__
        .MBISTADDR      (14'h0),
        .MBISTINDATA    (86'h0),
        .MBISTOUTDATA   (),
        .MBISTWRITEEN   (1'b0),
        .MBISTREADEN    (1'b0),
        .MBISTARRAY     (9'b0),
        .MBISTBE        (4'b0),
        .MBISTCFG       (1'b0),
//`else        
//        .MBISTOUTDATA   (),
//`endif// __RTL_FUNC_SIMULATION__ 
        .MBISTACK       (),
        // @modified martin memory ema, dft port add
        .RA1_MEM_EMA        (3'b010),
        .RA1_MEM_EMAW       (2'b01 ),
        .RA1_MEM_EMAS       (1'b0  ),
        .RF1_MEM_EMA        (3'b010),
        .RF1_MEM_EMAW       (2'b01 ),
        .RF1_MEM_EMAS       (1'b0  ),
        .DFTRAMBYP          (1'b0  ),
        .PGEN               (3'b0  ),
        .RET1N              (3'h7  ),
        .RET2N              (3'h7  )

    );


    //--------------------------------------------------------------------------
    // vbus - @mark
    //--------------------------------------------------------------------------
    vbus_si_axi
    #(.IW(IW),            // ID Width
      .AW(32))           // Address Width
    vbus_si_axi_cortex
    (
        .i_aclk     (i_clk),
        .i_aresetn  (i_rstn),
        .i_awid     (awidm   ),
        .i_awaddr   (awaddrm[31:0]),
        .i_awburst  (awburstm),
        .i_awlen    (awlenm  ),
        .i_awsize   (awsizem ),
        .i_awprot   (awprotm ),
        .i_awvalid  (awvalidm),
        .o_awready  (awreadym),
        .i_wdata    (wdatam  ),
        .i_wstrb    (wstrbm  ),
        .i_wlast    (wlastm  ),
        .i_wvalid   (wvalidm ),
        .o_wready   (wreadym ),
        .o_bid      (bidm    ),
        .o_bresp    (brespm  ),
        .o_bvalid   (bvalidm ),
        .i_bready   (breadym ),
        .i_arid     (aridm   ),
        .i_araddr   (araddrm[31:0]),
        .i_arlen    (arlenm  ),
        .i_arsize   (arsizem ),
        .i_arburst  (arburstm),
        .i_arprot   (arprotm ),
        .i_arvalid  (arvalidm),
        .o_arready  (arreadym),
        .o_rid      (ridm    ),
        .o_rdata    (rdatam  ),
        .o_rresp    (rrespm[1:0]),
        .o_rlast    (rlastm  ),
        .o_rvalid   (rvalidm ),
        .i_rready   (rreadym )
    );

endmodule

