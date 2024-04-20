eAprox :: Integer -> Float
factorial :: Integer -> Integer

factorial 0 = 1
factorial n = n * factorial (n-1)

eAprox 0 = 0
eAprox n =  1 / fromInteger (factorial n) + eAprox(n-1) -- Uso fromInteger (funcion incluida en Haskell prelude) para que pueda ser Integer -> Float

e :: Float 
e = eAprox 10