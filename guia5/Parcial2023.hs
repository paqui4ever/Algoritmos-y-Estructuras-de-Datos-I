-- (Presidente, Vicepresidente)
-- [("Juan Perez", "Susana Garcia"), ("Maria Montero", "Pablo Moreno")] -> [34, 56] => gana la segunda formula

-- EJERCICIO 1

votosEnBlanco :: [(String, String)] -> [Integer] -> Integer -> Integer -- A REVISAR
votosEnBlanco [] _ _ = 0
votosEnBlanco _ [] _ = 0
votosEnBlanco _ _ 0 = 0
votosEnBlanco (x:xs) votos cantTotalVotos | (longitud (x:xs) == longitud votos) && (sumaDeListaDeNumeros votos <= cantTotalVotos) && (esListaDePositivos votos == True) = 0
                                            | otherwise = sacarUltimoElemento votos

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

sumaDeListaDeNumeros :: [Integer]-> Integer
sumaDeListaDeNumeros [] = 0
sumaDeListaDeNumeros (x:xs) = x + sumaDeListaDeNumeros xs

sacarUltimoElemento :: [Integer] -> Integer
sacarUltimoElemento [] = 0
sacarUltimoElemento (x:xs) | longitud (x:xs) == 1 = x
                           | otherwise = sacarUltimoElemento xs

esListaDePositivos :: [Integer] -> Bool
esListaDePositivos [] = True
esListaDePositivos (x:xs) | x >= 0 = esListaDePositivos xs
                          | otherwise = False

-- esListaDePositivos [1,2,3] = True => 1 >= 0? Si (x>=0?) => 2>=0? Si => 3 >= 0? Si
-- votosEnBlanco [("Juan", "Pedro"), ("Pepe", "Tito")] [34,1] 35 = 0
-- longitud de la lista formulas (la primera) es la misma que la lista de votos
-- votosEnBlanco [("Juan", "Pedro"), ("Pepe", "Tito")] [36,1,5] 42 = 5  

-- EJERCICIO 2

formulasValidas :: [(String, String)] -> Bool
formulasValidas [] = True
formulasValidas ((x,y):xs) | x == y = False
                           | otherwise = formulasValidas xs && not (hayRepetidos (sacarElementosDeTuplas ((x,y):xs))) -- Veo que no haya repetidos en la lista original generada a partir de las tuplas dadas, 
                                                                                                                      -- y recurso sobre formulas validas para el resto de la lista

-- formulasValidas [("Juan", "Juan")] = False 
-- formulasValidas [("Juan", "Pedro"), ("Pepe", "Juan")] = False

sacarElementosDeTuplas :: [(String, String)] -> [String]
sacarElementosDeTuplas [] = []
sacarElementosDeTuplas (x:xs) = fst x : snd x : sacarElementosDeTuplas xs

hayRepetidos :: [String] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = elementoEnLaLista x xs || hayRepetidos xs

elementoEnLaLista :: String -> [String] -> Bool
elementoEnLaLista _ [] = False
elementoEnLaLista palabra (x:xs) | palabra == x = True
                                 | otherwise = elementoEnLaLista palabra xs

tuplaDuplicada :: (String, String) -> [(String, String)] -> Bool -- approach para formulasValidas a revisar
tuplaDuplicada _ [] = False
tuplaDuplicada (x, y) ((a, b):ys) | comparacionEntreTuplas (x,y) (a,b) = True
                                  | otherwise = tuplaDuplicada (x,y) ys

comparacionEntreTuplas :: (String, String) -> (String, String) -> Bool
comparacionEntreTuplas (x,y) (n,m) = (x == n || x == m) && (y == n || y == m)

-- EJERCICIO 3

porcentajeDeVotos :: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeVotos _ [] _ = 0
porcentajeDeVotos _ _ [] = 0
porcentajeDeVotos presidente (x:xs) votos = fromInteger (numeroDePosicionX (snd (posicionElemento presidente (x:xs) 1)) votos) / (fromInteger (sumaDeListaDeNumeros votos)) * 100 
{- posicionElemento busca la posicion donde se encuentra la tupla del candidato buscado 
y devuelve (candidato, posicion de la tupla). Como quiero usar esa posicion para sacar el numero de votos de ese candidato, aplico snd a la tupla en esa posicion (la del candidato)  y extraigo ese numero correspondido con la tupla de la lista votos.
Para el denominador uso sumaDeListaDeNumeros para saber la cantidad total de votos y así sacar el porcentaje pedido -}

-- porcentajeDeVotos "Silvano" [("Juan", "Pedro"), ("Silvano", "Pepe")] [5,30] = 85.7 
-- Tengo que ver la posicion de Silvano en la lista

-- posicionEnLaLista "Juan" [("Juan", "Pepe")] => pertenece "Juan" x? Si => (Juan, 1)
-- posicionEnLalista "Juan" [("Pedro", "Silvano"), ("Juan", "Pepe")] => pertenece "Juan" x? No => pertenece "Juan" xs?

perteneceTupla :: String -> (String, String) -> Bool
perteneceTupla persona (x,y) | persona == x || persona == y = True
                             | otherwise = False

perteneceListaDeTuplas :: String -> [(String, String)] -> Bool
perteneceListaDeTuplas persona ((x,y):xs) | perteneceTupla persona (x,y) == True = True
                                          | otherwise = perteneceListaDeTuplas persona xs

posicionElemento :: String -> [(String, String)] -> Integer -> (String, Integer)
posicionElemento persona ((x,y):xs) index | (persona == x || persona == y) = (persona, index) 
                                          | otherwise = posicionElemento persona xs (index + 1)


posicionNumeroEnLista :: Integer -> [Integer] -> Integer -- No la terminé usando
posicionNumeroEnLista _ [] = 0
posicionNumeroEnLista numero (x:xs) | numero == x = 1
                                    | otherwise = (posicionNumeroEnLista numero xs) + 1

numeroDePosicionX :: Integer -> [Integer] -> Integer
numeroDePosicionX _ [] = 0
numeroDePosicionX posicion (x:xs) | posicion == 1 = x
                                  | otherwise = numeroDePosicionX (posicion-1) xs --llamada recursiva sobre posicion

-- EJERCICIO 4

proximoPresidente :: [(String, String)] -> [Integer] -> String
proximoPresidente [] _ = " "
proximoPresidente _ [] = " "
proximoPresidente lista votos = proximoPresidenteAux lista lista votos -- como en proximoPresidenteAux voy perdiendo elementos uso la misma lista dos veces

proximoPresidenteAux :: [(String, String)] -> [(String, String)] -> [Integer] -> String
proximoPresidenteAux ((x,y):[]) _ _ = x -- Caso base al que apuntamos llegar con la recursión, una lista de un solo elemento (una tupla en este caso)
proximoPresidenteAux ((x,y):(n,m):xs) formulas votos | votosCandidato1 >= votosCandidato2 = proximoPresidenteAux ((x,y):xs) formulas votos -- recursa sobre la lista SIN el candidato con menos votos
                                                     | otherwise = proximoPresidenteAux ((n,m):xs) formulas votos -- lo mismo pero como no se cumple el requisito se hace la recursion sobre una lista sin (x,y) en vez de (n,m)
    where votosCandidato1 = cantidadDeVotos x formulas votos
          votosCandidato2 = cantidadDeVotos n formulas votos

-- proximoPresidente [("Juan", "Pedro"), ("Pepe", "Tomas")] [25,65] => porcentajeDeVotos "Juan" vs porcentajeDeVotos "Pepe"
-- proximoPresidente [("Juan", "Pedro"), ("Pepe", "Tomas"), ("Silvano", "Titi")] [25,65,100] => porcentajeDeVotos

cantidadDeVotos :: String -> [(String, String)] -> [Integer] -> Integer
cantidadDeVotos _ [] _ = 0
cantidadDeVotos _ _ [] = 0
cantidadDeVotos candidato ((x,y):xs) votos = numeroDePosicionX (snd (posicionElemento candidato ((x,y):xs) 1)) votos 
{-Uso la misma logica que usé para el numerador de porcentajeDeVotos, saco el numero de la lista votos que coincide con el numero de la posicion del candidato pedido-}
