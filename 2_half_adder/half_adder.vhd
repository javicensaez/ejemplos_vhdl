library ieee;  
use ieee.std_logic_1164.all;          -- Importa tipos de datos como std_logic y std_logic_vector, necesarios para trabajar con señales lógicas
use ieee.numeric_std.all;             -- Importa funciones aritméticas sobre números binarios (como suma y resta de vectores de bits)
use ieee.std_logic_unsigned.all;      -- Importa operaciones aritméticas en vectores de bits (no estándar, alternativa para realizar operaciones aritméticas sin conversión de tipos)

-- Declaración de la entidad "half_adder"
entity half_adder is
    port (
        G_CLOCK_50: in std_logic;                    -- Entrada de reloj a 50 MHz
        V_SW  : in std_logic_vector (9 downto 0);    -- Entrada de 10 interruptores (SWITCH), de los cuales se usan los bits 1 y 0
        V_BT  : in std_logic_vector (3 downto 0);    -- Entrada de 4 botones (BUTTONS)
        G_LED : out std_logic_vector(9 downto 0);    -- Salida para 10 LEDs, de los cuales se utilizan los LEDs 0 y 1
        G_HEX0 : out std_logic_vector(6 downto 0);   -- Salida para el primer display de 7 segmentos
        G_HEX1 : out std_logic_vector(6 downto 0);   -- Salida para el segundo display de 7 segmentos
        G_HEX2 : out std_logic_vector(6 downto 0);   -- Salida para el tercer display de 7 segmentos
        G_HEX3 : out std_logic_vector(6 downto 0)    -- Salida para el cuarto display de 7 segmentos
    );
end;

-- Arquitectura de la entidad "half_adder"
architecture rtl of half_adder is
    -- Señales internas (intermedias) que se usarán para almacenar valores
    signal E1, E0: std_logic;   -- Señales internas para los bits de los interruptores V_SW(1) y V_SW(0)
    signal S1, S0: std_logic;   -- Señales internas que representan la salida (suma y acarreo) del sumador
    signal xor1, and1: std_logic; -- Señales internas usadas para los cálculos de la lógica combinacional

begin
   -- Asignación de los valores de los interruptores (SWITCH) a las señales internas E1, E0
   E1 <= V_SW(1);                   -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);                   -- E0 toma el valor del interruptor 0
   
   -- Lógica combinacional del half adder (sumador de un bit)
   S0 <= E1 xor E0;               -- S0 es la suma de E1 y E0 (operación XOR)
   S1 <= E1 and E0;               -- S1 es el acarreo (carry), resultado de la operación AND entre E1 y E0

   -- Asignación de valores a los LEDs de salida
   G_LED(0) <= S0;                  -- El LED 0 muestra el resultado de la suma (S0)
   G_LED(1) <= S1;                  -- El LED 1 muestra el acarreo (S1)
end rtl;
