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

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos (x:xs) (y:ys) | x == y = mismosElementos xs ys
                              | otherwise = False

-- mismosElementos [1,2,3] [1,2,3] = 1=1? 2=2? 3=3?

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua (x:xs) | reverso (x:xs) == (x:xs) = True
               | otherwise = False

-- capicua [1,0,1] => reverso [1,0,1] = [1,0,1] => reverso (x:xs) == (x:xs)

reverso :: [t] -> [t]
reverso [] = []
reverso xs = ultimo xs : reverso (principio xs)

principio :: [t] -> [t]
principio (x:xs) | longitud xs == 0 = []
                 | otherwise = x : principio xs

ultimo :: [t] -> t 
ultimo (x:xs) | longitud xs < 1 = x
              | otherwise = ultimo xs

longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = longitud xs + 1


minimo :: [Integer]->Integer 
minimo [x] = x
minimo (x:y:xs) | x<y = minimo (x:xs)
                | otherwise = minimo (y:xs)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs)
