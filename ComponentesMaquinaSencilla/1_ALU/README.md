
# README: ALU Project

## Descripción General

Este proyecto se centra en la implementación de una Unidad Aritmético-Lógica (ALU) en VHDL. La ALU es un componente fundamental en la arquitectura de computadoras, responsable de realizar operaciones aritméticas y lógicas. Los ficheros incluidos en este proyecto son:

- `topALU.vhd`: Módulo principal que conecta y coordina los distintos componentes del sistema, incluyendo la ALU. Actúa como la entidad principal donde se define la arquitectura general y las interconexiones.
- `ALU.vhd`: Descripción del componente ALU, que implementa diversas operaciones aritméticas y lógicas, tales como suma, XOR, mover un operando, entre otras. Este módulo contiene la lógica principal para realizar las funciones deseadas.

## Archivos del Proyecto

### 1. `topALU.vhd`

Este archivo contiene la descripción del módulo superior, encargado de instanciar y conectar todos los submódulos necesarios para el correcto funcionamiento del sistema. No es necesario modificar este archivo, ya que su función es integrar la ALU y gestionar las señales de entrada y salida.

Este módulo define:

- Las señales de interconexión entre la ALU y otros componentes.
- La interfaz de entrada y salida que permite el control de la ALU desde niveles superiores.

Para la simulación, el archivo `topALU.vhd` utiliza los siguientes interruptores y LEDs para definir los operandos, la operación y visualizar el resultado:

- **Operando `A`**: Se define utilizando los interruptores del 3 al 0, rellenando el resto de los bits con ceros para obtener un operando de 16 bits.
- **Operando `B`**: Se define utilizando los interruptores del 8 al 5, mientras que el resto de los bits se completan con ceros para formar el operando de 16 bits.
- **Selector de Operación (`SEL`)**: Los interruptores 9 y 4 se utilizan para seleccionar la operación a realizar por la ALU. Este selector de 2 bits permite elegir entre las diferentes operaciones disponibles.
- **Resultado de la Operación**: El resultado de la operación realizada por la ALU se muestra en los LEDs del 3 al 0, representando los 4 bits menos significativos del resultado.
- **Flag de Activación (`Z`)**: El flag `Z`, que indica si el resultado de la operación es igual a 0, se muestra en el LED 9. Si el resultado es cero, este LED se activa.

### 2. `ALU.vhd`

Este archivo contiene la implementación de la Unidad Aritmético-Lógica. La ALU puede realizar una variedad de operaciones, basadas en un selector de 2 bits (`SEL`) y dos operandos (`A` y `B`), ambos de 16 bits. Las operaciones disponibles son:

- **Selector `00`**: Realiza la suma de los operandos `A` y `B`.
- **Selector `01`**: Mueve el valor del operando `B` a la salida.
- **Selector `10`**: Realiza la operación lógica XOR entre `A` y `B`.
- **Selector `11`**: No se utiliza.

El resultado de la ALU es un valor de 16 bits y, adicionalmente, la ALU tiene un flag de salida (`Z`) de un bit que se activa si el resultado de la operación es igual a 0.

## Instrucciones para la Simulación

Para simular este proyecto, se tiene que utilizar webLAb. Asegúrate de incluir ambos archivos en el proyecto y establecer `topALU.vhd` como el módulo superior.

Pasos para la simulación:

1. Cargar los archivos `topALU.vhd` y `ALU.vhd` en el entorno de simulación.
2. Compilar ambos módulos asegurándote de no tener errores de sintaxis.
3. Configurar las señales de entrada mediante los interruptores para probar diferentes operaciones de la ALU.
4. Ejecutar la simulación y verificar los resultados de las operaciones.

## Estructura del Proyecto

- **Entidad `topALU`**: Punto de entrada principal que interconecta todos los componentes.
- **Entidad `ALU`**: Unidad que realiza operaciones matemáticas y lógicas.

## Notas Adicionales

Este proyecto está diseñado con fines educativos para aprender a implementar y simular una ALU en VHDL. Es importante entender la estructura modular del código y cómo se interconectan los distintos componentes para formar un sistema más complejo.

## Créditos

Este trabajo es parte de una práctica educativa para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL.
