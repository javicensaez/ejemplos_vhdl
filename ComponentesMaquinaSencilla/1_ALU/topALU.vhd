-- No tocar este fichero
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity topALU is
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

architecture rtl of topALU is
signal datoa: std_logic_vector(15 downto 0);
signal datob: std_logic_vector(15 downto 0);
signal sel: std_logic_vector(1 downto 0);
signal salida: std_logic_vector(15 downto 0);
signal flagz: std_logic;
signal clk: std_logic;

COMPONENT ALU IS
	PORT (
		A : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		SEL : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		z : OUT STD_LOGIC;
		clk: IN STD_LOGIC
	);
END COMPONENT;

begin
clk<=G_CLOCK_50;
datoa(3 downto 0)<=V_SW(3 downto 0);
datob(3 downto 0)<=V_SW(8 downto 5);
sel<=V_SW(9)&V_SW(4);
G_LED(3 downto 0)<=salida(3 downto 0);
G_LED(9)<=flagz;

R1: ALU port map(datoa,datob,sel,salida,flagz,clk);

end rtl;