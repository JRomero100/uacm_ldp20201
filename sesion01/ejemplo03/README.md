[`Lenguajes de Programación`](../../README.md) > [`Sesión 01`](../README.md) > `Ejemplo 02`

## Ejemplo 3: Funciones predefinidas

### OBJETIVO

- Conocer algunas de las principales funciones de __Haskell__.

#### REQUISITOS

- WinGHCi instalado.

#### DESARROLLO

Para usar funciones sobre los tipos básicos, debe especificarse el nombre de la función a aplicar e indicar los
argumentos de la función separando cada uno por espacios. A continuación se presentan algunos ejemplos.

##### Funciones lógicas

Se tienen funciones básicas de la lógica como son la negación, conjunción, disyunción y algunas otras de
comparación.

```haskell
Prelude> not True
False
Prelude> True && False
False
Prelude> False || True
True
Prelude> 1 == 1
True
Prelude> 1 /= 1
False
```

Como puede apreciarse, la función `not` representa la negación, la función `&&` la conjunción y finalmente, la
función `||` la disyunción de expresiones lógicas.

*Observación*: Es importante destacar que todas las funciones de Haskell, son en un principio prefijas, sin embargo, existen algunas funciones que pueden usarse infijamente siempre y cuando, éstas reciban dos parámetros. La disyunción y conjunción son ejemplos de estas funciones.

##### Funciones aritméticas

Al igual que las funciones lógicas, la mayoría de funciones aritméticas funcionan infijamente. Para usar una
función prefija que recibe dos parámetros de manera infija se puede delimitar el nombre de la función por el
símbolo ‘ como es el caso de la función `div`.

```haskell
Prelude> 1 + 2 + 3
6
Prelude> 2/3 - 1/3
0.3333333333333333
Prelude> 2 * 3 * 6
36
Prelude> 10 / 2 / 2
2.5
Prelude> div 5 2
2
Prelude> 5 ‘div‘ 2
2
Prelude> 2^3
8
Prelude> 2**3
8.0
Prelude> sqrt 81
9
Prelude> mod 10 2
0
Prelude> max 1 2
2
Prelude> min 1 2
1
```

##### Manejo de cadenas

```haskell
Prelude> length "Manzana"
7
Prelude> "Manzana" !! 3
’z’
Prelude> "Man" ++ "zana" 
"Manzana"
```
