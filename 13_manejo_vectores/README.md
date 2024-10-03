# Proyecto VHDL: Manipulación de Vectores de Bits y Extensión de Signo

Este proyecto consta de tres archivos de VHDL que muestran cómo manipular vectores de bits, extender el signo de 4 bits a 8 bits, y realizar operaciones como invertir y cambiar mitades de bytes. A continuación, se detallan los tres ficheros y los conceptos clave utilizados en ellos.

## Archivos del Proyecto

### 1. `sign_extension.vhd`
Este archivo realiza la **extensión de signo** de una señal de 4 bits a 8 bits. Se toma el bit más significativo de los 4 bits de entrada y se replica para los 4 bits más significativos del resultado de 8 bits, conservando el valor positivo o negativo del número.

### 2. `swap_half_byte.vhd`
Este archivo intercambia la mitad baja y la mitad alta de un byte de 8 bits, extrayendo y luego concatenando las mitades usando el operador `&`.

### 3. `invert_bits.vhd`
Este archivo invierte el orden de los bits en un vector de 10 bits. Los bits más significativos se asignan a los menos significativos y viceversa, utilizando índices para extraer bits específicos.

---

## Conceptos Clave

### Extracción de Bits de Vectores de Bits
En VHDL, es común extraer partes de un vector utilizando rangos de índices. Aquí hay algunos ejemplos:

- **`V_SW(3 downto 0)`**: Extrae los 4 bits menos significativos del vector `V_SW`.
- **`V_SW(9 downto 5)`**: Extrae los 5 bits más significativos del vector `V_SW`.
- **`V_SW(0 to 3)`**: Extrae los primeros 4 bits, pero con un orden creciente (útil en algunos contextos).

### Concatenación de Bits (`&`)
El operador `&` se utiliza en VHDL para concatenar bits o vectores de bits. Este operador toma dos o más señales y las concatena en un nuevo vector.

Ejemplo de concatenación de un bit individual y un vector de bits:

```vhdl
output_8bits <= (others => input_4bits(3)) & input_4bits;
```

En este caso:

others => input_4bits(3): Extiende el bit de signo (input_4bits(3)) a varios bits.
&: Concatena los bits de signo con los 4 bits originales.
Uso de Comillas Simples y Dobles
Comillas simples (' ') se utilizan para bits individuales:

```vhdl
'0'  -- Representa un bit con valor 0
'1'  -- Representa un bit con valor 1
```

Comillas dobles (" ") se utilizan para vectores de bits o cadenas de bits:

```vhdl
"1010"  -- Representa un vector de 4 bits
"11111111"  -- Representa un vector de 8 bits
```

Ejemplos Prácticos
Extensión de Signo: En el archivo sign_extension.vhd, se extiende el bit más significativo de un número de 4 bits a un número de 8 bits. Si el bit más significativo es 0, se llena con ceros, si es 1, se llena con unos.

Concatenación: En el archivo swap_half_byte.vhd, se intercambian los bits superiores e inferiores de un byte de 8 bits:

G_LED <= lower_bits & upper_bits;  -- Intercambiar parte baja y alta

Inversión de Bits: En el archivo invert_bits.vhd, se invierte el orden de los bits en un vector:

G_LED <= V_SW(0 to 9);  -- Invierte los bits
