library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad que maneja vectores de bits con concatenación y extracción
entity swap_half_byte is
    port (
        V_SW : in std_logic_vector(9 downto 0);  -- Interruptores de entrada (10 bits)
        G_LED : out std_logic_vector(9 downto 0) -- LEDs de salida (10 bits)
    );
end swap_bits;

-- Arquitectura que muestra como concatenar y extraer bits de vectores
architecture behavioral of swap_bits is
    signal upper_bits, lower_bits : std_logic_vector(4 downto 0);  -- Señales para parte alta y baja
    signal concatenated_bits : std_logic_vector(9 downto 0);        -- Señal para los bits concatenados
begin
    -- Extracción de la parte alta y baja de V_SW
    upper_bits <= V_SW(9 downto 5);  -- Extraer los bits superiores (bits 9 a 5)
    lower_bits <= V_SW(4 downto 0);  -- Extraer los bits inferiores (bits 4 a 0)

    -- Concatenar las partes alta y baja para crear un nuevo vector de 10 bits
    concatenated_bits <= lower_bits & upper_bits;  -- Intercambiar las señales

    -- Asignar los bits concatenados a los LEDs de salida
    G_LED <= concatenated_bits;  -- Enviar el vector concatenado a los LEDs

end behavioral;