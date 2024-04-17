todosDigitosIguales :: Integer -> Bool

todosDigitosIguales x | x < 10 = True
                      | otherwise = primerDigito x == ultimoDigito x && todosDigitosIguales(x div 10) --Uso recursivamente todosDigitosIguales con x/10 para que se aplique con los otros dos digitos y me saque de encima el ultimo

primerDigito :: Integer -> Integer
primerDigito x | x < 10 = x
               | otherwise = x div 10 -- Saco el primer digito diviendo por 10, osea que 92/10 = 9.2 pero como es Integer queda solo el 9, dandome el primer digito nomás

ultimoDigito :: Integer -> Integer 
ultimoDigito x | x < 10 = x
               | otherwise = x mod 10 -- Saco el último digito usando el mod de 10, osea que 92 mod 10 = 2 

-- Asi con la primera parte de la segunda linea de la funcion principal verifico, por ejemplo, en 92 si el 9 y el 2 son iguales y luego hago la llamada recursiva de x/10
-- Por ejemplo con un numero como 111 sería 1=1? Si, entonces 111/10 = 11 y repito: 1=1? Si, entonces 11/10 = 1.1 osea que queda 1 y 1<10 => True