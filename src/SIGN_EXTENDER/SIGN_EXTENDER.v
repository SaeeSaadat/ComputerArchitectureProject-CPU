module sign_extender #(
    parameter in_width = 16,
    parameter out_width = 32
) (
    input    [in_width - 1 : 0]  in,
    output   [out_width - 1 : 0] out
);

    localparam width_dif = out_width - in_width;
    assign out = {{width_dif {in[in_width - 1]}}, in[in_width - 1 : 0]};

endmodule