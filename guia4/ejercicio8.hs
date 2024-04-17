iesimoDigito :: Integer -> Integer -> Integer
cantidadDigitos :: Integer -> Integer

iesimoDigito x y | y == cantidadDigitos x = mod x 10 -- Acá quiero decir  que si la cantidad de digitos coincide con el numero dado que me devuelva el ultimo digito
                 | otherwise = iesimoDigito (div x 10) y --La llamada recursiva implica buscar que coincidan el y y la cant de digitos, por eso divido por 10 y veo si coinciden

cantidadDigitos x | x < 10 = 1
                  | otherwise = 1 + cantidadDigitos (div x 10) -- Voy dividiendo el numero para ir sacandole digitos y sumo uno para mostrar que cada iteración implica un digito más