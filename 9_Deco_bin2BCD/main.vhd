library ieee;
use ieee.std_logic_1164.all;

-- Entidad principal que conecta los interruptores, decodificador y displays de 7 segmentos
entity main is
    port (
        V_SW : in std_logic_vector(9 downto 0);  -- Interruptores de entrada (binario de 10 bits)
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
    signal bin_input : std_logic_vector(4 downto 0);  -- Señal que asigna bits 3 al 0 de los interruptores

begin
    -- Asignar los bits 3 al 0 de los interruptores a la señal bin_input
    bin_input <= V_SW(3 downto 0);

    -- Instanciar el decodificador binario a BCD en una sola línea usando asignación posicional
    bin_to_bcd_inst : bin_to_bcd port map (bin_input, bcd_tens, bcd_units);

    -- Instanciar el decodificador BCD a 7 segmentos para el primer dígito (unidades) usando asignación posicional
    bcd_to_7seg_inst0 : bcd_to_7seg port map (bcd_units, G_HEX0);

    -- Instanciar el decodificador BCD a 7 segmentos para el segundo dígito (decenas) usando asignación posicional
    bcd_to_7seg_inst1 : bcd_to_7seg port map (bcd_tens, G_HEX1);

end rtl