# Proyecto VHDL: Decodificación Binaria y Visualización en 7 Segmentos

Este proyecto implementa un sistema que toma una entrada binaria de 5 bits, la convierte a BCD y luego la muestra en un display de 7 segmentos utilizando componentes modulares en VHDL.

## Archivos

### 1. `bin_to_bcd.vhd`
Este archivo contiene el módulo que convierte un número binario de 5 bits a su representación en BCD (Binary Coded Decimal).

- **Entradas**:
  - `bin_in`: Un número binario de 5 bits.
- **Salidas**:
  - `bcd_tens`: El valor de las decenas en formato BCD.
  - `bcd_units`: El valor de las unidades en formato BCD.

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entidad del decodificador binario a BCD
entity bin_to_bcd is
    port (
        bin_in : in std_logic_vector(4 downto 0);  -- Entrada binaria de 5 bits
        bcd_tens : out std_logic_vector(3 downto 0); -- Salida BCD para las decenas
        bcd_units : out std_logic_vector(3 downto 0) -- Salida BCD para las unidades
    );
end bin_to_bcd;

-- Arquitectura del decodificador
architecture combinational of bin_to_bcd is
    signal binary : unsigned(4 downto 0);    -- Número binario en formato unsigned
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

        -- Comenzar la conversión
        if binary_integer >= 10 then
            decenas <= "0001";            -- Si el número es mayor o igual a 10, hay una decena
            unidades <= to_unsigned(binary_integer - 10, 4); -- Restar 10 para obtener las unidades
        else
            unidades <= to_unsigned(binary_integer, 4);      -- Asignar el valor binario a las unidades
        end if;
    end process;

    -- Asignar las señales internas a las salidas BCD
    bcd_tens <= std_logic_vector(decenas);   -- Salida de las decenas en BCD
    bcd_units <= std_logic_vector(unidades); -- Salida de las unidades en BCD
end combinational;

```

### 2. `bcd_to_7seg.vhd`
Este módulo convierte un número BCD de 4 bits a una señal de control para un display de 7 segmentos.

- **Entradas**:
  - `bcd_in`: Un número BCD de 4 bits.
- **Salidas**:
  - `seg_out`: Una señal de 7 bits que controla los segmentos del display (g, f, e, d, c, b, a).

```vhdl

library ieee;
use ieee.std_logic_1164.all;

-- Entidad del decodificador BCD a 7 segmentos
entity bcd_to_7seg is
    port (
        bcd_in : in std_logic_vector(3 downto 0);  -- Entrada BCD (4 bits)
        seg_out : out std_logic_vector(6 downto 0) -- Salida para los 7 segmentos (a, b, c, d, e, f, g)
    );
end bcd_to_7seg;

-- Arquitectura del decodificador
architecture rtl of bcd_to_7seg is
begin
    process(bcd_in)
    begin
        case bcd_in is
            when "0000" => seg_out <= "1000000"; -- 0
            when "0001" => seg_out <= "1111001"; -- 1
            when "0010" => seg_out <= "0100100"; -- 2
            when "0011" => seg_out <= "0110000"; -- 3
            when "0100" => seg_out <= "0011001"; -- 4
            when "0101" => seg_out <= "0010010"; -- 5
            when "0110" => seg_out <= "0000010"; -- 6
            when "0111" => seg_out <= "1111000"; -- 7
            when "1000" => seg_out <= "0000000"; -- 8
            when "1001" => seg_out <= "0010000"; -- 9
            when others => seg_out <= "1111111"; -- Deshabilitar segmentos
        end case;
    end process;
end rtl;

```

### 3. `main.vhd`
Este es el módulo principal que interconecta los módulos anteriores. Toma una entrada binaria de 5 bits desde los interruptores, la convierte a BCD utilizando el módulo `bin_to_bcd`, y luego muestra los valores de decenas y unidades en dos displays de 7 segmentos utilizando el módulo `bcd_to_7seg`.

```vhdl

library ieee;
use ieee.std_logic_1164.all;

-- Entidad principal que conecta los interruptores, decodificador y displays de 7 segmentos
entity main is
    port (
        V_SW : in std_logic_vector(4 downto 0);  -- Interruptores de entrada (binario de 5 bits)
        G_HEX0 : out std_logic_vector(6 downto 0);  -- Salida para el primer display de 7 segmentos
        G_HEX1 : out std_logic_vector(6 downto 0)   -- Salida para el segundo display de 7 segmentos
    );
end main;

-- Arquitectura de la entidad principal
architecture rtl of main is
    -- Declaración de componentes
    component bin_to_bcd
        port (
            bin_in : in std_logic_vector(4 downto 0);
            bcd_tens : out std_logic_vector(3 downto 0);
            bcd_units : out std_logic_vector(3 downto 0)
        );
    end component;

    component bcd_to_7seg
        port (
            bcd_in : in std_logic_vector(3 downto 0);
            seg_out : out std_logic_vector(6 downto 0)
        );
    end component;

    -- Señales internas para las decenas y unidades
    signal bcd_tens, bcd_units : std_logic_vector(3 downto 0);

begin
    -- Instanciar el decodificador binario a BCD
    bin_to_bcd_inst : bin_to_bcd
        port map (
            bin_in => V_SW,
            bcd_tens => bcd_tens,
            bcd_units => bcd_units
        );

    -- Instanciar el decodificador BCD a 7 segmentos para el primer dígito (unidades)
    bcd_to_7seg_inst0 : bcd_to_7seg
        port map (
            bcd_in => bcd_units,
            seg_out => G_HEX0
        );

    -- Instanciar el decodificador BCD a 7 segmentos para el segundo dígito (decenas)
    bcd_to_7seg_inst1 : bcd_to_7seg
        port map (
            bcd_in => bcd_tens,
            seg_out => G_HEX1
        );

end rtl;

```

## Unsigned e Integer en VHDL

En VHDL, hay varios tipos de datos que se pueden utilizar para representar números. Dos de los más comunes son **unsigned** e **integer**.

### **Unsigned**
- Es un vector de bits que representa un número entero positivo (sin signo).
- Se define como `unsigned(n downto 0)`, donde `n` es el número de bits.
- Los bits se pueden manipular individualmente y el número se puede interpretar como binario.

#### Ejemplo de conversión de binario a `unsigned`:
```vhdl
signal bin_in : std_logic_vector(4 downto 0);  -- Entrada binaria de 5 bits
signal bin_unsigned : unsigned(4 downto 0);

bin_unsigned <= unsigned(bin_in);  -- Conversión de binario a unsigned
```

### **Integer**
- Representa un número entero (positivo o negativo) en formato decimal.
- En lugar de usar vectores de bits, se utiliza directamente para cálculos numéricos.

#### Ejemplo de conversión de `unsigned` a `integer`:
```vhdl
signal bin_unsigned : unsigned(4 downto 0);
signal bin_integer : integer;

bin_integer <= to_integer(bin_unsigned);  -- Conversión de unsigned a integer
```

### Conversión de Integer a Unsigned:
Si necesitas volver de un número entero a un formato de bits, puedes usar la función `to_unsigned`:
```vhdl
bin_unsigned <= to_unsigned(bin_integer, 5);  -- Conversión de integer a unsigned (5 bits)
```

## Conclusión

Este proyecto muestra cómo trabajar con números binarios, convertirlos a BCD y mostrarlos en un display de 7 segmentos en un sistema modular de VHDL. Además, cubre los conceptos de tipos de datos como `unsigned` e `integer`, y cómo convertir entre ellos en VHDL.
