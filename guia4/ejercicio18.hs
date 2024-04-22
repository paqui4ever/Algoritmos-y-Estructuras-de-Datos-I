mayorDigitoPar :: Integer -> Integer
esPar :: Integer -> Bool
ultimoDigitoPar :: Integer -> Bool
restoDeNConPares :: Integer -> Bool
esMayor :: Integer -> Integer -> Integer

mayorDigitoPar x | x < 1 = 0
                 | x < 10 && esPar x == False = -1
                 | x < 10 && esPar x == True = x
                 | esPar ultimoDigito == True = esMayor ultimoDigito (mayorDigitoPar (div x 10))
                 | otherwise = mayorDigitoPar (div x 10)
                 where ultimoDigito = mod x 10

esMayor x y | x < y = y
            | x > y = x
            | otherwise = x

esPar x | x < 1 = False
        | mod x 2 == 0 = True
        | otherwise = False

-- Funciones que no terminé usando y pensé que podía usar para resolver el ejercicio
ultimoDigitoPar x | x < 1 = False
                  | mod ultimoDigito 2 == 0 = True
                  | otherwise = False
                  where ultimoDigito = mod x 10

restoDeNConPares x | x < 1 = False
                   | otherwise = ultimoDigitoPar (div x 10) || restoDeNConPares (div x 10)