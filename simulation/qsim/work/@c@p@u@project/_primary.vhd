library verilog;
use verilog.vl_types.all;
entity CPUProject is
    port(
        pc_enable_pin   : out    vl_logic;
        cpu_clk         : in     vl_logic;
        rest            : in     vl_logic;
        alupin          : out    vl_logic_vector(31 downto 0);
        instruction_pin : out    vl_logic_vector(31 downto 0);
        jump_mux_option1_outpin: out    vl_logic_vector(31 downto 0);
        jump_mux_option2_outpin: out    vl_logic_vector(31 downto 0);
        jump_mux_option3_outpin: out    vl_logic_vector(31 downto 0);
        jump_mux_option4_outpin: out    vl_logic_vector(31 downto 0);
        jump_mux_select_outpin: out    vl_logic_vector(1 downto 0);
        pc_input_pin    : out    vl_logic_vector(31 downto 0);
        pcpin2          : out    vl_logic_vector(31 downto 0);
        reg1_outpin     : out    vl_logic_vector(31 downto 0);
        reg1address_outpin: out    vl_logic_vector(4 downto 0);
        reg2_outpin     : out    vl_logic_vector(31 downto 0);
        reg2address_outpin: out    vl_logic_vector(4 downto 0);
        reg3address_outpin: out    vl_logic_vector(4 downto 0)
    );
end CPUProject;
