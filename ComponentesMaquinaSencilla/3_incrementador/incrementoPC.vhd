library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity incrementoPC is
    Port ( entrada : in STD_LOGIC_VECTOR (6 downto 0);
           salida : out STD_LOGIC_VECTOR (6 downto 0)
           );
end incrementoPC;

architecture Behavioral of incrementoPC is

begin


salida<=entrada +"0000001";

end Behavioral;
