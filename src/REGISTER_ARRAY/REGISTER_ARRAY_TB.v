module register_array_tb ();




reg         clk = 0;
reg         rst = 0;

reg  [4 : 0]       r1_address;
reg  [4 : 0]       r2_address;
reg  [4 : 0]       r3_address;

reg                write_enable;
reg  [31 : 0]      write_data;

wire [31 : 0] r1_out;
wire [31 : 0] r2_out;


register_array #(
    .register_num(32),
    .register_width(32)
) inst(
    .clk(clk),
    .rst(rst),
    .reg1_address(r1_address),
    .reg2_address(r2_address),
    .write_reg_address(r3_address),
    .write_enable(write_enable),
    .write_data(write_data),
    .reg1(r1_out),
    .reg2(r2_out)
);

localparam clock_period = 10;
localparam clock_half_period = 5;
always #clock_half_period clk = ~clk;

initial begin

    rst = 1;
    #clock_period rst = 0;
    #clock_period write_enable = 1;

    r3_address = 0;
    write_data = 10;
    #clock_period

    r3_address = 1;
    write_data = 20;
    #clock_period
    
    r3_address = 2;
    write_data = 30;
    
    #clock_period
    r3_address = 5;
    write_data = 50;
    
    #clock_period
    r3_address = 9;
    write_data = -10;
    
    #clock_period

    write_enable = 0;

    #clock_period


    r1_address = 0;
    r2_address = 5;

    #clock_period

    r1_address = 1;
    r2_address = 2;

    #clock_period

    r1_address = 9;
    r2_address = 9;
    
    #clock_period
    #clock_period

    #clock_half_period

    rst = 1;

    #clock_period
    #clock_period
    #clock_period

    


    $stop;
    

end

endmodule