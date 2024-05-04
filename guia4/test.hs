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


