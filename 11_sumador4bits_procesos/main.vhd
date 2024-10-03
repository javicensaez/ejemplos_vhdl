library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad principal
entity main is
    port (
        V_SW : in std_logic_vector(8 downto 0);  -- Interruptores de entrada
        G_HEX0 : out std_logic_vector(6 downto 0);  -- Salida para el primer display de 7 segmentos (unidades)
        G_HEX1 : out std_logic_vector(6 downto 0)   -- Salida para el segundo display de 7 segmentos (decenas)
    );
end main;

-- Arquitectura principal sin uso de componentes, solo processes e integers
architecture behavioral of main is
    signal A, B : std_logic_vector(3 downto 0);  -- Señales para los operandos A y B
    signal sum : integer range 0 to 31;          -- Suma como integer
    signal bcd_tens, bcd_units : std_logic_vector(3 downto 0);  -- Decenas y unidades en BCD

begin
    -- Asignar los bits de los interruptores a los operandos A y B
    A <= V_SW(8 downto 5);
    B <= V_SW(3 downto 0);

    -- Proceso que realiza la suma
    process(A, B)
    begin
        -- Convertir los operandos A y B a integers y realizar la suma
        sum <= to_integer(unsigned(A)) + to_integer(unsigned(B));
    end process;

    -- Proceso separado para convertir el resultado a BCD
    process(sum)
    begin
        bcd_tens <= std_logic_vector(to_unsigned(sum / 10, 4));  -- Decenas
        bcd_units <= std_logic_vector(to_unsigned(sum mod 10, 4)); -- Unidades
    end process;

    -- Proceso para convertir BCD a 7 segmentos
    process(bcd_units)
    begin
        case bcd_units is
            when "0000" => G_HEX0 <= "1000000"; -- 0
            when "0001" => G_HEX0 <= "1111001"; -- 1
            when "0010" => G_HEX0 <= "0100100"; -- 2
            when "0011" => G_HEX0 <= "0110000"; -- 3
            when "0100" => G_HEX0 <= "0011001"; -- 4
            when "0101" => G_HEX0 <= "0010010"; -- 5
            when "0110" => G_HEX0 <= "0000010"; -- 6
            when "0111" => G_HEX0 <= "1111000"; -- 7
            when "1000" => G_HEX0 <= "0000000"; -- 8
            when "1001" => G_HEX0 <= "0010000"; -- 9
            when others => G_HEX0 <= "1111111"; -- Apagar todos los segmentos
        end case;
    end process;

    process(bcd_tens)
    begin
        case bcd_tens is
            when "0000" => G_HEX1 <= "1000000"; -- 0
            when "0001" => G_HEX1 <= "1111001"; -- 1
            when "0010" => G_HEX1 <= "0100100"; -- 2
            when "0011" => G_HEX1 <= "0110000"; -- 3
            when "0100" => G_HEX1 <= "0011001"; -- 4
            when "0101" => G_HEX1 <= "0010010"; -- 5
            when "0110" => G_HEX1 <= "0000010"; -- 6
            when "0111" => G_HEX1 <= "1111000"; -- 7
            when "1000" => G_HEX1 <= "0000000"; -- 8
            when "1001" => G_HEX1 <= "0010000"; -- 9
            when others => G_HEX1 <= "1111111"; -- Apagar todos los segmentos
        end case;
    end process;

end behavioral;
