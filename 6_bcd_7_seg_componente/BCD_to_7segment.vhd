library IEEE;  -- Importa la biblioteca estándar IEEE para trabajar con señales y tipos de datos lógicos.
use IEEE.STD_LOGIC_1164.ALL;  -- Importa los tipos de datos lógicos como std_logic y std_logic_vector.

-- Definición de la entidad "BCD_to_7segment", que describe las entradas y salidas del decodificador.
entity BCD_to_7segment is
    Port (
        E3 : in STD_LOGIC;  -- Entrada binaria de 1 bit (más significativo).
        E2 : in STD_LOGIC;  -- Entrada binaria de 1 bit.
        E1 : in STD_LOGIC;  -- Entrada binaria de 1 bit.
        E0 : in STD_LOGIC;  -- Entrada binaria de 1 bit (menos significativo).
        a  : out STD_LOGIC; -- Salida para el segmento 'a' del display de 7 segmentos.
        b  : out STD_LOGIC; -- Salida para el segmento 'b' del display de 7 segmentos.
        c  : out STD_LOGIC; -- Salida para el segmento 'c' del display de 7 segmentos.
        d  : out STD_LOGIC; -- Salida para el segmento 'd' del display de 7 segmentos.
        e  : out STD_LOGIC; -- Salida para el segmento 'e' del display de 7 segmentos.
        f  : out STD_LOGIC; -- Salida para el segmento 'f' del display de 7 segmentos.
        g  : out STD_LOGIC  -- Salida para el segmento 'g' del display de 7 segmentos.
    );
end BCD_to_7segment;  -- Finaliza la definición de la entidad.

-- Comienza la definición de la arquitectura "Behavioral", que describe cómo se comporta la entidad.
architecture Behavioral of BCD_to_7segment is
begin
    -- Control del segmento 'g'
    -- El segmento 'g' se enciende cuando E1, E2 y E3 son 0 (NOT(E1) AND NOT(E2) AND NOT(E3)) o cuando E0, E1 y E2 son 1 (E0 AND E1 AND E2).
    g <= (not(E1) and not(E2) and not(E3)) or (E0 and E1 and E2);
    
    -- Control del segmento 'f'
    -- El segmento 'f' se enciende cuando E1 es 1 y E2 es 0 (E1 AND NOT(E2)) o cuando E0 es 1, E2 es 0 y E3 es 0 (E0 AND NOT(E2) AND NOT(E3)) o cuando E0 y E1 son 1 (E0 AND E1).
    f <= (E1 and not(E2)) or (E0 and not(E2) and not(E3)) or (E0 and E1);
    
    -- Control del segmento 'e'
    -- El segmento 'e' se enciende cuando E1 es 0 y E2 es 1 (NOT(E1) AND E2) o cuando E0 es 1 (E0).
    e <= (not(E1) and E2) or (E0);
    
    -- Control del segmento 'd'
    -- El segmento 'd' se enciende cuando E0 es 0, E1 es 0 y E2 es 1 (NOT(E0) AND NOT(E1) AND E2) o cuando E0 es 1, E1 es 0 y E2 es 0 (E0 AND NOT(E1) AND NOT(E2)) o cuando E0, E1 y E2 son 1 (E0 AND E1 AND E2).
    d <= (not(E0) and not(E1) and E2) or (E0 and not(E1) and not(E2)) or (E0 and E1 and E2);
    
    -- Control del segmento 'c'
    -- El segmento 'c' se enciende cuando E0 es 0, E1 es 1 y E2 es 0 (NOT(E0) AND E1 AND NOT(E2)).
    c <= (not(E0) and E1 and not(E2));
    
    -- Control del segmento 'b'
    -- El segmento 'b' se enciende cuando E0 es 0, E1 es 1 y E2 es 1 (NOT(E0) AND E1 AND E2) o cuando E0 es 1, E1 es 0 y E2 es 1 (E0 AND NOT(E1) AND E2).
    b <= (not(E0) and E1 and E2) or (E0 and not(E1) and E2);
    
    -- Control del segmento 'a'
    -- El segmento 'a' se enciende cuando E0 es 0, E1 es 0 y E2 es 1 (NOT(E0) AND NOT(E1) AND E2) o cuando E0 es 1, E1 es 0, E2 es 0 y E3 es 0 (E0 AND NOT(E1) AND NOT(E2) AND NOT(E3)).
    a <= (not(E0) and not(E1) and E2) or (E0 and not(E1) and not(E2) and not(E3));
    
end Behavioral;  -- Finaliza la descripción del comportamiento de la arquitectura.
