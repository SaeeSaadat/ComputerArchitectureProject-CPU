module pc (
    input               clk,
    input               rst,
    input [31:0]        data,
    input               enable,

    output reg [31:0]       data_out
    
);

    always @(posedge clk or posedge rst) begin
        
        if (rst) begin
            data_out <= 0;
        end
        else if (enable) begin
           data_out <= data;
        end
        
    end
    
endmodule