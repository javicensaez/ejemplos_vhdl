library ieee;  
use ieee.std_logic_1164.all;          -- Importa tipos de datos como std_logic y std_logic_vector
use ieee.numeric_std.all;             -- Importa funciones aritméticas sobre números binarios
use ieee.std_logic_unsigned.all;      -- Importa operaciones aritméticas en vectores de bits (no estándar)

-- Declaración de la entidad "prueba"
entity prueba is
    port (
        G_CLOCK_50: in std_logic;                    -- Entrada de reloj a 50 MHz
        V_SW  : in std_logic_vector (9 downto 0);    -- Entrada de 10 interruptores (SWITCH)
        V_BT  : in std_logic_vector (3 downto 0);    -- Entrada de 4 botones (BUTTONS)
        G_LED : out std_logic_vector(9 downto 0);    -- Salida para 10 LEDs
        G_HEX0 : out std_logic_vector(0 to 6);       -- Salida para el primer display de 7 segmentos
        G_HEX1 : out std_logic_vector(0 to 6);       -- Salida para el segundo display de 7 segmentos
        G_HEX2 : out std_logic_vector(0 to 6);       -- Salida para el tercer display de 7 segmentos
        G_HEX3 : out std_logic_vector(0 to 6)        -- Salida para el cuarto display de 7 segmentos
    );
end;

-- Arquitectura de la entidad "prueba"
architecture rtl of prueba is
    -- Señales internas (intermedias) que se usarán para almacenar valores
    signal E2, E1, E0: std_logic;   -- Señales internas de un solo bit para almacenar los valores de los interruptores
    signal S1, S0: std_logic;       -- Señales internas para los LEDs

begin
   -- Asignación de los valores de los interruptores (SWITCH) a las señales internas E2, E1, E0
   E2 <= V_SW(2);                   -- E2 toma el valor del interruptor 2
   E1 <= V_SW(1);                   -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);                   -- E0 toma el valor del interruptor 0

   -- Lógica combinacional de la prueba
   

   -- Asignación de valores a los LEDs de salida
   G_LED(0) <= S0;                  -- El LED 0 toma el valor de la señal S0
   G_LED(1) <= S1;                  -- El LED 1 toma el valor de la señal S1
end rtl;
