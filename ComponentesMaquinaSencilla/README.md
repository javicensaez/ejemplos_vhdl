
# README: Proyecto de CPU Sencilla en VHDL

## Descripción General

Este proyecto tiene como objetivo diseñar una CPU sencilla en VHDL. Para lograrlo, se han descompuesto sus componentes principales en módulos individuales, los cuales se desarrollarán por separado para luego ser integrados. Cada módulo corresponde a una parte fundamental de la CPU y se almacena en su respectiva carpeta. Cada componente ha sido diseñado y simulado individualmente para garantizar su correcto funcionamiento antes de integrarlo en el diseño completo de la CPU.

## Estructura de Carpetas

El proyecto está organizado en las siguientes carpetas:

1. **1_ALU**: Implementación de la Unidad Aritmético-Lógica (ALU).
2. **2_Multiplexador**: Implementación del multiplexador.
3. **3_Incrementador**: Implementación de un incrementador para el contador de programa (PC).
4. **4_Registro**: Implementación de un registro para almacenar valores.

Cada una de estas carpetas contiene los siguientes archivos:

- `top<Módulo>.vhd`: Este archivo es el módulo superior (top) encargado de conectar y coordinar los distintos componentes del sistema, gestionando las señales de entrada y salida. **No es necesario modificar este archivo**, ya que su función es realizar la interconexión con la FPGA para probar si el funcionamiento es correcto.
- `<Módulo>.vhd`: Este archivo contiene la lógica del componente en sí. Es el archivo que debe ser completado y en el cual se implementa el comportamiento específico del módulo.

## Instrucciones para Cada Proyecto

Para cada módulo del proyecto (ALU, multiplexador, incrementador y registro), sigue los siguientes pasos:

1. **Entender el propósito del módulo**: Cada módulo tiene una función específica dentro de la CPU. Lee el README de cada carpeta para conocer más sobre su funcionalidad y cómo se integra en la CPU.
2. **Completar el archivo del módulo**: El archivo `<Módulo>.vhd` es donde debes implementar la lógica correspondiente. Este archivo debe ser completado para asegurar el funcionamiento deseado.
3. **Probar el módulo**: Usa el archivo `top<Módulo>.vhd` para probar el módulo. Este archivo se encarga de realizar la interconexión necesaria con la FPGA para verificar el comportamiento del módulo mediante switches y LEDs.

## Ejemplo de Uso de los Módulos

- En el caso del **registro**, se utiliza un interruptor para simular el reloj, otro para la señal de carga (`load`) y otro para la señal de reset (`reset`). Los interruptores restantes permiten introducir el valor a almacenar, y los LEDs muestran el valor almacenado en el registro.
- De manera similar, otros módulos utilizan los interruptores y LEDs para simular entradas y visualizar salidas, verificando así la correcta implementación.

## Objetivo Final

Una vez que se haya diseñado y probado cada componente individualmente, estos se integrarán para formar una CPU sencilla. Esta CPU incluirá la ALU para realizar operaciones aritméticas y lógicas, registros para almacenar valores, un contador de programa que se incrementa automáticamente, y un multiplexador para la selección de señales.

## Notas Adicionales

Este proyecto está diseñado con fines educativos para aprender sobre diseño digital y arquitecturas de computadoras utilizando VHDL. Cada componente debe ser entendido, implementado y simulado antes de proceder con la integración completa. Esto ayuda a identificar errores y asegurar que cada parte de la CPU funciona correctamente antes de combinarla con otras partes.

## Créditos

