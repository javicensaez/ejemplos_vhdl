library IEEE;
use IEEE.STD_LOGIC_1164.ALL;         -- Importa tipos estandar como std_logic y std_logic_vector para senales logicas
use IEEE.STD_LOGIC_ARITH.ALL;        -- Importa funciones aritmeticas (nota: esta libreria esta obsoleta, se recomienda usar numeric_std)
use IEEE.STD_LOGIC_UNSIGNED.ALL;     -- Importa operaciones aritmeticas en vectores sin signo

-- Declaracion de la entidad "base"
entity base is
	Port (
		G_CLOCK_50 : in std_logic;                 -- Entrada de reloj de 50 MHz
		V_SW : in std_logic_vector (7 downto 0);   -- Entrada de 8 interruptores (SWITCH)
		G_LED : out std_logic_vector (7 downto 0); -- Salida para 8 LEDs
		G_HEX0 : out std_logic_vector (6 downto 0) := "1111111" -- Salida de 7 segmentos inicializada a "1111111" (todos los segmentos apagados)
		);
end base;

-- Arquitectura "behavioral" de la entidad "base"
architecture behavioral of base is
    -- Declaracion de senales internas para representar los bits de los interruptores
	signal  E3, E2, E1, E0: std_logic;
    -- Declaracion de senales internas que representaran los segmentos a, b, c, d, e, f, g del display de 7 segmentos
	signal  a, b, c, d, e, f, g: std_logic;
	
begin
    -- Asignacion de los valores de los interruptores a las senales internas
	E3 <= V_SW(3);     -- E3 toma el valor del interruptor V_SW(3)
	E2 <= V_SW(2);     -- E2 toma el valor del interruptor V_SW(2)
	E1 <= V_SW(1);     -- E1 toma el valor del interruptor V_SW(1)
	E0 <= V_SW(0);     -- E0 toma el valor del interruptor V_SW(0)
		
    -- Logica combinacional para controlar los segmentos del display de 7 segmentos
    -- Estas expresiones determinan el encendido/apagado de cada segmento en funcion de las senales E3, E2, E1 y E0
	g <= (not(E1) and not(E2) and not(E3)) or (E0 and E1 and E2);       -- Control del segmento g
	f <= (E1 and not(E2)) or (E0 and not(E2) and not(E3)) or (E0 and E1); -- Control del segmento f
	e <= (not(E1) and E2) or (E0);                                      -- Control del segmento e
	d <= (not(E0) and not(E1) and E2) or (E0 and not(E1) and not(E2)) or (E0 and E1 and E2); -- Control del segmento d
	c <= (not(E0) and E1 and not(E2));                                  -- Control del segmento c
	b <= (not(E0) and E1 and E2) or (E0 and not(E1) and E2);            -- Control del segmento b
	a <= (not(E0) and not(E1) and E2) or (E0 and not(E1) and not(E2) and not(E3)); -- Control del segmento a
		
    -- Asignacion de las senales de los segmentos al display de 7 segmentos (G_HEX0)
	G_HEX0(0) <= a;  -- El segmento 0 (a) toma el valor de la senal a
	G_HEX0(1) <= b;  -- El segmento 1 (b) toma el valor de la senal b
	G_HEX0(2) <= c;  -- El segmento 2 (c) toma el valor de la senal c
	G_HEX0(3) <= d;  -- El segmento 3 (d) toma el valor de la senal d
	G_HEX0(4) <= e;  -- El segmento 4 (e) toma el valor de la senal e
	G_HEX0(5) <= f;  -- El segmento 5 (f) toma el valor de la senal f
	G_HEX0(6) <= g;  -- El segmento 6 (g) toma el valor de la senal g
		
end behavioral;
