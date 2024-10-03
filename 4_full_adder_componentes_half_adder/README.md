# Proyecto VHDL: Half Adder y Full Adder

## Descripción del Proyecto

Este proyecto implementa dos entidades VHDL: un **half adder** (sumador de medio bit) y un **full adder** (sumador completo de un bit). El **full adder** se construye utilizando dos instancias del **half adder**. Estos componentes son fundamentales en la construcción de sumadores y unidades aritméticas.

### Archivos incluidos

#### 1. `half_adder.vhd`

Este archivo define el **half adder**, que toma dos bits de entrada (`A` y `B`) y calcula la **suma** (`SUM`) y el **acarreo** (`CARRY`). El **half adder** realiza las siguientes operaciones lógicas:

- **Entradas**:
  - `A`: Primer bit de entrada.
  - `B`: Segundo bit de entrada.
  
- **Salidas**:
  - `SUM`: Resultado de la operación de suma.
  - `CARRY`: Acarreo resultante de la operación de suma.

**Lógica interna**:
El half adder utiliza las operaciones lógicas **XOR** y **AND** para calcular la suma y el acarreo, respectivamente:

```vhdl
SUM <= A xor B;     -- SUM es la suma de A y B (XOR)
CARRY <= A and B;   -- CARRY es el acarreo (AND)
```

#### 2. `full_adder.vhd`

Este archivo define el **full adder**, que extiende la funcionalidad del **half adder** para sumar tres bits: `A`, `B`, y un bit de acarreo de entrada (`CIN`). El **full adder** calcula la **suma** (`SUM`) y el **acarreo de salida** (`COUT`). El full adder se construye utilizando dos instancias del **half adder**.

- **Entradas**:
  - `A`: Primer bit de entrada.
  - `B`: Segundo bit de entrada.
  - `CIN`: Bit de acarreo de entrada.
  
- **Salidas**:
  - `SUM`: Resultado de la operación de suma.
  - `COUT`: Acarreo resultante de la operación de suma.

**Instanciación del half adder**:
El full adder utiliza dos instancias del half adder para sumar los bits de entrada y el acarreo:

```vhdl
-- Primer half adder
u1: half_adder port map (A, B, sum1, carry1);

-- Segundo half adder
u2: half_adder port map (sum1, CIN, SUM, carry2);
```

**Acarreo de salida**:
El acarreo de salida se calcula como la operación **OR** entre los acarreos de las dos instancias del half adder:

```vhdl
COUT <= carry1 or carry2;
```

### Jerarquía del Diseño

1. **Entidad `half_adder`**:
   - Suma dos bits de entrada (`A` y `B`).
   - Proporciona la suma y el acarreo como salida.

2. **Entidad `full_adder`**:
   - Utiliza dos instancias de `half_adder` para sumar tres bits (`A`, `B`, y `CIN`).
   - Proporciona la suma y el acarreo final (`SUM` y `COUT`).

### Conclusión

Este proyecto implementa dos componentes fundamentales en la aritmética digital: un **half adder** y un **full adder**. El **half adder** se utiliza para sumar dos bits, mientras que el **full adder** extiende esta funcionalidad para sumar tres bits, aprovechando dos instancias del half adder.
