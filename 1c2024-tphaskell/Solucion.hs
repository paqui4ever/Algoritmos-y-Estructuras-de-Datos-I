module Solucion where
import Data.Char

-- Nombre de grupo: { Legalicenla }
-- Integrante1: { REDACTED , REDACTED }
-- Integrante2: { REDACTED, REDACTED }
-- Integrante3: { REDACTED, REDACTED }
-- Integrante4: { REDACTED , REDACTED }
-- Integrantes que abandonaron la materia: { }


{-

  .---.       .-''-.    .-_'''-.      ____      .---.    .-./`)     _______      .-''-.  ,---.   .--.  .---.        ____            
  | ,_|     .'_ _   \  '_( )_   \   .'  __ `.   | ,_|    \ .-.')   /   __  \   .'_ _   \ |    \  |  |  | ,_|      .'  __ `.         
,-./  )    / ( ` )   '|(_ o _)|  ' /   '  \  \,-./  )    / `-' \  | ,_/  \__) / ( ` )   '|  ,  \ |  |,-./  )     /   '  \  \        
\  '_ '`) . (_ o _)  |. (_,_)/___| |___|  /  |\  '_ '`)   `-'`"`,-./  )      . (_ o _)  ||  |\_ \|  |\  '_ '`)   |___|  /  |        
 > (_)  ) |  (_,_)___||  |  .-----.   _.-`   | > (_)  )   .---. \  '_ '`)    |  (_,_)___||  _( )_\  | > (_)  )      _.-`   |        
(  .  .-' '  \   .---.'  \  '-   .'.'   _    |(  .  .-'   |   |  > (_)  )  __'  \   .---.| (_ o _)  |(  .  .-'   .'   _    |        
 `-'`-'|___\  `-'    / \  `-'`   | |  _( )_  | `-'`-'|___ |   | (  .  .-'_/  )\  `-'    /|  (_,_)\  | `-'`-'|___ |  _( )_  |        
  |        \\       /   \        / \ (_ o _) /  |        \|   |  `-'`-'     /  \       / |  |    |  |  |        \\ (_ o _) /        
  `--------` `'-..-'     `'-...-'   '.(_,_).'   `--------`'---'    `._____.'    `'-..-'  '--'    '--'  `--------` '.(_,_).'         
                                                                                                                                    
-}



-- Función Auxiliar

absoluto :: Int -> Int
absoluto numero | numero >= 0 = numero
                | otherwise = (-1) * numero


{-           Ejercicios Resueltos           -}

{-               Ejercicio 1               -}
esMinuscula :: Char -> Bool
esMinuscula char = ord char >= 97 && ord char <= 123



{-               Ejercicio 2               -}
letraANatural :: Char -> Int
letraANatural char = ord char - 97



{-               Ejercicio 3               -}
desplazar :: Char -> Int -> Char
desplazar char numero | esMinuscula char = chr (mod (letraANatural char + numero) 26 + 97)
                      | otherwise = char



{-               Ejercicio 4               -}
cifrar :: String -> Int -> String
cifrar [] _ = []
cifrar (x:frase) numero | esMinuscula x = desplazar x numero : cifrar frase numero
                        | otherwise = x : cifrar frase numero



{-               Ejercicio 5               -}
descifrar :: String -> Int -> String
descifrar frase numero = cifrar frase (26 - numero)



{-               Ejercicio 6               -}
cifrarLista :: [String] -> [String]
cifrarLista lista = cifrarListaAux lista 0
   where
       cifrarListaAux :: [String] -> Int -> [String]
       cifrarListaAux [] _ = []
       cifrarListaAux (x:xs) add = cifrar x add : cifrarListaAux xs (add + 1)



{-               Ejercicio 7               -}
frecuencia :: String -> [Float]
frecuencia frase = frecuenciaAux frase 97
    where 
        frecuenciaAux :: String -> Int -> [Float]
        frecuenciaAux _ 123 = []
        frecuenciaAux frase add | not (chr add `elem` frase) = 0.0 : frecuenciaAux frase (add + 1)
                                | otherwise = porcentaje (chr add) frase : frecuenciaAux frase (add + 1)

        porcentaje :: Char -> String -> Float
        porcentaje char frase = cuantasVeces char frase * 100 / cantidadDeMinusculas frase

        cuantasVeces :: Char -> String -> Float
        cuantasVeces _ [] = 0.0
        cuantasVeces x (y:ys) | x == y = 1.0 + cuantasVeces x ys
                              | otherwise = cuantasVeces x ys

        cantidadDeMinusculas :: String -> Float
        cantidadDeMinusculas [] = 0.0
        cantidadDeMinusculas (x:xs) | esMinuscula x = 1.0 + cantidadDeMinusculas xs
                                    | otherwise = cantidadDeMinusculas xs



{-               Ejercicio 8               -}
cifradoMasFrecuente :: String -> Int -> (Char, Float)
cifradoMasFrecuente frase numero = (letraMasFrecuente fraseCifrada, elementoMasGrande frecuenciaDeLaFraseCifrada)
    where
        fraseCifrada = cifrar frase numero :: String
        frecuenciaDeLaFraseCifrada = frecuencia fraseCifrada :: [Float]

        letraMasFrecuente :: String -> Char
        letraMasFrecuente cifrado = chr (length (hastaElementoMasGrande frecuenciaDeLaFraseCifrada) + 97)


        elementoMasGrande :: [Float] -> Float
        elementoMasGrande [x] = x
        elementoMasGrande (x:y:frecuencia) | x >= y = elementoMasGrande (x:frecuencia)
                                           | otherwise = elementoMasGrande (y:frecuencia)

        hastaElementoMasGrande :: [Float] -> [Float]
        hastaElementoMasGrande (x:frecuencia) | x == elementoMasGrande frecuenciaDeLaFraseCifrada = [] 
                                              | otherwise = x : hastaElementoMasGrande frecuencia 



{-               Ejercicio 9               -}
esDescifrado :: String -> String -> Bool 
esDescifrado frase1 frase2 = esDescifradoAux frase1 frase2 0
     where
        esDescifradoAux frase1 frase2 n | n > 25 = False
                                        | frase2 == cifrar frase1 n = True 
                                        | otherwise = esDescifradoAux frase1 frase2 (n + 1)



{-               Ejercicio 10               -}
todosLosDescifrados :: [String] -> [(String, String)]
todosLosDescifrados [] = []
todosLosDescifrados (x:xs) = todosLosDescifradosAux (x:xs) ++ todosLosDescifrados xs
    where 
        todosLosDescifradosAux :: [String] -> [(String, String)]
        todosLosDescifradosAux [] = []
        todosLosDescifradosAux [x] = []
        todosLosDescifradosAux (x:y:xs) | esDescifrado x y = (x, y) : (y, x) : todosLosDescifrados (x:xs)
                                        | otherwise = todosLosDescifrados (x:xs)



{-               Ejercicio 11               -}
expandirClave :: String -> Int -> String
expandirClave clave n | n > length clave = expandirClave (clave ++ clave) n
                      | otherwise = soltar clave (length clave - n)
    where
        dropLast :: [a] -> [a]
        dropLast [x] = []
        dropLast (x:xs) = x : dropLast xs  

        soltar :: [a] -> Int -> [a]
        soltar lista 0 = lista
        soltar lista numero = soltar (dropLast lista) (numero - 1)



{-               Ejercicio 12               -}
cifrarVigenere :: String -> String -> String
cifrarVigenere [] _ = []
cifrarVigenere frase clave = cifrarVigereneAux frase (expandirClave clave (length frase))
    where
        cifrarVigereneAux :: String -> String -> String
        cifrarVigereneAux [] _ = []
        cifrarVigereneAux (x:frase) (y:clave) = cifrar [x] (letraANatural y) ++ cifrarVigereneAux frase clave



{-               Ejercicio 13               -}
descifrarVigenere :: String -> String -> String
descifrarVigenere [] _ = []
descifrarVigenere frase clave = descifrarVigereneAux frase (expandirClave clave (length frase))
    where
        descifrarVigereneAux :: String -> String -> String
        descifrarVigereneAux [] _ = []
        descifrarVigereneAux (x:frase) (y:clave) = descifrar [x] (letraANatural y) ++ descifrarVigereneAux frase clave



{-               Ejercicio 14               -}
peorCifrado :: String -> [String] -> String
peorCifrado frase claves = encontrarPeorClave claves (todasLasDistancias frase (todosLosCifrados frase claves))
     where
         distanciaSecuencias :: String -> String -> Int
         distanciaSecuencias [] [] = 0
         distanciaSecuencias (x:xs) (y:ys) = absoluto (letraANatural x - letraANatural y) + distanciaSecuencias xs ys

         todosLosCifrados :: String -> [String] -> [String]
         todosLosCifrados _ [] = [] 
         todosLosCifrados frase (x:claves) = cifrarVigenere frase x : todosLosCifrados frase claves

         todasLasDistancias ::  String -> [String] -> [Int]
         todasLasDistancias _ [] = []
         todasLasDistancias frase (x:cifrados) = distanciaSecuencias frase x : todasLasDistancias frase cifrados
         
         encontrarPeorClave :: [String] -> [Int] -> String -- Encuentra la peor clave por eliminación.
         encontrarPeorClave [x] _ = x
         encontrarPeorClave (x:y:claves) (d1:d2:distancias) | d1 <= d2 = encontrarPeorClave (x:claves) (d1:distancias)
                                                            | otherwise = encontrarPeorClave (y:claves) (d2:distancias)
         
         

{-               Ejercicio 15               -}
combinacionesVigenere :: [String] -> [String] -> String -> [(String, String)]
combinacionesVigenere msjs claves cifrado = cifrarTodo msjs claves
    where 
        expansionClave :: String -> String -> String
        expansionClave clave mensaje = expandirClave clave (length mensaje)

        cifrarPrimero :: String -> [String] -> [(String, String)]
        cifrarPrimero _ [] = []
        cifrarPrimero mensaje (x:claves) | cifrarVigenere mensaje (expansionClave x mensaje) == cifrado = (mensaje, x) : cifrarPrimero mensaje claves
                                         | otherwise = cifrarPrimero mensaje claves

        cifrarTodo :: [String] -> [String] -> [(String, String)]
        cifrarTodo [] _ = []
        cifrarTodo (x:mensajes) claves = cifrarPrimero x claves ++ cifrarTodo mensajes claves
