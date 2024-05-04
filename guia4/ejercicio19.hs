esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos 5 = True
esSumaInicialDePrimos n = esSumaInicialDePrimosDesde 1 n  -- Barro todos los casos fijandome si es suma inicial desde 1, es decir si es 2                     

esSumaInicialDePrimosDesde :: Integer -> Integer -> Bool -- Determina si la suma de los m numeros primos es igual a n
esSumaInicialDePrimosDesde m 1 = False
esSumaInicialDePrimosDesde m n | esSumaInicialDePrimosHasta m == n = True -- Calcula la suma de primos hasta m y se fija si es igual a n
                               | esSumaInicialDePrimosHasta m > n = False -- como m siempre será menor o igual cuando es suma inicial de primos, si pasa lo contrario no será suma inicial de primos
                               | otherwise = esSumaInicialDePrimosDesde (m+1) n -- Si m es menor a n significa que tengo que seguir sumando primos hasta que me pase o hasta que encuentre que m == n

esSumaInicialDePrimosHasta :: Integer -> Integer -- Calcula la suma de primos hasta un numero n del conjunto de primos
esSumaInicialDePrimosHasta 1 = 2 -- Primer numero primo
esSumaInicialDePrimosHasta 2 = 5 -- Segundo numero primo
esSumaInicialDePrimosHasta n = nEsimoPrimo n + esSumaInicialDePrimosHasta (n-1) -- Busco el nEsimoPrimo y se lo sumo a la suma del resto de los primos antes que él

nEsimoPrimo :: Integer -> Integer

nEsimoPrimo 1 = 2 -- Pongo de caso base el primer numero primo
nEsimoPrimo x | x < 1 = 0 --Hago cumplir el requiere de números naturales
              | otherwise = siguientePrimo (nEsimoPrimo (x-1)) --Si yo tengo una serie de primos, yo quiero saber el siguiente primo del ultimo pŕimo, es decir, 
                                                               --quiero aplicar la función siguientePrimo al nEsimoPrimo x-1

-- esSumaInicialDePrimos 5 = True pues 5 = 2+3 => m = 2
-- esSumaInicialDePrimos 2 = True pues 2 = 2 => m = 1
-- esSumaInicialDePrimos 10 = True pues 10 = 2+3+5 => m = 3
-- esSumaInicialDePrimos 17 = True pues 17 = 2+3+5+7 => m = 4
-- esSumaInicialDePrimos 28 = True pues 30 = 2+3+5+7+11 => m = 5
-- primos 2+3+5+7+11+13...
-- 5 = 2 + siguientePrimo (2)
-- 10 = 2 + siguientePrimo 2 + siguientePrimo 3
-- 17 = 2 + siguientePrimo 2 + siguientePrimo 3 + siguientePrimo 5

siguientePrimo :: Integer -> Integer
siguientePrimo 2 = 3
siguientePrimo 3 = 5
siguientePrimo n | esPrimo (n+1) == True = n+1
                 | otherwise = siguientePrimo (n+1)

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde x y | mod x y == 0 = y
                      | otherwise = menorDivisorDesde x (y+1)

menorDivisor :: Integer -> Integer
menorDivisor 0 = 0
menorDivisor x | x == 1 = 1
               | otherwise = menorDivisorDesde x 2

esPrimo :: Integer -> Bool
esPrimo 2 = True
esPrimo n | n <= 0 = False
          | otherwise = menorDivisor n == n 