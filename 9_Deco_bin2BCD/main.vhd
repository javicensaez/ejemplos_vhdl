
library ieee;
use ieee.std_logic_1164.all;

-- Entidad principal que conecta los interruptores, decodificador y displays de 7 segmentos
entity main is
    port (
        V_SW : in std_logic_vector(4 downto 0);  -- Interruptores de entrada (binario de 5 bits)
        G_HEX0 : out std_logic_vector(6 downto 0);  -- Salida para el primer display de 7 segmentos
        G_HEX1 : out std_logic_vector(6 downto 0)   -- Salida para el segundo display de 7 segmentos
    );
end main;

-- Arquitectura de la entidad principal
architecture rtl of main is
    -- Declaración de componentes
    component bin_to_bcd
        port (
            bin_in : in std_logic_vector(4 downto 0);
            bcd_tens : out std_logic_vector(3 downto 0);
            bcd_units : out std_logic_vector(3 downto 0)
        );
    end component;

    component bcd_to_7seg
        port (
            bcd_in : in std_logic_vector(3 downto 0);
            seg_out : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Señales internas para las decenas y unidades
    signal bcd_tens, bcd_units : std_logic_vector(3 downto 0);

begin
    -- Instanciar el decodificador binario a BCD
    bin_to_bcd_inst : bin_to_bcd
        port map (
            bin_in => V_SW,
            bcd_tens => bcd_tens,
            bcd_units => bcd_units
        );

    -- Instanciar el decodificador BCD a 7 segmentos para el primer dígito (unidades)
    bcd_to_7seg_inst0 : bcd_to_7seg
        port map (
            bcd_in => bcd_units,
            seg_out => G_HEX0
        );

    -- Instanciar el decodificador BCD a 7 segmentos para el segundo dígito (decenas)
    bcd_to_7seg_inst1 : bcd_to_7seg
        port map (
            bcd_in => bcd_tens,
            seg_out => G_HEX1
        );

end rtl;
