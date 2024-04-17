sumatoriaN :: Integer -> Integer
sumatoriaN 1 = 1
sumatoriaN x | x + sumatoriaN (x-1) --Ver clase practica

sumatoriaDePotencia :: Integer -> Integer -> Integer
sumatoriaDePotencia 1 n = n
sumatoriaDePotencia j n = sumatoriaDePotencia(j-1) n + n^j --Ver clase practica

sumatoriaDoble :: Integer -> Integer -> Integer
sumatoriaDoble n m = sumatoriaDePotencia m 1
sumatoriaDoble n m = sumatoriaDePotencia n m + sumatoriaDoble (n-1) n -- Revisar
