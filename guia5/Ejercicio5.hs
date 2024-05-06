sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada (x:xs) = sumaAcumuladaDesde (x:xs) 1 

-- sumaAcumulada [1,2,3,4,5] = [1,3,6,10,15] = [1,1+2,1+2+3,1+2+3+4,1+2+3+4+5] = [pos 1, pos 1 + pos 2, pos 1 + pos 2 + pos 3, pos 1 + pos 2 + pos 3 + pos 4, ...]
-- => [x, sumaAcumulada (1) + pos 2, sumaAcumulada (2) + pos 3]

sumatoriaHasta :: (Num t) => [t] -> Int -> t
sumatoriaHasta [] _ = 0
sumatoriaHasta _ 0 = 0
sumatoriaHasta (x:xs) n = x + sumatoriaHasta xs (n-1)

sumaAcumuladaDesde :: (Num t) => [t] -> Int -> [t]
sumaAcumuladaDesde [] _ = []
sumaAcumuladaDesde (x:xs) n | n <= length (x:xs) = sumatoriaHasta (x:xs) n : sumaAcumuladaDesde (x:xs) (n+1) -- Calculo el primero con sumatoriaHasta y luego hago recursion sobre eso con un n 
                                                                                                             -- cada vez mas grande, asi cumpliendo la sumaAcumulada
                            | otherwise = []
