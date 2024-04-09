absoluto :: Int -> Int
maximoAbsoluto :: Int -> Int -> Int
maximoTresNumeros :: Int -> Int -> Int -> Int
sumaDistintos :: Int -> Int -> Int -> Int

absoluto x | x > 0 = x
           | otherwise = -x

maximoAbsoluto x y | absoluto x > absoluto y = x
                   | absoluto x < absoluto y = y

sumaDistintos x y z | x == y && x == z && z == y = 0
                    | x == y = z
                    | x == z = y
                    | y == z = x
                    | otherwise = x + y + z