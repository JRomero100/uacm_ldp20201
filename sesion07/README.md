[`Lenguajes de Programación`](../README.md) > `Sesión 7`

## Sesión 7: Recursión de cola

Manuel Soto Romero · *31 de marzo de 2020*

### Introducción

<img src="imagenes/imagen1.gif" align="right" height="200" width="200" hspace="10">
<div style="text-align: justify;">

Como hemos visto, la recursión es una técnica que permite definir conceptos en términos de sí mismos. Sin embargo, puede consumir bastante memoria al consumir excesivos registros de activación.

En esta sesión repasaremos la técnica de recursión de cola con el fin de optimizar algunas funciones.

Recordar los pasos:

1. Definir una nueva función añadiendo acumuladores
2. Reescribir el caso base para que regrese el acumulador correspondiente
3. Eliminar las llamadas pendientes y operar con los acumuladores
4. Reescribir la llamada original para que use esta nueva definición

---

#### Ejemplo 1.
Dada la siguiente función de `sumaNat`, transformarla usando la técnica de *recursión de cola*.

```haskell
sumaNat :: Int -> Int
sumaNat 0 = 0
sumaNat n = n + sumaNat n-1
```	

*Solución:*

```haskell
sumaNCola :: Int -> Int -> Int
sumaNCola 0 acc = acc
sumaNCola n acc = sumaNCola (n-1) (n+acc)

sumaNat :: Int -> Int
sumaNat n = sumaNCola n 0
```

---

#### Ejemplo 2.
Dada la siguiente función de `dobles`, transformarla usando la técnica de *recursión de cola*.

```haskell
dobles :: Int -> Int
dobles 0 = 0
dobles n = 2*n + dobles (n-1)
```	

*Solución:*

```haskell
doblesCola :: Int -> Int -> Int
doblesCola 0 acc = acc
doblesCola n acc = doblesCola (n-1) (2*n + dobles (n-1))

dobles :: Int -> Int
dobles n = doblesCola n 0
```

---

#### Ejemplo 3.
Dada la siguiente función de `toma`, transformarla usando la técnica de *recursión de cola*.

```haskell
toma :: Int -> [a] -> [a]
toma 0 l = []
toma n (x:xs) = x:(toma n-1 xs)
```	

*Solución:*

```haskell
tomaCola :: Int -> [a] -> [a] -> [a]
tomaCola 0 l acc = acc
tomaCola n (x:xs) acc = tomaCola n-1 xs (acc ++ [x])

toma :: Int -> [a] -> [a]
toma n l = tomaCola n l []
```

---

### Actividad 6

Dada la definición de `filter`, modificala para que use la técnica de recursión de cola.

**Fecha de entrega:** 4 de abril de 2020

</div>

`Anterior` | `Siguiente`