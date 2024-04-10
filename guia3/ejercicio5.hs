f :: Int -> Int
g :: Int -> Int
todosMenores :: (Int, Int, Int) -> Bool

todosMenores (x,y,z) | f x > g x && f y > g y && f z > g z = True
                     | otherwise = False

f x | x <= 7 = x*x
    | x > 7 = 2*x - 1

g x | mod x 2 == 0 = div x 2
    | otherwise = 3*x + 1