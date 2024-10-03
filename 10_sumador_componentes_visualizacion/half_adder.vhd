
library ieee;
use ieee.std_logic_1164.all;

-- Declaración de la entidad "half_adder"
entity half_adder is
    port (
        A : in std_logic;           -- Primer bit de entrada
        B : in std_logic;           -- Segundo bit de entrada
        SUM : out std_logic;        -- Bit de salida que representa la suma (S)
        CARRY : out std_logic       -- Bit de salida que representa el acarreo (C)
    );
end;

-- Arquitectura de la entidad "half_adder"
architecture rtl of half_adder is
begin
   -- Lógica combinacional del half adder
   SUM <= A xor B;                  -- Suma de A y B (XOR)
   CARRY <= A and B;                -- Acarreo entre A y B (AND)
end rtl;
