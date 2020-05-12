module Naturales where

data Nat = Cero
         | Suc Nat
         deriving(Show)

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
