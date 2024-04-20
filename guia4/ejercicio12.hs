raizDe2Aprox :: Integer -> Float

raizDe2Aprox 1 = 2
raizDe2Aprox x = 2 + 1 / raizDe2Aprox (x-1)

raizDeDos :: Float
raizDeDos = (raizDe2Aprox 10) - 1