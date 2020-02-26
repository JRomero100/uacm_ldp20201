module Ejemplo1 where


-- Función que obtiene la última cifra de un número.
ultimaCifra :: Int -> Int
ultimaCifra x = mod x 10

-- Función que obtiene el mayor de tres números.
maxTres :: Int -> Int -> Int -> Int
maxTres a b c = max (max a b) c

-- Función que calcula el xor.
xor1 :: Bool -> Bool -> Bool
xor1 False False = False
xor1 False True  = True
xor1 True  False = True
xor1 True  True  = False

-- Función que calcula el área de un círculo
-- a partir del diámetro.
areaCirculo :: Float -> Float
areaCirculo d = pi * (d/2) * (d/2)

-- Ejercicio: Definir las funciones 
-- not1, and1 y or1.
