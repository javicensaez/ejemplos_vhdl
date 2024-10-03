
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
    -- Instancia del componente BCD_to_7segment
    component BCD_to_7segment
        Port (
            E3 : in STD_LOGIC;
            E2 : in STD_LOGIC;
            E1 : in STD_LOGIC;
            E0 : in STD_LOGIC;
            a  : out STD_LOGIC;
            b  : out STD_LOGIC;
            c  : out STD_LOGIC;
            d  : out STD_LOGIC;
            e  : out STD_LOGIC;
            f  : out STD_LOGIC;
            g  : out STD_LOGIC
        );
    end component;

    -- Señales intermedias para los dos decodificadores
    signal E3_0, E2_0, E1_0, E0_0: STD_LOGIC;
    signal E3_1, E2_1, E1_1, E0_1: STD_LOGIC;
    signal a0, b0, c0, d0, e0, f0, g0: STD_LOGIC;
    signal a1, b1, c1, d1, e1, f1, g1: STD_LOGIC;

begin
    -- Asignar las entradas V_SW(3 downto 0) a las señales del primer decodificador
    E3_0 <= V_SW(3);
    E2_0 <= V_SW(2);
    E1_0 <= V_SW(1);
    E0_0 <= V_SW(0);

    -- Asignar las entradas V_SW(8 downto 5) a las señales del segundo decodificador
    E3_1 <= V_SW(8);
    E2_1 <= V_SW(7);
    E1_1 <= V_SW(6);
    E0_1 <= V_SW(5);

    -- Instancia del primer decodificador (para G_HEX0)
    u0: BCD_to_7segment Port map (E3_0, E2_0, E1_0, E0_0, a0, b0, c0, d0, e0, f0, g0);

    -- Instancia del segundo decodificador (para G_HEX1)
    u1: BCD_to_7segment Port map (E3_1, E2_1, E1_1, E0_1, a1, b1, c1, d1, e1, f1, g1);

    -- Asignar las señales de salida de los segmentos a G_HEX0
    G_HEX0(0) <= a0;
    G_HEX0(1) <= b0;
    G_HEX0(2) <= c0;
    G_HEX0(3) <= d0;
    G_HEX0(4) <= e0;
    G_HEX0(5) <= f0;
    G_HEX0(6) <= g0;

    -- Asignar las señales de salida de los segmentos a G_HEX1
    G_HEX1(0) <= a1;
    G_HEX1(1) <= b1;
    G_HEX1(2) <= c1;
    G_HEX1(3) <= d1;
    G_HEX1(4) <= e1;
    G_HEX1(5) <= f1;
    G_HEX1(6) <= g1;

    -- Asignar los valores de los interruptores a los LEDs (ahora con 10 interruptores y 10 LEDs)
    G_LED <= V_SW;

end Behavioral;