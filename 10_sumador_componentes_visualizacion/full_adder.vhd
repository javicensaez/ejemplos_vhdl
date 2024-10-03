
library ieee;
use ieee.std_logic_1164.all;

-- Declaración del full adder que usa dos half adders
entity full_adder is
    port (
        A : in std_logic;           -- Primer bit de entrada
        B : in std_logic;           -- Segundo bit de entrada
        CIN : in std_logic;         -- Acarreo de entrada
        SUM : out std_logic;        -- Bit de salida que representa la suma
        COUT : out std_logic        -- Bit de salida que representa el acarreo
    );
end;

-- Arquitectura del full adder
architecture rtl of full_adder is
    -- Declaración del componente half_adder
    component half_adder
        port (
            A : in std_logic;
            B : in std_logic;
            SUM : out std_logic;
            CARRY : out std_logic
        );
    end component;

    -- Señales internas
    signal sum1, carry1, carry2: std_logic;

begin
    -- Primer half adder
    u1: half_adder port map (A, B, sum1, carry1);

    -- Segundo half adder
    u2: half_adder port map (sum1, CIN, SUM, carry2);

    -- Acarreo de salida
    COUT <= carry1 or carry2;

end rtl;
