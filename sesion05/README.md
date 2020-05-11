[`Lenguajes de Programación`](../README.md) > `Sesión 5`

## Sesión 5: Evaluación Perezosa

<img src="../imagenes/pizarron.png" align="right" height="100" width="100" hspace="10">

Como vimos en las Notas de Clase, __Haskell__ es un lenguaje de programación que usa evaluación perezosa. Esto quiere
decir que los argumentos de las funciones no son evaluados hasta que sean estrictamente necesarios. En particular, 
revisamos dos ejemplos de construcción de listas infinitas:

[**`Ejemplo1.hs`**](codigos/Ejemplo1.hs)
```haskell
unos :: [Int]
unos = 1:unos

pot2 :: Int -> [Int]
pot2 n = n:(pot2 (n*2))
```

```
Prelude> take 5 unos
[1,1,1,1,1]
Prelude> take 2 (pot2 2)
[2,4]
```

---

> :rocket: **Actividad.**   
Ejecuta las funciones anteriores, trata de evaluar ambas funciones sin hacer uso de `take` analiza lo que ocurre con la
evaluación. Cambia el primer elemento de las listas y forma tus propias listas infinitas.

---

En esta sesión, construiremos una función que genere números primos usando un algoritmo muy popular llamado [*criba de
Eratóstenes*](https://es.wikipedia.org/wiki/Criba_de_Erat%C3%B3stenes).

### :dart: <ins>El Problema</ins>

---

> :warning: **Problema.**   
Dado un rango de números entre 2 y *n*, elegir únicamente aquellos que sean números primos. Recordar que un número primo
es un número que sólo es divisible entre 1 y entre sí mismo.

---

El algoritmo consiste en tomar cada elemento del rango y eliminar todos aquellos que sean múltiplos del mismo. El
algoritmo continúa hasta que al tratar de eliminar quede exactamente la misma lista. Por ejemplo, supongamos que tenemos
la lista

```
[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
```

Como el primer elemento de la lista es el 2, debemos eliminar todos sus múltiplos quedando: 

```
[2,3,5,7,9,11,13,15,17,19]
```

---

> :rocket: **Actividad.**   
¿Cómo eliminarías estos elementos usando listas por comprensión? Intenta definir esta lista en __Haskell__.

---

Ahora, continuamos con el siguiente número, que en este caso es 3, por lo tanto eliminamos sus múltiplos quedando:

```
[2,3,5,7,11,13,17,19]
```

---

> :rocket: **Actividad.**   
Usando la lista por comprensión que definiste en el ejercicio anterior, define una función que dada una lista y un 
número entero, elimine todos los múltiplos de ese número de la lista:   
>   
> ```quitaMultiplos :: [Int] -> Int -> [Int]```

---

Continuamos ahora con los múltiplos de 5:

```
[2,3,5,7,11,13,17,19]
```

Como la lista que intentamos modificar es exactamente igual, el algoritmo finaliza y la lista resultante únicamente 
tiene números primos. Podemos generalizar este algoritmo para definir una lista *infinita* que genere números primos.

[**`Ejemplo2.hs`**](codigos/Ejemplo2.hs)
```haskell
cribaEratostenes :: [Int] -> [Int]
cribaEratostenes (x:xs) = x:(cribaEratostenes [y | y <- xs, mod y x /= 0])

primos :: [Int]
primos = cribaEratostenes [2..]
```

- La primera función, implementa el algoritmo de la Criba de Eratóstenes. Dada una lista con cabeza `x` y cola `xs`
  construye mediante una lista por comprensión, una lista con `x` como cabeza y como resto, elimina de la cola aquellos
  elementos que sean múltiplos de `x`. Esto se verifica usando el módulo.

  La lista resultante vuelve a pasarse a la función `cribaEratostenes`. Esto es recursión, hablaremos de esto con más
  detalle en la siguiente sesión.

- La segunda función, genera números primos, simplemente llama a la función `cribaEratostenes` para iniciar desde el
  número 2. Al tener evaluación perezosa esta lista no se evalúa hasta que le sea requerido, por lo tanto podemos ir
  tomando elementos de poco a poco usando `take` por ejemplo.

```
Prelude> take 10 primos
[2,3,5,7,11,13,17,19,23,29]
```

---

> :rocket: **Actividad.**   
Ejecuta el código y analiza su implementación. Prueba generar unos cuantos números primos, pero antes de ejecutar la 
función, escribe en papel cómo sería la ejecución en cada uno de los pasos. Analiza las llamadas recursivas en cada
intento.

---

[`Anterior`](../sesion04/README.md) | `Siguiente`