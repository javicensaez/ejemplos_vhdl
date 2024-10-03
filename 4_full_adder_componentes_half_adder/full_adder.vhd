library ieee;
use ieee.std_logic_1164.all;          -- Importa tipos de datos como std_logic y std_logic_vector


-- Declaración del sumador completo
entity full_adder is
    port (
        A : in std_logic;             -- Primer bit de entrada
        B : in std_logic;             -- Segundo bit de entrada
        CIN : in std_logic;           -- Bit de acarreo de entrada
        SUM : out std_logic;          -- Bit de salida que representa la suma
        COUT : out std_logic          -- Bit de salida que representa el acarreo de salida
    );
end;

-- Arquitectura del sumador completo
architecture rtl of full_adder is
    -- Declaración del componente del semi sumador
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
    -- Instancia del primer semi sumador usando asignación posicional
    u1: half_adder
        port map (A, B, sum1, carry1);    -- Primer semi sumador: entradas A, B; salidas sum1, carry1

    -- Instancia del segundo semi sumador usando asignación posicional
    u2: half_adder
        port map (sum1, CIN, SUM, carry2);  -- Segundo semi sumador: entradas sum1, CIN; salidas SUM, carry2

    -- Acarreo de salida
    COUT <= carry1 or carry2;             -- El acarreo de salida es la OR de carry1 y carry2

end rtl;