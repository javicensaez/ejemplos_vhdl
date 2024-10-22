-- Alumno 1 nombre y apellidos: 
-- Alumno 2 nombre y apellidos: 

LIBRARY IEEE; -- Comenta esta linea
USE IEEE.std_logic_1164.ALL; -- Comenta esta linea
USE IEEE.numeric_std.ALL; -- Comenta esta linea
USE IEEE.std_logic_unsigned.ALL; -- Comenta esta linea

ENTITY ALU IS
	PORT (
		A : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		SEL : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		z : OUT STD_LOGIC;
		clk: IN STD_LOGIC
	);
END ALU;

ARCHITECTURE Behavioral OF ALU IS

signal resultadoSumaExt:  STD_LOGIC_VECTOR (16 DOWNTO 0); -- Comenta esta linea
signal resultadoSuma: STD_LOGIC_VECTOR (15 DOWNTO 0); -- Comenta esta linea
signal resultadoXor:  STD_LOGIC_VECTOR (15 DOWNTO 0);  -- Comenta esta linea
signal resultadoTotal: STD_LOGIC_VECTOR (15 DOWNTO 0); -- Comenta esta linea
-- Mete aqui mas senales si las necesitas

BEGIN

-- Mete aqui el codigo del programa

END Behavioral;
