library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad que realiza la extensión de signo de 4 bits a 8 bits y lo muestra en los LEDs
entity sign_extension is
    port (
        V_SW : in std_logic_vector(9 downto 0);  -- Interruptores de entrada (10 bits)
        G_LED : out std_logic_vector(9 downto 0) -- LEDs de salida (10 bits)
    );
end sign_extension;

-- Arquitectura que realiza la extensión de signo
architecture behavioral of sign_extension is
    signal input_4bits : std_logic_vector(3 downto 0); -- Señal interna para los 4 bits de entrada
    signal output_8bits : std_logic_vector(7 downto 0); -- Señal interna para los 8 bits con extensión de signo
begin
    -- Asignar los 4 bits menos significativos de V_SW a la entrada de 4 bits
    input_4bits <= V_SW(3 downto 0);

    -- Proceso para realizar la extensión de signo
    process(input_4bits)
    begin
        -- Extender el signo dependiendo del bit más significativo (input_4bits(3))
        output_8bits <= (others => input_4bits(3)) & input_4bits; -- Concatenar el bit de signo con los 4 bits de entrada
    end process;

    -- Asignar los 8 bits extendidos a los LEDs
    G_LED(7 downto 0) <= output_8bits; -- Asignar los primeros 8 bits a los LEDs
    G_LED(9 downto 8) <= "00";         -- Apagar los LEDs 9 y 8
end behavioral;
