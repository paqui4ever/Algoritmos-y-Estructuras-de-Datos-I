prodInt :: (Float, Float) -> (Float, Float) -> Float
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float

prodInt (x, y) (n, m) = x*n + y*m 

todoMenor (x, y) (n, m) | x < n && y < m = True
                        | otherwise = False

distanciaPuntos (x, y) (n, m) = sqrt ((x-n)*(x-n) + (y-m)*(y-m))