library ieee;  
use ieee.std_logic_1164.all;          -- Importa tipos de datos como std_logic y std_logic_vector, necesarios para trabajar con señales logicas
use ieee.numeric_std.all;             -- Importa funciones aritmeticas sobre numeros binarios (como suma y resta de vectores de bits)
use ieee.std_logic_unsigned.all;      -- Importa operaciones aritmeticas en vectores de bits (no estandar, alternativa para realizar operaciones aritmeticas sin conversion de tipos)

-- Declaracion de la entidad "full_adder"
entity full_adder is
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
architecture rtl of full_adder is
    -- Senales internas (intermedias) que se usaran para almacenar valores
    signal E2, E1, E0: std_logic;   -- Senales internas para los bits de los interruptores V_SW(2), V_SW(1) y V_SW(0)
    signal S1, S0: std_logic;       -- Senales internas que representan la salida (sum y carry) del sumador
    signal xor1, and1, and2: std_logic; -- Senales internas usadas para los calculos de la logica combinacional

begin
   -- Asignacion de los valores de los interruptores (SWITCH) a las senales internas E2, E1, E0
   E2 <= V_SW(2);                   -- E2 toma el valor del interruptor 2
   E1 <= V_SW(1);                   -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);                   -- E0 toma el valor del interruptor 0
   
   -- Logica combinacional del sumador completo
   xor1 <= E1 xor E0;               -- xor1 realiza la operacion XOR entre E1 y E0
   S0 <= xor1 xor E2;               -- S0 es el resultado final de la suma (XOR entre xor1 y E2)
   and1 <= E1 and E0;               -- and1 realiza la operacion AND entre E1 y E0
   and2 <= xor1 and E2;             -- and2 realiza la operacion AND entre xor1 y E2
   S1 <= and1 or and2;              -- S1 es el acarreo (carry), resultado de OR entre and1 y and2

   -- Asignacion de valores a los LEDs de salida
   G_LED(0) <= S0;                  -- El LED 0 muestra el resultado de la suma (S0)
   G_LED(1) <= S1;                  -- El LED 1 muestra el acarreo (S1)
end rtl;
