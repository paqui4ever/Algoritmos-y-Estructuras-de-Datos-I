bisiesto :: Integer -> Bool

bisiesto x | (mod x 4 /= 0) = False
           | (mod x 100 == 0 && mod x 400 /= 0) = False
           | otherwise = True

           