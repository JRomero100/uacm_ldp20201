module Ejemplo2 where

cribaEratostenes :: [Int] -> [Int]
cribaEratostenes (x:xs) = x:(cribaEratostenes [y | y <- xs, mod y x /= 0])

primos :: [Int]
primos = cribaEratostenes [2..]
