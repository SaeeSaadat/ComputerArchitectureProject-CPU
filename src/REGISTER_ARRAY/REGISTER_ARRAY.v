module register_array #(
    parameter register_num = 32,
    parameter register_width = 32,
    parameter register_num_length = 5 //$clog2(register_num)
) (
    input                                 clk,
    input                                 rst,
    input   [register_num_length - 1 : 0] reg1_address,
    input   [register_num_length - 1 : 0] reg2_address,
    input   [register_num_length - 1 : 0] write_reg_address,

    input                                 write_word_enable,
    input                                 write_byte_enable,
    input   [register_width - 1 : 0]      write_data,

    output  [register_width - 1 : 0]      reg1,
    output  [register_width - 1 : 0]      reg2
);

reg [register_width - 1 : 0] registers [register_num - 1: 0];

assign reg1 = registers[reg1_address];
assign reg2 = registers[reg2_address];

integer i;
always @ (posedge clk or posedge rst) begin

    if (rst) begin
        for (i = 0 ; i < register_num ; i = i + 1) begin
            registers[i] <= 0;
        end
    end
    else begin
        if (write_word_enable) begin
            registers[write_reg_address] <= write_data;
        end
        else if (write_byte_enable) begin
            registers[write_reg_address][7:0] <= write_data[7:0];
        end
    end

end

endmodule