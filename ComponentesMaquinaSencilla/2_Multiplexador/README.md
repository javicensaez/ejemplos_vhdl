
# README: Multiplexador Project

## Descripción General

Este proyecto se centra en la implementación de un multiplexador en VHDL. Un multiplexador es un componente digital que permite seleccionar una de varias señales de entrada y dirigirla a la salida. Los ficheros incluidos en este proyecto son:

- `topMultiplexador.vhd`: Módulo principal que conecta y coordina los distintos componentes del sistema, incluyendo el multiplexador. Actúa como la entidad principal donde se define la arquitectura general y las interconexiones.
- `multiplexador.vhd`: Descripción del componente multiplexador, que implementa la lógica necesaria para seleccionar entre diferentes señales de entrada en función de un selector. Este módulo contiene la lógica principal para realizar las funciones del multiplexador.

## Archivos del Proyecto

### 1. `topMultiplexador.vhd`

**Este archivo no necesita ser modificado.** Su función es integrar el multiplexador y gestionar las señales de entrada y salida, asegurando el correcto funcionamiento del sistema.

Este archivo contiene la descripción del módulo superior, encargado de instanciar y conectar todos los submódulos necesarios.

Este módulo define:

- Las señales de interconexión entre el multiplexador y otros componentes.
- La interfaz de entrada y salida que permite el control del multiplexador desde niveles superiores.

Para la simulación, el archivo `topMultiplexador.vhd` utiliza los siguientes interruptores y LEDs para definir las señales de entrada, el selector y visualizar la salida:

- **Entradas**:
  - Entrada 1: Se define utilizando los interruptores del 1 al 0.
  - Entrada 2: Se define utilizando los interruptores del 3 al 2.
  - Entrada 3: Se define utilizando los interruptores del 6 al 5.
  - Entrada 4: Se define utilizando los interruptores del 8 al 7.
- **Selector**: Se define utilizando los interruptores 9 y 4. Estos bits se utilizan para seleccionar cuál de las entradas se dirigirá a la salida.
- **Salida**: La salida seleccionada se muestra en los LEDs del 6 al 9.

### 2. `multiplexador.vhd`

**Este archivo debe ser finalizado.** Contiene la implementación del multiplexador y necesita ser completado para asegurar el funcionamiento correcto del sistema.

El multiplexador tiene varias entradas y un selector que determina cuál de esas entradas se transmite a la salida.

- **Entradas**: El multiplexador tiene 4 entradas de 7 bits cada una.
- **Selector**: Utiliza un selector de 2 bits (`SEL`) que determina cuál de las 4 entradas se dirige a la salida.
- **Salida**: La salida es de 7 bits y corresponde a la entrada seleccionada por el `SEL`.

## Instrucciones para la Simulación

Para simular este proyecto, se tiene que utilizar webLAb. Asegúrate de incluir ambos archivos en el proyecto y establecer `topMultiplexador.vhd` como el módulo superior.

Pasos para la simulación:

1. Cargar los archivos `topMultiplexador.vhd` y `multiplexador.vhd` en el entorno de simulación.
2. Compilar ambos módulos asegurándote de no tener errores de sintaxis.
3. Configurar las señales de entrada mediante los interruptores para probar las diferentes combinaciones del multiplexador.
4. Ejecutar la simulación y verificar los resultados de las combinaciones de entrada y selección.

## Estructura del Proyecto

- **Entidad `topMultiplexador`**: Punto de entrada principal que interconecta todos los componentes.
- **Entidad `multiplexador`**: Unidad que realiza la función de selección entre múltiples entradas.

## Notas Adicionales

Este proyecto está diseñado con fines educativos para aprender a implementar y simular un multiplexador en VHDL. Es importante entender la estructura modular del código y cómo se interconectan los distintos componentes para formar un sistema más complejo.

## Créditos

Este trabajo es parte de una práctica educativa para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL.
