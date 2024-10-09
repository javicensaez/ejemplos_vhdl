
library ieee;
use ieee.std_logic_1164.all;

-- Importar la declaración de los componentes
use work.paquete.all;

-- Entidad principal que conecta el sumador, decodificador binario a BCD y displays de 7 segmentos
entity main is
    port (
        V_SW : in std_logic_vector(8 downto 0);  -- Interruptores de entrada
        G_HEX0 : out std_logic_vector(6 downto 0);  -- Salida para el primer display de 7 segmentos (unidades)
        G_HEX1 : out std_logic_vector(6 downto 0)   -- Salida para el segundo display de 7 segmentos (decenas)
    );
end main;

-- Arquitectura de la entidad principal
architecture rtl of main is

    -- Señales internas
    signal datoa, datob : std_logic_vector(3 downto 0);  -- Señales para datos A y B
    signal sum : std_logic_vector(3 downto 0);
    signal carry : std_logic;
    signal bcd_tens, bcd_units : std_logic_vector(3 downto 0);
    signal bin_input : std_logic_vector(4 downto 0);  -- Señal que une suma y acarreo

begin
    -- Asignar los bits de los interruptores a las señales datoa (8 downto 5) y datob (3 downto 0)
    datoa <= V_SW(8 downto 5);
    datob <= V_SW(3 downto 0);

    -- Instanciar el sumador de 4 bits
    sum_inst : four_bit_adder port map (datoa, datob, sum, carry);

    -- Concatenar la suma y el carry para el decodificador binario a BCD
    bin_input <= carry & sum;

    -- Instanciar el decodificador binario a BCD
    bin_to_bcd_inst : bin_to_bcd port map (bin_input, bcd_tens, bcd_units);

    -- Instanciar el decodificador BCD a 7 segmentos para el primer dígito (unidades)
    bcd_to_7seg_inst0 : bcd_to_7seg port map (bcd_units, G_HEX0);

    -- Instanciar el decodificador BCD a 7 segmentos para el segundo dígito (decenas)
    bcd_to_7seg_inst1 : bcd_to_7seg port map (bcd_tens, G_HEX1);

end rtl;
