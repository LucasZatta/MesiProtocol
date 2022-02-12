library verilog;
use verilog.vl_types.all;
entity mesi is
    port(
        habEscritaMem   : in     vl_logic;
        Instrucao       : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        Saida           : out    vl_logic_vector(7 downto 0)
    );
end mesi;
