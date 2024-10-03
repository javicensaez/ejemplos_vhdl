# Proyecto VHDL: Decodificador BCD a 7 Segmentos con 2 Instancias

## Descripción del Proyecto

Este proyecto implementa un decodificador **BCD a 7 segmentos** utilizando dos instancias de un componente que toma como entrada un vector BCD de 4 bits y controla un display de 7 segmentos a través de un vector de 7 bits que representa los segmentos (`a` a `g`). 

El sistema utiliza **10 interruptores** y **10 LEDs**:
- **Interruptores del 3 al 0** controlan el primer display de 7 segmentos (**G_HEX0**).
- **Interruptores del 8 al 5** controlan el segundo display de 7 segmentos (**G_HEX1**).

### Archivos incluidos

#### 1. `BCD_to_7segment_vector.vhd`

Este archivo define el **componente** que convierte un valor en BCD (de 4 bits) en el control de los 7 segmentos del display. El decodificador genera un vector de salida de 7 bits, donde cada bit controla un segmento específico (`a` a `g`) del display.

- **Entradas**:
  - `bcd_in`: Un vector de 4 bits que representa un valor en BCD.
  
- **Salidas**:
  - `seg_out`: Un vector de 7 bits que controla los segmentos del display de 7 segmentos (`a`, `b`, `c`, `d`, `e`, `f`, `g`).

**Lógica interna**:
El decodificador convierte el valor BCD en la salida correspondiente para los segmentos del display, utilizando una estructura `case` para manejar los números del 0 al 9.

**Ejemplo de asignación**:
```vhdl
process(bcd_in)
begin
    case bcd_in is
        when "0000" => seg_out <= "0000001"; -- 0
        when "0001" => seg_out <= "1001111"; -- 1
        when others => seg_out <= "1111111"; -- Deshabilitar segmentos
    end case;
end process;
```

#### 2. `base_with_2_instances_vector.vhd`

Este archivo define la **entidad principal** `base`, que utiliza dos instancias del componente **BCD_to_7segment_vector** para decodificar dos valores BCD distintos, provenientes de los interruptores, y mostrarlos en dos displays de 7 segmentos.

- **Entradas**:
  - `G_CLOCK_50`: Señal de reloj de 50 MHz (no utilizada en este diseño).
  - `V_SW`: Un vector de 10 bits que representa los interruptores de la FPGA.
  
- **Salidas**:
  - `G_LED`: Un vector de 10 bits que controla los LEDs de la FPGA.
  - `G_HEX0`: Un vector de 7 bits que controla el primer display de 7 segmentos.
  - `G_HEX1`: Un vector de 7 bits que controla el segundo display de 7 segmentos.

**Jerarquía**:
- El módulo `base` utiliza dos instancias del componente **BCD_to_7segment_vector**.
- La primera instancia decodifica los bits **V_SW(3 downto 0)** para controlar **G_HEX0**.
- La segunda instancia decodifica los bits **V_SW(8 downto 5)** para controlar **G_HEX1**.

**Ejemplo de instanciación**:
```vhdl
u0: BCD_to_7segment_vector Port map (bcd_in0, hex0_out);
u1: BCD_to_7segment_vector Port map (bcd_in1, hex1_out);
```

### Flujo del Diseño

1. Los interruptores (`V_SW(9 downto 0)`) actúan como entradas del sistema:
   - `V_SW(3 downto 0)` se usan como entrada BCD para la primera instancia del decodificador, la cual controla **G_HEX0**.
   - `V_SW(8 downto 5)` se usan como entrada BCD para la segunda instancia del decodificador, la cual controla **G_HEX1**.

2. Cada instancia del componente **BCD_to_7segment_vector** convierte los valores BCD de los interruptores en señales que controlan los segmentos del display de 7 segmentos.

3. Los LEDs (`G_LED`) reflejan directamente los valores de los interruptores.

### Jerarquía del Diseño

- **Entidad `base`**:
  - **Instancia 1 (u0)**: Decodifica `V_SW(3 downto 0)` y controla el primer display (`G_HEX0`).
  - **Instancia 2 (u1)**: Decodifica `V_SW(8 downto 5)` y controla el segundo display (`G_HEX1`).

### Conclusión

Este proyecto implementa un decodificador BCD a 7 segmentos utilizando una arquitectura modular en **VHDL**. Se hace uso de dos instancias de un componente decodificador para controlar dos displays de 7 segmentos, cada uno representando un valor BCD diferente basado en los interruptores de la FPGA.


