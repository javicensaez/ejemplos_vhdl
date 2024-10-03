# Proyecto VHDL: Control de Display de 7 Segmentos con Interruptores

## Descripción

Este proyecto implementa el control de un **display de 7 segmentos de ánodo común** utilizando interruptores (`V_SW`) en un diseño en **VHDL**. El diseño permite que el valor de los interruptores controle los segmentos del display, encendiéndolos o apagándolos de acuerdo con una lógica combinacional.

### Componentes principales:

- **V_SW (interruptores)**: Entrada de 8 bits (`std_logic_vector(7 downto 0)`) que representa los interruptores de entrada.
- **G_HEX0 (display de 7 segmentos)**: Salida de 7 bits (`std_logic_vector(6 downto 0)`) que representa los 7 segmentos del display.
- **G_LED**: Aunque está declarado como una salida de 8 bits, no se usa en este diseño.

El objetivo es controlar los segmentos `a`, `b`, `c`, `d`, `e`, `f`, y `g` del display según los primeros 4 bits de los interruptores (`V_SW(3 downto 0)`).

## Display de 7 Segmentos de Ánodo Común

Este proyecto utiliza un **display de 7 segmentos de ánodo común**. En este tipo de display, el ánodo (positivo) de todos los LED está conectado en común, y para encender un segmento es necesario aplicar un valor bajo (`0` lógico) en el pin correspondiente del segmento. Es decir, para encender un segmento, se debe aplicar un `0` en el terminal de salida.


## Tabla de Verdad

En la siguiente tabla de verdad, las columnas de **E3, E2, E1, E0** son las **entradas** que representan el estado de los interruptores. Las columnas **a, b, c, d, e, f, g** son las **salidas**, donde **0** indica que el segmento está encendido y **1** indica que está apagado, ya que es un display de **ánodo común**.


| **E3** | **E2** | **E1** | **E0** | **a** | **b** | **c** | **d** | **e** | **f** | **g** |
|--------|--------|--------|--------|-------|-------|-------|-------|-------|-------|-------|
|   0    |   0    |   0    |   0    |   0   |   0   |   0   |   0   |   0   |   0   |   1   |  --> 0
|   0    |   0    |   0    |   1    |   1   |   0   |   0   |   1   |   1   |   1   |   1   |  --> 1
|   0    |   0    |   1    |   0    |   0   |   0   |   1   |   0   |   0   |   1   |   0   |  --> 2
|   0    |   0    |   1    |   1    |   0   |   0   |   0   |   0   |   1   |   1   |   0   |  --> 3
|   0    |   1    |   0    |   0    |   1   |   0   |   0   |   1   |   1   |   0   |   0   |  --> 4
|   0    |   1    |   0    |   1    |   0   |   1   |   0   |   0   |   1   |   0   |   0   |  --> 5
|   0    |   1    |   1    |   0    |   0   |   1   |   0   |   0   |   0   |   0   |   0   |  --> 6
|   0    |   1    |   1    |   1    |   0   |   0   |   0   |   1   |   1   |   1   |   1   |  --> 7
|   1    |   0    |   0    |   0    |   0   |   0   |   0   |   0   |   0   |   0   |   0   |  --> 8
|   1    |   0    |   0    |   1    |   0   |   0   |   0   |   0   |   1   |   0   |   0   |  --> 9
|   1    |   0    |   1    |   0    |   x   |   x   |   x   |   x   |   x   |   x   |   x   |  --> x
|   1    |   0    |   1    |   1    |   x   |   x   |   x   |   x   |   x   |   x   |   x   |  --> x
|   1    |   1    |   0    |   0    |   x   |   x   |   x   |   x   |   x   |   x   |   x   |  --> x
|   1    |   1    |   0    |   1    |   x   |   x   |   x   |   x   |   x   |   x   |   x   |  --> x
|   1    |   1    |   1    |   0    |   x   |   x   |   x   |   x   |   x   |   x   |   x   |  --> x
|   1    |   1    |   1    |   1    |   x   |   x   |   x   |   x   |   x   |   x   |   x   |  --> x


### Expresiones Lógicas de los Segmentos

- **Segmento `a`**:   

  $a = \overline{E0} \cdot \overline{E1} \cdot E2 + E0 \cdot \overline{E1} \cdot \overline{E2} \cdot \overline{E3}$

- **Segmento `b`**:  

  $b = \overline{E0} \cdot E1 \cdot E2 + E0 \cdot \overline{E1} \cdot E2$

- **Segmento `c`**:  

  $c = \overline{E0} \cdot E1 \cdot \overline{E2}$

- **Segmento `d`**:  
  $d = \overline{E0} \cdot \overline{E1} \cdot E2 + E0 \cdot \overline{E1} \cdot \overline{E2} + E0 \cdot E1 \cdot E2$

- **Segmento `e`**:  

  $e = \overline{E1} \cdot E2 + E0$

- **Segmento `f`**:  

  $f = E1 \cdot \overline{E2} + E0 \cdot \overline{E2} \cdot \overline{E3} + E0 \cdot E1$

- **Segmento `g`**:  

  $g = \overline{E1} \cdot \overline{E2} \cdot \overline{E3} + E0 \cdot E1 \cdot E2$
