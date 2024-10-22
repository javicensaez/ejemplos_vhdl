
# README: Incrementador para el Program Counter (PC)

## Descripción General

Este proyecto se centra en la implementación de un incrementador de contador de programa (PC) en VHDL. El incrementador tiene como objetivo aumentar el valor del contador de programa, que es un componente fundamental en arquitecturas de computadoras para llevar el registro de la dirección de la siguiente instrucción a ejecutar.

Los archivos incluidos en este proyecto son:

- `topIncrementador.vhd`: Módulo principal que conecta y coordina los distintos componentes del sistema, incluyendo el incrementador. Este archivo también gestiona las señales de entrada y salida, integrando el módulo `incrementoPC` en el sistema completo.
- `incrementoPC.vhd`: Descripción del componente que realiza el incremento del valor del program counter. Este archivo contiene la lógica necesaria para incrementar el valor del PC en cada ciclo.

## Archivos del Proyecto

### 1. `topIncrementador.vhd`

Este archivo contiene la descripción del módulo superior, encargado de instanciar y conectar todos los submódulos necesarios para el correcto funcionamiento del sistema. **No es necesario modificar este archivo**, ya que su función es integrar el incrementador y gestionar las señales de entrada y salida.

Este módulo define:

- **Entrada de reloj (`G_CLOCK_50`)**: Señal de reloj de 50 MHz que sincroniza el sistema.
- **Interruptores (`V_SW`)**: Interruptores de entrada usados para proporcionar el valor inicial del contador de programa. Se utilizan los interruptores del 6 al 0.
- **LEDs (`G_LED`)**: Los LEDs del 6 al 0 se utilizan para mostrar el valor actual del contador después de ser incrementado.

### 2. `incrementoPC.vhd`

Este archivo contiene la implementación del componente `incrementoPC`, que tiene la siguiente funcionalidad:

- **Entrada (`entrada`)**: Recibe el valor del program counter a través de un vector de 7 bits.
- **Salida (`salida`)**: Proporciona el valor incrementado del program counter, también en un vector de 7 bits.

El incrementador incrementa el valor recibido en la entrada y lo entrega a la salida para ser visualizado a través de los LEDs conectados en el módulo superior.

## Instrucciones para la Simulación

Para simular este proyecto, se recomienda utilizar un entorno de simulación compatible con VHDL, como ModelSim o Vivado. Asegúrate de incluir ambos archivos (`topIncrementador.vhd` y `incrementoPC.vhd`) en el proyecto y establecer `topIncrementador.vhd` como el módulo superior.

Pasos para la simulación:

1. Cargar los archivos `topIncrementador.vhd` y `incrementoPC.vhd` en el entorno de simulación.
2. Compilar ambos módulos asegurándote de no tener errores de sintaxis.
3. Configurar las señales de entrada utilizando los interruptores (`V_SW`) para establecer el valor inicial del contador.
4. Ejecutar la simulación y verificar el valor mostrado en los LEDs (`G_LED`) después de cada ciclo de reloj.

## Estructura del Proyecto

- **Entidad `topIncrementador`**: Punto de entrada principal que interconecta todos los componentes y gestiona las señales del sistema.
- **Entidad `incrementoPC`**: Unidad que realiza el incremento del valor del contador de programa.

## Notas Adicionales

Este proyecto está diseñado con fines educativos para aprender a implementar y simular un incrementador de contador de programa (PC) en VHDL. Es importante entender la estructura modular del código y cómo se interconectan los distintos componentes para formar un sistema más complejo.

## Créditos

Este trabajo es parte de una práctica educativa para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL.
