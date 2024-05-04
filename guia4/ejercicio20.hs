sumaDivisoresHasta :: Integer -> Integer -> Integer
sumaDivisoresHasta m 1 = 1
sumaDivisoresHasta m n | mod m n == 0 = n + sumaDivisoresHasta m (n-1)
                       | otherwise = sumaDivisoresHasta m (n-1)

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresHasta n n -- suma de divisores de n hasta n inclusive

tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n1 n2 | n1 /= n2 = max (sumaDivisores n1) (tomaValorMax (n1-1) n2) -- hago la llamada recursiva para ir acercandome a n1==n2 y además ir viendo el maximo en el rango restante
                   | otherwise = sumaDivisores n2 -- si son iguales es lo mismo la suma de los divisores de n1 que de n2
