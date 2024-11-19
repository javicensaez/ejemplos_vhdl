# Proyecto VHDL: TopCPU

El archivo `TopCPU.vhd` implementa el módulo principal de una CPU en VHDL. Este módulo integra varios componentes como registros, una ALU, una unidad de control, y una memoria, permitiendo la simulación de operaciones básicas de una CPU.

---

## Estructura del Archivo

El archivo define la entidad `TopCPU` con los siguientes puertos principales:

### Puertos de la Entidad

| Puerto        | Dirección | Ancho            | Descripción                                                                             |
|---------------|-----------|------------------|-----------------------------------------------------------------------------------------|
| `G_CLOCK_50`  | `in`      | `1 bit`          | Entrada de reloj de 50 MHz.                                                            |
| `V_SW`        | `in`      | `10 bits`        | Interruptores de entrada.                                                              |
| `V_BT`        | `in`      | `4 bits`         | Botones de entrada.                                                                    |
| `G_LED`       | `out`     | `10 bits`        | LEDs de salida para visualizar datos del bus secundario.                               |
| `G_HEX0-3`    | `out`     | `7 bits` c/u     | Displays de 7 segmentos para mostrar el estado o información relevante del sistema.    |

---


## Señales Definidas

- **`BUS_DIR_B`**: Bus de direcciones secundario, usado para seleccionar direcciones de memoria.
- **`BUS_DATOS_OUT_B`**: Bus de datos secundarios, usado para extraer datos de la memoria.
- **`estado`**: Señal que representa el estado actual de la unidad de control.

Estas señales no deben ser modificadas directamente y no forman parte de la CPU como tal. Solo son para depuracción.

## Consideraciones para los Estudiantes

### Definir señales:

- Definir todas las señales necesarias para poder unir los componentes de la CPU. Seguir el PDF proporcionado.

### Completar las Conexiones:

- Reemplazar los marcadores (`aaa`, `bbb`, etc.) con las señales específicas para cada componente.

### Verificar Señales:

- Asegurarse de que las señales de control generadas por la unidad de control (`UC1`) correspondan a las necesidades de la CPU.

### Simulación:

- Probar el diseño en un entorno de simulación para verificar que las señales interactúan correctamente y los datos se procesan como se espera.

### Debugging:

- Utilizar los LEDs (`G_LED`) y displays de 7 segmentos (`G_HEX`) para monitorear el comportamiento del sistema.

# Ampliación del Proyecto de CPU (3 Puntos)

En esta ampliación, se añaden funcionalidades de depuración utilizando los interruptores `SW9`, `SW8` y `SW7`. Estas funcionalidades permiten controlar la ejecución de la CPU de manera manual o automática, ajustar la frecuencia del reloj, y seleccionar entre la visualización de memoria o registros internos en los displays de 7 segmentos.

---

## Funcionalidades de Depuración

### SW9: Modo de Ejecución (Automático/Manual)

- **Manual (0):** La ejecución de la CPU será manual. Cada ciclo de reloj se ejecuta al pulsar un botón.
- **Automático (1):** La CPU ejecutará de forma automática, con la frecuencia seleccionada por el interruptor `SW8`.

---

### SW8: Selección de Frecuencia (Solo si SW9 = 1)

- **1:** La CPU funcionará a 50 MHz (frecuencia base del reloj).
- **0:** La CPU funcionará a 1 Hz, generando un ciclo de reloj lento para depuración.

---

### SW7: Selección de Visualización (Memoria/Registros)

- **0:** Se visualizará en los displays de 7 segmentos el contenido de la memoria.
- **1:** Se visualizará en los displays de 7 segmentos el contenido de los registros internos.

---

## Visualización de Datos

### Memoria (SW7 = 0)

- **SW6 downto SW0:** Selecciona la dirección de memoria a visualizar en los displays de 7 segmentos.

---

### Registros Internos (SW7 = 1)

- **SW6 downto SW4:** Selecciona qué registro mostrar en los displays de 7 segmentos en hexadecimal.
- Los códigos de selección son:

| **Código (SW6 downto SW4)** | **Registro Visualizado**                                 |
|-----------------------------|---------------------------------------------------------|
| `000`                       | Contenido del Registro **A**                            |
| `001`                       | Contenido del Registro **B**                            |
| `010`                       | Contenido del Registro de Instrucciones (**IR**)        |
| `011`                       | Contenido del Registro del Contador de Programa (**PC**)|
| `100`                       | Salida del **Multiplexor**                              |
| `101`                       | Salida de la **ALU**                                    |
| `110`                       | Estado de la Unidad de Control                          |

---

## Instrucciones para Implementación

1. **Modo de Ejecución:**
   - Utilizar `SW9` para determinar si la CPU debe funcionar en modo manual o automático.
   - En modo manual, que cada ciclo se ejecute al pulsar un boton.
   - Implementar un generador de frecuencia para proporcionar una señal de 1 Hz cuando `SW8 = 0`.

2. **Visualización de Datos:**
   - Usar un multiplexor para seleccionar entre los datos de memoria y los registros internos según el valor de `SW7`.
   - Asignar los registros internos a las opciones especificadas en la tabla.

3. **Depuración:**
   - Asegurar que los datos seleccionados por los interruptores se muestran correctamente en los displays de 7 segmentos.

---

¡Esta ampliación proporciona un entorno robusto para depurar y visualizar el comportamiento de la CPU en tiempo real!
