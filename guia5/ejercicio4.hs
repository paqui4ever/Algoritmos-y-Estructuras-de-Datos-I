sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && x == y  = quitar y (y:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

-- sacarBlancosRepetidos ['H','i', ' ', ' ', 't']

quitar :: (Eq t) => t -> [t] -> [t]
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar y xs -- Le agrego el x porque y /= x y no quiero perder esa parte de la lista
                                            -- Le agrego el x a la lista resultante de quitar el elemento y sin el head (x)
                                            -- y luego el resto de la lista normal

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras [x] = 1
contarPalabras (x:xs) | x == ' '  = 1 + contarPalabras xs
                      | otherwise = contarPalabras xs 

-- contarPalabras ['h', 'o', 'y', ' ', 's', 'i']
-- contarPalabras ['h', ' ', 'l', ' ', 'z']

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = palabraIndividual (x:xs) : palabras (sacarBlancos xs) -- Agrego la palabra como lista a la lista de palabras aplicandole sacarBlancos para no agregar espacios en blanco como palabras

sacarBlancos :: [Char] -> [Char]
sacarBlancos [] = []
sacarBlancos (x:xs) | x == ' ' = xs
                    | otherwise = sacarBlancos xs

-- palabras ['h', ' ', 'l', ' ', 'z'] = [['h'], ['l'], ['z']]
-- palabras ['h', ' ', 'l'] => x : (y:ys) => [['h']] => ['l'] : [['h']]
-- Creo una funcion para identificar palabras enteras que me devuelvan una lista de chars, osea las palabras
-- Creo una funcion que saca todos los espacios en blanco de la entrada

palabraIndividual :: [Char] -> [Char]
palabraIndividual [] = []
palabraIndividual (x:xs) | head (sacarBlancosRepetidos (x:xs)) == ' ' = []
                         | otherwise = x : palabraIndividual xs

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga (y:x:xs) | y /= ' ' = 

-- palabraMasLarga ['h','h','l', ' ', 'm', 'm', ' ', 'z']
-- contadorDeCaracteres ['h','h','l',''] = 3

contadorDeCaracteres :: [Char] -> Integer
contadorDeCaracteres [] = 0
contadorDeCaracteres (x:xs) | x /= ' ' = 1 + contadorDeCaracteres xs
                            | otherwise = contadorDeCaracteres xs