[`Lenguajes de Programación`](../../README.md) > [`Sesión 04`](../README.md) > `Ejemplo 01`

## Ejemplo 1: Reducción de funciones

### 1. Objetivos :dart:

- Aplicar los conceptos de funciones de primera clase en __Haskell__.

### 2. Requisitos :cliboard:

- __Haskell__ instalado en tu equipo.

### 3. Desarrollo :rocket:

En la [Nota de Clase 3](https://sites.google.com/view/uacmldp20201/material) se definió el proceso de reducción de expresiones y se ejemplificó usando el lenguaje __FLAE__. Ahora aplicaremos estos conceptos para analizar el proceso de reducción de funciones directamente en __Haskell__.

1. Hasta ahora, hemos visto únicamente funciones con nombre. Pero en realidad, éstas son en realidad etiquedas para poder manipular a las funciones de forma más sencilla. En realidad, cada que definimos una función con un nombre, por detrás se está generando una función *anónima*, similar a la primitiva `fun` de nuestro lenguaje.

   Este tipo de función es llamado *lambda* y hace referencia al Cálculo Lambda de Alonzo Church. La sintaxis de una lambda en __Haskell__ es la siguiente:

   ```haskell
   \p -> b
   ```

   Por ejemplo, si definimos la función `doble` como se muestra a continuación:

   ```haskell
   doble :: Int -> Int
   doble n = 2 * n
   ```

   Para evaluar por ejemplo `doble 3`, debemos encontrar la lambda que encapsula esta función y aplicar las Beta-reducciones correspondientes.

   ```
   > doble 3
   = (\n -> 2 * n) 3
   -> (2 * n)[n := 3] = 2 * 3
   -> 6
   ```

1. Al comportarse como funciones anónimas, todas las propiedades, estudiadas en clase, se cumplen. Es decir:

   - Las funciones son currificadas, en realidad no son funciones de múltiples parámetros.

     ```
     Prelude> (\x y -> x + y) 2 3
     5
     Prelude> ((\x -> \y -> x + y) 2) 3
     ```

   - La aplicación tiene el mayor nivel de precedencia y asocia a la izquierda.

     ```
     Prelude> a = 2
     Prelude> b = 4
     Prelude> (\x -> x + 2) a - b
     0
     Prelude> (\x -> x 2) (\y -> (\z -> y + 3)) 4
     5
     ```

   - Las funciones son tratas como miembros de primera clase, como se aprecia en los ejemplos anteriores. Otro ejemplo, podría darse en las funciones `map` y `filter`.

     ```
     Prelude> map (\x -> x + 13) [1,2,3,4]
     [14,15,16,17]
     Prelude> filter (\x -> mod x 5 == 0) [1,2,3,4,5,6,7,8,9,10]
     [5,10]
     ```

   - Finalmente, puedo componer funciones.

     ```
     Prelude> map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
     [-5,-3,-6,-7,-3,-2,-19,-24]
     ```


[`Anterior`](../README.md) | [`Siguiente`](../actividad/README.md)   
