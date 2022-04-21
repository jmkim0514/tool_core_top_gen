module slave_ahb_32 (
    input           i_hclk     ,
    input           i_hresetn  ,
    input  [1:0]    i_htrans   ,
    input  [31:0    i_haddr    ,
    input           i_hwrite   ,
    input  [2:0]    i_hsize    ,
    input  [2:0]    i_hburst   ,
    input  [1:0]    i_hwdata   ,
    input           i_hmastlock,
    output [31:0]   o_hrdata   ,
    output          o_hready   ,
    output [1:0]    o_hresp    ,

    output          o_cs       ,
    output [31:0]   o_addr     ,
    output [31:0]   o_data     ,
    input  [31:0]   i_data
);

endmodule