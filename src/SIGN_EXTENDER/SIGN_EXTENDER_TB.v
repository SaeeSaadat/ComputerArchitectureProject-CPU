module sign_extender_TB ();

reg [15:0] in;
wire [31:0] out;

sign_extender #(
    .in_width(16),
    .out_width(32)
) extender (
    .in(in),
    .out(out)
);

initial begin

    in = 0;
    #10
    in = 10;
    #10
    in = -10;
    #10
    in = -100;
    #10
    in = 16;
    #10
    in = -2;

end

endmodule