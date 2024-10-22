
# README: Memoria y Top para CPU Sencilla

## Instrucciones de la CPU

La CPU puede ejecutar las siguientes instrucciones:

- **ADD**: Suma el contenido de la dirección fuente (`DIR F`) con el contenido de la dirección destino (`DIR D`), y almacena el resultado en la dirección destino.
- **CMP**: Compara el contenido de la dirección fuente (`DIR F`) con el contenido de la dirección destino (`DIR D`). No devuelve ningún resultado a la memoria, pero activa el flag `Z` si los dos datos son iguales.
- **MOV**: Copia el contenido de la dirección fuente (`DIR F`) a la dirección destino (`DIR D`).
- **BEQ**: Verifica el flag `Z` generado en la instrucción anterior. Si el flag `Z` es 0, se ejecuta la siguiente instrucción; si el flag `Z` es 1, se ejecuta la instrucción indicada en la dirección destino (`DIR D`).

## Estructura del Código Máquina

El código máquina sigue la siguiente estructura:

```
INSTRUCCIÓN    CÓD OPER    DIR F    DIR D
ADD F D        00          fffffff  ddddddd
CMP F D        01          fffffff  ddddddd
MOV F D        10          fffffff  ddddddd
BEQ DIR        11          0000000  ddddddd
```

Cada instrucción se compone de 16 bits, divididos en los siguientes campos:

- **Código de operación (2 bits)**: Identifica la operación a realizar (ADD, CMP, MOV, BEQ).
- **Dirección fuente (`DIR F`, 7 bits)**: Indica la dirección de origen para las operaciones.
- **Dirección destino (`DIR D`, 7 bits)**: Indica la dirección de destino para las operaciones.

Las instrucciones se codifican y comienzan en la dirección 0 de la memoria. Esta estructura permite identificar el tipo de operación a realizar y las ubicaciones de memoria involucradas.

## Ejemplo de Programa en Ensamblador

Debajo tienes un ejemplo de código ensamblador que hace el producto del dato `a` por el dato `b`, dejando el resultado en `Resultado`:

```assembly
.ver 1

; Los datos empiezan en la dirección 11
.data
    dw      Zero 0
    dw      One 1
    dw      Resultado 0
    dw      i 0
    dw      a 3
    dw      b 5

.fin    lblend

; Las instrucciones empiezan en la dirección 0
.code
Begin:  mov Zero, Resultado
        mov Zero, i
While:  cmp i, b
        beq end
        add a, Resultado
        add One, i
        cmp One, One
        beq While
end:    cmp One, One
        beq end

lblend:
```

Rellena la siguiente tabla indicando el código máquina necesario para implementar este programa:

| Dirección | Ensamblador         | Código Operación | Dirección Origen | Dirección Destino | Instrucción en Hexadecimal |
| --------- | ------------------- | ---------------- | ---------------- | ----------------- | -------------------------- |
| 0         | MOV Zero, Resultado | 10               | 0001011          | 0001100           | 4C18                       |
| 1         | MOV Zero, i         |                  |                  |                   |                            |
| 2         | CMP i, b            |                  |                  |                   |                            |
| 3         | BEQ end             |                  |                  |                   |                            |
| 4         | ADD a, Resultado    |                  |                  |                   |                            |
| 5         | ADD One, i          |                  |                  |                   |                            |
| 6         | CMP One, One        |                  |                  |                   |                            |
| 7         | BEQ While           |                  |                  |                   |                            |
| 8         | CMP One, One        |                  |                  |                   |                            |
| 9         | BEQ end             |                  |                  |                   |                            |

El código máquina resultante del programa debe guardarse en la memoria de la CPU. Añádelo en el archivo `memoria.vhd`, en la sección correspondiente a la inicialización de la memoria, para que esté disponible al arrancar la CPU.

## Descripión General

Este proyecto se enfoca en implementar una memoria de doble puerto en VHDL y un módulo superior (`top_memoria`) para probar su funcionamiento. La memoria es una parte fundamental de la CPU sencilla que se está desarrollando, ya que almacena tanto los datos como el código máquina para la ejecución del programa.

El objetivo es cargar el código máquina de un programa simple y probar las operaciones de lectura y escritura en la memoria, utilizando interruptores y botones para simular los accesos.

## Archivos del Proyecto

- **`memoria.vhd`**: Implementación de la memoria de doble puerto. El puerto A permite leer y escribir datos en la memoria, mientras que el puerto B solo permite leer. En este archivo se debe cargar el código máquina del programa.
- **`top_memoria.vhd`**: Módulo superior que conecta la memoria con los interruptores y LEDs de la FPGA para permitir la prueba de su funcionamiento. Este archivo no debe ser modificado, ya que se utiliza únicamente para la interconexión y prueba.

## Cargar el Código Máquina en la Memoria

En el archivo `memoria.vhd`, es necesario cargar el siguiente código máquina, que representa un programa simple.

En el archivo `memoria.vhd`, encontrarás la declaración de la memoria como una variable compartida, inicializada con valores específicos:

```vhdl
shared variable RAM : ram_type := (
    0 => "1011001001100110", -- Inicialización de la posición 0 con un valor específico
    100 => x"0000",
    101 => x"0001",
    102 => x"0000",
    103 => x"0000",
    104 => x"0003",
    105 => x"0005",
    others => x"0000"
);
```

### Explicación
- **`shared variable RAM : ram_type`**: Esta es la declaración de una memoria compartida, de tipo `ram_type`, que permite almacenar múltiples valores en diferentes posiciones.
- **Posición 0 (`0 => "1011001001100110"`)**: Inicializa la posición de memoria 0 con un valor binario específico. Puedes modificar estas posiciones para incluir el código máquina generado.
- **Otras posiciones**: Las direcciones 100 a 105 tienen valores específicos asignados con el formato hexadecimal (`x"0000"`, etc.), y las demás posiciones se inicializan con ceros usando `others => x"0000"`.

### Añadir el Código Máquina
Para añadir más instrucciones al archivo `memoria.vhd`, deberás modificar la inicialización de `RAM` para incluir el código máquina que se generó en la tabla anterior. Cada instrucción debe codificarse como un valor de 16 bits en binario o hexadecimal, y se debe asignar a la dirección correspondiente. Por ejemplo:

```vhdl
shared variable RAM : ram_type := (
    0 => "0001000100110011", -- MOV Zero, Resultado
    1 => "0001000100110100", -- MOV Zero, i
    2 => "0001010101100011", -- CMP i, b
    3 => "0011010100001111", -- BEQ end
    -- Resto del programa...
    others => x"0000"
);
```

Cada línea representa una instrucción codificada que debe almacenarse en la memoria para ser ejecutada por la CPU. Es importante asegurarse de que la codificación sea correcta y que se asignen las direcciones adecuadas.

El programa consta de instrucciones y datos, los cuales se deben cargar en las posiciones de memoria correspondientes. Los datos comienzan a partir de la dirección 11, mientras que las instrucciones empiezan en la dirección 0.

## Estructura del `top_memoria.vhd`

El archivo `top_memoria.vhd` se encarga de interconectar la memoria con la FPGA para simular su funcionamiento mediante interruptores y LEDs. La descripción de los puertos y la funcionalidad es la siguiente:

- **Entrada de dirección (`addra`)**: Los interruptores del 9 al 5 se utilizan para ingresar la dirección que se desea manipular en la memoria.
- **Entrada de datos (`di`)**: Los interruptores del 4 al 0 se utilizan para ingresar el dato que se desea almacenar en la memoria.
- **Habilitación de escritura (`we`)**: Controlada por el botón 1. Si está activado, permite escribir en la memoria en la dirección especificada por `addra`.
- **Habilitación de la memoria (`en`)**: Controlada por el botón 0. Permite activar el acceso a la memoria.
- **Visualización de la salida (`doa`)**: Los LEDs del 9 al 0 muestran el valor leído de la memoria en la dirección especificada por `addra`.

## Instrucciones para la Simulación

Para simular el proyecto, sigue estos pasos:

1. **Cargar los archivos** `memoria.vhd` y `top_memoria.vhd` en el entorno de simulación.
2. **Compilar ambos módulos** asegurándote de no tener errores de sintaxis.
3. **Configurar los interruptores** (`V_SW`) y los botones (`V_BT`) según lo indicado para probar el acceso a la memoria.
4. **Probar las operaciones** de lectura y escritura en la memoria utilizando los botones y los interruptores, y observar el resultado en los LEDs (`G_LED`).

## Notas Adicionales

Este proyecto es parte de una práctica educativa para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL. El enfoque está en entender cómo funciona la memoria de una CPU sencilla y cómo interactuar con ella mediante una FPGA.

Es importante asegurarse de que la memoria esté correctamente inicializada con los datos y el código máquina, y de probar las funcionalidades de lectura y escritura para validar su comportamiento.

## Créditos

Este trabajo es parte de una práctica educativa para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL.
