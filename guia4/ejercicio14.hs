sumaPotencias :: Integer -> Integer -> Integer -> Integer
recursionSobreM :: Integer -> Integer -> Integer -> Integer

recursionSobreN n m q | n == 1 = q^(1+m)
                      | otherwise = q^(n+m) + recursionSobreM n (m-1) q 

sumaPotencias n m q | n == 1 = recursionSobreM 1 m q
                    | otherwise = recursionSobreM n m q + sumaPotencias (n-1) m q