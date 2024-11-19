# Unidad de Control y Top Unidad de Control

Este proyecto implementa una **Unidad de Control** en VHDL que gestiona señales de control para una CPU, y un **Top Unidad de Control** que permite probar la funcionalidad de la unidad de control utilizando interruptores y LEDs.

---

## Archivos del Proyecto

### 1. `unidadControl.vhd`

La **Unidad de Control** es una máquina de estados finita (FSM) que genera las señales de control necesarias en función del estado actual, el código de operación (`OP`), y el estado del flag `Z` de la instrucción anterior.

#### Puertos de la entidad `unidadControl`:

| Puerto       | Dirección | Ancho            | Descripción                                                   |
|--------------|-----------|------------------|---------------------------------------------------------------|
| `clk`        | `in`      | `1 bit`          | Señal de reloj.                                               |
| `OP`         | `in`      | `2 bits`         | Código de operación.                                          |
| `registro_fz`| `in`      | `1 bit`          | Flag Z de la instrucción anterior.                           |
| `sel_dir`    | `out`     | `2 bits`         | Selección de dirección para las operaciones.                 |
| `r_w`        | `out`     | `1 bit`          | Señal de lectura/escritura.                                   |
| `carga_ri`   | `out`     | `1 bit`          | Señal para cargar el registro de instrucciones.              |
| `carga_rpc`  | `out`     | `1 bit`          | Señal para cargar el registro del contador de programa.       |
| `codigo_alu` | `out`     | `2 bits`         | Código de operación para la ALU.                             |
| `carga_ra`   | `out`     | `1 bit`          | Señal para cargar el registro A.                             |
| `carga_rb`   | `out`     | `1 bit`          | Señal para cargar el registro B.                             |
| `carga_rfz`  | `out`     | `1 bit`          | Señal para cargar el registro de flags.                      |
| `rst`        | `in`      | `1 bit`          | Señal de reinicio.                                            |

#### Máquina de Estados Finita (FSM)

La FSM tiene 8 estados (`"000"` a `"111"`) que se utilizan para generar las señales de control. Cada estado se define en un proceso, y las transiciones de estado están condicionadas por las entradas `OP` y `registro_fz`.

---

### 2. `top_unidadControl.vhd`

El módulo **Top Unidad de Control** es un entorno de prueba que utiliza la `unidadControl` como componente. Permite controlar la unidad mediante interruptores (`V_SW`) y visualizar las señales de control generadas en LEDs (`G_LED`) y displays de 7 segmentos (`G_HEX`).

#### Puertos de la entidad `top_unidadControl`:

| Puerto   | Dirección | Ancho            | Descripción                                   |
|----------|-----------|------------------|-----------------------------------------------|
| `G_CLOCK_50` | `in` | `1 bit`         | Entrada de reloj a 50 MHz.                   |
| `V_SW`       | `in` | `10 bits`       | Interruptores de entrada.                    |
| `V_BT`       | `in` | `4 bits`        | Botones de entrada.                          |
| `G_LED`      | `out`| `10 bits`       | Salidas LED para visualizar señales.         |
| `G_HEX0-3`   | `out`| `7 bits` cada uno | Displays de 7 segmentos para mostrar estados.|

#### Uso de `unidadControl` como Componente

El archivo `top_unidadControl` instancia el componente `unidadControl` y mapea sus señales de entrada y salida a los interruptores, botones y LEDs:

```vhdl
unidadControl_inst: unidadControl port map(
    clk => reloj,
    OP => OP,
    registro_fz => registro_fz,
    sel_dir => sel_dir,
    r_w => r_w,
    carga_ri => carga_ri,
    carga_rpc => carga_rpc,
    codigo_alu => codigo_alu,
    carga_ra => carga_ra,
    carga_rb => carga_rb,
    carga_rfz => carga_rfz,
    rst => rst,
    estado => estado
);

## Asignaciones Específicas

### Interruptores (`V_SW`):

- `V_SW(1 downto 0)`: Código de operación (`OP`).
- `V_SW(2)`: Flag Z (`registro_fz`).
- `V_SW(4)`: Señal de reset (`rst`).

### LEDs (`G_LED`):

- Mapean las señales de control como `sel_dir`, `r_w`, `carga_ri`, etc.
- Ejemplo: `G_LED(1 downto 0) <= sel_dir;`

### Displays de 7 Segmentos (`G_HEX`):

- Muestran el estado actual de la FSM en formato decimal.

## Conceptos Clave

### FSM:

- Utiliza estados para definir qué señales de control deben estar activas en cada paso.
- Se implementa con un proceso en VHDL que utiliza un `case` para definir las transiciones y señales.

### Componentes:

- `unidadControl` se utiliza como un bloque modular dentro del `top_unidadControl`.

### Displays de 7 Segmentos:

- Los estados de la FSM se convierten en valores para activar segmentos específicos.

---

## Cómo Probar el Proyecto

### Entradas:

- Usa los interruptores (`V_SW`) para definir las instrucciones (`OP`) y el flag `Z`.
- Usa un botón para el reloj (`V_BT(0)`).

### Salidas:

- Observa los LEDs (`G_LED`) para verificar las señales generadas.
- Observa los displays de 7 segmentos para comprobar el estado actual.

## Modificaciones Requeridas en `unidadControl.vhd`

El archivo `unidadControl.vhd` proporciona una plantilla base para implementar una Unidad de Control mediante una máquina de estados finita (FSM). El objetivo es completar las señales y transiciones según las especificaciones del diseño.

### Elementos a Completar:

1. **Estados Iniciales y Transiciones:**
   - Actualmente, el estado inicial y las transiciones contienen valores de marcador `"XXX"`.
   - Los alumnos deben definir correctamente las transiciones entre estados basándose en los valores de entrada (`OP` y `registro_fz`).
   - Ejemplo:
     ```vhdl
     if rst = '1' then
         estado_uc <= "000"; -- Estado inicial de la FSM
     else
         case estado_uc is
             when "000" => estado_uc <= "001"; -- Definir transición específica
     ```

2. **Códigos de Operación (`OP`):**
   - El código de operación (`OP`) controla las acciones de la Unidad de Control.
   - Los alumnos deben identificar qué valores de `OP` corresponden a las instrucciones `MOV`, `ADD`, `CMP`, y `BEQ`, y definir las transiciones y salidas correspondientes.

3. **Salidas de Control:**
   - Todas las salidas (`sel_dir`, `r_w`, `carga_ri`, `carga_rpc`, `codigo_alu`, etc.) están actualmente configuradas como `"XX"` o `'X'`.
   - Los alumnos deben asignar los valores correctos a estas señales en cada estado según el diseño del procesador.
   - Ejemplo:
     ```vhdl
     when "001" =>
         sel_dir <= "10"; -- Seleccionar dirección de la instrucción actual
         r_w <= '1';      -- Activar escritura
         carga_ri <= '0'; -- No cargar el registro de instrucciones
     ```

4. **Condiciones para el Flag `registro_fz`:**
   - El flag `registro_fz` debe influir en las transiciones, especialmente en la instrucción `BEQ`.
   - Ejemplo de implementación:
     ```vhdl
     when "011" =>
         if registro_fz = '1' then
             estado_uc <= "100"; -- Salto condicional tomado
         else
             estado_uc <= "000"; -- Salto no tomado
         end if;
     ```

5. **Estados Faltantes:**
   - Los alumnos deben completar los estados restantes (`"100"`, `"101"`, `"110"`, `"111"`) para que la FSM cubra todos los posibles casos.

---

### Pasos para Completar el Archivo:

1. **Leer el Código Base:**
   - Familiarízate con la estructura de la FSM y las señales de entrada/salida.

2. **Definir las Transiciones:**
   - Completa las transiciones de la FSM en el bloque `case estado_uc is`.

3. **Configurar las Salidas:**
   - En el proceso asociado a `estado_uc`, asigna los valores correctos a las señales de control.

4. **Probar el Diseño:**
   - Asegúrate de que la FSM transita correctamente entre estados y genera las salidas deseadas.

5. **Simular el Código:**
   - Usa un simulador para verificar que el diseño cumple con las especificaciones.

---

### Ejemplo de Modificación:

Antes:
```vhdl
when "000" =>
    sel_dir <= "XX"; -- Cambiar XX por el valor correcto
    r_w <= 'X'; -- Cambiar X por el valor correcto
    carga_ri <= 'X'; -- Cambiar X por el valor correcto
    codigo_alu <= "XX"; -- Cambiar XX por el valor correcto

Después:

when "000" =>
    sel_dir <= "01"; -- Seleccionar la dirección 01
    r_w <= '0';      -- Activar lectura
    carga_ri <= '1'; -- Cargar el registro de instrucciones
    codigo_alu <= "00"; -- Código de operación para MOV

Con estas modificaciones, el diseño será funcional y alineado con las instrucciones requeridas.
