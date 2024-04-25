relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False
relacionesValidas [(x,y)] = True
relacionesValidas (x:y:xs) = not (comparacion x) && not (comparacion y) && not (comparacionEntreTuplas x y) && relacionesValidas (y:xs)

comparacion :: (String, String) -> Bool
comparacion (x,y) = x == y

comparacionEntreTuplas :: (String, String) -> (String, String) -> Bool
comparacionEntreTuplas (x,y) (n,m) = (x == n || x == m) && (y == n || y == m)

personas :: [(String, String)] -> [String]
personas [] = ["Nadie"]
personas [(x,y)] = [x,y]
personas (x:y:xs) = quitarIguales(fst x : snd x : personas (y:xs))

quitarIguales :: [String] -> [String] -- Como tendria que haber hecho la funcion en el simulacro asi me quedaban todos nombres unicos en el output de la funcion personas
quitarIguales [] = []
quitarIguales (x:xs) | elementoEnLaLista x xs = quitarIguales xs  -- Podria haber usado la funcion incluida en haskell elem pero la hago yo por las dudas
                     | otherwise = x: quitarIguales xs

elementoEnLaLista :: (Eq t) => t -> [t] -> Bool
elementoEnLaLista _ [] = False
elementoEnLaLista n (x:xs) | n == x = True
                           | otherwise = elementoEnLaLista n xs

extraerElementosDeTuplas :: (String, String) -> [String] -- Funcion que no terminé usando pero la dejo acá porque está buena
extraerElementosDeTuplas (x,y) = fst (x,y) : [snd (x,y)]

amigosDeV1 :: String -> [(String, String)] -> [String] -- Version inicial de la función, no funciona del todo bien
amigosDeV1 _ [] = []
amigosDeV1 "Nadie" [x] = ["Nadie"]
amigosDeV1 n (x:xs) | elementoEnLaLista n (extraerElementosDeTuplas x) == True = quitar n (extraerElementosDeTuplas x)
                    | otherwise = amigosDeV1 n xs

amigosDeV2 :: String -> [(String, String)] -> [String] -- Version definitiva de la funcion amigosDe
amigosDeV2 _ [] = []
amigosDeV2 n ((x,y):xs) | (n == x || n == y) = quitarElementoDeTupla n (x,y) : amigosDeV2 n xs
                        | otherwise = amigosDeV2 n xs

-- amigosDe Silvano [("Silvano", "Martina"), ("Pedro", "Silvano"), ("Tomas", "Pepe"), ("Silvano", "Pepe"), ("Juan", "Pedro")] = ["Martina", "Pedro", "Pepe"]
-- amigosDe Silvano [("Silvano", "Martina"), ("Pedro", "Juan")] => ["Silvano", "Martina", "Pedro", "Juan"]
-- Extraigo elementos de las tuplas y saco los pares que estan junto al n que busco
 

quitarElementoDeTupla :: String -> (String, String) -> String
quitarElementoDeTupla n (x,y) | n == x = y
                              | otherwise = x

quitar :: (Eq t) => t -> [t] -> [t]
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar y xs 

personaConMasAmigos :: [(String, String)] -> String -- Tengo que corregirla
personaConMasAmigos [] = "Nadie"
personaConMasAmigos (x:xs) = elementoConMasApariciones xs

elementoConMasApariciones :: [(String, String)] -> String
elementoConMasApariciones [] = "Nadie"
elementoConMasApariciones ((x,y):xs) | contadorDeApariciones x (extraerElementosDeTuplas (x,y)) > contadorDeApariciones y (extraerElementosDeTuplas (x,y)) = x
                                     | otherwise = y

contadorDeApariciones :: String -> [String] -> Integer
contadorDeApariciones _ [] = 0
contadorDeApariciones n (x:xs) | n == x = 1 + contadorDeApariciones n xs
                               | otherwise = contadorDeApariciones n xs

