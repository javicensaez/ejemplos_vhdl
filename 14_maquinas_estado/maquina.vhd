library ieee;
use ieee.std_logic_1164.all;       -- Librería para manejar señales lógicas (std_logic, std_logic_vector)
use ieee.numeric_std.all;          -- Librería para operaciones con números (enteros, unsigned, etc.)
use ieee.std_logic_unsigned.all;   -- Librería para operaciones aritméticas no estándar en vectores lógicos

-- Declaración de la entidad "maquina"
entity maquina is
    port (
        G_CLOCK_50: in std_logic;                -- Entrada de reloj a 50 MHz
        V_SW  : in std_logic_vector (9 downto 0); -- Interruptores de entrada
        V_BT  : in std_logic_vector (3 downto 0); -- Botones de entrada
        G_LED : out std_logic_vector(9 downto 0); -- LEDs de salida
        G_HEX0 : out std_logic_vector(0 to 6);   -- Display de 7 segmentos (HEX0)
        G_HEX1 : out std_logic_vector(0 to 6);   -- Display de 7 segmentos (HEX1)
        G_HEX2 : out std_logic_vector(0 to 6);   -- Display de 7 segmentos (HEX2)
        G_HEX3 : out std_logic_vector(0 to 6)    -- Display de 7 segmentos (HEX3)
    );
end;

-- Arquitectura de la entidad "maquina"
architecture rtl of maquina is

-- Señales internas para manejar el estado y la lógica
signal salida: std_logic_vector(1 downto 0); -- Señal para la salida del estado (sin usar en este código)
signal estado: std_logic_vector(1 downto 0); -- Señal para el estado actual de la FSM
signal enable: std_logic;                    -- Señal para habilitar la FSM
signal reset: std_logic;                     -- Señal para reiniciar la FSM
signal dir: std_logic;                       -- Señal para definir la dirección de la FSM (incremento o decremento)
signal clk: std_logic;                       -- Reloj principal de la FSM

begin
-- Asignación de señales a los botones e interruptores
clk <= V_BT(0);         -- El reloj principal es controlado por el botón 0
reset <= V_BT(1);       -- El botón 1 actúa como reset
enable <= V_SW(0);      -- Interruptor 0 habilita la FSM
dir <= V_SW(1);         -- Interruptor 1 define la dirección de la FSM

-- Proceso secuencial: Manejo del estado en función del reloj y reset
process (clk, reset) is
begin
    -- Si el reloj tiene un flanco de subida y la FSM está habilitada
    if (rising_edge(clk) and (enable = '1')) then
        case estado is
            when "00" =>  -- Estado 00
                if dir = '1' then
                    estado <= "01"; -- Incrementa al siguiente estado
                else
                    estado <= "11"; -- Decrementa al estado anterior
                end if;
            when "01" =>  -- Estado 01
                if dir = '1' then
                    estado <= "10";
                else
                    estado <= "00";
                end if;
            when "10" =>  -- Estado 10
                if dir = '1' then
                    estado <= "11";
                else
                    estado <= "01";
                end if;
            when "11" =>  -- Estado 11
                if dir = '1' then
                    estado <= "00";
                else
                    estado <= "10";
                end if;
            when others => -- En caso de valores indefinidos ('U', 'X', '-', etc.)
                estado <= (others => 'X'); -- Asignar valor indefinido
        end case;
    end if;

    -- Si reset es activado (reset = '0')
    if reset = '0' then
        estado <= "00"; -- Reinicia al estado inicial
    end if;
end process;

-- Proceso combinacional: Salidas del display HEX0 según el estado
process(estado) is
begin
    case estado is
        when "00" => G_HEX0 <= "0000001"; -- Display muestra 0
        when "01" => G_HEX0 <= "1001111"; -- Display muestra 1
        when "10" => G_HEX0 <= "0010010"; -- Display muestra 2
        when "11" => G_HEX0 <= "0000110"; -- Display muestra 3
    end case;
end process;

end rtl;
