module slave (
    input              psel_jimmy,
    input              penable_jimmy,
    input  [31:0]      paddr_jimmy,
    input  [31:0]      pwdata_jimmy,
    output [31:0]      prdata_jimmy,
    output             o_rstn
);

    wire            u0_o_valid;
    wire            u0_i_ready;
    wire    [31:0]  u0_o_data;
    wire    [31:0]  u0_i_data;
    wire            u0_i_resp;
    wire            u0_o_mreq;
    wire    [31:0]  u1_o_resp;

    assign  o_mreq[0] = u0_o_mreq[0];
    assign  o_resp[0] = u1_o_resp[0];
    assign  u0_i_resp[0] = u1_o_resp[0];

    master u_master (
        .o_valid   (u0_o_valid),
        .i_ready   (u0_i_ready),
        .o_data    (u0_o_data),
        .i_data    (u0_i_data),
        .i_resp    (u0_i_resp),
        .o_mreq    (u0_o_mreq),
        .i_sys     ({i_rstn,i_clk}),
    );

    slave u_slave (
        .i_valid   (u0_o_valid),
        .o_ready   (u0_i_ready),
        .i_data    (u0_o_data),
        .o_data    (u0_i_data),
        .o_resp    (u1_o_resp),
        .i_mreq    (u0_o_mreq),
        .o_sys     ({o_rstn,o_clk}),
    );

endmodule