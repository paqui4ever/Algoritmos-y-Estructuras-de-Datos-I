-- Punto a)

menorDivisor :: Integer -> Integer

menorDivisor x | x == 1 = 1
               | otherwise = menorDivisorDesde x 2

menorDivisorDesde :: Integer -> Integer -> Integer

menorDivisorDesde x y | mod x y == 0 = y
                      | otherwise = menorDivisorDesde x (y+1)

-- Punto b) 

esPrimo :: Integer -> Bool

esPrimo x | x <= 0 = False
          | otherwise = mod x x == 0 && mod x 1 == 0

-- Punto c), FALTA TERMINAR

sonCoprimos :: Integer -> Integer -> Bool

sonCoprimos x y | x < 1 || y < 1 = False
                | x == 1 || y == 1 = True 
                | otherwise = 

sonMultiplos :: Integer -> Integer -> Bool

sonMultiplos x y | x == y = True
                 | otherwise = mod x y == 0