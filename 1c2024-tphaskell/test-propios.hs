import Test.HUnit
import Solucion
import Data.List
-- No está permitido agregar nuevos imports.

runTestsPropios = runTestTT allTests

allTests = test [
    "esMinuscula" ~: testsEjesMinuscula,
    "letraANatural" ~: testsEjletraANatural,
    "desplazar" ~: testsEjdesplazar,
    "cifrar" ~: testsEjcifrar,
    "descifrar" ~: testsEjdescifrar,
    "cifrarLista" ~: testsEjcifrarLista,
    "frecuencia" ~: testsEjfrecuencia,
    "cifradoMasFrecuente" ~: testsEjcifradoMasFrecuente,
    "esDescifrado" ~: testsEjesDescifrado,
    "todosLosDescifrados" ~: testsEjtodosLosDescifrados,
    "expandirClave" ~: testsEjexpandirClave,
    "cifrarVigenere" ~: testsEjcifrarVigenere,
    "descifrarVigenere" ~: testsEjdescifrarVigenere,
    "peorCifrado" ~: testsEjpeorCifrado,
    "combinacionesVigenere" ~: testsEjcombinacionesVigenere
    ]


testsEjesMinuscula = test [
    "esMinuscula letra minuscula a" ~: (esMinuscula 'a') ~?= True,
    "esMinuscula letra minuscula z" ~: (esMinuscula 'z') ~?= True,
    "esMinuscula ñ" ~: (esMinuscula 'ñ') ~?= False,
    "esMinuscula signo de puntuación" ~: (esMinuscula '.') ~?= False,
    "esMinuscula espacio" ~: (esMinuscula ' ') ~?= False,
    "esMinuscula primera letra mayúscula" ~: (esMinuscula 'A') ~?= False,
    "esMinuscula última letra mayúscula" ~: (esMinuscula 'Z') ~?= False,
    "esMinuscula vocal con tilde" ~:  (esMinuscula 'á') ~?= False
    ]

testsEjletraANatural = test [
    "letraANatural letra a" ~: (letraANatural 'a') ~?= 0,
    "letraANatural letra z" ~: (letraANatural 'z') ~?= 25,
    "letraANatural letra n" ~: (letraANatural 'n') ~?= 13
    ]

testsEjdesplazar = test [
    "desplazar letra a una posicion atrás" ~: (desplazar 'a' (-1)) ~?= 'z',
    "desplazar letra a una posicion adelante" ~: (desplazar 'a' 1) ~?= 'b',
    "desplazar letra z una posicion adelante" ~: (desplazar 'z' 1) ~?= 'a',
    "desplazar letra y 10 posiciones adelante" ~: (desplazar 'y' 10) ~?= 'i',
    "desplazar letra del medio 5 posiciones atras" ~: (desplazar 'n' (-5)) ~?= 'i',
    "desplazar letra del medio 5 posiciones adelante" ~: (desplazar 'n' 5) ~?= 's',
    "desplazar letra del medio 5 posiciones adelante" ~: (desplazar ' ' 1) ~?= ' '
    ]

testsEjcifrar = test [
    "cifrar todas minusculas" ~: (cifrar "computacion" 3) ~?= "frpsxwdflrq",
    "cifrar palabra con letras que no son minusculas" ~: (cifrar "COMPUTACION" 3) ~?= "COMPUTACION",
    "cifrar palabra con letras que no son minusculas y minusculas"  ~: (cifrar "cOmPu-TaCiOn" 3) ~?= "fOpPx-TdClOq",
    "no cifrar"  ~: (cifrar "computacion" 0) ~?= "computacion",
    "cifrar string vacion" ~: (cifrar "" 6) ~?= ""
    ]

testsEjdescifrar = test [
    "descifrar todas minusculas" ~: (descifrar "frpsxwdflrq" 3) ~?= "computacion",
    "descifrar todas minusculas" ~: (descifrar "zorro" 2) ~?= "xmppm",
    "no descifrar" ~: (descifrar "zorro" 0) ~?= "zorro",
    "descifrar palabra con letras que no son minusculas y minusculas"  ~: (descifrar "ElefaNtE." 25) ~?= "EmfgbNuE.",
    "descifrar palabra con letras que no son minusculas" ~: (descifrar "COMPUTACION" 25) ~?= "COMPUTACION",
    "descifrar string vacio" ~: (descifrar "" 25) ~?= ""
    ]

testsEjcifrarLista = test [
    "cifrar lista vacia" ~: ( cifrarLista [] ) ~?= [],
    "cifrar lista 3 elementos"  ~: ( cifrarLista ["compu", "labo", "intro"] ) ~?= ["compu", "mbcp", "kpvtq"], 
    "cifrar lista 1 elemento" ~: ( cifrarLista ["algoritmo"] ) ~?= ["algoritmo"]
    ]

testsEjfrecuencia = test [
    "frecuencia ejemplo del TP" ~: expectlistProximity (frecuencia "taller")  (lista1),
    "frecuencia pangrama perfecto" ~: expectlistProximity (frecuencia "un jugoso zumo de piña y kiwi bien frío es exquisito y no lleva alcohol") (lista2), 
    "frecuencia abecedario" ~: expectlistProximity (frecuencia "abcdefghijklmnopqrstuvwxyz")(lista3),
    "frecuencia palabra vacia " ~: (frecuencia "") ~?= lista4,
    "frecuencia palabra con caracteres que no sean minúsculas" ~: expectlistProximity (frecuencia "ComPutacion")(lista5),
    "frecuencia palabra con la misma letra repetida" ~: (frecuencia "eeeeeee") ~?= lista6
    ]

testsEjcifradoMasFrecuente = test [
    "cifrado mas frecuente palabra mas larga" ~: expectAnyTuplaAprox (cifradoMasFrecuente "electroencefalografista" 6) [('k', 17.391304)],
    "cifrado mas frecuente palabra mas corta" ~: expectAnyTuplaAprox (cifradoMasFrecuente "a" 2) [('c', 100.0)],
    "cifrado mas frecuente palabra con minusculas y no minusculas" ~: expectAnyTuplaAprox (cifradoMasFrecuente "aN" 3) [('d', 100.0)],
    "cifrado mas frecuente palabra con minusculas y no minusculas" ~: expectAnyTuplaAprox (cifradoMasFrecuente "a.d" 3) [ ('d', 50.0) , ('g', 50.0)],
    "cifrado mas frecuente palabra de ejemplo TP" ~: expectAnyTuplaAprox (cifradoMasFrecuente "taller" 3) [('o', 33.333336), ('o', 33.333332)]
    ]

testsEjesDescifrado = test [
    "es descifrado palabra cualquiera" ~: (esDescifrado "kiwi" "pnbn") ~?= True, 
    "es descifrado palabra de Ejemplo TP" ~: (esDescifrado "taller" "compu") ~?= False,
    "es descifrado dos string vacios" ~: (esDescifrado "" "") ~?= True,
    "es descifrado primer string vacio " ~: (esDescifrado "" "a") ~?= False,
    "es descifrado segundo string vacio " ~: (esDescifrado "a" "") ~?= False
    ]

testsEjtodosLosDescifrados = test [
    "lista con dos elementos y un descifrado verdadero" ~: expectPermutacion (todosLosDescifrados ["kiwi", "pnbn"] ) [("pnbn", "kiwi"),("kiwi", "pnbn")],
    "lista con un solo elemento" ~: (todosLosDescifrados ["kiwi"]) ~?= [],
    "lista vacia "  ~: (todosLosDescifrados [])  ~?= [],
    "lista con tres elementos y un descifrado verdadero" ~: expectPermutacion (todosLosDescifrados["compu", "frpsx", "mywza"]) [("frpsx", "compu"), ("compu", "frpsx")],
    "lista con tres elementos y tres descifrados verdaderos"  ~: expectPermutacion (todosLosDescifrados["kiwi","pnbn","omam"]) [("kiwi","pnbn"),("pnbn","kiwi"),("kiwi","omam"),("omam","kiwi"),("pnbn","omam"),("omam","pnbn")],
    "lista con tres elementos y tres descifrados verdaderos permutados1" ~: expectPermutacion (todosLosDescifrados["kiwi","pnbn","omam"]) [("pnbn","kiwi"),("kiwi","pnbn"), ("omam","kiwi"),("kiwi","omam"),("omam","pnbn"), ("pnbn","omam")],
    "lista con tres elementos y tres descifrados verdaderos permutados2" ~: expectPermutacion (todosLosDescifrados["kiwi","pnbn","omam"]) [("pnbn","kiwi"),("kiwi","pnbn"), ("kiwi","omam"),("omam","pnbn"), ("pnbn","omam"), ("omam","kiwi")]
    
    ]

testsEjexpandirClave = test [
    "expandir clave con clave de una letra y mayor que uno" ~: ( expandirClave "a" 5 )  ~?= "aaaaa",
    "expandir clave con más cantidad de letras que n" ~: ( expandirClave "abcefg" 4 )  ~?= "abce",
    "expandir clave con cantidad de letras menores que n"  ~: ( expandirClave "compu" 8 )  ~?= "compucom" 

    ]

testsEjcifrarVigenere = test [
    "cifrar Vigenere con palabra cualquiera y clave de una letra" ~: (cifrarVigenere "murcielago" "o") ~?= "aifqwszouc",
    "cifrar Vigenere con palabra cualquiera y clave de dos letras"  ~: (cifrarVigenere "murcielago" "ab") ~?= "mvrdiflbgp",
    "cifrar Vigenere frase y clave de dos letras"  ~: (cifrarVigenere "el veloz murcielago hindu" "bz") ~?= "fk ufkpy lvqdhfkbfp ihocv",
    "cifrar Vigenere palabra de 10 letras y clave de nueve letras"  ~: (cifrarVigenere "murcielago" "armadillo")  ~?= "mldclmwluo",
    "cifrar Vigenere ejemplo del TP"  ~: (cifrarVigenere "computacion" "ip") ~?= "kdueciirqdv",
    "cifrar Vigenere string vacío" ~: (cifrarVigenere "" "ip") ~?= ""
  
    ]


testsEjdescifrarVigenere = test [
    "descifrar Vigenere con palabra cualquiera y clave de una letra" ~: (descifrarVigenere "aifqwszouc" "o") ~?= "murcielago",
    "descifrar Vigenere con palabra cualquiera y clave de dos letras"  ~: (descifrarVigenere "mvrdiflbgp" "ab") ~?= "murcielago",
    "descifrar Vigenere palabra y clave de nueve letras"  ~: (descifrarVigenere "mldclmwluo" "armadillo")  ~?= "murcielago",
    "descifrar Vigenere frase y clave de dos letras"  ~: (descifrarVigenere "fk ufkpy lvqdhfkbfp ihocv" "bz") ~?= "el veloz murcielago hindu",
    "descifrar Vigenere ejemplo del TP"  ~: (descifrarVigenere "kdueciirqdv" "ip")  ~?= "computacion",
    "descifrar Vigenere string vacío" ~: (cifrarVigenere "" "ip") ~?= ""
    ]

testsEjpeorCifrado = test [
    "peor cifrado palabra computacion y claves cd ab bd" ~: ( peorCifrado "computacion" ["cd","ab","bd"]) ~?= "ab",
    "peor cifrado palabra computacion y claves afge zw bec" ~: ( peorCifrado "computacion" ["zw","afge","bec"]) ~?= "bec",
    "peor cifrado palabra y una clave" ~: ( peorCifrado "saxofon" ["zw"])  ~?= "zw",
    "peor cifrado palabra y una clave" ~: ( peorCifrado "saxofon" ["zzxxy", "wavz", "zya", "etno"])  ~?= "wavz",
    "peor cifrado string vacio" ~: ( peorCifrado "" ["ip", "asdef", "ksy"] ) ~?= "ip",
    "peor cifrado ejemplo del TP" ~: (peorCifrado "computacion" ["ip", "asdef", "ksy"]) ~?= "asdef"
    ]

testsEjcombinacionesVigenere = test [
    "combinaciones Vigenere con algun caracter no minuscula en msjes" ~: (combinacionesVigenere ["Hola"] ["b"] "ipmb") ~?= [],
    "combinaciones Vigenere sin ninguna clave valida para cifrado"  ~: (combinacionesVigenere ["hola", "mundo"] ["a", "z"] "ipmb") ~?= [],
    "combinaciones Vigenere ejemplo del TP orden cambiado opcion1" ~: (combinacionesVigenere ["hola", "mundo"] ["b", "a"] "ipmb") ~?= [("hola", "b")],
    "combinaciones Vigenere ejemplo del TP orden cambiado opcion2" ~: (combinacionesVigenere ["mundo", "hola"] ["b", "a"] "ipmb") ~?= [("hola", "b")],
    "combinaciones Vigenere ejemplo del TP orden cambiado opcion3" ~: (combinacionesVigenere ["mundo", "hola"] ["a", "b"] "ipmb") ~?= [("hola", "b")],
    "combinaciones Vigenere ejemplo del TP " ~: (combinacionesVigenere ["hola", "mundo"] ["a", "b"] "ipmb") ~?= [("hola", "b")],
    "combinaciones Vigenere con mas de un cifrado valido" ~: (combinacionesVigenere ["hola", "mund", "mundo"] ["wvzy", "b","c"] "ipmb") ~?= [("hola", "b"), ("mund", "wvzy")], 
    "combinaciones Vigenere extension de listas mayor a dos" ~: (combinacionesVigenere ["el", "veloz", "murcielago", "hindu"] ["xep", "armadillo", "ob", "ihocc" ] "mldclmwluo") ~?= [("murcielago", "armadillo")]
    
    ]

 --listas para funcion frecuencia

lista1 = [16.666668,0.0,0.0,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0,33.333336,0.0,0.0,0.0,0.0,0.0,16.666668,0.0,16.666668,0.0,0.0,0.0,0.0,0.0,0.0]
lista2 = [5.454545,1.818181,1.818181,1.818181,9.090909,1.818181,1.818181,1.818181,10.909090,1.818181,1.818181,7.272727,1.818181,5.454545,14.545454,1.818181,1.818181,1.818181,5.454545,1.818181,7.272727,1.818181,1.818181,1.818181,3.636363,1.818181] 
lista3 = [3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153,3.846153]
lista4 = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
lista5 = [11.111111,0.0,11.111111,0.0,0.0,0.0,0.0,0.0,11.111111,0.0,0.0,0.0,11.111111,11.111111,22.222222,0.0,0.0,0.0,0.0,11.111111,11.111111,0.0,0.0,0.0,0.0,0.0]
lista6 = [0.0,0.0,0.0,0.0,100.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]



-- Funciones útiles

-- margetFloat(): Float
-- asegura: res es igual a 0.00001
margenFloat = 0.00001

-- expectAny (actual: a, expected: [a]): Test
-- asegura: res es un Test Verdadero si y sólo si actual pertenece a la lista expected
expectAny :: (Foldable t, Eq a, Show a, Show (t a)) => a -> t a -> Test
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)


-- expectlistProximity (actual: [Float], expected: [Float]): Test
-- asegura: res es un Test Verdadero si y sólo si:
--                  |actual| = |expected|
--                  para todo i entero tal que 0<=i<|actual|, |actual[i] - expected[i]| < margenFloat()
expectlistProximity:: [Float] -> [Float] -> Test
expectlistProximity actual expected = esParecidoLista actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esParecidoLista :: [Float] -> [Float] -> Bool
esParecidoLista actual expected = (length actual) == (length expected) && (esParecidoUnaAUno actual expected)

esParecidoUnaAUno :: [Float] -> [Float] -> Bool
esParecidoUnaAUno [] [] = True
esParecidoUnaAUno (x:xs) (y:ys) = (aproximado x y) && (esParecidoUnaAUno xs ys)

aproximado :: Float -> Float -> Bool
aproximado x y = abs (x - y) < margenFloat


-- expectAnyTuplaAprox (actual: CharxFloat, expected: [CharxFloat]): Test
-- asegura: res un Test Verdadero si y sólo si:
--                  para algun i entero tal que 0<=i<|expected|,
--                         (fst expected[i]) == (fst actual) && |(snd expected[i]) - (snd actual)| < margenFloat()

expectAnyTuplaAprox :: (Char, Float) -> [(Char, Float)] -> Test
expectAnyTuplaAprox actual expected = elemAproxTupla actual expected ~? ("expected any of: " ++ show expected ++ "\nbut got: " ++ show actual)

elemAproxTupla :: (Char, Float) -> [(Char, Float)] -> Bool
elemAproxTupla _ [] = False
elemAproxTupla (ac,af) ((bc,bf):bs) = sonAprox || (elemAproxTupla (ac,af) bs)
    where sonAprox = (ac == bc) && (aproximado af bf)



-- expectPermutacion (actual: [T], expected[T]) : Test
-- asegura: res es un Test Verdadero si y sólo si:
--            para todo elemento e de tipo T, #Apariciones(actual, e) = #Apariciones(expected, e)

expectPermutacion :: (Ord a, Show a) => [a] -> [a] -> Test
expectPermutacion actual expected = esPermutacion actual expected ~? ("expected list: " ++ show expected ++ "\nbut got: " ++ show actual)

esPermutacion :: Ord a => [a] -> [a] -> Bool
esPermutacion a b = (length a == length b) && (sort a == sort b)