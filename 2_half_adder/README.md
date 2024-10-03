# Proyecto VHDL: Half Adder con Entradas y Salidas

## Descripción del Proyecto

Este proyecto implementa una entidad llamada **`half_adder`** que simula un **sumador de 1 bit (half adder)**. Este sumador toma como entradas dos bits de los interruptores y genera la **suma** y el **acarreo** correspondientes. Además, el proyecto incluye lógica básica para interactuar con **10 LEDs** y **4 displays de 7 segmentos**.

## Tabla de Verdad del Half Adder

| **E1** | **E0** | **Acarreo (S1)** | **Suma (S0)** |
|--------|--------|------------------|---------------|
|   0    |   0    |        0         |       0       |
|   0    |   1    |        0         |       1       |
|   1    |   0    |        0         |       1       |
|   1    |   1    |        1         |       0       |


### Archivos incluidos

#### 1. `half_adder.vhd`

Este archivo contiene la entidad **`half_adder`** que realiza la siguiente funcionalidad:

- **Entradas**:
  - `G_CLOCK_50`: Señal de reloj de 50 MHz (no utilizada en este diseño).
  - `V_SW`: Un vector de 10 bits que representa 10 interruptores. Se utilizan los bits **V_SW(1)** y **V_SW(0)**.
  - `V_BT`: Un vector de 4 bits que representa 4 botones.

- **Salidas**:
  - `G_LED`: Un vector de 10 bits que controla 10 LEDs. Solo se usan los **LEDs 0 y 1**.
  - `G_HEX0`, `G_HEX1`, `G_HEX2`, `G_HEX3`: Cada uno es un vector de 7 bits que controla un display de 7 segmentos.

### Descripción de la Arquitectura

#### Señales Internas
El diseño utiliza algunas **señales internas** (`E1`, `E0`, `S1`, `S0`, `xor1`, `and1`) para manejar la lógica del sumador de 1 bit:

- `E1`, `E0`: Señales que almacenan los valores de los interruptores **V_SW(1)** y **V_SW(0)**, respectivamente.
- `S1`, `S0`: Señales que representan la salida del half adder.
  - `S0`: Resultado de la suma de **E1 XOR E0**.
  - `S1`: Resultado del acarreo de **E1 AND E0**.

#### Funcionalidad

1. **Asignación de valores de los interruptores**:
   Los interruptores **V_SW(1)** y **V_SW(0)** se asignan a las señales internas **E1** y **E0** respectivamente.

   ```vhdl
   E1 <= V_SW(1);  -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);  -- E0 toma el valor del interruptor 0
   ```

2. **Lógica combinacional del half adder**:
   La lógica combinacional se usa para calcular la **suma** y el **acarreo** a partir de los bits **E1** y **E0**.
   
   ```vhdl
   S0 <= E1 xor E0;  -- S0 es la suma de E1 y E0 (XOR)
   S1 <= E1 and E0;  -- S1 es el acarreo entre E1 y E0 (AND)
   ```

3. **Control de los LEDs**:
   - El LED 0 refleja el resultado de la suma **S0**.
   - El LED 1 refleja el resultado del acarreo **S1**.

   ```vhdl
   G_LED(0) <= S0;  -- El LED 0 muestra la suma (S0)
   G_LED(1) <= S1;  -- El LED 1 muestra el acarreo (S1)
   ```

### Jerarquía del Diseño

- **Entidad `half_adder`**:
  - Realiza un **half adder** con dos bits de entrada, proporcionando la suma y el acarreo como salidas.
  - Maneja las entradas y salidas de los interruptores y los LEDs.
  - Controla 4 displays de 7 segmentos (aunque no se utilizan en este diseño específico).

### Conclusión

Este diseño implementa un **half adder** en VHDL que simula la suma de dos bits y genera el resultado y el acarreo correspondientes. El proyecto se puede ampliar para incluir más lógica combinacional y otros elementos.
