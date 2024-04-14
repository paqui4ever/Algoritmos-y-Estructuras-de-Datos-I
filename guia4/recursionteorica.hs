f :: Integer -> Integer

f n | n == 1 = 1
    | otherwise = f (n-1) + 2*n - 1