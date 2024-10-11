library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad del decodificador binario a BCD para 5 bits
entity bin_to_bcd is
    port (
        bin_in : in std_logic_vector(4 downto 0);  -- Entrada binaria de 5 bits (0 a 31)
        bcd_tens : out std_logic_vector(3 downto 0); -- Salida BCD para las decenas
        bcd_units : out std_logic_vector(3 downto 0) -- Salida BCD para las unidades
    );
end bin_to_bcd;

-- Arquitectura del decodificador
architecture combinational of bin_to_bcd is
    signal binary : unsigned(4 downto 0);    -- Número binario en formato unsigned (5 bits)
    signal decenas, unidades : unsigned(3 downto 0); -- Variables para las decenas y unidades
    signal binary_integer : integer;  -- Variable entera para almacenar el valor de la entrada binaria
begin
    -- Asignar la entrada binaria a la señal binaria unsigned
    binary <= unsigned(bin_in);

    -- Convertir el valor binario a entero
    binary_integer <= to_integer(binary);

    -- Decodificación combinacional del número binario a BCD
    process(binary_integer)
    begin
        -- Inicializar las decenas y unidades
        decenas <= "0000";
        unidades <= "0000";

        -- Verificar los diferentes rangos
        if binary_integer < 10 then
            decenas <= "0000";  -- Decenas = 0
            unidades <= to_unsigned(binary_integer, 4);  -- Unidades = binario
        elsif binary_integer < 20 then
            decenas <= "0001";  -- Decenas = 1
            unidades <= to_unsigned(binary_integer - 10, 4); -- Unidades = binario - 10
        elsif binary_integer < 30 then
            decenas <= "0010";  -- Decenas = 2
            unidades <= to_unsigned(binary_integer - 20, 4); -- Unidades = binario - 20
        elsif binary_integer < 32 then
            decenas <= "0011";  -- Decenas = 3
            unidades <= to_unsigned(binary_integer - 30, 4); -- Unidades = binario - 30
        else
            -- No debería ocurrir con 5 bits (máximo valor es 31)
            decenas <= "0000";  -- Reset de las decenas
            unidades <= "0000"; -- Reset de las unidades
        end if;
    end process;

    -- Asignar las señales internas a las salidas BCD
    bcd_tens <= std_logic_vector(decenas);   -- Salida de las decenas en BCD
    bcd_units <= std_logic_vector(unidades); -- Salida de las unidades en BCD
end combinational;
