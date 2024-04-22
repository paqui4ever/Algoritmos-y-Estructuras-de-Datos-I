esFibonacci :: Integer -> Bool
esFibonacci x | x < 0 = False -- Hago que se cumpla el requiere de n>=0
              | x == 0 = True -- Pongo de caso base fibonacci 0 = 0
              | otherwise = contadorFibonacci x x -- Busco si hay algun x tal que fibonacci x = x

contadorFibonacci :: Integer -> Integer -> Bool
contadorFibonacci x n | n < 0 = False
                      | fibonacci n == x = True -- Existe algun n tal que fibonacci (n) = x?
                      | otherwise = contadorFibonacci x (n-1) --Hago la llamada recursiva para ver si el n anterior lo cumple

fibonacci :: Integer -> Integer

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x-1) + fibonacci (x-2)