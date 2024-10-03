
# Proyecto VHDL: Prueba con Entradas y Salidas

## Descripción del Proyecto

Este proyecto implementa una entidad llamada **`prueba`** que interactúa con 10 interruptores (**V_SW**) y 4 botones (**V_BT**) para controlar **10 LEDs** y **4 displays de 7 segmentos**. El código incluye una lógica básica para manejar estas entradas y salidas.

### Archivos incluidos

#### 1. `prueba.vhd`

Este archivo contiene la entidad **`prueba`** que realiza la siguiente funcionalidad:

- **Entradas**:
  - `G_CLOCK_50`: Señal de reloj de 50 MHz.
  - `V_SW`: Un vector de 10 bits que representa 10 interruptores.
  - `V_BT`: Un vector de 4 bits que representa 4 botones.

- **Salidas**:
  - `G_LED`: Un vector de 10 bits que controla 10 LEDs.
  - `G_HEX0`, `G_HEX1`, `G_HEX2`, `G_HEX3`: Cada uno es un vector de 7 bits que controla un display de 7 segmentos.

### Descripción de la Arquitectura

#### Señales Internas
El diseño utiliza algunas **señales internas** (`E2`, `E1`, `E0`, `S1`, `S0`) que almacenan temporalmente los valores de las entradas:

- `E2`, `E1`, `E0`: Son señales internas que almacenan los valores de los interruptores **V_SW(2)**, **V_SW(1)**, y **V_SW(0)**, respectivamente.
- `S1`, `S0`: Señales internas que se utilizan para controlar los LEDs.

#### Funcionalidad

1. **Asignación de valores de los interruptores**:
   Los interruptores **V_SW(2 downto 0)** son asignados a las señales internas **E2**, **E1**, y **E0** respectivamente.

   ```vhdl
   E2 <= V_SW(2);  -- E2 toma el valor del interruptor 2
   E1 <= V_SW(1);  -- E1 toma el valor del interruptor 1
   E0 <= V_SW(0);  -- E0 toma el valor del interruptor 0
   ```

2. **Control de los LEDs**:
   - Los LEDs 0 y 1 se controlan mediante las señales internas **S0** y **S1**, respectivamente.
   
   ```vhdl
   G_LED(0) <= S0;  -- El LED 0 toma el valor de la señal S0
   G_LED(1) <= S1;  -- El LED 1 toma el valor de la señal S1
   ```

### Jerarquía del Diseño

- **Entidad `prueba`**: 
  - Maneja las entradas de 10 interruptores y 4 botones.
  - Controla las salidas para 10 LEDs y 4 displays de 7 segmentos.
  - Utiliza señales internas para almacenar temporalmente los valores de los interruptores y controlar las salidas.

### Funciones Pendientes

El código incluye una estructura para la **lógica combinacional**, pero aún no está implementada. Esto se puede extender para aplicar cualquier lógica específica que involucre los interruptores y los botones.

### Conclusión

Este diseño ofrece una base sencilla para manejar múltiples entradas y salidas en una FPGA. Se puede ampliar fácilmente para implementar lógica combinacional más compleja según las necesidades del proyecto.