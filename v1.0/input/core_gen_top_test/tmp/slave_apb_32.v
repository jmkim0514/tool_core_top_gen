module slave_apb_32 (
    input           i_pclk    ,
    input           i_presetn ,
    output          o_irq     ,
    input           i_psel    ,
    input           i_penable ,
    input  [31:0]   i_paddr   ,
    input           i_pwrite  ,
    input  [31:0]   i_pwdata  ,
    input  [2:0]    i_pprot   ,
    input  [3:0]    i_pstrb   ,
    output [31:0]   o_prdata  ,
    output          o_pready  ,
    output          o_pslverr ,

    output          o_cs      ,
    output [31:0]   o_addr    ,
    output [31:0]   o_data    ,
    input  [31:0]   i_data
);


endmodule