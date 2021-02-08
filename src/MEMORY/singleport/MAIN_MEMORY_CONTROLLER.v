module main_memory_controller #(

    parameter clock_period = 10,
    parameter word_size = 32, //bits
    parameter size = 256, //number of words inside the memory
    parameter address_len = $clog2(size)

)(

    input                               enable,
    input                               system_clk,
    input                               rst,
    input   [word_size - 1 : 0]         memory_input,
    input   [address_len - 1 : 0]       memory_input_address,
    input   [1:0]                       mode, // 00: read , 01: store word, 10: store byte
    input   [word_size - 1 : 0]         memory_write_data,
    

    output reg  [address_len - 1 : 0]       memory_out_address,
    output reg  [word_size - 1 : 0]         memory_out_write_data,


);

    reg clk = 0;
    reg [1:0] state = 0;

    localparam s_read_word = 0;
    localparam s_write_word = 1;
    localparam s_done = 2;

    localparam half_period = clock_period / 2 ;

    always #half_period clk = ~clk & enable

    always @(posedge clk or posedge rst) begin
        
        if (rst) begin

        end
        else begin
            case (mode)

            00: begin // read
                state <= 0;
                memory_out_address <= memory_input_address;
                memory_out_data <= z;


            end

            endcase 
            

        end

    end

endmodule