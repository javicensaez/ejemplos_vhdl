library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad del comparador de 4 bits
entity comparator_4bit is
    port (
        V_SW : in std_logic_vector(9 downto 0);  -- Interruptores de entrada
        G_LED : out std_logic_vector(9 downto 0) -- LEDs de salida
    );
end comparator_4bit;

-- Arquitectura del comparador de 4 bits utilizando puertas lógicas
architecture behavioral of comparator_4bit is
    component comparator_2bit
        port (
            A : in std_logic_vector(1 downto 0);
            B : in std_logic_vector(1 downto 0);
            A_greater : out std_logic;
            A_equal : out std_logic;
            A_less : out std_logic
        );
    end component;

    -- Señales internas para la salida de los comparadores
    signal greater_low, equal_low, less_low : std_logic;
    signal greater_high, equal_high, less_high : std_logic;

    -- Señales para parte alta y baja de A y B
    signal A_high, A_low, B_high, B_low : std_logic_vector(1 downto 0);

begin
    -- Dividir los datos A y B en parte alta y baja
    A_high <= V_SW(8 downto 7);
    A_low  <= V_SW(6 downto 5);
    B_high <= V_SW(3 downto 2);
    B_low  <= V_SW(1 downto 0);

    -- Instancia del comparador para la parte baja de A y B, usando asignacion posicional
    u1: comparator_2bit port map (A_low, B_low, greater_low, equal_low, less_low);

    -- Instancia del comparador para la parte alta de A y B, usando asignacion posicional
    u2: comparator_2bit port map (A_high, B_high, greater_high, equal_high, less_high);

    -- Logica de comparación utilizando puertas lógicas
    process(greater_high, equal_high, less_high, greater_low, equal_low, less_low)
    begin
        -- A > B si la parte alta es mayor o si la parte alta es igual y la parte baja es mayor
        G_LED(2) <= greater_high or (equal_high and greater_low);

        -- A < B si la parte alta es menor o si la parte alta es igual y la parte baja es menor
        G_LED(0) <= less_high or (equal_high and less_low);

        -- A = B si la parte alta y la parte baja son iguales
        G_LED(1) <= equal_high and equal_low;
    end process;

end behavioral;