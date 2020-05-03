module Ejemplo1 where

    -- Función que calcula el área total de un cilíndro dada su altura
    -- y diámetro.
    areaTotal :: Float -> Float -> Float
    areaTotal h d = let r = (d / 2) in 2 * pi * r * (h + r)
    