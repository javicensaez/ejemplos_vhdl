
library ieee;
use ieee.std_logic_1164.all;

-- Entidad del sumador de 4 bits
entity four_bit_adder is
    port (
        A : in std_logic_vector(3 downto 0);   -- Primer operando de 4 bits
        B : in std_logic_vector(3 downto 0);   -- Segundo operando de 4 bits
        SUM : out std_logic_vector(3 downto 0); -- Salida de la suma de 4 bits
        COUT : out std_logic                  -- Acarreo de salida
    );
end four_bit_adder;

-- Arquitectura del sumador de 4 bits
architecture rtl of four_bit_adder is
    component full_adder
        port (
            A : in std_logic;
            B : in std_logic;
            CIN : in std_logic;
            SUM : out std_logic;
            COUT : out std_logic
        );
    end component;

    -- Señales para acarreos intermedios
    signal carry : std_logic_vector(3 downto 0);

begin
    -- Primer bit (LSB)
    fa0: full_adder port map (A(0), B(0), '0', SUM(0), carry(0));

    -- Segundo bit
    fa1: full_adder port map (A(1), B(1), carry(0), SUM(1), carry(1));

    -- Tercer bit
    fa2: full_adder port map (A(2), B(2), carry(1), SUM(2), carry(2));

    -- Cuarto bit (MSB)
    fa3: full_adder port map (A(3), B(3), carry(2), SUM(3), carry(3));

    -- Acarreo de salida
    COUT <= carry(3);

end rtl;
