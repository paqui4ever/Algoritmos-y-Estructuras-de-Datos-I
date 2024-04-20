f1 :: Integer -> Integer
f2 :: Integer -> Float -> Float
f3 :: Integer -> Float -> Float
f3Aux :: Integer -> Float -> Float
f4 :: Integer -> Float -> Float
f4Aux :: Integer -> Integer -> Float -> Float

f1 0 = 1
f1 x = 2^x + f1(x-1)

f2 n q | n <= 0 = 0 -- Hay que agregar el requiere de n>0, sino no funciona
       | n == 1 && q == 0 = 1
       | otherwise = q^n + f2 (n-1) q 

f3Aux n q | n < 1 = 0 -- Con la auxiliar hago el planteo de casos base y la llamada recursiva hasta n 
          | n == 1 && q == 0 = 0
          | otherwise = q^n + f3Aux (n-1) q 

f3 x y = f3Aux (2*x) y -- Uso una funcion principal para hacer la operación hasta 2n

f4Aux n i q | i < n = 0 --Si i < n entonces ya llegamos al caso de que va a pasar a ser negativo el exponente
            | otherwise = q^i + f4Aux n (i-1) q
    
f4 x y = f4Aux x (2*x) y 