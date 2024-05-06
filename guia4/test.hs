sumaDeDivisoresHastaM :: Integer -> Integer -> Integer
sumaDeDivisoresHastaM n 1 = 1
sumaDeDivisoresHastaM n m | mod n m == 0 = m + sumaDeDivisoresHastaM n (m-1)
                          | otherwise = sumaDeDivisoresHastaM n (m-1)

-- sumaDeDivisoresHastaM 2 2 = mod 2 1 == 0? Si => m + sumaDeDivisoresHastaM 
-- sumaDeDivisoresHastaM 3 2 = mod 3 2 == 0? No => mod 3 (2-1) == 0? SI = sumaDeDivisoresHastaM n (m-1)
-- sumaDeDivisoresHastaM 3 3 = mod 3 3 == 0? Si => m + sumaDeDivisoresHastaM n (m-1) 

sumaDeDivisoresDesdeN :: Integer -> Integer -> Integer
sumaDeDivisoresDesdeN x n = 1 + sumaDeDivisoresHastaM x x - sumaDeDivisoresHastaM x n -- Lo saco por complemento de conjuntos

-- {1,3} = 1+3
-- desde 2 = {3}, desde 1 = {1,3}

numeroDePosicionX :: Integer -> [Integer] -> Integer
numeroDePosicionX _ [] = 0
numeroDePosicionX 0 _ = 0
numeroDePosicionX posicion (x:xs) | posicion == 1 = x
                                  | otherwise = numeroDePosicionX (posicion - 1) xs 

sumatoriaHasta :: (Num t) => [t] -> Int -> t
sumatoriaHasta [] _ = 0
sumatoriaHasta _ 0 = 0
sumatoriaHasta (x:xs) m = x + sumatoriaHasta xs (m-1)

sumaAcumuladaDesde :: (Num t) => [t] -> Int -> [t]
sumaAcumuladaDesde [] _ = []
sumaAcumuladaDesde (x:xs) m | length (x:xs) >= m = sumatoriaHasta (x:xs) m : sumaAcumuladaDesde (x:xs) (m+1) -- necesito que la longitud sea mayor que el numero dado, cuando se deja de cumplir concatena una lista vacia
                            | otherwise = []

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada lista = sumaAcumuladaDesde lista 1 

sumaDeDivisoresHasta :: Int -> Int -> Int
sumaDeDivisoresHasta _ 0 = 0
sumaDeDivisoresHasta n limite | mod n limite == 0 = limite + sumaDeDivisoresHasta n (limite - 1)
                              | otherwise = sumaDeDivisoresHasta n (limite - 1)

sumaDeDivisores :: Int -> Int 
sumaDeDivisores 0 = 0
sumaDeDivisores n = sumaDeDivisoresHasta n n 

esPrimo :: Integer -> Bool
esPrimo 2 = True
esPrimo 1 = False
esPrimo n = menorDivisor n == n 

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorDesde n 2 

menorDivisorDesde :: Integer -> Integer -> Integer
menorDivisorDesde n base | mod n base == 0 = base
                         | otherwise = menorDivisorDesde n (base + 1)

siguientePrimo :: Integer -> Integer
siguientePrimo 2 = 5
siguientePrimo n | esPrimo (n+1) = n+1
                 | otherwise = siguientePrimo (n+1)

nEsimoPrimo :: Integer -> Integer 
nEsimoPrimo 1 = 2
nEsimoPrimo 2 = 3
nEsimoPrimo n = siguientePrimo (nEsimoPrimo (n-1))

-- nEsimoPrimo 3 = [2,3,5]
-- nEsimoPrimo 1 = 2 = siguientePrimo 1
-- nEsimoPrimo 2 = siguientePrimo 2

sumaInicialDePrimosHasta :: Integer -> Integer
sumaInicialDePrimosHasta 1 = 2
sumaInicialDePrimosHasta n = nEsimoPrimo n + sumaInicialDePrimosHasta (n - 1)

sumaInicialDePrimosDesde :: Integer -> Integer -> Bool 
sumaInicialDePrimosDesde m 1 = False
sumaInicialDePrimosDesde m n | sumaInicialDePrimosHasta m > n = False
                                | sumaInicialDePrimosHasta m == n = True
                                | otherwise = sumaInicialDePrimosDesde (m+1) n 

sumaIncialDePrimos :: Integer -> Bool 
sumaIncialDePrimos 5 = True
sumaInicialDePrimos n = sumaInicialDePrimosDesde 1 n 

-- sumaInicialDePrimosHasta 2 = 2+3 = siguientePrimo (n-1) + siguientePrimo n 
-- sumaIncialDePrimosHasta