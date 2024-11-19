LIBRARY IEEE; -- Comenta esta linea
USE IEEE.std_logic_1164.ALL; -- Comenta esta linea
USE IEEE.numeric_std.ALL; -- Comenta esta linea
USE IEEE.std_logic_unsigned.ALL; -- Comenta esta linea

ENTITY top_unidadControl IS
	PORT (
        G_CLOCK_50: in std_logic;                    -- Entrada de reloj a 50 MHz
        V_SW  : in std_logic_vector (9 downto 0);    -- Entrada de 10 interruptores (SWITCH)
        V_BT  : in std_logic_vector (3 downto 0);    -- Entrada de 4 botones (BUTTONS)
        G_LED : out std_logic_vector(9 downto 0);    -- Salida para 10 LEDs
        G_HEX0 : out std_logic_vector(6 downto 0);       -- Salida para el primer display de 7 segmentos
        G_HEX1 : out std_logic_vector(6 downto 0);       -- Salida para el segundo display de 7 segmentos
        G_HEX2 : out std_logic_vector(6 downto 0);       -- Salida para el tercer display de 7 segmentos
        G_HEX3 : out std_logic_vector(6 downto 0)        -- Salida para el cuarto display de 7 segmentos
	);
END top_unidadControl;

ARCHITECTURE Behavioral OF top_unidadControl IS

component unidadControl is
    Port (  clk : in STD_LOGIC;
            OP: in STD_LOGIC_VECTOR (1 downto 0);
            registro_fz : in STD_LOGIC;
            sel_dir: out STD_LOGIC_VECTOR (1 downto 0);
            r_w: out STD_LOGIC;
            carga_ri: out STD_LOGIC;
            carga_rpc: out STD_LOGIC;
            codigo_alu: out STD_LOGIC_VECTOR (1 downto 0);
            carga_ra: out STD_LOGIC;           
            carga_rb: out STD_LOGIC;    
            carga_rfz: out STD_LOGIC;      
            rst : in STD_LOGIC;
            estado: out STD_LOGIC_VECTOR (2 downto 0) 
    );
  end component;

    signal OP: std_logic_vector(1 downto 0);
    signal registro_fz: std_logic;
    signal reloj: std_logic;
    signal sel_dir: std_logic_vector(1 downto 0);
    signal r_w: std_logic;
    signal carga_ri: std_logic;
    signal carga_rpc: std_logic;
    signal codigo_alu: std_logic_vector(1 downto 0);
    signal carga_ra: std_logic;
    signal carga_rb: std_logic;
    signal carga_rfz: std_logic;
    signal rst: std_logic;
    signal estado: std_logic_vector(2 downto 0);


BEGIN

OP<=V_SW(1 downto 0);
registro_fz<=V_SW(2);
reloj<=not V_BTW(0);
rst<=V_SW(4);

unidadControl_inst: unidadControl port map(
    clk=>reloj,
    OP=>OP,
    registro_fz=>registro_fz,
    sel_dir=>sel_dir,
    r_w=>r_w,
    carga_ri=>carga_ri,
    carga_rpc=>carga_rpc,
    codigo_alu=>codigo_alu,
    carga_ra=>carga_ra,
    carga_rb=>carga_rb,
    carga_rfz=>carga_rfz,
    rst=>rst,
    estado=>estado
);

G_LED(1 downto 0)<=sel_dir;
G_LED(2)<=r_w;
G_LED(3)<=carga_ri;
G_LED(4)<=carga_rpc;
G_LED(6 downto 5)<=codigo_alu;
G_LED(7)<=carga_ra;
G_LED(8)<=carga_rb;
G_LED(9)<=carga_rfz;

process(estado)
begin
    case estado is
        when "000" => G_HEX0 <= "1000000"; -- 0
        when "001" => G_HEX0 <= "1111001"; -- 1
        when "010" => G_HEX0 <= "0100100"; -- 2
        when "011" => G_HEX0 <= "0110000"; -- 3
        when "100" => G_HEX0 <= "0011001"; -- 4
        when "101" => G_HEX0 <= "0010010"; -- 5
        when "110" => G_HEX0 <= "0000010"; -- 6
        when "111" => G_HEX0 <= "1111000"; -- 7
        when others => G_HEX0 <= "1111111"; -- Deshabilitar segmentos
    end case;
end process;



END Behavioral;
