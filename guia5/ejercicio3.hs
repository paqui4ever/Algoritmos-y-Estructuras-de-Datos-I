sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--sumatoria [1] = 1
--sumatoria [1,2] = 1 + 2
--sumatoria [1,2,3] = 1 + 2 + 3

productoria :: [Integer] -> Integer
productoria [] = 0
productoria [x] = x 
productoria (x:xs) = x * productoria xs

-- productoria [1] = 1
-- productoria [1,2] = 1 * 2 => productoria x (pero como es un solo elemento y no una lista se escribe solo x) * productoria xs
-- productoria [1,2,3] = 1 * 2 * 3

maximo :: [Integer] -> Integer
maximo [] = 0
maximo [x] = x
maximo (y:x:xs) | x > y = maximo xs -- Parto los primeros 2 elementos de la lista como individuales (x e y) para poder compararlos entre si,
                                    -- voy viendo cual es mas grande en el resto de la lista aplicando la funcion de forma recursiva
                | otherwise = maximo (y:xs) -- Si no se cumple x>y es o porque x == y o x < y entonces aplico la funcion maximo como primer elemento y
                                            -- y luego el resto de la lista normal

-- maximo [1,2,3,6,4] = 6 => x > xs? No, maximo xs?

sumarN :: Integer -> [Integer] -> [Integer]
sumarN 0 [x] = [x]
sumarN x [] = []
sumarN n (x:xs) = n+x : sumarN n xs

-- sumarN 1 [1] = [1+1] = [2]
-- sumarN 1 [1,2] = [1+1, 2+1] = [2,3] => [sumarN x, sumarN xs] => x+n : sumarN xs 

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

--sumarElPrimero [1,2,3] = [1+1, 1+2, 1+3]
-- sumarElPrimero [1,2] = [1+1, 2+1]  
-- sumarElPrimero [1] = [1+1] = sumarN x (x:xs) 

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = x + ultimo (x:xs) : sumarN (ultimo (x:xs)) xs

-- sumarElUltimo [1,2] = [1+2, 2+2] = x + ultimo (x:xs) : sumarN (ultimo (x:xs)) xs 
-- sumarElUltimo [1] = [1+1] = sumarN (ultimo (x:xs)) xs

longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = longitud xs + 1

ultimo :: [t] -> t 
ultimo (x:xs) | longitud xs < 1 = x
              | otherwise = ultimo xs

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN 0 [x] = [x]
multiplosDeN 1 [x] = [x]
multiplosDeN n [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

-- multiplosDeN 2 [2,1] = 2 => mod n x == 0? Si es asi le agrego ese x a una lista la cual es la llamada recursiva de la funcion para el resto de la lista

minimo :: [Integer]->Integer 
minimo [x] = x
minimo (x:y:xs) | x<y = minimo (x:xs)
                | otherwise = minimo (y:xs)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs) --Tomo lista con mas de un elemento ya que ya tengo un caso base con una lista de un solo elemento

--ordenar [3,2,1,0,8] => 3 > 2 => quitar 3 => quitar x de [3,2,1,0,8]
--                       2 < 1 => quitar 2 => quitar x de [2,1,0,8]
--                       1 > 0 => quitar 1 => quitar x de [1,0,8]
--                       0 < 8 => dejarlo ahi el 8 pero sacar el 0 => quitar x de [0,8]
--                      agrego 3, agrego 2, agrego 1, agrego 0 = [0,1,2,3,8] => 3 : [8]
--                                                                           => 2 : [3,8]
--                                                                           => 1 : [2,3,8]
--                                                                           => 0 : [1,2,3,8]
-- quitar todos menos el maximo, ir agregando desde el mas grande despues del maximo al mas chico de todos
-- o quitar el maximo, y hacer recursion sobre la funcion. Voy reduciendo la lista, quitando los maximos de cada iteracion.

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar y xs -- Le agrego el x porque y /= x y no quiero perder esa parte de la lista
                                            -- Le agrego el x a la lista resultante de quitar el elemento y sin el head (x)
                                            -- y luego el resto de la lista normal
