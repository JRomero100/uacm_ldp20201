[`Lenguajes de Programación`](../README.md) > `Sesión 5`

## Sesión 5: Evaluación perezosa

Manuel Soto Romero · *17 de marzo de 2020*

### Introducción

<img src="imagenes/imagen1.gif" align="right" height="200" width="200" hspace="10">
<div style="text-align: justify;">	

La evaluación perezosa es una propiedad de los lenguajes de programación que permite postergar la evaluación de 
expresiones hasta que sean usadas en un programa.   

__Haskell__ es un lenguaje de programación que hace uso de evaluación perezosa. Tal y como se muestra en la 
<a href="https://drive.google.com/file/d/1_eE9gZPW1V8isPE1qw0yyTRhBS1VT7Zc/view" target="_blank" >Nota de Clase 5</a>, 
dos de las principales ventajas de contar con evaluación perezosa son: (1) se evita la evaluación de expresiones que no 
son usadas jamás en un programa y (2) la definición de estructuras de datos infinitas. En esta sesión, revisaremos 
principalmente ejemplos de definición de listas infinitas aprovechando el uso de la evaluación perezosa.

---

#### Ejemplo 1.
En la siguiente expresión, nunca es evaluada la división por cero, misma que en un lenguaje con evaluación glotona, 
generaría un error aunque no sea usada jamás la variable correspondiente.

```
Sesion5> let a = 10/0 in 2 + 2
4
```

---

#### Ejemplo 2.
Las listas en general, pueden ser tratadas como estructura infinitas, debido a la evaluación perezosa. Por ejemplo, 
podemos definir listas mediante lo que se conoce como *rango*. Un rango permite construir listas mediante los símbolos
`..`. Por ejemplo, si queremos definir una lista con los números naturales, podemos escribir:

```
Sesion5> [0..]
[0,1,2,3,4,5,6,7,8,9,10,...]
```

Usamos puntos suspensivos para denotar que la lista se vuelve infinita, esto se puede comprobar ejecutando `[0..]` desde
el intérprete de __Haskell__.

---

#### Ejemplo 3.
Para procesar este tipo de listas infinitas, podemos asignar su definición a una variable y dado que la variable no será
ejecutada hasta que se solicite, la construcción de la lista se postergará debido a la evaluación glotona. Para asignar
variables dentro del intérprete se usa `let`.

```
Sesion5> let nat = [0..]
```

De esta forma, podemos obtener elementos de la lista, usando las funciones de listas que ya conocemos. Por ejemplo, la
podemos obtener la cabeza de la lista con `head`.

```
Sesion5> head nat
0
```

Otra función de utilidad podría ser `take` que toma los primeros `n` elementos de una lista. Por ejemplo, si queremos
obtener los primeros 10 números naturales, escribimos:

```
Sesion5> take 10 nat
[0,1,2,3,4,5,6,7,8,9]
```

---

#### Ejemplo 4
Otra forma de definir listas infinitas es mediante la definición de funciones recursivas. Por ejemplo, la siguiente
función define una lista infinita de unos:

```haskell
unos :: [Int]
unos = 1:unos
```

El primer elemento de la lista es un 1, mientras que la cola de la lista es la llamada a la misma lista con la misma 
estructura, un uno como cabeza y la llamada a ella misma como cola. Estudiaremos el concepto de recursión más adelante.

Si ejecutamos unos, desde el intérprete de __Haskell__ obtenemos una lista infinita de unos.

```
Sesion5> unos
[1,1,1,1...]
```

Y de la misma forma, podemos obtener los elementos usando las funciones `head` y `take`.

```
Sesion5> head unos
1
Sesion5> take 5 unos
[1,1,1,1,1]
```

---

#### Ejemplo 5
Esta forma de definir funciones, permite definir listas más complejas, por ejemplo, una lista con los números pares.
En este caso, la función deberá recibir un parámetro indicando dónde iniciar la lista. 

```haskell
pares :: Int -> [Int]
pares n = n:(pares n*2)
```

```
Sesion5> pares 2
[2,4,6,8,10,12,14,...]
Sesion5> head (pares 2)
2
Sesion5> take 5 (pares2)
[2,4,6,8,10]
```

---

#### Ejemplo 6
Otra forma de definir listas, es mediante lo que se conoce como *lista por comprensión*, similar a los conjuntos por
comprensión. Por ejemplo, la lista de números pares entre 0 y 10.

```
Sesion5 > [2*x | x <- [0..5]]
[0,2,4,6,8,10]
```

La lista anterior se lee cómo:

*La lista de las equis multiplicadas por dos **tal que** x es la lista de números del 0 al 5*.

Usando este tipo de listas podemos definir una lista de otros tipos de datos. Por ejemplo, podemos construir una lista 
de pares donde la primera entrada sea un número natural y la segunda entrada sea la aplicación de una función a dicho 
número.

```haskell
aplica :: (Int -> a) -> [(Int,a)]
aplica f = [(x,f x) | x <- [0..]]
```

Por ejemplo, si usamos la *lambda* `\x -> x+2` se obtiene:

```
Sesion5> let prueba = aplica (\x -> x+2)
Sesion5> head prueba
(0,2)
Sesion5> take 5 prueba
[(0,2),(1,3),(2,4),(3,5),(4,6)]
```

---

### Actividad 5

<img src="imagenes/imagen2.jpeg" align="right" height="200" width="200" hspace="10">


Usando listas infinitas (por comprensión), define una función `tablas` que dado un número, construya una lista infinita
con la tabla de multiplicar de dicho número. 

```haskell
tablas :: Int -> [(Int,Int,Int)]
tablas n = ...
```

Por ejemplo:

```
Actividad5> let cinco = tablas 5
Actividad5> head cinco
(5,0,0)
Actividad5> take 3 cinco
[(5,0,0),(5,1,5),(5,2,10)]
Actividad5> cinco !! 6
(5,5,25)
```

</div>

`Anterior` | `Siguiente`