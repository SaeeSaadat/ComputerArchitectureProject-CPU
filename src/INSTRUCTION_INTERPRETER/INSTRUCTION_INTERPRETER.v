module instruction_interpreter (
    input [31:0] code,

    output reg [4:0]    reg1,
    output reg [4:0]    reg2,
    output reg [4:0]    reg3,
    output reg [4:0]    s_r_amount,
    output reg [15:0]   im_data,
    output reg          write_enable
);

    always @(code) begin

        if (code[31:26]>=1 && code[31:26] <=15)
        begin
            reg3 = code[25:21];
            reg1 = code[20:16];
            reg2 = code[15:11];
            s_r_amount = code[10:6];
        end
        else if (code[31:26] >=16 && code[31:26] <=23) begin
            reg3 = code[25:21];
            reg1 = code[20:16];
            reg2 = 5'bz;
            im_data = code[15:0];
            s_r_amount = 5'bz;
        end
        else if (code[31:26] >= 24 && code[31:26] <= 27) begin
            reg1 = code[25:21];
            reg3 = code[25:21];
            reg2 = code[20:16];
            im_data = code[15:0];
            s_r_amount = 5'bz;
        end 
        else begin
            reg1 = code[25:21];
            reg2 = code[20:16];
            reg3 = 5'bz;
            im_data = code[15:0];
            s_r_amount = 5'bz;
        end
    end
endmodule