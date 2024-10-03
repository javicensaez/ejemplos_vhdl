# Proyecto VHDL: Sumador de 4 bits con Conversión a BCD y Visualización en Displays de 7 Segmentos

Este proyecto implementa un sistema que toma dos números de 4 bits desde los interruptores, los suma utilizando procesos con el tipo de dato `integer`, convierte el resultado a BCD y lo muestra en dos displays de 7 segmentos (uno para las unidades y otro para las decenas).

## Descripción del Proyecto

Este sistema está implementado en un único archivo VHDL que no utiliza componentes externos. La suma de los dos números se realiza directamente en un proceso, y la conversión del resultado a BCD se realiza en un proceso separado. Los valores BCD obtenidos se decodifican para controlar los segmentos de dos displays de 7 segmentos.

### Entradas

- **V_SW (std_logic_vector(8 downto 0))**: Este vector de 9 bits representa los interruptores. Los bits 8 a 5 corresponden al operando `A` y los bits 3 a 0 corresponden al operando `B`.

### Salidas

- **G_HEX0 (std_logic_vector(6 downto 0))**: Esta señal controla el display de 7 segmentos que muestra las unidades del resultado.
- **G_HEX1 (std_logic_vector(6 downto 0))**: Esta señal controla el display de 7 segmentos que muestra las decenas del resultado.

## Arquitectura

### 1. Suma de los dos operandos

El proceso que realiza la suma toma los operandos `A` y `B` desde los bits correspondientes de `V_SW` y los convierte a integers utilizando `to_integer()` para realizar la operación aritmética.

```vhdl
process(A, B)
begin
    -- Convertir los operandos A y B a integers y realizar la suma
    sum <= to_integer(unsigned(A)) + to_integer(unsigned(B));
end process;
```

### 2. Conversión de la suma a BCD

Un proceso separado convierte el resultado de la suma, que es un número entero, a su representación en BCD. El número entero se divide por 10 para obtener las decenas y se toma el resto de la división (módulo) para obtener las unidades.

```vhdl
process(sum)
begin
    bcd_tens <= std_logic_vector(to_unsigned(sum / 10, 4));  -- Decenas
    bcd_units <= std_logic_vector(to_unsigned(sum mod 10, 4)); -- Unidades
end process;
```

### 3. Decodificación de los dígitos BCD a señales para los displays de 7 segmentos

Hay dos procesos adicionales que convierten los valores BCD de las unidades y decenas en señales que controlan los displays de 7 segmentos. Cada segmento del display está controlado por un bit de `G_HEX0` o `G_HEX1`.

```vhdl
process(bcd_units)
begin
    case bcd_units is
        when "0000" => G_HEX0 <= "1000000"; -- 0
        when "0001" => G_HEX0 <= "1111001"; -- 1
        when "0010" => G_HEX0 <= "0100100"; -- 2
        when "0011" => G_HEX0 <= "0110000"; -- 3
        when "0100" => G_HEX0 <= "0011001"; -- 4
        when others => G_HEX0 <= "1111111"; -- Apagar todos los segmentos
    end case;
end process;
```

## Ventajas del Diseño

- **Eficiencia**: La suma de los operandos se realiza directamente con el tipo `integer`, lo que simplifica el manejo aritmético de los números.
- **Modularidad**: Aunque no se utilizan componentes externos, el diseño se organiza en procesos separados, lo que facilita su comprensión y mantenimiento.
- **Visualización**: Los valores de la suma se muestran claramente en dos displays de 7 segmentos.

## Conclusión

Este archivo VHDL demuestra cómo realizar la suma de dos números de 4 bits, convertir el resultado a BCD y mostrarlo en displays de 7 segmentos, todo ello sin utilizar componentes externos y con un enfoque de procesos e integers.
