medioFact :: Integer -> Integer

medioFact 0 = 1
medioFact 1 = 1
medioFact x = medioFact (x-2) * x

-- medioFact 10 = medioFact (x-2) * x
-- medioFact 1 = 1