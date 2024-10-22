
# README: Registro en VHDL

## Descripción General

Este proyecto se centra en la implementación de un registro en VHDL. Un registro es un componente fundamental en la arquitectura de computadoras que permite almacenar un valor de varios bits durante un ciclo de reloj y proporcionar ese valor como salida cuando sea necesario.

Los archivos incluidos en este proyecto son:

- `topRegistro.vhd`: Módulo principal que conecta y coordina los distintos componentes del sistema, incluyendo el registro. Este archivo también gestiona las señales de entrada y salida, integrando el módulo `registro` en el sistema completo.
- `registro.vhd`: Descripción del componente que implementa el registro, que almacena un valor de entrada y lo mantiene hasta que una nueva señal lo actualice.

## Archivos del Proyecto

### 1. `topRegistro.vhd`

Este archivo contiene la descripción del módulo superior, encargado de instanciar y conectar todos los submódulos necesarios para el correcto funcionamiento del sistema. **No es necesario modificar este archivo**, ya que su función es integrar el registro y gestionar las señales de entrada y salida.

Este módulo define:

- **Interruptor 9**: Se utiliza para simular la señal de reloj (`clk`) del registro.
- **Interruptor 8**: Se utiliza para simular la señal de carga (`load`) del registro.
- **Interruptor 7**: Se utiliza para simular la señal de reset (`reset`) del registro.
- **Interruptores (`V_SW`)**: Interruptores de entrada usados para proporcionar el valor a almacenar en el registro. Se utilizan los interruptores del 6 al 0.
- **LEDs (`G_LED`)**: Los LEDs del 6 al 0 se utilizan para mostrar el valor almacenado en el registro.

### 2. `registro.vhd`

Este archivo contiene la implementación del componente `registro`, que tiene la siguiente funcionalidad:

- **Entrada (`data_in`)**: Recibe el valor a almacenar en el registro, a través de un vector de 7 bits.
- **Salida (`data_out`)**: Proporciona el valor almacenado en el registro, también en un vector de 7 bits.
- **Reloj (`clk`)**: Señal de reloj que controla cuándo se almacena el nuevo valor en el registro.
- **Reset asíncrono (`reset`)**: Señal de reset que, cuando está activa, fuerza el valor del registro a cero de manera asíncrona.
- **Carga sincrónica (`load`)**: Señal de carga que controla cuándo se almacena un nuevo valor en el registro, sincronizado con el reloj.

El registro almacena el valor recibido en la entrada y lo mantiene hasta que una nueva señal de reloj indica que debe actualizarse.

## Instrucciones para la Simulación

Para simular este proyecto, se recomienda utilizar un entorno de simulación webLAB. Asegúrate de incluir ambos archivos (`topRegistro.vhd` y `registro.vhd`) en el proyecto y establecer `topRegistro.vhd` como el módulo superior.

Pasos para la simulación:

1. Cargar los archivos `topRegistro.vhd` y `registro.vhd` en el entorno de simulación.
2. Compilar ambos módulos asegurándote de no tener errores de sintaxis.
3. Configurar las señales de entrada utilizando los interruptores (`V_SW`) para establecer el valor inicial del registro.
4. Ejecutar la simulación y verificar el valor mostrado en los LEDs (`G_LED`) después de cada ciclo de reloj.

## Estructura del Proyecto

- **Entidad `topRegistro`**: Punto de entrada principal que interconecta todos los componentes y gestiona las señales del sistema.
- **Entidad `registro`**: Unidad que almacena un valor y lo mantiene hasta que se actualice en el próximo ciclo de reloj.

## Notas Adicionales

Este proyecto está diseñado con fines educativos para aprender a implementar y simular un registro en VHDL. Es importante entender la estructura modular del código y cómo se interconectan los distintos componentes para formar un sistema más complejo.

## Créditos

Este trabajo es parte de una práctica educativa para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL.
