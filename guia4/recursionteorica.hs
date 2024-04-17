f :: Integer -> Integer

f n | n == 1 = 1 -- Defino el caso base en el cual f(1)=1
    | otherwise = f (n-1) + 2*n - 1 --Defino f(n) en base a f(n-1)