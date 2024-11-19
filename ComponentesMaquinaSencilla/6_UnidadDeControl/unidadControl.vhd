library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity unidadControl is
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
          rst : in STD_LOGIC -- Señal de estado de la unidad de control
  );
end unidadControl;

architecture Behavioral of unidadControl is
signal estado_uc : STD_LOGIC_VECTOR (2 downto 0);
begin
process(clk)
begin
if rising_edge(clk) then
    if rst='1' then  
        estado_uc<="XXX";  --Cambiar XXX por el valor correcto
    else
        case estado_uc is
        when "000" =>   estado_uc<="XXX";   --Cambiar XXX por el valor correcto
        when "001" =>   if OP="XX" then --Cambiar XX por el valor correcto
                            if registro_fz='0' then
                                estado_uc<="XXX";   --Cambiar XXX por el valor correcto
                            else
                                estado_uc<="XXX";   --Cambiar XXX por el valor correcto
                            end if;
                        else 
                            estado_uc<="XXX";   --Cambiar XXX por el valor correcto
                        end if;
        when "111" => estado_uc<="XXX";   --Cambiar XXX por el valor correcto

        when "010" =>  if OP(1)='1' then
                            estado_uc<="XXX";   --Cambiar XXX por el valor correcto
                            else
                                estado_uc<="XXX";  --Cambiar XXX por el valor correcto
                        end if;
        
        when "011" => if OP(0)='1' then
                            estado_uc<="XXX";  --Cambiar XXX por el valor correcto
                            else
                                estado_uc<="XXX";  --Cambiar XXX por el valor correcto
                        end if;
        when "100" =>   estado_uc<="XXX";  --Cambiar XXX por el valor correcto
        when "101" =>   estado_uc<="XXX";  --Cambiar XXX por el valor correcto
        when "110" =>   estado_uc<="XXX";  --Cambiar XXX por el valor correcto
        when others =>  estado_uc<="XXX";  --Cambiar XXX por el valor correcto
        end case;
    end if;
end if;
end process;

process(estado_uc)
begin
case estado_uc is
when "000" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "001" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "010" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "011" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "100" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "101" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "110" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
when "111" =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto

when others =>
                sel_dir<="XX"; --Cambiar XX por el valor correcto
                r_w<='X'; --Cambiar X por el valor correcto
                carga_ri<='X'; --Cambiar X por el valor correcto
                carga_rpc<='X'; --Cambiar X por el valor correcto
                codigo_alu<="XX"; --Cambiar XX por el valor correcto
                carga_ra<='X'; --Cambiar X por el valor correcto
                carga_rb<='X'; --Cambiar X por el valor correcto
                carga_rfz<='X'; --Cambiar X por el valor correcto
end case;
end process;

estado<=estado_uc;

end Behavioral;
