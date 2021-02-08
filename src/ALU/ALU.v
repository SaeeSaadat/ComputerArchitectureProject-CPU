module alu(
    input clk,
    input rst,
    input [4:0] alu_opcode,
    input [31:0] input_1,
    input [31:0] input_2,
    input [4:0] s_r_amount,
    output reg [31:0] resut
);



always@(posedge clk) begin
    if(rst)begin
        result <= 0;
    end
    else begin
        
        case(alu_opcode)
            5'b00001: begin
                result <= input_1 + input_2;
            end

            5'b00010: begin
                resut <= input_1 - input_2;
            end

            5'b00011: begin
                result <= input_1 * input_2;
            end

            5'b00100: begin
                result <= input_1 / input_2;
            end

            5'b00101: begin
                result <= input_1 % input_2;
            end

            5'b00110: begin
                result <= (input_1 > input_2) ? input_1 : input_2;
            end

            5'b00111: begin
                result <= (input_1 < input_2) ? input_1 : input_2;
            end

            5'b01000: begin
                result <= ~input_1;
            end

            5'b01001: begin
                result <= ~(input_1 & input_2);
            end

            5'b01010: begin
                result <= ~(input_1 ^ input_2);







end

endmodule