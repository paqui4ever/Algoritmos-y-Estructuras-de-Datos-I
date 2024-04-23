pertenece :: (Eq t) => t -> [t] -> Bool
pertenece y (x:xs) | x == y = True
                   | otherwise = pertenece y xs

-- pertenece 1 [2,1] = True => 2 == 1? No, 1 == 1? Si => pertenece 1 [1,2] = True

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs

-- hayRepetidos [1,2,3,1] = True => x == xs?

quitar :: (Eq t) => t -> [t] -> [t]
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar xs -- Le agrego el x porque y /= x y no quiero perder esa parte de la lista
                                            -- Le agrego el x a la lista resultante de quitar el elemento y sin el head (x)
                                            -- y luego el resto de la lista normal

