module Ejemplo2 where

    -- Función que calcula el área total de un cilíndro dada su altura
    -- y diámetro.
    areaTotal :: Float -> Float -> Float
    areaTotal h d = 2 * pi * r * (h + r)
        where r = (d / 2)
        