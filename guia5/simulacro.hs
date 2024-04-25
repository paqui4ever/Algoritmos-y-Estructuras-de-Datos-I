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

quitarIguales :: [String] -> [String] -- Como tendria que haber hecho la funcion en el simulacro
quitarIguales [] = []
quitarIguales (x:xs) | elementoEnLaLista x xs = quitarIguales xs  -- Podria haber usado la funcion incluida en haskell elem pero la hago yo por las dudas
                     | otherwise = x: quitarIguales xs

elementoEnLaLista :: (Eq t) => t -> [t] -> Bool
elementoEnLaLista _ [] = False
elementoEnLaLista n (x:xs) | n == x = True
                           | otherwise = elementoEnLaLista n xs

extraerElementosDeTuplas :: (String, String) -> [String] -- Funcion que no terminé usando pero la dejo acá porque está buena
extraerElementosDeTuplas (x,y) = fst (x,y) : [snd (x,y)]

amigosDe :: String -> [(String, String)] -> [String]
amigosDe "Nadie" [] = ["Nadie"]

--personaConMasAmigos :: [(String, String)] -> String


