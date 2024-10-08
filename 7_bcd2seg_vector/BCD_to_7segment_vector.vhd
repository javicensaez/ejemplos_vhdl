
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaracion del nuevo componente para decodificar BCD a 7 segmentos
entity BCD_to_7segment_vector is
    Port (
        bcd_in : in STD_LOGIC_VECTOR(3 downto 0);  -- Entrada de 4 bits para el valor en BCD
        seg_out : out STD_LOGIC_VECTOR(6 downto 0) -- Salida de 7 bits para controlar los segmentos de a a g
    );
end BCD_to_7segment_vector;

architecture Behavioral of BCD_to_7segment_vector is
begin
    -- Lógica para decodificar el valor BCD y controlar los segmentos del display
    process(bcd_in)
    begin
        case bcd_in is
            when "0000" => seg_out <= "1000000"; -- 0
            when "0001" => seg_out <= "1111001"; -- 1
            when "0010" => seg_out <= "0100100"; -- 2
            when "0011" => seg_out <= "0110000"; -- 3
            when "0100" => seg_out <= "0011001"; -- 4
            when "0101" => seg_out <= "0010010"; -- 5
            when "0110" => seg_out <= "0000010"; -- 6
            when "0111" => seg_out <= "1111000"; -- 7
            when "1000" => seg_out <= "0000000"; -- 8
            when "1001" => seg_out <= "0010000"; -- 9
            when others => seg_out <= "1111111"; -- Deshabilitar segmentos
        end case;
    end process;
end Behavioral;
