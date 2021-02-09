module and_two #( parameter width = 32 ) (
    input [31:0] input1,
    input [31:0] input2,
    output [31:0] result
);

assign result = input1 & input2;

endmodule