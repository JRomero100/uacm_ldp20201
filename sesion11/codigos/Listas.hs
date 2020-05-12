module Listas where

data Lista a = Nil
             | Cons a (Lista a)
             deriving(Show)

-- Función que calcula la longitud de una lista.
longitud :: Lista a -> Int
longitud Nil = 0
longitud (Cons _ xs) = 1 + longitud xs
