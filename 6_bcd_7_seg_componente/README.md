
# Proyecto VHDL: Decodificador BCD a 7 Segmentos

## Descripción del Proyecto

Este proyecto consiste en un **decodificador BCD a 7 segmentos** implementado en **VHDL**. El decodificador toma como entrada un número en **BCD** (código binario decimal) y controla los segmentos de un display de 7 segmentos para representar dicho número. La jerarquía del proyecto incluye dos módulos:

1. **`BCD_to_7segment.vhd`**: El componente que implementa el decodificador BCD a 7 segmentos.
2. **`base_with_BCD_to_7segment.vhd`**: El módulo principal que utiliza el componente `BCD_to_7segment` y conecta las entradas y salidas con los interruptores y LEDs de una FPGA.

### Archivos incluidos

#### 1. `BCD_to_7segment.vhd`

Este archivo define el **componente** que implementa el decodificador de **BCD a 7 segmentos**. Las entradas y salidas del decodificador son:

- **Entradas**:
  - `E3`, `E2`, `E1`, `E0`: Entradas de 1 bit cada una que representan un número en BCD (de 0 a 9).
  
- **Salidas**:
  - `a`, `b`, `c`, `d`, `e`, `f`, `g`: Salidas de 1 bit cada una que controlan los segmentos del display de 7 segmentos.

**Lógica interna**: El decodificador usa operaciones lógicas para encender o apagar cada uno de los segmentos del display en función del número BCD que recibe como entrada.

**Ejemplo de asignación**:
```vhdl
g <= (not(E1) and not(E2) and not(E3)) or (E0 and E1 and E2);
```

#### 2. `base_with_BCD_to_7segment.vhd`

Este archivo define la **entidad principal** `base`, que instancia el componente `BCD_to_7segment` y lo conecta a las entradas y salidas correspondientes de la FPGA.

- **Entradas**:
  - `G_CLOCK_50`: Señal de reloj de 50 MHz (no utilizada en este diseño).
  - `V_SW`: Vector de 10 bits que representa los interruptores de la FPGA.
  
- **Salidas**:
  - `G_LED`: Vector de 10 bits que controla los LEDs de la FPGA.
  - `G_HEX0`: Vector de 7 bits que controla los segmentos del display de 7 segmentos.

**Jerarquía**: 
- El módulo `base` utiliza el componente `BCD_to_7segment`.
- Las primeras 4 entradas de los interruptores `V_SW(3 downto 0)` se mapean a las entradas `E3`, `E2`, `E1`, `E0` del decodificador.
- Las salidas `a`, `b`, `c`, `d`, `e`, `f`, `g` del componente controlan los segmentos del display de 7 segmentos (`G_HEX0`).

**Ejemplo de asignación**:
```vhdl
G_HEX0(0) <= a;
G_HEX0(1) <= b;
G_HEX0(2) <= c;
G_HEX0(3) <= d;
G_HEX0(4) <= e;
G_HEX0(5) <= f;
G_HEX0(6) <= g;
```

### Jerarquía del Diseño

- **Entidad `base`**: La entidad principal que interactúa con los interruptores y los LEDs.
  - **Componente `BCD_to_7segment`**: Decodificador BCD a 7 segmentos.
    - **Entradas**: `E3`, `E2`, `E1`, `E0` (mapeadas desde los interruptores).
    - **Salidas**: `a`, `b`, `c`, `d`, `e`, `f`, `g` (conectadas a `G_HEX0` para controlar el display).

### Flujo del Diseño

1. Los interruptores (`V_SW(7 downto 0)`) actúan como entradas del sistema.
   - `V_SW(3 downto 0)` se usan como entradas BCD (`E3`, `E2`, `E1`, `E0`).
   - `V_SW(7 downto 4)` no se utilizan.
   
2. El decodificador **`BCD_to_7segment`** convierte los bits BCD de entrada en señales de control para los segmentos del display de 7 segmentos.
   - Cada salida `a` a `g` corresponde a un segmento del display.

3. Las salidas de los segmentos (`a`, `b`, `c`, `d`, `e`, `f`, `g`) se asignan directamente a `G_HEX0`, que controla el display de 7 segmentos en la FPGA.

4. Los LEDs (`G_LED`) simplemente reflejan el estado de los interruptores de entrada.

### Conclusión

Este proyecto implementa un decodificador BCD a 7 segmentos utilizando una arquitectura jerárquica en VHDL. El componente `BCD_to_7segment` realiza la conversión de BCD a señales de control para los segmentos del display, mientras que la entidad `base` gestiona la interacción con los interruptores y los LEDs de la FPGA.
