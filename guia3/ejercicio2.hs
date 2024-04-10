absoluto :: Int -> Int
maximoAbsoluto :: Int -> Int -> Int
-- maximoTresNumeros :: Int -> Int -> Int -> Int
sumaDistintos :: Int -> Int -> Int -> Int
algunoEs0 :: Float -> Float -> Bool
ambosSon0 :: Float -> Float -> Bool
mismoIntervalo :: Float -> Float -> Bool
esMultiploDe :: Int -> Int -> Bool
digitoUnidades :: Int -> Int
ultimoDigito :: Int -> Int
digitoDecenas :: Int -> Int

absoluto x | x > 0 = x
           | otherwise = -x

maximoAbsoluto x y | absoluto x > absoluto y = x
                   | absoluto x < absoluto y = y

sumaDistintos x y z | x == y && x == z && z == y = 0
                    | x == y = z
                    | x == z = y
                    | y == z = x
                    | otherwise = x + y + z

algunoEs0 x y | x == 0 || y == 0 = True
              | otherwise = False

ambosSon0 x y | x == 0 && y == 0 = True
              | otherwise = False

mismoIntervalo x y | x <= 3 && y <= 3 = True
                   | x > 3 && x <= 7 && y > 3 && y <= 7 = True
                   | x > 7 && y > 7 = True
                   | otherwise = False

esMultiploDe x y | x `mod` y == 0 = True
                 | otherwise = False

digitoUnidades x | x < 0 = ultimoDigito(-x)
                 | otherwise = ultimoDigito (x)

digitoDecenas x | x < 0 = (x `div` 10) `mod` 10
                | otherwise = (x `div` 10) `mod` 10

ultimoDigito x = x `mod` 10