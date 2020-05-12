[`Lenguajes de Programación`](../README.md) > `Sesión 11`

## Sesión 11: Tipos de Datos Recursivos

<img src="../imagenes/pizarron.png" align="right" height="100" width="100" hspace="10">

Ya hemos visto la definición de algunos tipos de datos con anterioridad y de hecho algunos de estos, han sido definidos
de forma recursiva. Por ejemplo, el intérprete de __Mini-Lisp__ que definimos en la Sesión 8.

En general cualquier tipo de dato definido con `data` puede implementar recursión. Basta con definir algún constructor
en términos del propio tipo de dato. En esta sesión estudiaremos algunos tipos de datos recursivos y modificaremos la
forma en la que __Haskell__ los muestra en pantalla. En esta sesión definiremos algunos tipos de datos con algunas
operaciones asociadas a éstos.

### :dart: <ins>Números naturales</ins>

---

> :green_book: **Definición.**   
Los números naturales se definen recursivamente como sigue:
> - El cero es un número natural.
> - Si *n* es un número natural entonces *s(n)* también lo es. Llamamos a *s* el sucesor de *n*.
> - Son todas.

---

Construimos el tipo de dato en __Haskell__ como sigue:

```haskell
data Nat = Cero
         | Suc Nat
         deriving(Show)
```

- Tipos de los constructores:

   ```
   Naturales> :t Cero
   Cero :: Nat
   Naturales> :t Suc 
   Suc :: Nat -> Nat
   ```

- Ejemplos de naturales:

   ```
   Naturales> Cero
   Cero
   Naturales> Suc Cero
   Suc Cero
   Naturales> Suc (Suc Cero)
   Suc (Suc Cero)
   ```

#### Funciones sobre Naturales

```haskell
-- Función que dado un número natural obtiene su equivalente entero.
natToInt :: Nat -> Int
natToInt Cero = 0
natToInt (Suc n) = 1 + natoToInt n

-- Función que dado un número entero obtiene su equivalente natural.
intToNat :: Int -> Nat
intToNat 0 = Cero
intToNat n = Suc (intToNat (n-1))

-- Función que dados dos números naturales, obtiene su suma.
sumaNat :: Nat -> Nat -> Nat
sumaNat Cero m = m
sumaNat (Suc n) m = Suc (suma n m)
```

```
Naturales> suma (Suc Cero) (Suc (Suc Cero))
Suc (Suc (Suc Cero))
```

---

> :rocket: **Actividad.**    
Carga el archivo [**`Naturales.hs`**](codigos/Naturales.hs) y prueba construir números naturales. Analiza las funciones
que se definieron y trata de generar su evaluación paso a paso. Define una función para multiplicar dos números 
naturales.

---

### :dart: <ins>Listas</ins>

---

> :green_book: **Definición.**   
Las listas con elementos en un conjunto *A* se definen recursivamente como sigue:
> - La lista vacía es una lista.
> - Si *x* es un elemento de un conjunto *A* y *xs* es una lista con elementos en *A* entonces *x:xs* es una lista. 
Llamamos a *x* la cabeza de la lista y a *xs* la cola.
> - Son todas

---

Dado que nuestras listas pueden definirse para cualquier conjunto *A*, añadiremos una variable de tipo como parámetro.
Esta variable se instanciará con un tipo concreto en tiempo de ejecución, mismo que puede inferir el algoritmo de 
inferencia de tipos de __Haskell__.

```haskell
data Lista a = Nil
             | Cons a (Lista a)
             deriving(Show)
```

- Tipos de los constructores:

   ```
   Listas> :t Nil
   Nil :: Lista a
   Listas> :t Cons
   Cons :: a -> Lista a -> Lista a
   ```

- Ejemplos de listas:

   ```
   Listas> Nil
   Nil
   Listas> Cons 1 (Cons 2 (Cons 3 Nil))
   Cons 1 (Cons 2 (Cons 3 Nil))
   ```

#### Funciones sobre listas

```haskell
-- Función que calcula la longitud de una lista.
longitud :: Lista a -> Int
longitud Nil = 0
longitud (Cons _ xs) = 1 + longitud xs
```

---

> :rocket: **Actividad.**    
Carga el archivo [**`Listas.hs`**](codigos/Listas.hs) y prueba construir listas. Analiza la función que se definió y trata de generar su evaluación paso a paso. Define una función para encontrar la reversa de una lista.

---

### :dart: <ins>Árboles Binarios</ins>

---

> :green_book: **Definición.**   
Los árboles binarios con elementos enteros, se definen recursivamente como sigue:
> - Si *n* es un número entero, entonces *hoja(n)* es un árbol binario.
> - Si *T1* y *T2* son árboles binarios y *n* es un número entero, entonces *nodo(T1,n,T2)* es un árbol binario.
> - Son todas

---

Construimos el tipo de dato en __Haskell__ como sigue:

```haskell
data ArbolB = Hoja Int
            | Nodo ArbolB Int ArbolB
            deriving(Show)
```

- Tipos de los constructores:

   ```
   Arboles> :t Hoja
   Hola :: Int -> ArbolB
   Arboles> :t Nodo
   Nodo :: ArbolB -> Int -> ArbolB -> ArbolB
   ```

- Ejemplo de árbol binario:

  ```
        5
       / \
      /   \
     3     7
    / \   / \
   1   4 6   9
   ```

   ```
   Arboles> Nodo (Nodo (Hoja 1) 3 (Hoja 4)) 
                 5 
                 (Nodo (Hoja 6) 7 (Hoja 9))
   Nodo (Nodo (Hoja 1) 3 (Hoja 4)) 
        5 
        (Nodo (Hoja 6) 7 (Hoja 9))
   ```

#### Funciones sobre árboles

```haskell
-- Función que indica si un elemento se encuentra contenido en el árbol.
contiene :: Int -> ArbolB -> Bool
contiene n (Hoja m) = n == m
contiene n (Nodo t1 m t2) = n == m || contiene n t1 || contiene n t2

-- Función que dado un árbol, obtiene la lista que lo represente en inorder.
aplana :: ArbolB -> [Int]
aplana (Hoja m) = [m]
aplana (Nodo t1 m t2) = aplana t1 ++ [m] ++ aplana t2

-- Función que dado un árbol ordenado, indica si un elemento se encuentra en el árbol.
contieneOrd :: Int -> ArbolB -> Bool
contieneOrd n (Hoja m) = n == m
contieneOrd n (Nodo t1 m t2)
	| n == m = True
	| n < m = contieneOrd n t1
	| otherwise = contieneOrd n t2
```

---

> :rocket: **Actividad.**    
Carga el archivo [**`Arboles.hs`**](codigos/Arboles.hs) y prueba construir árboles. Analiza las funciones que se 
definieron y trata de generar su evaluación paso a paso. Define una función para encontrar el promedio de los elementos
de un árbol.

---

`Anterior` | `Siguiente`