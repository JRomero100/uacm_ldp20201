module Ejemplo1 where

unos :: [Int]
unos = 1:unos

pot2 :: Int -> [Int]
pot2 n = n:(pot2 (n*2))
