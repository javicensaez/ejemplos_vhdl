library ieee;  
use ieee.std_logic_1164.all;          -- Importa tipos de datos como std_logic y std_logic_vector, necesarios para trabajar con señales lógicas

-- Declaración de la entidad "half_adder" con 2 bits de entrada y 2 bits de salida
entity half_adder is
    port (
        A : in std_logic;             -- Primer bit de entrada
        B : in std_logic;             -- Segundo bit de entrada
        SUM : out std_logic;          -- Bit de salida que representa la suma (S)
        CARRY : out std_logic         -- Bit de salida que representa el acarreo (C)
    );
end;

-- Arquitectura de la entidad "half_adder"
architecture rtl of half_adder is
begin
   -- Lógica combinacional del half adder (sumador de medio bit)
   SUM <= A xor B;                   -- SUM es la suma de A y B (operación XOR)
   CARRY <= A and B;                 -- CARRY es el acarreo, resultado de la operación AND entre A y B
end rtl;
