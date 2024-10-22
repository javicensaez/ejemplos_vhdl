library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexador is
    Port ( dato0 : in STD_LOGIC_VECTOR (6 downto 0);
           dato1 : in STD_LOGIC_VECTOR (6 downto 0);
           dato2 : in STD_LOGIC_VECTOR (6 downto 0);
           dato3 : in STD_LOGIC_VECTOR (6 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           salida : out STD_LOGIC_VECTOR (6 downto 0);
           clk: in STD_LOGIC);
end multiplexador;

architecture Behavioral of multiplexador is

begin





end Behavioral;
