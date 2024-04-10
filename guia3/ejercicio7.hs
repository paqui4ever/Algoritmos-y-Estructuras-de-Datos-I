distanciaManhattan :: (Flaot, Float, Float) -> (Float, Float, Float) -> Float
absoluto :: Float -> Float

absoluto x | x >= 0 = x
           | otherwise = (-x)

distanciaManhattan (x,y,z) (a,b,c) = absoluto(x-a) + absoluto(y-b) + absoluto(z-c)