library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.paquete.all;

entity TopCPU is
    port (
        G_CLOCK_50: in std_logic;
        V_SW  : in std_logic_vector (9 downto 0);
        V_BT  : in std_logic_vector (3 downto 0);
        G_LED : out std_logic_vector(9 downto 0);
        G_HEX0 : out std_logic_vector(0 to 6);
        G_HEX1 : out std_logic_vector(0 to 6);
        G_HEX2 : out std_logic_vector(0 to 6);
        G_HEX3 : out std_logic_vector(0 to 6)
    );
end;

architecture rtl of TopCPU is

signal BUS_DIR_B: STD_LOGIC_VECTOR (6 downto 0); --No tocar, señal para sacar un dato de la memoria por un bus secundario, el bus de direcciones
signal BUS_DATOS_OUT_B: STD_LOGIC_VECTOR (15 downto 0);  --No tocar, señal para sacar un dato de la memoria por un bus secundario, el bus de datos
signal estado : STD_LOGIC_VECTOR (2 downto 0); -- Estado de la unidad de control


begin


enmen<='1'; -- No tocar, habilita la memoria
rst<=V_SW(9); -- No tocar, reset de la maquina

G_LED(9 downto 0)<=BUS_DATOS_OUT_B(9 downto 0); -- No tocar, salida de los datos de la memoria a los leds por el bus secundario para visualizar el contenido de la memoria
BUS_DIR_B<=V_SW(6 downto 0); -- No tocar, carga la dirección de memoria por el bus secundario, se vera en los ledes la el contenido de la dirección de memoria que se selecciones con los interruptores

  
      X1 : memoria port map (aaa,enmen,ccc,ddd,BUS_DIR_B,ffff,ggggg,BUS_DATOS_OUT_B);  --No tocar, las señales ya colocadas, enmen, bus_dir_b, bus_datos_out_b, en el resto pones las adecuadas
      RA : registro Port map (aaaa,bbbb,cccc,dddd,eeee); -- pones las señales adecuadas
      RB : registro Port map (aaa,bbbb,cccc,dddd,eeee); -- pones las señales adecuadas
      RPC : registro Port map (aaaa,bbbb,ccccc,dddd,eeee); -- pones las señales adecuadas
      RPIns : registro Port map (aaaa,bbbbb,cccc,ddddd,eeeee); -- pones las señales adecuadas, cuidado el registro es de 16 bits pero solo se usan 7 bits
      RPFz : registro Port map (aaaa,bbbb,ccccc,ddddd,eeee); -- pones las señales adecuadas, cudiado el registro es de 16 bits pero solo se usan 1 bit
      ALU1: ALU Port Map (aaaaa,bbbbb,cccc,dddd,eeee,ffff); -   pones las señales adecuadas
      IncPc: incrementoPC Port Map (aaa,bbb); -- pones las señales adecuadas
      MULTIPLE1:  multiplexador Port Map (aa,bb,ccc,dd,ee,ff,gg); -- pones las señales adecuadas
      UC1: unidadControl Port Map (a,b,c,d,e,f,g,h,i,j,k,l,estado); -- pones las señales adecuadas, no tocar el estado


end rtl;