[`Lenguajes de Programación`](../README.md) > `Sesión 4`

## Sesión 4: Funciones de Primera Clase

<img src="../imagenes/pizarron.png" align="right" height="100" width="100" hspace="10">

Como hemos visto, las funciones de los lenguajes de programacion funcionales como __Haskell__ tiene características que
las hacen distintas a las de cualquier otro lenguaje. En particular, decimos que las funciones de un lenguaje de 
programación son de *primera clase*, si puedo pasarlas como parámetro a otras funciones, si puedo devolverlas como
resultado, guardarlas en estructuras de datos y en general, tratarlas como cualquier otro valor en el lenguaje.

En esta sesión revisaremos cómo es que __Haskell__ maneja estos conceptos y los aplicaremos revisando tres conceptos
esenciales que debes saber sobre las funciones: aplicación de funciones, funciones *lambda* y composición.

### :dart: <ins>Aplicación de funciones</ins>

Hemos visto ya, cómo definir funciones en __Haskell__, pero no hemos visto cómo es su proceso de evaluación. Veamos un
ejemplo. Para ejemplificar esto, usaremos la función `doble`:

```haskell
-- Función que obtiene el doble de un número.
doble :: Int -> Int
doble x = 2*x
```

```
Ejemplo> doble 2 + 3
...
```

¿Cuál debería ser resultado de esta llamada? ¿Aplicar `(doble 2) + 3`? ¿Aplicar `doble (2 + 3)`?

Para contestar a estas preguntas, necesitamos saber la precedencia de una función. La precedencia nos indica qué 
operador aplicar en una expresión cuando tenemos más de un tipo presente. En este caso, decimos que la aplicación de funciones *siempre tiene la mayor precedencia*. Por lo tanto, primero aplicamos la función y luego sumamos `(doble 2) +
3`:

```
Ejemplo> doble 2 + 3
7
```

¿Qué debería devolver la siguiente ejecución?

```
Ejemplo> doble doble 2
...
```

¿Aplicar `(doble doble) 2`? ¿Aplicar `doble (doble 2)`?

Para saber la respuesta, en este caso necesitamos conocer la asociatividad de las funciones. La asociatividad nos indica
cómo evlauar expresiones en el caso de tener más de un operador del mismo tipo presente. En este caso, la aplicación de
función asocia a la izquierda. Es decir, si se tienen las funciones `f`, `g` y `h` a evaluar con `x`, la forma de 
asociar será: `((f g) h) x`.

De forma que el código anterior, lanzaría un error:

```
Ejemplo> doble doble 2
<interactive>:2:1: error:
...
```

Sin embargo, a pesar de esta precedencia y asociatividad. __Haskell__ provee una función muy útil llamada `$`. La 
función `$` define una aplicación de función, pero usando el nivel de precedencia más bajo y asociando a la derecha.
Además se usa infijamente. Por ejemplo:

```
Ejemplo> doble $ 2 + 3
10
Ejemplo> doble $ doble $ 3
12
```

- En el primer caso, se toma la suma de mayor precedencia, evaluandose a 5 y finalmente `doble 5` es 10.

- En el segundo caso, se asocia a la derecha, por lo tanto tenemos primero `doble 3` igual a 6 y finalmente `doble 6`
  igual a 12.

---

> :rocket: **Actividad**    
Abre el intérprete de __Haskell__ y carga la definición de `doble` del [**`Ejemplo1.hs`**](codigos/Ejemplo1.hs) prueba cambiar los paréntesis de lugar y modifica
los argumentos de la función, puedes usar otras funciones también. Después cambia esas ejecuciones usando `$`, observa
las diferencias.

---

### :dart: <ins>Funciones lambda</ins>

Al escribir programas en __Haskell__ es común que se necesite definir una función que no esté definida dentro del
preludio de __Haskell__ y se tenga que definir una función auxiliar. Hay casos particulares en los que dicha función
no se usa mas que para aplicar casos muy sencillos y quizá su definición no sea del todo útil. En estos casos decimos
que el nombre de la función no es relevante, a diferencia de su comportamiento.

Es posible definir funciones de este tipo, es decir, sin nombre,son llamadas *funciones anónimas* o *lambdas*.

Para definir una *lambda*, se usa la siguiente sintaxis:

```
\<parametro>* -> <cuerpo>
```

Se comportan como cualquier otra función en el lenguaje y en particular podemos pasarlas a otras funciones. Veamos
algunos ejemplos:

```
Ejemplo> (\x -> x*2) 2 + 3
7
Ejemplo> (\x -> x*2) (2 + 3)
10
Ejemplo> (\x -> x*2) $ (\x -> x*3) $ 5
30
Ejemplo> map (\x -> x^5) [1,2,3,4]
[1,32,243,1024]
```

- En los primeros tres ejemplos, vemos el uso de la función lambda de forma idéntica a como usamos anteriormente a la
  función `doble`, con la diferencia de que no estamos dando un nombre a esta función.

- En el segundo ejemplo se usa la función `map` sobre listas. Esta función recibe una función y la aplica a cada 
  elemento que almacena. En este caso eleva a la 5 cada uno de sus elementos.

---

> :rocket: **Actividad**    
Abre el intérprete de __Haskell__ y ejecuta todas las expresiones presentadas. Combina el uso de `map` con otras lambdas
definidas por ti. Pon en práctica todo lo que haz aprendido en estas sesiones. Por ejemplo, escribe una función que
dado un número entero, muestre su tabla de multiplicar del uno al 10. Puedes usar `map`, tuplas, lambdas, listas por
comprensión, etc. ¡No te limites!

---

### :dart: <ins>Composición de funciones</ins>

En matemáticas podemos componer dos funciones de forma que se cree una nueva a partir de esas dos de forma que al aplicar esta nueva función con un parámetro, se haga una evaluación compuesta.

Es decir, si tenemos una función, digamos `f` y otra función `g`, las componemos y las evaluamos con un argumento `x`, primero evaluaremos `g x` y ese resultado será el que reciba `f`.

Para componer funciones en __Haskell__ se usa la función `.`.

Por ejemplo, supongamos que tengo una lista de números y quiero hacerlos todos negativos. No puedo simplemente 
multiplicar por `-1` pues los números negativos se volverían positivos. Así es que más conveniente primero calcular el
valor absoluto con la función `abs` y después volverlos negativos con la función `negate`.

Una posible solución sería:

```
Prelude> map negate $ map abs [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]
```

Esta solución aunque es útil, hace uso dos veces de `map`. Podríamos usar una lambda que agrupe la aplicación de las
dos funciones en una:

```
Prelude> map (\x -> negate $ abs x) [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]
```

Esto es mucho más corto y de hecho es la definición de la composición de funciones. La lambda que dimos en el ejemplo anterior es lo que devuelve la función `.` con la composición de `negate` y `abs`.

```
Prelude> map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
[-5,-3,-6,-7,-3,-2,-19,-24]
```	

---

> :rocket: **Actividad**    
Abre el intérprete de __Haskell__ y ejecuta todas las expresiones presentadas. Prueba componiendo funciones diferentes.

---

[`Anterior`](../sesion03/README.md) | [`Siguiente`](../sesion05/README.md)