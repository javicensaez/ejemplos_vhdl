# Máquina de Estados Finita (FSM)

Este diseño implementa una **Máquina de Estados Finita (FSM)** que tiene cuatro estados principales (`00`, `01`, `10`, `11`) y permite transitar entre ellos dependiendo de las entradas del sistema. Los estados controlan la salida del display de 7 segmentos (`G_HEX0`) para mostrar el estado actual.

---

## Descripción de los Estados

### Estados y Transiciones

| **Estado Actual** | **Entrada (`dir`)** | **Estado Siguiente** |
|--------------------|---------------------|-----------------------|
| `00`              | `1`                 | `01`                  |
| `00`              | `0`                 | `11`                  |
| `01`              | `1`                 | `10`                  |
| `01`              | `0`                 | `00`                  |
| `10`              | `1`                 | `11`                  |
| `10`              | `0`                 | `01`                  |
| `11`              | `1`                 | `00`                  |
| `11`              | `0`                 | `10`                  |

---

## Entradas y Salidas

### Entradas

- **`clk` (Reloj):**
  - Controlado por el botón `V_BT(0)`. Activa los cambios de estado en el flanco de subida.
- **`reset`:**
  - Controlado por el botón `V_BT(1)`. Reinicia el estado a `00` cuando está en `0`.
- **`enable`:**
  - Controlado por el interruptor `V_SW(0)`. La FSM funciona solo si `enable = '1'`.
- **`dir` (Dirección):**
  - Controlado por el interruptor `V_SW(1)`. Define la dirección de la FSM:
    - `dir = '1'`: Incrementa el estado.
    - `dir = '0'`: Decrementa el estado.

### Salidas

- **`G_HEX0`:**
  - Muestra el estado actual en el display de 7 segmentos.

---

## Lógica de Transición de Estados

### Proceso de Estado

El siguiente bloque maneja las transiciones de estados:

```vhdl
process (clk, reset) is
begin
    if (rising_edge(clk) and (enable = '1')) then
        case estado is
            when "00" => 
                if dir = '1' then
                    estado <= "01"; -- Incrementa al estado 01
                else
                    estado <= "11"; -- Decrementa al estado 11
                end if;
            when "01" => 
                if dir = '1' then
                    estado <= "10"; -- Incrementa al estado 10
                else
                    estado <= "00"; -- Decrementa al estado 00
                end if;
            when "10" => 
                if dir = '1' then
                    estado <= "11"; -- Incrementa al estado 11
                else
                    estado <= "01"; -- Decrementa al estado 01
                end if;
            when "11" => 
                if dir = '1' then
                    estado <= "00"; -- Incrementa al estado 00
                else
                    estado <= "10"; -- Decrementa al estado 10
                end if;
            when others => 
                estado <= (others => 'X'); -- Estado indefinido
        end case;
    end if;

    if reset = '0' then
        estado <= "00"; -- Reinicia al estado inicial
    end if;
end process;

## Salida a Display de 7 Segmentos

La salida `G_HEX0` muestra el estado actual en el display de 7 segmentos. Cada estado tiene una representación específica:

| **Estado** | **Salida (`G_HEX0`)** | **Display** |
|------------|------------------------|-------------|
| `00`       | `0000001`             | `0`         |
| `01`       | `1001111`             | `1`         |
| `10`       | `0010010`             | `2`         |
| `11`       | `0000110`             | `3`         |

### Lógica de Salida

```vhdl
process(estado) is
begin
    case estado is
        when "00" => G_HEX0 <= "0000001"; -- Muestra 0
        when "01" => G_HEX0 <= "1001111"; -- Muestra 1
        when "10" => G_HEX0 <= "0010010"; -- Muestra 2
        when "11" => G_HEX0 <= "0000110"; -- Muestra 3
    end case;
end process;

## Características Clave

### Dirección de Transición:

- La FSM puede avanzar (`dir = '1'`) o retroceder (`dir = '0'`) entre estados.

### Control de Habilitación y Reinicio:

- **`enable`**: Controla si la FSM está activa.
- **`reset`**: Reinicia la FSM al estado inicial (`00`).

### Visualización:

- Los estados actuales se muestran en `G_HEX0` para facilitar la depuración.
