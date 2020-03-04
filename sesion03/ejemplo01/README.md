[`Lenguajes de Programación`](../../README.md) > [`Sesión 03`](../README.md) > `Ejemplo 01`

## Ejemplo 1: Definición de listas

### OBJETIVO

- Conocer la sintaxis para manejar listas en __HASKELL__.

#### REQUISITOS

- WinGHCi instalado

#### DESARROLLO

Una lista es una estructura de datos *recursiva* definida mediante los conceptos de *cabeza* y *resto* de la lista. De la misma forma se tienen lista vacía, representadas por `[]`.

   - La cabeza de la lista representa al primer elemento.
   - El resto de la lista representa la lista que se encuentra justo después del primer elemento.
   
Por ejemplo, podemos definir una lista con los números enteros del 1 al 5. Para construir listas se usa el operador `cons` que toma una cabeza y un resto y genera la lista correspondiente. La operación `cons` se representa por el símbolo `:`. Veamos cómo construir la lista.

```haskell
Prelude> 1:2:3:4:5:[]
[1,2,3,4,5]
```

Esta representación es útil para construir listas a través de programación, sin embargo, para definir listas con elementos concretos, basta con definir los elementos de la lista, separando cada uno con comas y delimitando la expresión con corchetes. Por ejemplo:

```haskell
Prelude> [1,2,3,4,5]
[1,2,3,4,5]
```

**Observación.** *Los elementos de las listas son de tipo **homogéneo**. Esto quiere decir que todos deben ser del mismo tipo de dato*.

##### Funciones sobre listas

Algunas funciones definidas para lista son:

- `reverse` Invierte una lista.

   ```haskell
   Prelude> reverse [1,2,3,4]
   [4,3,2,1]
   ```
   
- `++` Concatena dos listas.

   ```haskell
   Prelude> [1,2,3] ++ [4,5,6]
   [1,2,3,4,5,6]
   ```
   
- `!!` Obtiene el *n*-ésimo elemento de una lista.

   ```haskell
   Prelude> [1,2,3] !! 1
   2
   ```

- `head` Obtiene la cabeza de una lista.

   ```haskell
   Prelude> head [1,2,3]
   1
   ```

- `tail` Obtiene el resto de una lista.

   ```haskell
   Prelude> tail [1,2,3]
   [2,3]
   ```

- `last` Obtiene el último elemento de una lista.
   
   ```haskell
   Prelude> last [1,2,3]
   3
   ```
   
- `init` Obtiene la lista sin el último elemento.

   ```haskell
   Prelude> init [1,2,3]
   [1,2]
   ```
   
- `take` Toma los primeros *n* elementos de una lista.

   ```haskell
   Prelude> take 2 [1,2,3]
   [1,2]
   ```
   
- `drop` Elimina los primeros *n* elementos de una lista.

   ```haskell
   Prelude> drop 2 [1,2,3]
   [3]
   ```

En la siguiente imagen podemos apreciar los elementos básicos de una lista.

![imagen](http://s3.amazonaws.com/lyah/listmonster.png)
