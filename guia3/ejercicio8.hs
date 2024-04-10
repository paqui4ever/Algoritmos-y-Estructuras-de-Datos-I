sumaUltimosDosDigitos :: Integer -> Integer
absoluto :: Integer -> Integer

absoluto x | x >= 0 = x
           | otherwise = (-x)

sumaUltimosDosDigitos x = (absoluto x) `mod` 10 + ((absoluto x) `div` 10) `mod` 10

comparar x y | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
             | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = -1
             | sumaUltimosDosDigitos x == sumaUltimosDosDigitos y = 0