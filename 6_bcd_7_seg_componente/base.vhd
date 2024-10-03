library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaracion de la entidad "base"
entity base is
    Port (
        G_CLOCK_50 : in STD_LOGIC;                  -- Entrada de reloj de 50 MHz
        V_SW : in STD_LOGIC_VECTOR (7 downto 0);    -- Entrada de 8 interruptores (SWITCH)
        G_LED : out STD_LOGIC_VECTOR (7 downto 0);  -- Salida para 8 LEDs
        G_HEX0 : out STD_LOGIC_VECTOR (6 downto 0) := "1111111"  -- Salida de 7 segmentos
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

    -- Señales intermedias para los segmentos del display
    signal E3, E2, E1, E0: STD_LOGIC;
    signal a, b, c, d, e, f, g: STD_LOGIC;

begin
    -- Asignar las entradas V_SW(3 downto 0) a las señales E3, E2, E1, E0
    E3 <= V_SW(3);
    E2 <= V_SW(2);
    E1 <= V_SW(1);
    E0 <= V_SW(0);

    -- Instancia del componente BCD_to_7segment usando asignación posicional en una sola línea
    u0: BCD_to_7segment Port map (E3, E2, E1, E0, a, b, c, d, e, f, g);

    -- Asignar las señales de salida de los segmentos a G_HEX0
    G_HEX0(0) <= a;
    G_HEX0(1) <= b;
    G_HEX0(2) <= c;
    G_HEX0(3) <= d;
    G_HEX0(4) <= e;
    G_HEX0(5) <= f;
    G_HEX0(6) <= g;

    -- Asignar los valores de los interruptores a los LEDs
    G_LED <= V_SW;

end Behavioral;
