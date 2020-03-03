[`Lenguajes de Programación`](../../README.md) > [`Sesión 02`](../README.md) > `Ejemplo 01`

## Ejemplo 1: Asignaciones locales

### OBJETIVO

- Conocer las principales asignaciones locales de __Haskell__.

#### REQUISITOS

- WinGHCi instalado

#### DESARROLLO

En la sesión pasada, definimos una función que calcula el área de un círculo a partir de su diámetro. Esta función, muestra un cálculo repetido: la división del parámetro `d` entre 2. Este tipo de cálculo resulta ser inefiniciente, por lo que Haskell provee dos formas: `let` y `where` que permiten definir variables con alcance local.

##### Asignaciones locales con `let`

La primitiva let tiene la siguiente sintaxis:

```haskell
let <variable> = <valor> in
   <cuerpo>
```

Esta primitiva permite asignar un nombre a expresiones a través de variables con alcance local. De esta
forma, se obtiene una expresión más eficiente, en cuanto a la evaluación se refiere, debido a que el valor
asociado a la variable o asignación local, sólo se calcula una vez.

**Ejemplo.** Modificar la función `areaCirculo` para que haga uso de la primitiva `let` y evite cálculos
repetitivos.

```haskell
-- Función que calcula el área de un círculo dado su diámetro .
areaCirculo2 :: Float -> Float
areaCirculo2 d =
let r = (d / 2) in
   pi * r * r
```

##### Asignaciones locales con `where`

A diferencia de `let`, `where` no es una expresión por sí misma pues debe aparecer siempre dentro de la
especificación de una función. La sintaxis de una función que usa `where` es la siguiente:

```haskell
<nombreFuncion> <parametro1> ... = <resultado>
   where <variable> = <valor>
```

**Ejemplo.** Modificar la función `areaCirculo` para que haga uso de `where` y evite cálculos repetitivos.

```haskell
-- Función que calcula el área de un círculo dado su diámetro .
areaCirculo3 :: Float -> Float
areaCirculo3 d = pi * r * r
   where r = (d / 2)
```   
