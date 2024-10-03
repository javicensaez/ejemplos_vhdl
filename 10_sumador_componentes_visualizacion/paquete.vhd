
library ieee;
use ieee.std_logic_1164.all;

package paquete is

-- Declaración del sumador de 4 bits
component four_bit_adder
    port (
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
        SUM : out std_logic_vector(3 downto 0);
        COUT : out std_logic
    );
end component;

-- Declaración del decodificador binario a BCD
component bin_to_bcd
    port (
        bin_in : in std_logic_vector(4 downto 0);
        bcd_tens : out std_logic_vector(3 downto 0);
        bcd_units : out std_logic_vector(3 downto 0)
    );
end component;

-- Declaración del decodificador BCD a 7 segmentos
component bcd_to_7seg
    port (
        bcd_in : in std_logic_vector(3 downto 0);
        seg_out : out std_logic_vector(6 downto 0)
    );
end component;

end package;