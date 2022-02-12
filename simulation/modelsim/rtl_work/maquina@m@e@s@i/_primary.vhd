library verilog;
use verilog.vl_types.all;
entity maquinaMESI is
    port(
        Clock           : in     vl_logic;
        WriteOrRead     : in     vl_logic;
        NoShared        : in     vl_logic;
        InvalidProcessor: in     vl_logic;
        InstructionHit  : in     vl_logic;
        InitialState    : in     vl_logic_vector(1 downto 0);
        ReadMiss        : out    vl_logic;
        WriteMiss       : out    vl_logic;
        Invalid         : out    vl_logic;
        WriteBack       : out    vl_logic;
        NewState        : out    vl_logic_vector(1 downto 0)
    );
end maquinaMESI;
