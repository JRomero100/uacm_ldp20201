module Ejemplo2 where

    -- Función que obtiene los factores de un número entero.
    factores :: Int -> [Int]
    factores n = [x | x <- [1..n], mod n x == 0]
    