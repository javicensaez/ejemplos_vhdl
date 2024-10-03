# Proyecto VHDL: Sumador de 4 bits con Conversión a BCD y Visualización en Displays de 7 Segmentos

Este proyecto implementa un sistema que toma dos números de 4 bits desde los interruptores, los suma utilizando un sumador completo (full adder), convierte la suma a BCD y muestra el resultado en dos displays de 7 segmentos. El sumador de 4 bits está compuesto por cuatro full adders conectados en serie, donde el carry-out de cada sumador es el carry-in del siguiente.

## Archivos

### 1. `bin_to_bcd.vhd`
Este archivo contiene el **decodificador de binario a BCD** que convierte una entrada binaria de 5 bits en dos dígitos BCD (decenas y unidades).

- **Entradas**:
  - `bin_in`: Un número binario de 5 bits.
- **Salidas**:
  - `bcd_tens`: El valor de las decenas en formato BCD.
  - `bcd_units`: El valor de las unidades en formato BCD.

```vhdl
{files_content['bin_to_bcd .vhd']}
```

### 2. `four_bit_adder.vhd`
Este archivo contiene el **sumador de 4 bits** compuesto por cuatro full adders conectados en serie. Cada full adder suma un bit del operando `A` y un bit del operando `B`, y el acarreo de salida de un full adder se conecta al acarreo de entrada del siguiente.

- **Entradas**:
  - `A`: Primer operando de 4 bits.
  - `B`: Segundo operando de 4 bits.
- **Salidas**:
  - `SUM`: Resultado de la suma de 4 bits.
  - `COUT`: Acarreo de salida.

```vhdl
{files_content['four_bit_adder.vhd']}
```

### 3. `full_adder.vhd`
Este archivo contiene el componente **full adder** que realiza la suma de dos bits y un acarreo de entrada.

- **Entradas**:
  - `A`: Primer bit de entrada.
  - `B`: Segundo bit de entrada.
  - `CIN`: Acarreo de entrada.
- **Salidas**:
  - `SUM`: Resultado de la suma de un bit.
  - `COUT`: Acarreo de salida.

```vhdl
{files_content['full_adder.vhd']}
```

### 4. `half_adder.vhd`
Este archivo contiene el componente **half adder** que realiza la suma de dos bits.

- **Entradas**:
  - `A`: Primer bit de entrada.
  - `B`: Segundo bit de entrada.
- **Salidas**:
  - `SUM`: Resultado de la suma de un bit.
  - `CARRY`: Acarreo de salida.

```vhdl
{files_content['half_adder.vhd']}
```

### 5. `main.vhd`
Este archivo es el **módulo principal** que conecta el sumador, el decodificador binario a BCD y los displays de 7 segmentos. Los números de entrada se toman de los interruptores y se suman utilizando el sumador de 4 bits. El resultado se convierte a BCD y se muestra en los displays.

- **Entradas**:
  - `V_SW`: Interruptores de entrada (8 bits).
- **Salidas**:
  - `G_HEX0`: Display de 7 segmentos para las unidades.
  - `G_HEX2`: Display de 7 segmentos para las decenas.

```vhdl
{files_content['main.vhd']}
```

### 6. `paquete.vhd`
Este archivo contiene la declaración de los componentes usados en el diseño. Aquí se agrupan los componentes como el sumador de 4 bits, el decodificador binario a BCD, y el decodificador BCD a 7 segmentos.

```vhdl
{files_content['paquete.vhd']}
```

### 7. `bcd_to_7seg.vhd`
Este archivo contiene el **decodificador BCD a 7 segmentos** que convierte un dígito BCD en una señal que controla los segmentos del display de 7 segmentos.

- **Entradas**:
  - `bcd_in`: Número BCD de 4 bits.
- **Salidas**:
  - `seg_out`: Señal para controlar los segmentos del display de 7 segmentos.

```vhdl
{files_content['bcd_to_7seg.vhd']}
```

## Package en VHDL

En VHDL, un **package** es una forma de agrupar declaraciones comunes que pueden ser utilizadas por múltiples módulos o entidades. Un package puede contener constantes, tipos de datos, funciones, procedimientos y componentes. Los packages permiten la reutilización y una mejor organización del código en proyectos complejos.

### Ventajas de los Packages

- **Reutilización**: Los packages permiten definir funciones, tipos de datos y constantes que pueden ser reutilizados en diferentes módulos del diseño.
- **Organización**: Ayudan a mantener el código más limpio y modular, agrupando elementos relacionados.
- **Mantenibilidad**: Facilitan la actualización de valores o tipos de datos en un solo lugar.

## Conclusión

Este proyecto muestra cómo sumar dos números de 4 bits, convertir el resultado a BCD y mostrarlo en displays de 7 segmentos utilizando una arquitectura modular. El sumador de 4 bits está compuesto por full adders conectados en serie, lo que permite manejar acarreos entre ellos.
