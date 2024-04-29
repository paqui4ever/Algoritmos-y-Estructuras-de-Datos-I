relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = False
relacionesValidas [(x,y)] = True
relacionesValidas (x:y:xs) = not (comparacion x) && not (comparacion y) && not (comparacionEntreTuplas x y) && relacionesValidas (y:xs)

comparacion :: (String, String) -> Bool
comparacion (x,y) = x == y

comparacionEntreTuplas :: (String, String) -> (String, String) -> Bool
comparacionEntreTuplas (x,y) (n,m) = (x == n || x == m) && (y == n || y == m)

personas :: [(String, String)] -> [String]
personas [] = []
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

personaConMasAmigos :: [(String, String)] -> String 
personaConMasAmigos [] = " "
personaConMasAmigos (x:xs) = fst (tuplaMax (x:xs) (x:xs))

personaApariciones :: String -> [(String, String)] -> (String, Integer)
personaApariciones n (x:xs) = (n, longitud (amigosDeV2 n (x:xs)))
    where longitud :: [String] -> Integer
          longitud [] = 0
          longitud (x:xs) = 1 + longitud xs 

comparacionPersonaApariciones :: (String, Integer) -> (String, Integer) -> (String, Integer)
comparacionPersonaApariciones (x,y) (n,m) | y >= m = (x,y)
                                          | otherwise = (n,m)

tuplaMax :: [(String, String)] -> [(String, String)] -> (String, Integer)
tuplaMax [(x,y)] n = (comparacionPersonaApariciones (personaApariciones x n) (personaApariciones y n))
tuplaMax ((x,y):xs) n = (comparacionPersonaApariciones (comparacionPersonaApariciones (personaApariciones x n) (personaApariciones y n))) (tuplaMax xs n)

-- Funciones que pensaba usar para resolver personaConMasAmigos pero no sirvieron
elementoConMasApariciones :: [(String, String)] -> String
elementoConMasApariciones [] = "Nadie"
elementoConMasApariciones ((x,y):(n,m):xs) | contadorDeApariciones x (extraerElementosDeTuplas (x,y)) > contadorDeApariciones n (extraerElementosDeTuplas (n,m)) = x
                                           | contadorDeApariciones y (extraerElementosDeTuplas (x,y)) > contadorDeApariciones m (extraerElementosDeTuplas (n,m)) = y
                                           | otherwise = elementoConMasApariciones xs

contadorDeApariciones :: String -> [String] -> Integer
contadorDeApariciones _ [] = 0
contadorDeApariciones n (x:xs) | n == x = 1 + contadorDeApariciones n xs
                               | otherwise = contadorDeApariciones n xs

-- personaConMasAmigos [("Juan", "Pedro"), ("Pepe", "Roman"), ("Pedro", "Tomas")] = Pedro

