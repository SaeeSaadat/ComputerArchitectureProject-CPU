library verilog;
use verilog.vl_types.all;
entity CPUProject_vlg_sample_tst is
    port(
        cpu_clk         : in     vl_logic;
        rest            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CPUProject_vlg_sample_tst;
