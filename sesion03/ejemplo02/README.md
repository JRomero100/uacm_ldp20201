[`Lenguajes de Programación`](../../README.md) > [`Sesión 02`](../README.md) > `Ejemplo 02`

## Ejemplo 2: Condicionales

### OBJETIVO

- Conocer los principales tipos de condicionales de __Haskell__.

#### REQUISITOS

- WinGHCi instalado.

#### DESARROLLO

De la misma forma que en matemáticas, en Haskell pueden definirse funciones por partes de acuerdo a
ciertas condiciones. Para establecer estas condiciones existen principalmente dos primitivas: `if` y guardias.
La primera primitiva es usada por lo general cuando se tiene una única condición mientras que la segunda
se usa cuando se tienen dos o más condiciones.

##### Condicional `if`

La sintaxis del condicional `if` es la siguiente:

```haskell
if <condición> then <then-expr> else <else-expr>
```

El primer valor `<condición>` debe ser una expresión booleana, el segundo valor `<then-expr>` se evaluará
siempre que la condición sea verdadera, y el tercer valor `<else-expr>` se ejecutará cuando no lo sea.

**Ejemplo.** Definir la función `valorAbsoluto` tal que `(valorAbsoluto x)` es el valor absoluto de un
número entero. Por ejemplo:

```haskell
valorAbsoluto 1729 = 1729
valorAbsoluto -265 = 265
```

```haskell
-- Función que calcula el valor absoluto de un número entero.
valorAbsoluto : Integer -> Integer
valorAbsoluto x = if x < 0 then x * (-1) else x
```

La condición se encuentra en la línea 3 `(x < 0)`, si el valor de entrada es menor que cero, entonces se
multiplicará el mismo por -1 y en caso contrario se regresa el valor tal cual.

##### Guardias

Al igual que `where`, las guardias sólo pueden usarse con funciones. La sintaxis de una función que hace uso
de guardias, es la siguiente:

```haskell
<nombreFuncion> <parametro1> ...
  | <condición1> = <expresión1>
  ...
  | otherwise = <expresión2>
```

Se tienen una serie de expresiones de la forma `<condición> = <expresion>` representando los posibles
casos y el valor a devolver en caso de que se cumpla la condición. Opcionalmente se tiene un caso otherwise
que se evalúa siempre que ninguna condición anterior haya sido verdadera.

**Ejemplo 8.** Definir la función `nombreMes` tal que `(nombreMes n)` es el nombre del mes representado por
el número entero `n`. Por ejemplo:

```haskell
nombreMes 8 = "Agosto"
nombreMes 10 = "Octubre"
nombreMes 11 = "Noviembre"
```

```haskell
-- Función que obtiene el nombre del mes representado por el número
-- recibido como parámetro.
nombreMes :: Integer -> String
nombreMes n
  | n == 1 = "Enero"
  | n == 2 = "Febrero"
  | n == 3 = "Marzo"
  | n == 4 = "Abril"
  | n == 5 = "Mayo"
  | n == 6 = "Junio"
  | n == 7 = "Julio"
  | n == 8 = "Agosto"
  | n == 9 = "Septiembre"
  | n == 10 = "Octubre"
  | n == 11 = "Noviembre"
  | n == 12 = "Diciembre"
  | otherwise = error "Mes inválido"
