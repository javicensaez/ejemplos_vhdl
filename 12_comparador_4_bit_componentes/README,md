# Proyecto VHDL: Comparador de 4 bits utilizando Puertas Lógicas

Este proyecto implementa un **comparador de 4 bits** utilizando componentes y puertas lógicas. El diseño compara dos números de 4 bits, divididos en **parte alta** (bits más significativos) y **parte baja** (bits menos significativos), y determina si un número es mayor, menor o igual que el otro. La salida se visualiza en 3 LEDs.

## Descripción del Proyecto

El proyecto se compone de un comparador de 2 bits, instanciado dos veces: una para comparar la **parte alta** y otra para la **parte baja** de los números de entrada. La lógica adicional asegura que si las partes altas de los números son iguales, se comparen las partes bajas para determinar el resultado final.

### Entradas

- **V_SW (std_logic_vector(9 downto 0))**: Este vector de 10 bits representa los interruptores. Los bits 8 y 7 corresponden a la parte alta de `A`, los bits 6 y 5 a la parte baja de `A`. Los bits 3 y 2 corresponden a la parte alta de `B`, y los bits 1 y 0 a la parte baja de `B`.

### Salidas

- **G_LED (std_logic_vector(2 downto 0))**: Tres LEDs que indican el resultado de la comparación:
  - **G_LED(0)**: Se enciende si `A` es menor que `B`.
  - **G_LED(1)**: Se enciende si `A` es igual a `B`.
  - **G_LED(2)**: Se enciende si `A` es mayor que `B`.

## Arquitectura

### 1. División de los Datos en Parte Alta y Parte Baja

El vector de entrada `V_SW` se divide en señales internas para la parte alta y parte baja de los números `A` y `B`.

```vhdl
A_high <= V_SW(8 downto 7);
A_low  <= V_SW(6 downto 5);
B_high <= V_SW(3 downto 2);
B_low  <= V_SW(1 downto 0);
```

### 2. Comparación de las Partes Bajas y Altas

Se instancian dos comparadores de 2 bits. El primero compara las **partes bajas** de `A` y `B`, y el segundo compara las **partes altas**.

```vhdl
-- Comparar las partes bajas
u1: comparator_2bit port map (A_low, B_low, greater_low, equal_low, less_low);

-- Comparar las partes altas
u2: comparator_2bit port map (A_high, B_high, greater_high, equal_high, less_high);
```

### 3. Lógica de Comparación

El resultado final de la comparación se obtiene combinando los resultados de las partes altas y bajas mediante puertas lógicas. Si las partes altas son iguales, se comparan las partes bajas para determinar si un número es mayor, menor o igual al otro.

```vhdl
-- A > B si la parte alta es mayor o si la parte alta es igual y la parte baja es mayor
G_LED(2) <= greater_high or (equal_high and greater_low);

-- A < B si la parte alta es menor o si la parte alta es igual y la parte baja es menor
G_LED(0) <= less_high or (equal_high and less_low);

-- A = B si la parte alta y la parte baja son iguales
G_LED(1) <= equal_high and equal_low;
```

## Conclusión

Este proyecto muestra cómo dividir y comparar números de 4 bits en dos partes, utilizando componentes y lógica combinacional. El diseño modular facilita la reutilización y mejora la organización del código. La combinación de puertas lógicas asegura que los resultados de la comparación sean precisos y se reflejen correctamente en los LEDs.

