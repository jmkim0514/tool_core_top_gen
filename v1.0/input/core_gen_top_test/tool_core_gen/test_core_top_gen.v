module test_core_top_gen (
);

    wire    [  2:0]  NC_in;
    wire             crm_o_cpu_aclk;
    wire             crm_o_cpu_areset;
    wire             crm_o_cpu_pclk;
    wire             crm_o_cpu_preset;
    wire             crm_o_peri_aclk;
    wire             crm_o_peri_areset;
    wire             crm_o_peri_pclk;
    wire             crm_o_peri_preset;
    wire    [  3:0]  cpu_o_awid;
    wire    [ 31:0]  cpu_o_awaddr;
    wire    [  3:0]  cpu_o_awlen;
    wire    [  2:0]  cpu_o_awsize;
    wire    [  1:0]  cpu_o_awburst;
    wire    [  1:0]  cpu_o_awlock;
    wire    [  3:0]  cpu_o_awcache;
    wire    [  2:0]  cpu_o_awprot;
    wire             cpu_o_awvalid;
    wire             cpu_i_awready;
    wire    [  3:0]  cpu_o_wid;
    wire    [127:0]  cpu_o_wdata;
    wire    [ 15:0]  cpu_o_wstrb;
    wire             cpu_o_wlast;
    wire             cpu_o_wvalid;
    wire             cpu_i_wready;
    wire    [  3:0]  cpu_i_bid;
    wire    [  1:0]  cpu_i_bresp;
    wire             cpu_i_bvalid;
    wire             cpu_o_bready;
    wire    [  3:0]  cpu_o_arid;
    wire    [ 31:0]  cpu_o_araddr;
    wire    [  3:0]  cpu_o_arlen;
    wire    [  2:0]  cpu_o_arsize;
    wire    [  1:0]  cpu_o_arburst;
    wire    [  1:0]  cpu_o_arlock;
    wire    [  3:0]  cpu_o_arcache;
    wire    [  2:0]  cpu_o_arprot;
    wire             cpu_o_arvalid;
    wire             cpu_i_arready;
    wire    [  3:0]  cpu_i_rid;
    wire    [127:0]  cpu_i_rdata;
    wire    [  1:0]  cpu_i_rresp;
    wire             cpu_i_rlast;
    wire             cpu_i_rvalid;
    wire             cpu_o_rready;
    wire             peri_o_psel;
    wire             peri_o_penable;
    wire    [ 31:0]  peri_o_paddr;
    wire             peri_o_pwrite;
    wire    [ 31:0]  peri_o_pwdata;
    wire    [  2:0]  peri_o_pprot;
    wire    [  3:0]  peri_o_pstrb;
    wire    [ 31:0]  peri_i_prdata;
    wire             peri_i_pready;
    wire             peri_i_pslverr;


    main_crm u_main_crm (
        .i_xtal           (NC_in[0]),
        .i_reset          (NC_in[1]),
        .o_cpu_aclk       (crm_o_cpu_aclk),
        .o_cpu_areset     (crm_o_cpu_areset),
        .o_cpu_pclk       (crm_o_cpu_pclk),
        .o_cpu_preset     (crm_o_cpu_preset),
        .o_peri_aclk      (crm_o_peri_aclk),
        .o_peri_areset    (crm_o_peri_areset),
        .o_peri_pclk      (crm_o_peri_pclk),
        .o_peri_preset    (crm_o_peri_preset)
    );

    cpu_hpdf u_cpu_hpdf (
        .i_aclk           (crm_o_cpu_aclk),
        .i_aresetn        (crm_o_cpu_areset),
        .o_awid           (cpu_o_awid),
        .o_awaddr         (cpu_o_awaddr),
        .o_awlen          (cpu_o_awlen),
        .o_awsize         (cpu_o_awsize),
        .o_awburst        (cpu_o_awburst),
        .o_awlock         (cpu_o_awlock),
        .o_awcache        (cpu_o_awcache),
        .o_awprot         (cpu_o_awprot),
        .o_awvalid        (cpu_o_awvalid),
        .i_awready        (cpu_i_awready),
        .o_wid            (cpu_o_wid),
        .o_wdata          (cpu_o_wdata),
        .o_wstrb          (cpu_o_wstrb),
        .o_wlast          (cpu_o_wlast),
        .o_wvalid         (cpu_o_wvalid),
        .i_wready         (cpu_i_wready),
        .i_bid            (cpu_i_bid),
        .i_bresp          (cpu_i_bresp),
        .i_bvalid         (cpu_i_bvalid),
        .o_bready         (cpu_o_bready),
        .o_arid           (cpu_o_arid),
        .o_araddr         (cpu_o_araddr),
        .o_arlen          (cpu_o_arlen),
        .o_arsize         (cpu_o_arsize),
        .o_arburst        (cpu_o_arburst),
        .o_arlock         (cpu_o_arlock),
        .o_arcache        (cpu_o_arcache),
        .o_arprot         (cpu_o_arprot),
        .o_arvalid        (cpu_o_arvalid),
        .i_arready        (cpu_i_arready),
        .i_rid            (cpu_i_rid),
        .i_rdata          (cpu_i_rdata),
        .i_rresp          (cpu_i_rresp),
        .i_rlast          (cpu_i_rlast),
        .i_rvalid         (cpu_i_rvalid),
        .o_rready         (cpu_o_rready),
        .i_pclk           (crm_o_cpu_pclk),
        .i_presetn        (crm_o_cpu_preset),
        .i_psel           (peri_o_psel),
        .i_penable        (peri_o_penable),
        .i_paddr          (peri_o_paddr),
        .i_pwrite         (peri_o_pwrite),
        .i_pwdata         (peri_o_pwdata),
        .i_pprot          (peri_o_pprot),
        .i_pstrb          (peri_o_pstrb),
        .o_prdata         (peri_i_prdata),
        .o_pready         (peri_i_pready),
        .o_pslverr        (peri_i_pslverr)
    );

    peri_hpdf u_peri_hpdf (
        .i_aclk           (crm_o_peri_aclk),
        .i_aresetn        (crm_o_peri_areset),
        .i_peri_awid      (cpu_o_awid),
        .i_peri_awaddr    (cpu_o_awaddr),
        .i_peri_awlen     (cpu_o_awlen),
        .i_peri_awsize    (cpu_o_awsize),
        .i_peri_awburst   (cpu_o_awburst),
        .i_peri_awlock    (cpu_o_awlock),
        .i_peri_awcache   (cpu_o_awcache),
        .i_peri_awprot    (cpu_o_awprot),
        .i_peri_awvalid   (cpu_o_awvalid),
        .o_peri_awready   (cpu_i_awready),
        .i_peri_wid       (cpu_o_wid),
        .i_peri_wdata     (cpu_o_wdata),
        .i_peri_wstrb     (cpu_o_wstrb),
        .i_peri_wlast     (cpu_o_wlast),
        .i_peri_wvalid    (cpu_o_wvalid),
        .o_peri_wready    (cpu_i_wready),
        .o_peri_bid       (cpu_i_bid),
        .o_peri_bresp     (cpu_i_bresp),
        .o_peri_bvalid    (cpu_i_bvalid),
        .i_peri_bready    (cpu_o_bready),
        .i_peri_arid      (cpu_o_arid),
        .i_peri_araddr    (cpu_o_araddr),
        .i_peri_arlen     (cpu_o_arlen),
        .i_peri_arsize    (cpu_o_arsize),
        .i_peri_arburst   (cpu_o_arburst),
        .i_peri_arlock    (cpu_o_arlock),
        .i_peri_arcache   (cpu_o_arcache),
        .i_peri_arprot    (cpu_o_arprot),
        .i_peri_arvalid   (cpu_o_arvalid),
        .o_peri_arready   (cpu_i_arready),
        .o_peri_rid       (cpu_i_rid),
        .o_peri_rdata     (cpu_i_rdata),
        .o_peri_rresp     (cpu_i_rresp),
        .o_peri_rlast     (cpu_i_rlast),
        .o_peri_rvalid    (cpu_i_rvalid),
        .i_peri_rready    (cpu_o_rready),
        .i_pclk           (NC_in[2]),
        .i_presetn        (crm_o_peri_pclk),
        .o_psel           (peri_o_psel),
        .o_penable        (peri_o_penable),
        .o_paddr          (peri_o_paddr),
        .o_pwrite         (peri_o_pwrite),
        .o_pwdata         (peri_o_pwdata),
        .o_pprot          (peri_o_pprot),
        .o_pstrb          (peri_o_pstrb),
        .i_prdata         (peri_i_prdata),
        .i_pready         (peri_i_pready),
        .i_pslverr        (peri_i_pslverr)
    );

endmodule