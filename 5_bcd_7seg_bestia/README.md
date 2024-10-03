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


<table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse; text-align: center;">
  <thead>
    <tr>
      <th colspan="4" style="background-color: #d3d3d3;">Entrada</th>
      <th colspan="7">Salida</th>
    </tr>
    <tr>
      <th style="background-color: #d3d3d3;">E3</th>
      <th style="background-color: #d3d3d3;">E2</th>
      <th style="background-color: #d3d3d3;">E1</th>
      <th style="background-color: #d3d3d3;">E0</th>
      <th style="border-left: 4px solid black;">a</th>
      <th>b</th>
      <th>c</th>
      <th>d</th>
      <th>e</th>
      <th>f</th>
      <th>g</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td style="border-left: 4px solid black;">x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td style="border-left: 4px solid black;">x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
      <td>x</td>
    </tr>
  </tbody>
</table>



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
