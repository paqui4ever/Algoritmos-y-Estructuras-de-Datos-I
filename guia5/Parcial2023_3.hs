-- (Presidente, Vicepresidente)
{- En los problemas en los cuales se reciban como parámetro secuencias de fórmulas y votos, cada posición de la lista votos representará la cantidad de votos obtenidos 
por la fórmula del parámetro formulas en esa misma posición. Por ejemplo, si la lista de fórmulas es [("Juan Pérez","Susana García"), ("María Montero","Pablo Moreno")] 
y la lista de votos fuera [34, 56], eso indicaría que la fórmula encabezada por María Montero obtuvo 56 votos, y la lista encabezada por Juan Pérez obtuvo 34 votos.
-}

module Parcial2023_3 where 

division :: Integer -> Integer -> Float
division a b = (fromIntegral a) / (fromIntegral b)

-- Ejercicio 1
porcentajeDeVotosAfirmativos :: [(String, String)] -> [Integer] -> Integer  -> Float
porcentajeDeVotosAfirmativos [] _ _ = 0
porcentajeDeVotosAfirmativos _ [] _ = 0
porcentajeDeVotosAfirmativos _ _ 0 = 0
porcentajeDeVotosAfirmativos  (x:xs) votos cantTotalVotos = (division (sumaDeListaDeNumeros votos) cantTotalVotos) * 100

sumaDeListaDeNumeros :: [Integer] -> Integer
sumaDeListaDeNumeros [] = 0
sumaDeListaDeNumeros (x:xs) = x + sumaDeListaDeNumeros xs

-- porcentajeDeVotosAfirmativos [("Juan", "Pepe"), ("Tomas", "Juan")] [12,13] 27 = ((13+12) / 27) * 100 = 92.59 


-- Ejercicio 2
formulasInvalidas :: [(String, String)] -> Bool
formulasInvalidas [] = True
formulasInvalidas [(x,y)] = x == y 
formulasInvalidas ((x,y):(n,m):xs) | (x == y || comparacionEntreTuplas (x,y) (n,m) == True) = True
                                   | otherwise = formulasInvalidas ((n,m):xs)
    where comparacionEntreTuplas :: (String, String) -> (String, String) -> Bool
          comparacionEntreTuplas (x,y) (n,m) = (x == n || x == m) || (y == n || y == m)

-- Ejercicio 3
porcentajeDeVotos :: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeVotos " " _ _ = 0
porcentajeDeVotos _ [] _ = 0
porcentajeDeVotos _ _ [] = 0
porcentajeDeVotos vice (x:xs) votos = (division (numeroDePosicionX (posicionEnLista vice (x:xs)) votos) (sumaDeListaDeNumeros votos)) * 100 

posicionEnLista :: String -> [(String, String)] -> Integer
posicionEnLista " " _ = 0
posicionEnLista _ [] = 0
posicionEnLista elemento (x:xs) | elem elemento (extraerElementosDeTuplas x) == True = 1
                                | otherwise = (posicionEnLista elemento xs) + 1
    where extraerElementosDeTuplas :: (String, String) -> [String]
          extraerElementosDeTuplas (x,y) = fst (x,y) : [snd (x,y)]

numeroDePosicionX :: Integer -> [Integer] -> Integer
numeroDePosicionX 0 _ = 0
numeroDePosicionX _ [] = 0
numeroDePosicionX posicion (x:xs) | posicion == 1 = x
                                  | otherwise = numeroDePosicionX (posicion - 1) xs

-- porcentajeDeVotos "Silvano" [("Juan", "Silvano"), ("Pedro", "Tomas")] [20,30] = (20 / (20+30)) * 100

-- Ejercicio 4
menosVotado :: [(String, String)] -> [Integer] -> String
menosVotado [] _ = " "
menosVotado _ [] = " "
menosVotado formulas votos = menosVotadoAux formulas formulas votos

menosVotadoAux :: [(String, String)] -> [(String, String)] -> [Integer] -> String
menosVotadoAux ((x,y):[]) _ _ = x
menosVotadoAux ((candidato1, vice1):(candidato2, vice2):xs) formulas votos | votosCandidato1 >= votosCandidato2 = menosVotadoAux ((candidato2, vice2):xs) formulas votos
                                                                           | otherwise = menosVotadoAux ((candidato1, vice1):xs) formulas votos
    where votosCandidato1 = numeroDePosicionX (posicionEnLista candidato1 formulas) votos
          votosCandidato2 = numeroDePosicionX (posicionEnLista candidato2 formulas) votos