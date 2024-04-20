sumaRacionales :: Integer -> Integer -> Float
recursionSobreQ :: Integer -> Integer -> Float

recursionSobreQ p q | q == 1 = fromInteger p -- Si el denominador es 1 entonces tengo que el res = p
                    | otherwise = fromInteger p / fromInteger q + recursionSobreQ p (q-1) -- Hago la llamada recursiva acercandome al caso base de q==1

sumaRacionales n m | n == 1 = recursionSobreQ 1 m --Tomo de caso base cuando n == 1
                   | otherwise = recursionSobreQ n m + sumaRacionales (n-1) m -- Hago la llamada recursiva acercandome al caso base