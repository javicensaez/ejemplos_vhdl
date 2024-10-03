library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad que invierte las posiciones de los interruptores y las asigna a los LEDs
entity invert_bits is
    port (
        V_SW : in std_logic_vector(9 downto 0);  -- Interruptores de entrada (10 bits)
        G_LED : out std_logic_vector(9 downto 0) -- LEDs de salida (10 bits)
    );
end invert_bits;

-- Arquitectura que invierte las posiciones de los bits
architecture behavioral of invert_bits is
begin
    -- Asignar los bits de entrada (V_SW) a los LEDs (G_LED) en orden inverso
    G_LED <= V_SW(0 to 9);  -- Invierte el orden de los bits asignando de 0 a 9

end behavioral;
