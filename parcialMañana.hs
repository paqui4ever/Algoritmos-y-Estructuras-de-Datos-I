-- EJERCICIO 1

hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar ' ' _ = False
hayQueCodificar _ [] = False
hayQueCodificar c ((x,y):xs) | c == fst (x,y) = True
                             | otherwise = hayQueCodificar c xs

-- EJERCICIO 2

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Integer
cuantasVecesHayQueCodificar ' ' _ _ = 0
cuantasVecesHayQueCodificar _ [] _ = 0
cuantasVecesHayQueCodificar _ _ [] = 0
cuantasVecesHayQueCodificar c frase (x:xs) | hayQueCodificar c (x:xs) = apareceCuantasVeces c frase
                                           | otherwise = 0

apareceCuantasVeces :: Char -> [Char] -> Integer
apareceCuantasVeces ' ' _ = 0
apareceCuantasVeces _ [] = 0
apareceCuantasVeces c (x:xs) | c == x = 1 + apareceCuantasVeces c xs
                             | otherwise = apareceCuantasVeces c xs

-- EJERCICIO 3

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [] _ = ' '
laQueMasHayQueCodificar _ [] = ' '
laQueMasHayQueCodificar frase mapeo = laQueMasHayQueCodificarAux frase frase mapeo

laQueMasHayQueCodificarAux :: [Char] -> [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificarAux (x:[]) _ _ = x
laQueMasHayQueCodificarAux (x:y:ys) frase mapeo | cuantasVecesHayQueCodificar x frase mapeo >= cuantasVecesHayQueCodificar y frase mapeo = laQueMasHayQueCodificarAux (x:ys) frase mapeo
                                                | otherwise = laQueMasHayQueCodificarAux (y:ys) frase mapeo

-- laQueMasHayQueCodificar ['p','e','r','r','o'] => apareceCuantasVeces 'p' (esa lista) 

-- EJERCICIO 4

codificarFrase :: [Char] -> [(Char, Char)] -> String
codificarFrase _ [] = ""
codificarFrase [] _ = ""
codificarFrase palabra ((x,y):xs) | pertenece (extraerDeTuplas (x,y)) palabra = y : codificarFrase palabra xs
                                  | otherwise = codificarFrase palabra (xs)

-- codificar "abc" [('a','e'), ('b','r'), ('c','t')] = "ert"
-- reemplaza las primeras por la segunda
-- coinciden primer caracter con primer caracter de la tupla

-- snd ('a','e') : snd ('b','r') : snd ('c','t')
-- ver si el primer caracter del string pertenece a una de las tuplas

pertenece :: [Char] -> String -> Bool
pertenece [] _ = False
pertenece (x:xs) palabra | elem x palabra = True
                         | otherwise = pertenece xs palabra

extraerDeTuplas :: (Char, Char) -> [Char]
extraerDeTuplas (x,y) = fst (x,y) : [snd (x,y)]

codificarFraseV2 :: [Char] -> [(Char, Char)] -> [Char]
codificarFraseV2 [] _ = []
codificarFraseV2 _ [] = []
codificarFraseV2 (x:xs) mapeo | hayQueCodificar x mapeo = (estaEmparejadaCon x mapeo) : codificarFraseV2 xs mapeo
                              | otherwise = x : codificarFraseV2 xs mapeo 

estaEmparejadaCon :: Char -> [(Char,Char)] -> Char
estaEmparejadaCon c ((x,y):ys) | c == x = y
                               | otherwise = estaEmparejadaCon c ys  