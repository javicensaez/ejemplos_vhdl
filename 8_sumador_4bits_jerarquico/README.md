# Proyecto VHDL: Sumador de 4 Bits utilizando Full Adder y Half Adder

## Descripción del Proyecto

Este proyecto implementa un **sumador de 4 bits** que utiliza instancias de **full adders**. A su vez, los **full adders** están construidos utilizando **half adders**. Los operandos de 4 bits se introducen a través de los interruptores, y el resultado de la suma se visualiza en los LEDs.

### Archivos VHDL

#### 1. `half_adder.vhd`

Este archivo define el **half adder**, que toma dos bits de entrada (`A` y `B`) y calcula la **suma** (`SUM`) y el **acarreo** (`CARRY`). 

- **Entradas**:
  - `A`: Primer bit de entrada.
  - `B`: Segundo bit de entrada.
  
- **Salidas**:
  - `SUM`: Resultado de la suma de `A` y `B`.
  - `CARRY`: Acarreo resultante de la operación.

```vhdl
SUM <= A xor B;
CARRY <= A and B;
```

#### 2. `full_adder.vhd`

Este archivo define el **full adder**, que extiende el **half adder** para sumar tres bits: `A`, `B`, y un bit de acarreo de entrada (`CIN`). El full adder se implementa utilizando dos instancias de **half adders**.

- **Entradas**:
  - `A`: Primer bit de entrada.
  - `B`: Segundo bit de entrada.
  - `CIN`: Acarreo de entrada.

- **Salidas**:
  - `SUM`: Resultado de la suma de `A`, `B`, y `CIN`.
  - `COUT`: Acarreo resultante de la operación.

```vhdl
COUT <= carry1 or carry2;  -- Acarreo de salida del full adder
```

#### 3. `four_bit_adder.vhd`

Este archivo define el **sumador de 4 bits**, que utiliza 4 instancias del **full adder** para realizar la suma de dos operandos de 4 bits. 

- **Entradas**:
  - `V_SW(3 downto 0)`: Primer operando (4 bits) ingresado a través de los interruptores.
  - `V_SW(8 downto 5)`: Segundo operando (4 bits) ingresado a través de los interruptores.

- **Salidas**:
  - `G_LED(3 downto 0)`: Resultado de la suma de los dos operandos (4 bits).
  - `G_LED(4)`: Acarreo final resultante de la operación de suma.

**Asignación de Señales**:
En el archivo `four_bit_adder.vhd`, las señales se asignan de manera que cada bit de los operandos se asocie con un **full adder** correspondiente. Los bits del primer operando se almacenan en las señales `a3-a0` y los bits del segundo operando se almacenan en `b3-b0`.

```vhdl
a3 <= V_SW(3); a2 <= V_SW(2); a1 <= V_SW(1); a0 <= V_SW(0);  -- Primer operando
b3 <= V_SW(8); b2 <= V_SW(7); b1 <= V_SW(6); b0 <= V_SW(5);  -- Segundo operando
```

Cada instancia del **full adder** suma un par de bits, y el acarreo se pasa al siguiente **full adder**. Además, las salidas de cada **full adder** (los bits de suma) se asignan a las señales `s3-s0`, que se concatenan utilizando el operador `&` y se asignan a los LEDs.

```vhdl
G_LED(3 downto 0) <= s3 & s2 & s1 & s0;  -- Concatenación de las señales s3-s0
```

**Explicación de la Concatenación**:
El operador `&` en VHDL se utiliza para **concatenar** bits o vectores de bits. En este caso, las señales `s3`, `s2`, `s1`, y `s0` representan los bits de suma, y son concatenadas para formar un vector de 4 bits que se asigna a los LEDs del 0 al 3 (`G_LED(3 downto 0)`).

Finalmente, el acarreo final (`carry3`) se asigna al LED 4.

```vhdl
G_LED(4) <= carry3;  -- Último acarreo asignado al LED 4
```

### Jerarquía del Diseño

1. **Entidad `half_adder`**: Realiza la suma de dos bits, proporcionando la suma y el acarreo.
2. **Entidad `full_adder`**: Suma tres bits (dos operandos y un acarreo), utilizando dos instancias del `half_adder`.
3. **Entidad `four_bit_adder`**: Suma dos operandos de 4 bits, utilizando cuatro instancias del `full_adder`.

### Conclusión

Este proyecto demuestra cómo se pueden construir sumadores de mayor tamaño reutilizando c