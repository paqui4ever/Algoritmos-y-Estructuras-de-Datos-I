doubleMe :: Int -> Int
doubleMe x = x + x 

f4 x y z | x == y = z
         | x ** y == y = x
         | otherwise = y

f5 x y z | x == y = z
         | x ** y == y = z
         | otherwise = z