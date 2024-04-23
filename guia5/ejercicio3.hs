maximo :: [Integer] -> Integer
maximo [] = 0
maximo [x] = x
maximo (y:x:xs) | x > y = maximo xs -- Parto los primeros 2 elementos de la lista como individuales (x e y) para poder compararlos entre si,
                                    -- voy viendo cual es mas grande en el resto de la lista aplicando la funcion de forma recursiva
                | otherwise = maximo (y:xs) -- Si no se cumple x>y es o porque x == y o x < y entonces aplico la funcion maximo como primer elemento y
                                            -- y luego el resto de la lista normal

-- maximo [1,2,3,6,4] = 6 => x > xs? No, maximo xs?

minimo :: [Integer]->Integer 
minimo [x] = x
minimo (x:y:xs) | x<y = minimo (x:xs)
                | otherwise = minimo (y:xs)

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs)

--ordenar [3,2,1,0,8] => 3 > 2 => quitar 3 => quitar x de [3,2,1,0,8]
--                       2 < 1 => quitar 2 => quitar x de [2,1,0,8]
--                       1 > 0 => quitar 1 => quitar x de [1,0,8]
--                       0 < 8 => dejarlo ahi el 8 pero sacar el 0 => quitar x de [0,8]
--                      agrego 3, agrego 2, agrego 1, agrego 0 = [0,1,2,3,8] => 3 : [8]
--                                                                           => 2 : [3,8]
--                                                                           => 1 : [2,3,8]
--                                                                           => 0 : [1,2,3,8]
-- quitar todos menos el maximo, ir agregando desde el mas grande despues del maximo al mas chico de todos
-- o quitar el maximo, y hacer recursion sobre la funcion. Voy reduciendo la lista, quitando los maximos de cada iteracion.

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar y (x:xs) | y == x = xs
                | otherwise = x : quitar y xs -- Le agrego el x porque y /= x y no quiero perder esa parte de la lista
                                            -- Le agrego el x a la lista resultante de quitar el elemento y sin el head (x)
                                            -- y luego el resto de la lista normal
