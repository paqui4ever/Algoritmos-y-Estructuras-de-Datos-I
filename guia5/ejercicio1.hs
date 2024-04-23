longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = longitud xs + 1

-- longitud [1,2,3] = longitud [2,3] + 1

ultimo :: [t] -> t 
ultimo (x:xs) | longitud xs < 1 = x
              | otherwise = ultimo xs

-- ultimo [1,2,3] = tail [1,2,3] = [2,3] => tail [2,3] = [3] => 3 es el ultimo

principio :: [t] -> [t]
principio (x:xs) | longitud xs == 0 = []
                 | otherwise = x : principio xs

-- principio [1,2,3] = [1]: principio[2,3] = [1] : [2] : principio [3] = [1] : [2] : [] = [1,2]

reverso :: [t] -> [t]
reverso [] = []
reverso xs = ultimo xs : reverso (principio xs)

-- Revisar como funciona principio para terminar de entender la recursión

