f :: Integer -> Integer

f n | n == 1 = 1 -- Defino el caso base en el cual f(1)=1
    | otherwise = f (n-1) + 2*n - 1 --Defino f(n) en base a f(n-1)


suma :: Integer -> Integer -- Dado un n, sumar todos los n positivos hasta ese n (menor estricto)
suma 0 = 0
suma x = suma(x-1) + (x-1)

suma2 :: Integer -> Integer --Lo mismo que el de arriba pero en la suma es hasta n inclusive
suma2 0 = 0 
suma2 x = suma2(x-1) + x

numberOfPaths :: Integer -> Integer -> Integer --Dado un grid de n x m, dar el número de paths posibles para llegar desde arriba a la izquierda hasta abajo a la derecha con solo movimientos para abajo y a la derecha
numberOfPaths n m | n == 1 || m == 1 = 1
                  | otherwise = (numberOfPaths (n-1) m) + (numberOfPaths n (m-1))

numberOfPartitions :: Int -> Int-> Int
numberOfPartitions n m | n==0 = 1
                       | m==0 = 0
                       | otherwise = numberOfPartitions n (m-1) + numberOfPartitions (n-m) m