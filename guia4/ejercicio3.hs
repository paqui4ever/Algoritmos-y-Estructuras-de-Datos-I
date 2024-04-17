esDivisible :: Integer -> Integer -> Bool

esDivisible x y | x < y = False
                | x == y = True
                | otherwise = esDivisible (x - y) y -- toma dos valores, el primero (x-y) para ver si termina siendo x < y o x == y y el segundo es y porque quiero saber si x es divisible por el segundo