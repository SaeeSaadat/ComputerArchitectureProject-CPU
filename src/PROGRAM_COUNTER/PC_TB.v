module pc_tb();

reg clk = 0;
reg rst = 0;
reg enable = 1;
always #10 clk = ~clk;

reg [31:0] data_in;
wire [31:0] data_out;


pc inst (
    .clk(clk),
    .rst(rst),
    .data(data_in),
    .enable(enable),

    .data_out(data_out)
);

initial begin
    
    #20
    data_in = 16;
    #20
    data_in = 32;
    #20
    data_in = 64;
    enable = 0;
    #20
    data_in = 128;
    enable = 1;
    #20
    data_in = 20;
    #20
    enable = 0;
    data_in = 20;
    #20
    rst = 1;
    #20
    rst = 0;
    #40

    data_in = 1024;
    #40

    $stop;

end

endmodule