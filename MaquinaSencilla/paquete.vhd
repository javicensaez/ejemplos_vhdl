library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

package paquete is
 
component memoria is
port (clk  : in std_logic;   
        en     : in std_logic; 
        we     : in std_logic; 
        addra: in std_logic_vector(6 downto 0);  
        addrb: in std_logic_vector(6 downto 0);  
        di     : in std_logic_vector(15 downto 0);   
        doa     : out std_logic_vector(15 downto 0);   
        dob     : out std_logic_vector(15 downto 0))   
end component;

component ALU IS
	PORT (
		A : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		B : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		SEL : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		Y : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		z : OUT STD_LOGIC;
		clk: IN STD_LOGIC
	);
END component; 

component registro is
    Port ( entrada : in STD_LOGIC_VECTOR (15 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0);
           carga : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end component;

component multiplexador is
    Port ( dato0 : in STD_LOGIC_VECTOR (6 downto 0);
           dato1 : in STD_LOGIC_VECTOR (6 downto 0);
           dato2 : in STD_LOGIC_VECTOR (6 downto 0);
           dato3 : in STD_LOGIC_VECTOR (6 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           salida : out STD_LOGIC_VECTOR (6 downto 0);
           clk: in STD_LOGIC);
end component;

component incrementoPC is
    Port ( entrada : in STD_LOGIC_VECTOR (6 downto 0);
           salida : out STD_LOGIC_VECTOR (6 downto 0)
           );
end component;

component unidadControl is
  Port (  clk : in STD_LOGIC;
          OP: in STD_LOGIC_VECTOR (1 downto 0);
          registro_fz : in STD_LOGIC;
          sel_dir: out STD_LOGIC_VECTOR (1 downto 0);
          r_w: out STD_LOGIC;
          carga_ri: out STD_LOGIC;
          carga_rpc: out STD_LOGIC;
          codigo_alu: out STD_LOGIC_VECTOR (1 downto 0);
          carga_ra: out STD_LOGIC;           
          carga_rb: out STD_LOGIC;    
          carga_rfz: out STD_LOGIC;      
          rst : in STD_LOGIC ;
          estado: out STD_LOGIC_VECTOR (2 downto 0) 
  );
end component;
 
end package;