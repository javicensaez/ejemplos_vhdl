
library ieee;
use ieee.std_logic_1164.all;

-- Declaración del sumador de 4 bits
entity four_bit_adder is
    port (
        V_SW : in std_logic_vector(9 downto 0);    -- Interruptores para los operandos
        G_LED : out std_logic_vector(4 downto 0)   -- LEDs para mostrar la suma y acarreo
    );
end;

-- Arquitectura del sumador de 4 bits
architecture rtl of four_bit_adder is
    -- Declaración del componente full_adder
    component full_adder
        port (
            A : in std_logic;
            B : in std_logic;
            CIN : in std_logic;
            SUM : out std_logic;
            COUT : out std_logic
        );
    end component;

    -- Señales internas
    signal a3, a2, a1, a0: std_logic;              -- Bits del primer operando
    signal b3, b2, b1, b0: std_logic;              -- Bits del segundo operando
    signal s4, s3, s2, s1, s0: std_logic;          -- Bits de la suma
    signal carry0, carry1, carry2, carry3: std_logic; -- Señales de acarreo intermedias

begin
    -- Asignar los interruptores a las señales a3-a0 y b3-b0
    a3 <= V_SW(3); a2 <= V_SW(2); a1 <= V_SW(1); a0 <= V_SW(0);  -- Primer operando
    b3 <= V_SW(8); b2 <= V_SW(7); b1 <= V_SW(6); b0 <= V_SW(5);  -- Segundo operando

    -- Instancias del full adder con señales de acarreo individuales
    fa0: full_adder port map (a0, b0, '0', s0, carry0);
    fa1: full_adder port map (a1, b1, carry0, s1, carry1);
    fa2: full_adder port map (a2, b2, carry1, s2, carry2);
    fa3: full_adder port map (a3, b3, carry2, s3, carry3);

    -- Asignar las sumas a los LEDs 0 a 3
    G_LED(3 downto 0) <= s3 & s2 & s1 & s0;

    -- Asignar el último acarreo al LED 4
    G_LED(4) <= carry3;

end rtl;
