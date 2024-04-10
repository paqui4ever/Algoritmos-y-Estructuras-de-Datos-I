estanRelacionados :: Int -> Int -> Bool

estanRelacionados x y | x == 0 && y == 0 = False
-- Uso el operador any() para cumplir con la parte de la especificación "para algun k en Z distinto de 0"
-- \k -> k /= 0 sería como decir defino una función (anonima) k tal que k es distinto de 0 y ademas se cumple lo otro (la relacion)
-- Lo definido entre brackets es el rango en el que busco los k para los que se cumple el cuerpo de la funcion
-- Como la salida de la función la definí como booleana, uso el otherwise para implicar el caso True
                      | otherwise = any(\k -> k /= 0 && x*x + x*y*k == 0) [-1000..1000]