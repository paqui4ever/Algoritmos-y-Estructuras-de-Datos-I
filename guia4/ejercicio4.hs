sumaImpares :: Integer -> Integer

sumaImpares 1 = 1
sumaImpares x = sumaImpares (x-1) + 2

-- sumaImpares 1 = 1
-- sumaImpares 3 = 1+3+5 = sumaImpares (2) + 2 = sumaImpares (x-1) + 2