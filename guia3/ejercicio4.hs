prodInt :: (Float, Float) -> (Float, Float) -> Float
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
sumaTerna :: (Int, Int, Int) -> Int
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
esMultiplo :: Int -> Int -> Int
posPrimerPar :: (Int, Int, Int) -> Int
esPar :: Int -> Bool
crearPar :: Int -> Int -> (Int, Int)
invertirPar :: (Int, Int) -> (Int, Int)

sumaTerna (x,y,z) = x + y + z 

sumarSoloMultiplos (x,y,z) = (esMultiplo x n) + (esMultiplo y n) + (esMultiplo z n)

posPrimerPar (x,y,z) | esPar x == True = 0
                     | esPar y == True = 1
                     | esPar z == True = 2
                     | otherwise = 4

crearPar x y = (x,y)

invertirPar (x,y) = (y,x)

esPar x | x `mod` 2 == 0 = True
        | otherwise = False

esMultiplo x y | mod x y == 0 = x
               | otherwise = 0

prodInt (x, y) (n, m) = x*n + y*m 

todoMenor (x, y) (n, m) | x < n && y < m = True
                        | otherwise = False

distanciaPuntos (x, y) (n, m) = sqrt ((x-n)*(x-n) + (y-m)*(y-m))

