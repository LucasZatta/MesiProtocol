library verilog;
use verilog.vl_types.all;
entity P02 is
    port(
        address         : in     vl_logic_vector(1 downto 0);
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(14 downto 0);
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(14 downto 0)
    );
end P02;
