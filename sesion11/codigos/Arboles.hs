module Arboles where

data ArbolB = Hoja Int
            | Nodo ArbolB Int ArbolB
            deriving(Show)

-- Función que indica si un elemento se encuentra contenido en el árbol.
contiene :: Int -> ArbolB -> Bool
contiene n (Hoja m) = n == m
contiene n (Nodo t1 m t2) = n == m || contiene n t1 || contiene n t2

-- Función que dado un árbol, obtiene la lista que lo represente en inorder.
aplana :: ArbolB -> [Int]
aplana (Hoja m) = [m]
aplana (Nodo t1 m t2) = aplana t1 ++ [m] ++ aplana t2

-- Función que dado un árbol ordenado, indica si un elemento se encuentra en el árbol.
contieneOrd :: Int -> ArbolB -> Bool
contieneOrd n (Hoja m) = n == m
contieneOrd n (Nodo t1 m t2)
    | n == m = True
    | n < m = contieneOrd n t1
    | otherwise = contieneOrd n t2
