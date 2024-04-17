sumaDigitos :: Integer -> Integer

sumaDigitos x | x < 10 = x
              | otherwise = mod x 10 + sumaDigitos (div x 10)

-- sumaDigitos 243 = 2 + 4 + 3 = mod 243 10 + mod 243 100 + mod 243 1000
-- sumaDigitos 1 = 1
-- sumaDigitos 243 = mod x 10 + sumaDigitos (div x 10)