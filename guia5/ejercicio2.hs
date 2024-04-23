pertenece :: (Eq t) => t -> [t] -> Bool
pertenece y (x:xs) | x == y = True
                   | otherwise = pertenece y xs

-- pertenece 1 [2,1] = True => 2 == 1? No, 1 == 1? Si => pertenece 1 [1,2] = True

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = False
todosIguales [x] = True
todosIguales (x:xs) = x == head xs && todosIguales xs --Veo que el primero sea igual que el segundo y evaluo de nuevo pero en el tail de la lista

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = False
todosDistintos [x] = True
todosDistintos (x:xs) = x /= head xs && todosDistintos xs -- Con ver que el primero es distinto del segundo e iterar sobre el tail es suficiente

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos (x:xs) | pertenece x xs = True
                    | otherwise = hayRepetidos xs

-- hayRepetidos [1,2,3,1] = True => x == xs?

quitar :: (Eq t) => t -> [t] -> [t]
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar y xs -- Le agrego el x porque y /= x y no quiero perder esa parte de la lista
                                            -- Le agrego el x a la lista resultante de quitar el elemento y sin el head (x)
                                            -- y luego el resto de la lista normal


quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos y (x:xs) | y == x = quitarTodos y xs
                     | otherwise = x : (quitarTodos y xs)

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (y:x:xs) | y == x = quitarTodos y (x:xs)
                           | otherwise = y : eliminarRepetidos xs


