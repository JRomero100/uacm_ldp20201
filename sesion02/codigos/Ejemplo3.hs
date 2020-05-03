module Ejemplo3 where

    -- Función que calcula el valor absoluto de un número.
    absoluto :: Int -> Int
    absoluto x = if x >= 0 then x else x * (-1)