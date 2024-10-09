library ieee;  
use ieee.std_logic_1164.all;          -- Importa tipos de datos como std_logic y std_logic_vector, necesarios para trabajar con señales logicas
use ieee.numeric_std.all;             -- Importa funciones aritmeticas sobre numeros binarios (como suma y resta de vectores de bits)
use ieee.std_logic_unsigned.all;      -- Importa operaciones aritmeticas en vectores de bits (no estandar, alternativa para realizar operaciones aritmeticas sin conversion de tipos)

-- Declaracion de la entidad "full_adder"
entity top_full_adder_test is
    port (
        G_CLOCK_50: in std_logic;                    -- Entrada de reloj a 50 MHz
        V_SW  : in std_logic_vector (9 downto 0);    -- Entrada de 10 interruptores (SWITCH), de los cuales se usan los bits 2, 1 y 0
        V_BT  : in std_logic_vector (3 downto 0);    -- Entrada de 4 botones (BUTTONS)
        G_LED : out std_logic_vector(9 downto 0);    -- Salida para 10 LEDs, de los cuales se utilizan los LEDs 0 y 1
        G_HEX0 : out std_logic_vector(6 downto 0);   -- Salida para el primer display de 7 segmentos
        G_HEX1 : out std_logic_vector(6 downto 0);   -- Salida para el segundo display de 7 segmentos
        G_HEX2 : out std_logic_vector(6 downto 0);   -- Salida para el tercer display de 7 segmentos
        G_HEX3 : out std_logic_vector(6 downto 0)    -- Salida para el cuarto display de 7 segmentos
    );
end;

-- Arquitectura de la entidad "full_adder"
architecture rtl of top_full_adder_test is
    -- Senales internas (intermedias) que se usaran para almacenar valores
    signal E2, E1, E0: std_logic;   -- Senales internas para los bits de los interruptores V_SW(2), V_SW(1) y V_SW(0)
    signal S1, S0: std_logic;       -- Senales internas que representan la salida (sum y carry) del sumador

    -- Declaración del sumador completo
component full_adder is
    port (
        A : in std_logic;             -- Primer bit de entrada
        B : in std_logic;             -- Segundo bit de entrada
        CIN : in std_logic;           -- Bit de acarreo de entrada
        SUM : out std_logic;          -- Bit de salida que representa la suma
        COUT : out std_logic          -- Bit de salida que representa el acarreo de salida
    );
end component;

    
begin
   -- Asignacion de los valores de los interruptores (SWITCH) a las senales internas E2, E1, E0
   E2 <= V_SW(2);                   -- E2 toma el valor del interruptor 2
   E1 <= V_SW(1);                   -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);                   -- E0 toma el valor del interruptor 0
   
   u1: full_adder port map (E2, E1, E0, sum1, carry1); -- Instancia del sumador completo con las senales E2, E1, E0 como entradas y sum1, carry1 como salidas


   -- Asignacion de valores a los LEDs de salida
   G_LED(0) <= S0;                  -- El LED 0 muestra el resultado de la suma (S0)
   G_LED(1) <= S1;                  -- El LED 1 muestra el acarreo (S1)
end rtl;
