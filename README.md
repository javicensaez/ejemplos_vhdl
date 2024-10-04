# Proyecto VHDL - Estructura de Carpetas

Este documento explica el contenido de cada carpeta dentro del proyecto de VHDL, que incluye varios ejemplos y componentes diseñados en VHDL. A continuación se detalla el propósito de cada carpeta y sus respectivos archivos.

---

## 1. `1_plantilla`
### Contenido:
- **prueba.vhd**: Un archivo de plantilla base para comenzar a trabajar con VHDL. Generalmente incluye la configuración básica de una entidad y su arquitectura.
- **README.md**: Explicación básica del archivo de plantilla.

---

## 2. `2_half_adder`
### Contenido:
- **half_adder.vhd**: Implementación de un medio sumador (Half Adder) utilizando lógica combinacional. Este sumador de 1 bit calcula la suma y el acarreo para dos bits de entrada.
- **README.md**: Explicación sobre la implementación y funcionamiento del Half Adder.

---

## 3. `3_full_adder`
### Contenido:
- **full_adder.vhd**: Implementación de un sumador completo (Full Adder) utilizando dos medios sumadores (Half Adders). El Full Adder suma dos bits y un bit de acarreo de entrada y genera una suma y un acarreo de salida.
- **README.md**: Explicación sobre la implementación del Full Adder utilizando Half Adders.

---

## 4. `4_full_adder_componentes_half_adder`
### Contenido:
- **full_adder.vhd**: Implementación del Full Adder utilizando componentes de Half Adders.
- **half_adder.vhd**: El mismo archivo de Half Adder utilizado en los componentes.
- **README.md**: Explicación sobre la jerarquía y el uso de componentes en VHDL para el Full Adder.

---

## 5. `5_bcd7seg_bestia`
### Contenido:
- **base.vhd**: Un ejemplo de decodificación de números BCD y su representación en un display de 7 segmentos.
- **README.md**: Explicación sobre el uso de un decodificador BCD a 7 segmentos.

---

## 6. `6_bcd_7_seg_componente`
### Contenido:
- **base.vhd**: Un archivo base que utiliza un decodificador de BCD a 7 segmentos como componente.
- **BCD_to_7segment.vhd**: Decodificador que convierte un número BCD en su representación para un display de 7 segmentos.
- **README.md**: Explicación sobre cómo utilizar componentes en VHDL y el decodificador BCD a 7 segmentos.

---

## 7. `7_bcd2seg_vector`
### Contenido:
- **base.vhd**: Archivo base que muestra el uso de vectores para la conversión BCD a 7 segmentos.
- **BCD_to_7segment_vector.vhd**: Un decodificador BCD a 7 segmentos que utiliza vectores.
- **README.md**: Explicación sobre el uso de vectores en VHDL.

---

## 8. `8_sumador_4bits_jerarquico`
### Contenido:
- **four_bit_adder.vhd**: Implementación de un sumador de 4 bits.
- **full_adder.vhd**: Utilización del sumador completo (Full Adder).
- **half_adder.vhd**: Utilización del Half Adder.
- **README.md**: Explicación sobre la jerarquía de los sumadores y cómo se implementan.

---

## 9. `9_Deco_bin2BCD`
### Contenido:
- **bcd_to_7seg.vhd**: Decodificador de binario a BCD para su visualización en un display de 7 segmentos.
- **bin_to_bcd.vhd**: Conversor de binario a BCD.
- **main.vhd**: Ejemplo que combina ambos decodificadores.
- **README.md**: Explicación sobre cómo convertir un número binario en BCD y luego visualizarlo en un display de 7 segmentos.

---

## 10. `10_sumador_componentes_visualizacion`
### Contenido:
- **bcd_to_7seg.vhd**: Decodificador BCD a 7 segmentos.
- **bin_to_bcd.vhd**: Conversor de binario a BCD.
- **four_bit_adder.vhd**: Sumador de 4 bits.
- **full_adder.vhd**: Sumador completo.
- **half_adder.vhd**: Half Adder.
- **main.vhd**: Ejemplo de sumador de 4 bits con visualización.
- **paquete.vhd**: Paquete con componentes utilizados en la simulación.
- **README.md**: Explicación sobre la simulación del sumador con visualización en 7 segmentos.

---

## 11. `11_sumador4bits_procesos`
### Contenido:
- **Sumador de 4 bits utilizando procesos en VHDL**. Implementa un sumador con procesos sin la necesidad de componentes.
- **README.md**: Explicación sobre el uso de procesos en VHDL.

---

## 12. `12_comparador_4_bit_componentes`
### Contenido:
- **Comparador de 4 bits** utilizando componentes de 2 bits.
- **README.md**: Explicación sobre la implementación de un comparador utilizando componentes jerárquicos.

---

## 13. `13_manejo_vectores`
### Contenido:
- **Ejemplos de manejo de vectores en VHDL**.
- **README.md**: Explicación detallada sobre cómo manipular vectores de bits, concatenarlos y extraer porciones de ellos en VHDL.
