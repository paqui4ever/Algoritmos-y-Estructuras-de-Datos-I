-- (Equipo, Arquero titular)
{-
Si la lista arquerosPorEquipo es [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi")] y la lista de goleses [3, 5], 
eso indicaría que Neyder Aragon recibió 3 goles, y Nahuel Galardi 5.
-} 

module Parcial2023_2 where 

-- EJERCICIO 1

atajaronSuplentes :: [(String, String)] -> [Integer] -> Integer -> Integer
atajaronSuplentes [] _ _  = 0
atajaronSuplentes _ [] _ = 0
atajaronSuplentes _ _ 0 = 0
atajaronSuplentes arquerosPorEquipo goles totalGolesTorneo = totalGolesTorneo - sumaDeListaDeNumeros goles

sumaDeListaDeNumeros :: [Integer] -> Integer
sumaDeListaDeNumeros [] = 0
sumaDeListaDeNumeros (x:xs) = x + sumaDeListaDeNumeros xs

-- atajaronSuplentes [("Sacachispas", "Neyder Aragon"), ("Fenix", "Nahuel Galardi")] [3,5,6] 14 = 6

-- EJERCICIO 2

equiposValidos :: [(String, String)] -> Bool
equiposValidos [] = True
equiposValidos [(x,y)] = not (intraTuplasIguales (x,y))
equiposValidos ((x,y):(n,m):xs) | (intraTuplasIguales (x,y) == True) || (tuplasIguales (x,y) (n,m) == True) = False
                                | otherwise = equiposValidos ((n,m):xs)

-- equiposValidos [("Fenix", "Fenix")] = False porque x == y
-- equiposValidos [("Fenix", "Juan Pedro"), ("Huracan", "Juan Pedro")] = False porque "Juan Pedro se repite"
-- equiposValidos [("Fenix", "Tomas"), ("Fenix", "Juan Pedro")] = False porque "Fenix se repite"
-- equiposValidos [("Fenix", "Tomas"), ("Fenix", "Juan Pedro"), ("Huracan", "Armani")] => equiposValidos [("Fenix", "Tomas")]

tuplasIguales :: (String, String) -> (String, String) -> Bool
tuplasIguales (equipo1, arquero1) (equipo2, arquero2) | (equipo1 == equipo2 || equipo1 == arquero2) || (arquero1 == equipo2 || arquero1 == arquero2) = True
                                                      | otherwise = False

intraTuplasIguales :: (String, String) -> Bool
intraTuplasIguales (x,y) = x == y

-- EJERCICIO 3

porcentajeDeGoles :: String -> [(String, String)] -> [Integer] -> Float
porcentajeDeGoles " " _ _ = 0
porcentajeDeGoles _ [] _ = 0
porcentajeDeGoles _ _ [] = 0
porcentajeDeGoles arquero (x:xs) goles = fromInteger (numeroDePosicionX (posicionEnLista arquero (x:xs)) goles) / fromInteger (sumaDeListaDeNumeros goles) * 100

extraerElementoDeTupla :: (String, String) -> [String]
extraerElementoDeTupla (x,y) = fst (x,y) : [snd (x,y)]

posicionEnLista :: String -> [(String, String)] -> Integer
posicionEnLista _ [] = 0
posicionEnLista " " _ = 0
posicionEnLista arquero (x:xs) | elem arquero (extraerElementoDeTupla x) == True = 1
                               | otherwise = posicionEnLista arquero xs + 1

-- porcentajeDeGoles "Silvano" [("Huracan", "Silvano"), ("Fenix", "Tomas")] [3,5] = 3 / (3+5)
-- elem (extraerElementoDeTupla (x,y))

elementoEnLaLista :: String -> [String] -> Bool -- lo mismo que elem
elementoEnLaLista _ [] = False
elementoEnLaLista " " _ = False
elementoEnLaLista elemento (x:xs) | elemento == x = True
                                  | otherwise = elementoEnLaLista elemento xs

numeroDePosicionX :: Integer -> [Integer] -> Integer
numeroDePosicionX _ [] = 0
numeroDePosicionX 0 _ = 0
numeroDePosicionX pos (x:xs) | pos == 1 = x
                             | otherwise = numeroDePosicionX (pos - 1) xs

-- EJERCICIO 4

vallaMenosVencida :: [(String, String)] -> [Integer] -> String
vallaMenosVencida [] _  = " "
vallaMenosVencida _ [] = " "
vallaMenosVencida arquerosPorEquipo goles = vallaMenosVencidaAux arquerosPorEquipo arquerosPorEquipo goles

vallaMenosVencidaAux :: [(String, String)] -> [(String, String)] -> [Integer] -> String
vallaMenosVencidaAux ((x,y):[]) _ _ = y
vallaMenosVencidaAux _ _ [] = " "
vallaMenosVencidaAux ((equipo1, arquero1):(equipo2, arquero2):xs) arquerosPorEquipo goles | cantidadDeGolesA arquero1 arquerosPorEquipo goles < cantidadDeGolesA arquero2 arquerosPorEquipo goles = vallaMenosVencidaAux ((equipo1, arquero1):xs) arquerosPorEquipo goles
                                                                                          | otherwise = vallaMenosVencidaAux ((equipo2, arquero2):xs) arquerosPorEquipo goles

cantidadDeGolesA :: String -> [(String, String)] -> [Integer] -> Integer
cantidadDeGolesA " " _ _ = 0
cantidadDeGolesA _ [] _ = 0
cantidadDeGolesA _ _ [] = 0
cantidadDeGolesA arquero (x:xs) goles = numeroDePosicionX (posicionEnLista arquero (x:xs)) goles


