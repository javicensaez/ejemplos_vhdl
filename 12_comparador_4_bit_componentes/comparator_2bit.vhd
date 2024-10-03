
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad del comparador de 2 bits
entity comparator_2bit is
    port (
        A : in std_logic_vector(1 downto 0);  -- Primer dato de 2 bits (entrada A)
        B : in std_logic_vector(1 downto 0);  -- Segundo dato de 2 bits (entrada B)
        A_greater : out std_logic;            -- Señal de salida: A es mayor que B
        A_equal : out std_logic;              -- Señal de salida: A es igual a B
        A_less : out std_logic                -- Señal de salida: A es menor que B
    );
end comparator_2bit;

-- Arquitectura del comparador de 2 bits
architecture behavioral of comparator_2bit is
begin
    -- Proceso que compara A y B y asigna las salidas correspondientes
    process(A, B)
    begin
        -- Inicializar las señales de salida a '0'
        A_greater <= '0';
        A_equal <= '0';
        A_less <= '0';
        
        -- Comparacion de los valores de A y B utilizando tipos unsigned
        if unsigned(A) > unsigned(B) then
            A_greater <= '1';  -- Si A es mayor que B, activar A_greater
        elsif unsigned(A) = unsigned(B) then
            A_equal <= '1';    -- Si A es igual a B, activar A_equal
        else
            A_less <= '1';     -- Si A es menor que B, activar A_less
        end if;
    end process;
end behavioral;
