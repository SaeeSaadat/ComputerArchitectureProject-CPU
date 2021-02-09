library verilog;
use verilog.vl_types.all;
entity CPUProject_vlg_check_tst is
    port(
        alupin          : in     vl_logic_vector(31 downto 0);
        instruction_pin : in     vl_logic_vector(31 downto 0);
        pc_input_pin    : in     vl_logic_vector(31 downto 0);
        pcpin2          : in     vl_logic_vector(31 downto 0);
        reg1_outpin     : in     vl_logic_vector(31 downto 0);
        reg1address_outpin: in     vl_logic_vector(4 downto 0);
        reg2_outpin     : in     vl_logic_vector(31 downto 0);
        reg2address_outpin: in     vl_logic_vector(4 downto 0);
        reg3address_outpin: in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end CPUProject_vlg_check_tst;
