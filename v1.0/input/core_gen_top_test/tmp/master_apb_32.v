module master_apb_32 (
    input           i_pclk    ,
    input           i_presetn ,
    output          o_irq     ,
    output          o_psel    ,
    output          o_penable ,
    output [31:0]   o_paddr   ,
    output          o_pwrite  ,
    output [31:0]   o_pwdata  ,
    output [2:0]    o_pprot   ,
    output [3:0]    o_pstrb   ,
    input  [31:0]   i_prdata  ,
    input           i_pready  ,
    input           i_pslverr 
);


endmodule