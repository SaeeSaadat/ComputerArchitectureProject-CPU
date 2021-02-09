module xor_two_TB ();

    reg [31:0] in1;
    reg [31:0] in2;
    wire [31:0] out;

    xor_two #(.width(32)) inst (
        .input1(in1),
        .input2(in2),
        .result(out)
    );

    initial begin 

        in1 = 32'h00000000;
        in2 = 32'hFFFFFFFF;

        #20

        in1 = 32'hF0F0F0F0;
        in2 = 32'h0F0F0F0F;

        #20
        in1 = 32'h0F0F0F0F;
        in2 = 32'h0F0F0F0F;

        #20
        in1 = 32'h11111111;
        in2 = 32'h33333333;

        #20

        $stop;

    end

endmodule