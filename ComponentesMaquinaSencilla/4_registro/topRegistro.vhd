library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity topRegistro is
    port (
        G_CLOCK_50: in std_logic;
        V_SW  : in std_logic_vector (9 downto 0);
        V_BT  : in std_logic_vector (3 downto 0);
        G_LED : out std_logic_vector(9 downto 0);
        G_HEX0 : out std_logic_vector(0 to 6);
        G_HEX1 : out std_logic_vector(0 to 6);
        G_HEX2 : out std_logic_vector(0 to 6);
        G_HEX3 : out std_logic_vector(0 to 6)
    );
end;

architecture rtl of topRegistro is
signal entrada: std_logic_vector(15 downto 0);
signal salida: std_logic_vector(15 downto 0);
signal enable: std_logic;
signal reset: std_logic;
signal carga: std_logic;
signal clk: std_logic;

component registro is
    Port ( entrada : in STD_LOGIC_VECTOR (15 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0);
           carga : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component;

begin
clk<=V_SW(9);
carga<=V_SW(8);
reset<=V_SW(7);
entrada(6 downto 0)<=V_SW( 6 downto 0);
G_LED(9 downto 0)<=salida(9 downto 0);



R1: registro port map(entrada,salida,carga,clk,reset);

end rtl;