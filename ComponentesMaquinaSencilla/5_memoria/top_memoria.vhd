
-- Este fichero es para comprobar el funcionamiento de una memoria.
-- Con los interruptores del 9 al 5 se puede introducir la dirección que se desea manipular.
-- Con los interruptores del 4 al 0 se puede introducir el dato que se desea almacenar.
-- Si se pulsa el botón 4, se habilita la escritura en la memoria.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_memoria is
    port (
        G_CLOCK_50 : in std_logic;                   -- Señal de reloj de 50 MHz
        V_SW       : in std_logic_vector(9 downto 0); -- Interruptores de entrada
        V_BT       : in std_logic_vector(3 downto 0); -- Botones de entrada
        G_LED      : out std_logic_vector(9 downto 0) -- LEDs de salida
    );
end top_memoria;

architecture Behavioral of top_memoria is
    component memoria
        port (
            clk   : in std_logic;                      -- Señal de reloj para sincronizar la memoria
            en    : in std_logic;                      -- Señal de habilitación de la memoria
            we    : in std_logic;                      -- Señal de habilitación de escritura para el puerto A
            addra : in std_logic_vector(6 downto 0);   -- Dirección de acceso para el puerto A
            addrb : in std_logic_vector(6 downto 0);   -- Dirección de acceso para el puerto B
            di    : in std_logic_vector(15 downto 0);  -- Datos de entrada para escribir en la memoria a través del puerto A
            doa   : out std_logic_vector(15 downto 0); -- Datos de salida del puerto A
            dob   : out std_logic_vector(15 downto 0)  -- Datos de salida del puerto B
        );
    end component;

    signal clk    : std_logic;
    signal en     : std_logic;
    signal we     : std_logic;
    signal addra  : std_logic_vector(6 downto 0);
    signal addrb  : std_logic_vector(6 downto 0);
    signal di     : std_logic_vector(15 downto 0);
    signal doa    : std_logic_vector(15 downto 0);
    signal dob    : std_logic_vector(15 downto 0);

begin
    -- Instancia del componente memoria
    U1: memoria port map (
        clk,                -- Señal de reloj
        en,                 -- Señal de habilitación de la memoria
        we,                 -- Señal de habilitación de escritura
        addra,              -- Dirección para el puerto A
        di,                 -- Datos de entrada para escribir
        (others => '0'),    -- Dirección para el puerto B (no se utiliza, se asigna 0)
        open,               -- Salida del puerto B (no se utiliza)
        doa                 -- Salida del puerto A
    );

    -- Conexión de señales
    clk    <= G_CLOCK_50;                        -- Conexión del reloj principal
    en     <= V_BT(0);                           -- Habilitación de la memoria controlada por el botón 0
    we     <= V_BT(1);                           -- Habilitación de escritura controlada por el botón 1
    addra <= "00" & V_SW(9 downto 5);            -- Dirección para el puerto A controlada por los interruptores del 9 al 5
    di <= "00000000000" & V_SW(4 downto 0);      -- Datos de entrada a escribir controlados por los interruptores del 4 al 0

    -- Salidas conectadas a los LEDs
    G_LED(9 downto 0) <= doa(9 downto 0);        -- Mostrar la salida del puerto A en los LEDs del 9 al 0

end Behavioral;
