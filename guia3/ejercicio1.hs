f :: Int -> Int
g :: Int -> Int
h :: Int -> Int
k :: Int -> Int

f n | n == 1 = 8
    | n == 3 = 131
    | n == 16 = 16

g x | x == 8 = 16
    | x == 16 = 4
    | x == 131 = 1

h m | m == 8 = 16
    | m == 16 = 131
    | m == 131 = 8

k z | z == 1 = 16
    | z == 4 = 1
    | z == 16 = 4
