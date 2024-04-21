-- Punto a)

menorDivisor :: Integer -> Integer

menorDivisor x | x == 1 = 1
               | otherwise = menorDivisorDesde x 2

menorDivisorDesde :: Integer -> Integer -> Integer

menorDivisorDesde x y | mod x y == 0 = y
                      | otherwise = menorDivisorDesde x (y+1)

-- Punto b) 

esPrimo :: Integer -> Bool

esPrimo x | x <= 0 = False
          | otherwise = menorDivisor x == x

-- Punto c)

sonCoprimos :: Integer -> Integer -> Bool

sonCoprimos x y | x < 1 || y < 1 = False
                | x == 1 || y == 1 = True 
                | otherwise = maximoComunDivisor x y == 1

maximoComunDivisor :: Integer -> Integer -> Integer

maximoComunDivisor x 0 = x
maximoComunDivisor x y = maximoComunDivisor y (mod x y) -- (Algoritmo de Euclides)"El maximo comun divisor es igual al maximo comun divisor del segundo y el resto de la division del primero por el segundo"

-- Punto d) 

nEsimoPrimo :: Integer -> Integer

nEsimoPrimo 1 = 2 -- Pongo de caso base el primer numero primo
nEsimoPrimo x | x < 1 = 0 --Hago cumplir el requiere de números naturales
              | otherwise = siguientePrimo (nEsimoPrimo (x-1)) --Si yo tengo una serie de primos, yo quiero saber el siguiente primo del ultimo pŕimo, es decir, quiero aplicar la función siguientePrimo al nEsimoPrimo x-1

siguientePrimo :: Integer -> Integer
siguientePrimo x | esPrimo (x+1) == True = x+1 --Pongo de caso base que justo el numero siguiente es primo, por tanto devuelve a si mismo
                 | otherwise = siguientePrimo (x+1) --Hago la llamada recursiva para ese x+1 que no cumplió el caso base

-- Función no útil para este ejercicio que hice pensando que podía usarla para este problema
contadorConPosicion :: Integer -> Integer

contadorConPosicion 0 = 0
contadorConPosicion x = 1 + contadorConPosicion (x-1) 

