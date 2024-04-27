factorial :: Integer -> Integer

factorial 0 = 1
factorial 1 = 1
factorial x = x * factorial (x-1)

numeroCombinatorio :: Integer -> Integer -> Integer -- Suele ser una recursion muy pesada, tira stack overflow
numeroCombinatorio _ 0 = 1
numeroCombinatorio n 1 = n
numeroCombinatorio n k = numeroCombinatorio (n+1) k - numeroCombinatorio n (k-1)

numeroCombinatorioSinRecu :: Integer -> Integer -> Integer
numeroCombinatorioSinRecu n k = factorial n `div` (factorial k * factorial (n-k)) 