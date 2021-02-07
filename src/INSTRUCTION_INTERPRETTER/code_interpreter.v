module code_interpreter (
    input [31:0] code,
    // output reg [4:0] s_reg1,
    // output reg [4:0] s_reg2,
    // output reg [4:0] d_reg,
    output reg [4:0] s_r_amount,
    // output reg [4:0] VR,
    // output reg [4:0] AR,
    output reg [4:0] reg1,
    output reg [4:0] reg2,
    output reg [4:0] reg3,
    // output reg [15:0] addr,
    output reg [15:0] im_data,
    // output reg [15:0] offset
);

    always @(code) begin

        reg1 = 4'bz;
        reg2 = 4'bz;
        reg3 = 4'bz;
        s_r_amount = 4'bz;
        // VR = 4'bz;
        // AR = 4'bz;
        // reg1 = 4'bz;
        // reg2 = 4'bz;
        // addr = 15'bz;
        im_data = 15'bz;
        // offset = 15'bz;

        if (code[31:26]>=1 && code[31:26] <=15)
        begin
            reg3 = code[25:21];
            // d_reg = code[25:21];
            s_reg1 = code[20:16];
            s_reg2 = code[15:11];
            s_r_amount = code[10:6];
        end
        else
        begin
            if (code[31:26] >=16 && code[31:26] <=23) 
                begin
                    reg3 = code[25:21];
                    s_reg1 = code[20:16];
                    im_data = code[15:0];
                end
            else begin
               if (code[31:26] >= 24 && code[31:26] <= 27) begin
                   reg1 = code[25:21];
                   reg3 = code[25:21];
                   reg2 = code[20:16];
                //    offset = code[15:0];
                   im_data = code[15:0];
               end 
               else begin
                   reg1 = code[25:21];
                   reg2 = code[20:16];
                   im_data = code[15:0];
                //    addr = code[15:0];
               end
            end
        end

    end
endmodule