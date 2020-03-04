[`Lenguajes de Programación`](../../README.md) > [`Sesión 03`](../README.md) > `Ejemplo 01`

## Ejemplo 1: Definición de tuplas

### OBJETIVO

- Conocer la sintaxis para manejar tuplas en __HASKELL__.

#### REQUISITOS

- WinGHCi instalado

#### DESARROLLO

Una tupla es una estructura de datos definida mediante un número indefinido de elementos. Los elementos se separan por comas y son delimitados por paréntesis. A las tuplas con dos elementos se les llama *pares*. Por ejemplo,

```haskell
Prelude> (1,2,3)
(1,2,3)
```

Los elementos de una tupla son **heterogéneos** esto quiere decir que no necesariamente son del mismo tipo. Además, una vez que definimos una tupla no podemos cambiar su tamaño (número de elementos) ni modificarlos. Por ejemplo,

```haskell
Prelude> ("Edad", 18)
("Edad", 18)
```

A las tuplas con dos elementos se les llama *pares* y se puede acceder a sus elementos usando las funciones `fst` y `snd`. Por ejemplo,

```haskell
Prelude> fst (1,2)
1
Prelude> snd (1,2)
2
```

##### Funciones que usan tuplas

Para definir funciones que usan tuplas basta con indicar en la firma que la función espera una función. Por ejemplo, usaremos pares para representar vectores y sus operaciones.

```haskell
-- Función que aplica la suma de vectores.
suma :: (Float,Float) -> (Float,Float) -> (Float,Float)
suma u v = (fst u + fst v, snd u + snd v)
```

```haskell
-- Función que multiplica por un escalar k un vector.
productok :: Float -> (Float,Float) -> (Float,Float)
protudtok k u = (k * fst u, k * snd u)
```
