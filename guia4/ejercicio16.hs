menorDivisor :: Integer -> Integer

menorDivisor x | x == 1 = 1
               | otherwise = menorDivisorDesde x 2

menorDivisorDesde :: Integer -> Integer -> Integer

menorDivisorDesde x y | mod x y == 0 = y
                      | otherwise = menorDivisorDesde x (y+1)