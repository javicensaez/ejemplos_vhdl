# Proyecto VHDL: Full Adder con Entradas y Salidas

## Descripción del Proyecto

Este proyecto implementa una entidad llamada **`full_adder`** que simula un **sumador completo (full adder)**. Este sumador toma tres bits de entrada de los interruptores y genera la **suma** y el **acarreo** correspondientes. El diseño interactúa con **10 LEDs** y **4 displays de 7 segmentos**.

## Tabla de Verdad del Full Adder

| **E2** | **E1** | **E0** | **Acarreo (S1)** | **Suma (S0)** |
|--------|--------|--------|------------------|---------------|
|   0    |   0    |   0    |        0         |       0       |
|   0    |   0    |   1    |        0         |       1       |
|   0    |   1    |   0    |        0         |       1       |
|   0    |   1    |   1    |        1         |       0       |
|   1    |   0    |   0    |        0         |       1       |
|   1    |   0    |   1    |        1         |       0       |
|   1    |   1    |   0    |        1         |       0       |
|   1    |   1    |   1    |        1         |       1       |

### Archivos incluidos

#### 1. `full_adder.vhd`

Este archivo contiene la entidad **`full_adder`** que realiza la siguiente funcionalidad:

- **Entradas**:
  - `G_CLOCK_50`: Señal de reloj de 50 MHz (no utilizada en este diseño).
  - `V_SW`: Un vector de 10 bits que representa 10 interruptores. Se utilizan los bits **V_SW(2)**, **V_SW(1)** y **V_SW(0)**.
  - `V_BT`: Un vector de 4 bits que representa 4 botones.

- **Salidas**:
  - `G_LED`: Un vector de 10 bits que controla 10 LEDs. Solo se usan los **LEDs 0 y 1**.
  - `G_HEX0`, `G_HEX1`, `G_HEX2`, `G_HEX3`: Cada uno es un vector de 7 bits que controla un display de 7 segmentos.

### Descripción de la Arquitectura

#### Señales Internas
El diseño utiliza varias **señales internas** (`E2`, `E1`, `E0`, `S1`, `S0`, `xor1`, `and1`, `and2`) para manejar la lógica del sumador completo:

- `E2`, `E1`, `E0`: Señales que almacenan los valores de los interruptores **V_SW(2)**, **V_SW(1)** y **V_SW(0)**, respectivamente.
- `S1`, `S0`: Señales que representan las salidas del sumador completo (suma y acarreo).
  - `S0`: Resultado de la suma.
  - `S1`: Resultado del acarreo.

#### Funcionalidad

1. **Asignación de valores de los interruptores**:
   Los interruptores **V_SW(2)**, **V_SW(1)** y **V_SW(0)** se asignan a las señales internas **E2**, **E1** y **E0** respectivamente.

   ```vhdl
   E2 <= V_SW(2);  -- E2 toma el valor del interruptor 2
   E1 <= V_SW(1);  -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);  -- E0 toma el valor del interruptor 0
   ```

2. **Lógica combinacional del full adder**:
   La lógica combinacional se usa para calcular la **suma** y el **acarreo** de los bits de entrada:
   
   ```vhdl
   xor1 <= E1 xor E0;  -- XOR entre E1 y E0
   S0 <= xor1 xor E2;  -- Suma final de XOR entre xor1 y E2
   and1 <= E1 and E0;  -- AND entre E1 y E0
   and2 <= xor1 and E2;  -- AND entre xor1 y E2
   S1 <= and1 or and2;  -- Acarreo final usando OR entre and1 y and2
   ```

3. **Control de los LEDs**:
   - El LED 0 refleja el resultado de la suma **S0**.
   - El LED 1 refleja el resultado del acarreo **S1**.

   ```vhdl
   G_LED(0) <= S0;  -- El LED 0 muestra la suma (S0)
   G_LED(1) <= S1;  -- El LED 1 muestra el acarreo (S1)
   ```

### Jerarquía del Diseño

- **Entidad `full_adder`**:
  - Realiza un **full adder** con tres bits de entrada, proporcionando la suma y el acarreo como salidas.
  - Maneja las entradas y salidas de los interruptores y los LEDs.
  - Controla 4 displays de 7 segmentos (aunque no se utilizan en este diseño específico).

### Conclusión

Este diseño implementa un **full adder** en VHDL que simula la suma de tres bits y genera el resultado y el acarreo correspondientes. El proyecto se puede ampliar para incluir más lógica combinacional y otros elementos.
