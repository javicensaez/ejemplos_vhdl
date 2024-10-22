
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity topIncrementador is
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
end topIncrementador;

architecture Behavioral of topIncrementador is
    signal switches : STD_LOGIC_VECTOR (6 downto 0) := V_SW(6 downto 0);
    signal leds : STD_LOGIC_VECTOR (6 downto 0);
    component incrementoPC
        Port (
            entrada : in STD_LOGIC_VECTOR (6 downto 0);
            salida : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;
begin
    U1: incrementoPC port map (switches, leds);
    G_LED(6 downto 0) <= leds;
end Behavioral;
