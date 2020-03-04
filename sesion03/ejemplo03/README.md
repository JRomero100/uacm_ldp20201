[`Lenguajes de Programación`](../../README.md) > [`Sesión 03`](../README.md) > `Ejemplo 03`

## Ejemplo 3: Funciones de orden superior 

### OBJETIVO

- Usar funciones de orden superior para resolver algunos problemas.

#### REQUISITOS

- WinGHCi instalado.

#### DESARROLLO

En Haskell, las funciones pueden ser pasadas como parámetro. En particular con el uso de listas, existen funciones que reciben otras funciones, llamadas *funciones de orden superior*.

##### Mapeos

Un *mapeo* o simplemente `map` es el resultado de aplicar una función a cada elemento de una estructura. Por ejemplo, en Haskell tenemos la función `map` aplica una función a cada elemento de una lista. 

```haskell
Prelude> map mes [1,2,3]
["Enero", "Febrero", "Marzo"]
```

La filta de `map` es la siguiente:

`map :: (a -> b) -> [a] -> [b]`

*Recibe una función de `a` a `b`, una lista de `a` y devuelve una lista de `b`*.

##### Filtros

Un *filtro* como su nombre lo dice, filtra los elementos que cumplen con una condición que es expresada mediante una función. Por ejemplo, supongamos que queremos los números pares de una lista.

```haskell
Prelude> filter even [1,2,3,4]
[2,4]
```

Lo que hace esta función es aplicar la función recibida a cada elemento de la lista, si al aplicar la función el resultado es verdadero, entonces deja el resultado en la lista, en caso contrario, lo quita.

La filta de `filter` es la siguiente:

`filter :: (a -> Bool) -> [a] -> [a]`

*Recibe una función de `a` a `Bool`, una lista de `a` y devuelve una lista de `a`*.
