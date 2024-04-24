suma :: [Integer] -> Integer
suma [] = 0
suma (x:xs) = x + suma xs

tomar :: Integer -> [Integer] -> [Integer]
tomar 0 _ = []
tomar _ [] = []
tomar n (x:xs) = x : tomar (n-1) xs 

-- take 1 [1,2,3] = [1]
-- take 2 [1,2,3] = [1,2]
-- take 3 [1,2,3] = [1,2,3]

element :: Integer -> [Integer] -> Bool
element _ [] = False
element n (x:xs) | n == x = True
                 | otherwise = element n xs

-- element 1 [1,2] = True => n == x?
-- element 2 [1,2] = True =>  n== x? NO => x == xs?

sorted :: [Integer] -> Bool
sorted [] = False
sorted [x] = True
sorted (x:y:xs) = x < y && sorted (y:xs) 


-- sorted [2,3,1] = False => 2 < 3? Si => 3 < 1? No => False
-- sorted [1,2,3] = True => 1 < 2? Si => 2 < 3? Si => True