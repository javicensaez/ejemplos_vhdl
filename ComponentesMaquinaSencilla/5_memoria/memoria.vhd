-- Este código implementa una memoria de doble puerto.
-- El puerto A permite tanto la lectura como la escritura en la memoria.
-- El puerto B solo permite la lectura de la memoria.

library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memoria is
port (
    clk   : in std_logic;   -- Señal de reloj para sincronizar la memoria
    en    : in std_logic;   -- Señal de habilitación de la memoria
    we    : in std_logic;   -- Señal de habilitación de escritura para el puerto A
    addra : in std_logic_vector(6 downto 0);  -- Dirección de acceso para el puerto A
    addrb : in std_logic_vector(6 downto 0);  -- Dirección de acceso para el puerto B
    di    : in std_logic_vector(15 downto 0); -- Datos de entrada para escribir en la memoria a través del puerto A
    doa   : out std_logic_vector(15 downto 0);-- Datos de salida del puerto A
    dob   : out std_logic_vector(15 downto 0) -- Datos de salida del puerto B
    );   
end;

architecture Behavioral of memoria is
    -- Definición del tipo de la memoria como un array de 128 posiciones, cada una de 16 bits
    type ram_type is array (127 downto 0) of std_logic_vector (15 downto 0);
    -- Declaración de la memoria como una variable compartida
    shared variable RAM : ram_type := (
        0 => "1011001001100110", -- Inicialización de la posición 0 con un valor específico
        100 => x"0000",
        101 => x"0001",
        102 => x"0000",
        103 => x"0000",
        104 => x"0003",
        105 => x"0005",
        others => x"0000"
    );
    -- Señales para almacenar las direcciones de lectura de ambos puertos
    signal read_addra : std_logic_vector(6 downto 0);
    signal read_addrb : std_logic_vector(6 downto 0);

begin
    -- Proceso para manejar la escritura en la memoria mediante el puerto A
    process (clk)
    begin
        if (clk'event and clk = '1') then  -- Detecta un flanco de subida en la señal de reloj
            if (en = '1') then  -- Si la memoria está habilitada
                if (we = '1') then  -- Si la señal de escritura está habilitada
                    RAM(conv_integer(addra)) := di;  -- Escribe el valor en la dirección especificada por addra
                end if;
            end if;
        end if;
    end process;
    
    -- Asignación de las direcciones de lectura para ambos puertos
    read_addra <= addra;
    read_addrb <= addrb;
    
    -- Lectura de la memoria en ambos puertos
    doa <= RAM(conv_integer(read_addra));  -- Lectura del puerto A
    dob <= RAM(conv_integer(read_addrb));  -- Lectura del puerto B

end Behavioral;
