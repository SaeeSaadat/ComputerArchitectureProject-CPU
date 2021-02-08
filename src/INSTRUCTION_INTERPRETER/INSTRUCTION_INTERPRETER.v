module instruction_interpreter (
    input [31:0] instruction,

    output reg [4:0]    reg1,
    output reg [4:0]    reg2,
    output reg [4:0]    reg3,
    output reg [4:0]    s_r_amount,
    output reg [31:0]   im_data,
    output reg          write_enable,
    output reg [4:0]    alu_opcode,
    output reg          jump_mux_signal,
    output reg          write_back_on_register_mux_signal,
    output reg          alu_input_mux_signal,
    output              PC_enable,
    output reg          memory_write_enable_signal,
);

    assign PC_enable = (instruction[31:26] == 0) ? 0 : 1;

    always @(instruction) begin

        if (instruction[31:26] == 5'b0) begin
            //TODO: Stop the whole thing! maybe there's nothing else to do since PC_Enable is assigned but still ...!
        end
        else if (instruction[31:26]>=1 && instruction[31:26] <=15)
        begin
            reg3 = instruction[25:21];
            reg1 = instruction[20:16];
            reg2 = instruction[15:11];
            s_r_amount = instruction[10:6];
            alu_opcode = instruction[29:26];
            jump_mux_signal = 0;
            write_back_on_register_mux_signal = 1;
            alu_input_mux_signal = 0;
            memory_write_enable_signal = 0;
        end
        else if (instruction[31:26] >=16 && instruction[31:26] <=23) begin
            reg3 = instruction[25:21];
            reg1 = instruction[20:16];
            reg2 = 5'bz;
            im_data = {{16 {instruction[15]}}, instruction[15:0]};
            s_r_amount = 5'bz;
            
            jump_mux_signal = 0;
            write_back_on_register_mux_signal = 1;
            alu_input_mux_signal = 1;
            memory_write_enable_signal = 0;

            case(instruction[29:26])
                4'b0010: begin
                    alu_opcode = 5'b00001;
                end

                4'b0011: begin
                    alu_opcode = 5'b00010;
                end

                4'b0100: begin
                    alu_opcode = 5'b00011;
                end

                4'b0101: begin
                    alu_opcode = 5'b00100;
                end

                4'b0110: begin
                    alu_opcode = 5'b01001;
                end

                4'b0111: begin
                    alu_opcode = 5'b01010;
                end
                default: begin
                    alu_opcode = 5'b00000;
            endcase

        end
        else if (instruction[31:26] >= 24 && instruction[31:26] <= 27) begin
            reg1 = instruction[25:21];
            reg3 = instruction[25:21];
            if (instruction[31:26] == 5'b011011)
                reg2 = instruction[20:16];
            else 
                reg2 = instru
            im_data = {{16 {instruction[15]}}, instruction[15:0]};
            s_r_amount = 5'bz;
            jump_mux_signal = 0;
            write_back_on_register_mux_signal = 0;
            alu_input_mux_signal = 1;
            alu_opcode = 5'b00001;
            memory_write_enable_signal = instruction[26];
        end 
        else begin
            reg1 = instruction[25:21];
            reg2 = instruction[20:16];
            reg3 = 5'bz;
            im_data = {{16 {instruction[15]}}, instruction[15:0]};
            s_r_amount = 5'bz;
            jump_mux_signal = 1;
            write_back_on_register_mux_signal = 1;
            alu_input_mux_signal = 0;
            memory_write_enable_signal = 0;
            case(instruction[29:26])
                
                4'b1110: begin
                    alu_opcode = 5'b10000;
                end

                4'b1111: begin
                    alu_opcode = 5'b01111;
                end
            endcase
        end
    end
endmodule