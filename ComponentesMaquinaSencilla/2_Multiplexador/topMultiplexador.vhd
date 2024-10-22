library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity topMultiplexador is
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

architecture rtl of topMultiplexador is
signal dato0: std_logic_vector(6 downto 0);
signal dato1: std_logic_vector(6 downto 0);
signal dato2: std_logic_vector(6 downto 0);
signal dato3: std_logic_vector(6 downto 0);
signal sel: std_logic_vector(1 downto 0);
signal salida: std_logic_vector(6 downto 0);
signal clk: std_logic;

component multiplexador is
    Port ( dato0 : in STD_LOGIC_VECTOR (6 downto 0);
           dato1 : in STD_LOGIC_VECTOR (6 downto 0);
           dato2 : in STD_LOGIC_VECTOR (6 downto 0);
           dato3 : in STD_LOGIC_VECTOR (6 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           salida : out STD_LOGIC_VECTOR (6 downto 0);
           clk: in STD_LOGIC);
end component;

begin
clk<=G_CLOCK_50;
dato0(1 downto 0)<=V_SW(1 downto 0);
dato1(1 downto 0)<=V_SW(3 downto 2);
dato2(1 downto 0)<=V_SW(6 downto 5);
dato3(1 downto 0)<=V_SW(8 downto 7);
sel<=V_SW(9)&V_SW(4);
G_LED(6 downto 0)<=salida(6 downto 0);

R1: multiplexador port map(dato0,dato1,dato2,dato3,sel,salida,clk);

end rtl;