parteEntera :: Float -> Integer

parteEntera x | (x < 1 && x > 0) || (x < 0 && x > -1) = 0 
              | x == 1 = 1
              | x == (-1) = (-1)
              | x > 1 = parteEntera(x-1) + 1
              | x < (-1) = parteEntera(x+1) + (-1)