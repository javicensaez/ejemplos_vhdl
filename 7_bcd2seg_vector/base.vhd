library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaracion de la entidad "base"
entity base is
    Port (
        G_CLOCK_50 : in STD_LOGIC;                  -- Entrada de reloj de 50 MHz
        V_SW : in STD_LOGIC_VECTOR (9 downto 0);    -- Entrada de 10 interruptores (SWITCH)
        G_LED : out STD_LOGIC_VECTOR (9 downto 0);  -- Salida para 10 LEDs
        G_HEX0 : out STD_LOGIC_VECTOR (6 downto 0) := "1111111";  -- Salida para el primer display de 7 segmentos
        G_HEX1 : out STD_LOGIC_VECTOR (6 downto 0) := "1111111"   -- Salida para el segundo display de 7 segmentos
    );
end base;

architecture Behavioral of base is
    -- Instancia del componente BCD_to_7segment_vector
    component BCD_to_7segment_vector
        Port (
            bcd_in : in STD_LOGIC_VECTOR(3 downto 0);  -- Entrada de 4 bits en BCD
            seg_out : out STD_LOGIC_VECTOR(6 downto 0) -- Salida de 7 bits para los segmentos
        );
    end component;

    -- Señales intermedias para las entradas y salidas de los decodificadores
    signal bcd_in0, bcd_in1: STD_LOGIC_VECTOR(3 downto 0);
    signal hex0_out, hex1_out: STD_LOGIC_VECTOR(6 downto 0);

begin
    -- Asignar las entradas V_SW(3 downto 0) a bcd_in0 y V_SW(8 downto 5) a bcd_in1
    bcd_in0 <= V_SW(3 downto 0);
    bcd_in1 <= V_SW(8 downto 5);

    -- Instancia del primer decodificador para G_HEX0
    u0: BCD_to_7segment_vector Port map (bcd_in0, hex0_out);

    -- Instancia del segundo decodificador para G_HEX1
    u1: BCD_to_7segment_vector Port map (bcd_in1, hex1_out);

    -- Asignar las salidas de los decodificadores a G_HEX0 y G_HEX1
    G_HEX0 <= hex0_out;
    G_HEX1 <= hex1_out;

    -- Asignar los valores de los interruptores a los LEDs
    G_LED <= V_SW;

end Behavioral;
