module control_unit (
    input [31:0] instruction,

    input               clk,
    input               rst,
    output reg [4:0]    reg1,
    output reg [4:0]    reg2,
    output reg [4:0]    reg3,
    output reg [4:0]    s_r_amount,
    output reg [31:0]   im_data,
    output              register_write_word_enable,
    output              register_write_byte_enable,
    output reg [4:0]    alu_opcode,
    output reg [1:0]    jump_mux_signal,        // 0 -> pc+4 , 1 -> pc + Address , 2 -> pc = reg1 , 3 -> pc = pc [31:18] | Address | 00 
    output reg          write_back_on_register_mux_signal,
    output reg          alu_input_mux_signal,
    output              PC_enable,
    output              memwrite_enable_a,  // WORD    
    output              memwrite_enable_b,  // BYTE  
    output              memread_enable_a,  // WORD    
    output              memread_enable_b  // BYTE  
);

    // assign PC_enable = (instruction[31:26] == 0) ? 0 : 1;
    assign PC_enable = 1;
    assign register_write_byte_enable = (instruction[31:26] == 6'b011010) ? 1 : 0;
    assign register_write_word_enable = (instruction[31:26] == 6'b011000 || 
                                        (instruction[31:26]>=1 && instruction[31:26] <=23) ) ? 1 : 0;

    assign memwrite_enable_a = (instruction[31:26] == 6'b011001) ? 1 : 0; 
    assign memwrite_enable_b = (instruction[31:26] == 6'b011011) ? 1 : 0; 
    assign memread_enable_a =  (instruction[31:26] == 6'b011000) ? 1 : 0; 
    assign memread_enable_b =  (instruction[31:26] == 6'b011010) ? 1 : 0; 

    always @(posedge clk or posedge rst) begin

        if (rst) begin
            reg1 <= 0;
            reg2 <= 0;
            reg3 <= 0;
            s_r_amount <= 0;
            im_data <= 0;
            alu_opcode <= 0;
            jump_mux_signal <= 0;
        end
        else begin

            if (instruction[31:26] == 0) begin
                //seriously TO fucking DO!
                //TODO: Stop the whole thing! maybe there's nothing else to do since PC_Enable is assigned but still ...!
            end
            else if (instruction[31:26]>=1 && instruction[31:26] <=15)
            begin
                reg3 <= instruction[25:21];
                reg1 <= instruction[20:16];
                reg2 <= instruction[15:11];
                s_r_amount <= instruction[10:6];
                alu_opcode <= instruction[29:26];
                jump_mux_signal <= 0;
                write_back_on_register_mux_signal <= 1;
                alu_input_mux_signal <= 0;
            end
            else if (instruction[31:26] >=16 && instruction[31:26] <=23) begin
                reg3 <= instruction[25:21];
                reg1 <= instruction[20:16];
                reg2 <= 5'bz;
                im_data <= {{16 {instruction[15]}}, instruction[15:0]};
                s_r_amount <= 5'bz;
                
                jump_mux_signal <= 0;
                write_back_on_register_mux_signal <= 1;
                alu_input_mux_signal <= 1;

                case(instruction[29:26])
                    4'b0010: begin
                        alu_opcode <= 5'b00001;
                    end

                    4'b0011: begin
                        alu_opcode <= 5'b00010;
                    end

                    4'b0100: begin
                        alu_opcode <= 5'b00011;
                    end

                    4'b0101: begin
                        alu_opcode <= 5'b00100;
                    end

                    4'b0110: begin
                        alu_opcode <= 5'b01001;
                    end

                    4'b0111: begin
                        alu_opcode <= 5'b01010;
                    end

                    default: begin
                        alu_opcode <= 5'b00000;
                    end
                endcase

            end
            else if (instruction[31:26] >= 24 && instruction[31:26] <= 27) begin
                reg1 <= instruction[20:16];
                reg2 <= instruction[25:21];
                reg3 <= instruction[25:21];

                im_data <= {{16 {instruction[15]}}, instruction[15:0]};
                s_r_amount <= 5'bz;
                jump_mux_signal <= 0;
                write_back_on_register_mux_signal <= 0;
                alu_input_mux_signal <= 1;
                alu_opcode <= 5'b00001;
            end 
            else begin
                reg1 <= instruction[25:21];
                reg2 <= instruction[20:16];
                reg3 <= 5'bz;
                im_data <= {{16 {instruction[15]}}, instruction[15:0]};
                s_r_amount <= 5'bz;
                if (instruction[31:26] == 6'b011101)
                    jump_mux_signal <= 2;
                else if (instruction[31:26] == 6'b011100)
                    jump_mux_signal <= 3;
                else 
                    jump_mux_signal <= 1;
                write_back_on_register_mux_signal <= 1;
                alu_input_mux_signal <= 0;
                case(instruction[29:26])
                    
                    4'b1110: begin
                        alu_opcode <= 5'b10000;
                    end

                    4'b1111: begin
                        alu_opcode <= 5'b01111;
                    end
                endcase
            end
        end
    end
endmodule