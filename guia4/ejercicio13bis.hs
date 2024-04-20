sumatoriaPotencia :: Integer -> Integer -> Integer
sumatoriaPotencia n m | n < 1 || m < 1 = 0
                      | n == 1 && m == 1 = 1
                      | otherwise = n^m + sumatoriaPotencia n (m-1)

sumatoriaDoble :: Integer -> Integer -> Integer
sumatoriaDoble 1 m = sumatoriaPotencia 1 m -- Pasa directamente a la sumatoria desde j=1 hasta m de n^j 
sumatoriaDoble n m = sumatoriaPotencia n m + sumatoriaPotencia (n-1) m -- Como n!=0 entonces ejecuta el termino completo con la sumatoria de potencia sumada a la sumatoria doble desde n-1 ya que le saqué una iteración con la sumatoria de potencia