module Ejemplo4 where

    -- Función que calcula el valor absoluto de un número.
    absoluto :: Int -> Int
    absoluto x
        | x > 0 = x
        | x < 0 = x * (-1)

    -- Función que obtiene el nombre de un mes dado su número.
    mes :: Int -> String
    mes n
       | n == 1 = "Enero"
       | n == 2 = "Febrero"
       | n == 3 = "Marzo"
       | n == 4 = "Abril"
       | n == 5 = "Mayo"
       | n == 6 = "Junio"
       | n == 7 = "Julio"
       | n == 8 = "Agosto"
       | n == 9 = "Septiembre"
       | n == 10 = "Octubre"
       | n == 11 = "Noviembre"
       | n == 12 = "Diciembre"
       | otherwise = error "Número inválido"
       