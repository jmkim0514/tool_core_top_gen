module master_ahb_32 (
    input             i_hclk     ,
    input             i_hresetn  ,
    output            o_irq      ,
    output [1:0       o_htrans   ,
    output [31:0      o_haddr    ,
    output            o_hwrite   ,
    output [2:0]      o_hsize    ,
    output [2:0]      o_hburst   ,
    output [1:0]      o_hwdata   ,
    output            o_hmastlock,
    input  [31:0]     i_hrdata   ,
    input             i_hready   ,
    input  [1:0]      i_hresp     
);

endmodule