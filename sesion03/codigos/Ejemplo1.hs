module Ejemplo1 where

    -- Función que resuelve una ecuación de segundo grado
    ecCuad :: Float -> Float -> Float -> Float
    ecCuad a b c = (((b*(-1)) + (sqrt (b**2-4a*c))) / (2*a),
                     (b*(-1)) - (sqrt (b**2-4*a*c))) (2*a))
