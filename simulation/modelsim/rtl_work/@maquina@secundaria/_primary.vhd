library verilog;
use verilog.vl_types.all;
entity MaquinaSecundaria is
    port(
        Clock           : in     vl_logic;
        InvalidProcessor: in     vl_logic;
        InstructionHit  : in     vl_logic;
        InitialState    : in     vl_logic_vector(1 downto 0);
        ReadMiss        : in     vl_logic;
        WriteMiss       : in     vl_logic;
        Invalid         : in     vl_logic;
        WriteBack       : out    vl_logic;
        MemoryAccess    : out    vl_logic;
        NewState        : out    vl_logic_vector(1 downto 0)
    );
end MaquinaSecundaria;
