[`Lenguajes de Programación`](../../README.md) > [`Sesión 01`](../README.md) > `Ejemplo 04`

## Ejemplo 4: Definición de funciones

### OBJETIVO

- Definir algunas funciones propias en __Haskell__.

#### REQUISITOS

- WinGHCi instalado.

#### DESARROLLO

Adicional a las funciones predefinidas sobre los tipos de datos básicos, es posible definir funciones propias.
El diseño de funciones es un proceso que debe seguir una serie de pasos ordenados y bien especificados para
garantizar su correcto funcionamiento, a continuación se presenta un método de definición de funciones y se
presentan algunos ejemplos junto a su solución.

##### Método de definición de funciones

Cuando se define una función que cumple cierto objetivo, se recomienda seguir los siguientes pasos en el
orden en que se indica:

- Entender lo que la función tiene que hacer.
- Escribir su contrato, o sea, su tipo (cuántos parámetros, de qué tipo, qué regresa).
- Escribir la descripción de la función a través de los comentarios.
- Finalmente, implementar el cuerpo de la función.

Para especificar el contrato de una función se usa una notación similar a la del dominio y contradominio de
las funciones matemáticas. Se usa la siguiente sintaxis:

```<nombreFuncion> :: <TipoParámetro1> -> ... -> <TipoParámetroN> -> <TipoSalida>```

Se especifica el nombre de la función, se especifica el tipo de cada parámetro separado por una flecha (->) y
se indica el tipo de la salida de la función al final. Por convención, para nombrar funciones, se usa notación
de camello, es decir, la primera palabra que identifica la función se escribe en minúsculas y el resto inicia con una letra mayúscula.

Para especificar la descripción de la función, se usan comentarios. En Haskell existen dos tipos de comentarios:

**De una línea**

```haskell
-- Comentario de una línea
```

**De varias líneas**

```haskell
{- Este es un comentario
   de varias líneas -}
```

Finalmente, para definir una función en su forma más simple, se usa la siguiente sintaxis:

```<nombreFuncion> <parametro1> ... <parametroN> = <salida>```

Se debe especificar un nombre para la función, una secuencia de parámetros de entrada separados por
espacios (puede no haber parámetros), un símbolo de igual (=) y un cuerpo.

Para definir funciones en un archivo .hs se debe crear un módulo cuyo nombre sea el mismo del archivo.
Por ejemplo si el archivo se llama `Ejemplo1.hs`, la primera línea del archivo debe ser:

```haskell
module Ejemplo1 where
```

##### Ejemplos de definición de funciones

**Ejemplo 1.** Definir la función ultimaCifra tal que (ultimaCifra x) es la última cifra del número x. Por ejemplo:

```haskell
ultimaCifra 325 = 5
```

*Solución:*

```haskell
-- Función que obtiene la última cifra de un número entero .
ultimaCifra :: Integer -> Integer
ultimaCifra x = mod x 10
```

**Ejemplo 2** Definir la función maxTres tal que (maxTres x y z) es el máximo de x, y y z. Por ejemplo:

```haskell
maxTres 6 2 4 = 6
maxTres 6 7 4 = 7
maxTres 6 7 9 = 9
```

*Solución:*

```haskell
-- Función que obtiene el máximo de tres números enteros .
maxTres :: Integer -> Integer -> Integer -> Integer
maxTres x y z = max x (max y z )
```

**Ejemplo 3** Definir la función xor1 que calcule la disyunción excluyente a partir de la tabla de verdad.
Usar 4 ecuaciones, una por cada línea de la tabla.

*Observación.* l operador de disyunción excluyente devuelve `True` siempre que una de las dos fórmulas sea
verdadera y la otra sea falsa.

*Solución* 

```haskell
-- Disyunción excluyente a partir de tablas de verdad .
xor1 :: Bool -> Bool -> Bool
xor1 False False = False
xor1 False True = True
xor1 True False = True
xor1 True True = False
```

**Ejemplo 4** Definir la función areaCirculo tal que (area-circulo d) calcula el área de un círculo de
diámetro d. Por ejemplo:

```haskell
areaCirculo 10 = 78.53
areaCirculo 4 = 12.56
areaCirculo 16 = 201.06
```

*Solución* 

```haskell
-- Función que calcula el área de un círculo dado su diámetro .
areaCirculo :: Float -> Float
areaCirculo d = pi * (d / 2) * ( d / 2)
```

Descarga estas definiciones [aquí](Ejemplo1.hs)
