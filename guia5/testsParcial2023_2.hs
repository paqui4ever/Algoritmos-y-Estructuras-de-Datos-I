import Test.HUnit
import Parcial2023_2

testSuiteAtajaronSuplentes = test [
    "atajaronSuplentesVacioArqueros" ~: (atajaronSuplentes [] [1,2,3] 25) ~?= 0,
    "atajaronSuplentesVacioGoles" ~: (atajaronSuplentes [("Huracan", "Armani"), ("River", "Pepe")] [] 42) ~?= 0,
    "atajaronSuplentesVacioTotalGoles" ~: (atajaronSuplentes [("Huracan", "Armani"), ("River", "Pepe")] [1,42] 0) ~?= 0,
    "atajaronSuplentesVacioTodo" ~: (atajaronSuplentes [] [] 0) ~?= 0,
    "atajaronSuplentes1" ~: (atajaronSuplentes [("Huracan", "Armani")] [23] 23) ~?= 0,
    "atajaronSuplentes2" ~: (atajaronSuplentes [("Huracan", "Armani")] [23] 25) ~?= 2,
    "atajaronSuplentes3" ~: (atajaronSuplentes [("Huracan", "Armani")] [23] 32) ~?= 9,
    "atajaronSuplentesNormal" ~: (atajaronSuplentes [("Huracan", "Armani"), ("River", "Pepe")] [1,14] 15) ~?= 0]

correrTestsAtajaronSuplentes = runTestTT testSuiteAtajaronSuplentes 

testSuiteEquiposValidos = test [
    "equiposValidosVacio" ~: (equiposValidos []) ~?= True,
    "equiposValidosIntraTuplasIguales" ~: (equiposValidos [("Huracan", "Huracan")]) ~?= False,
    "equiposValidosEntreTuplasIguales" ~: (equiposValidos [("Huracan", "Armani"), ("Huracan", "Armani")]) ~?= False,
    "equiposValidosArquerosRepetidos" ~: (equiposValidos [("Huracan", "Armani"), ("River", "Armani")]) ~?= False,
    "equiposValidosEquiposRepetidos" ~: (equiposValidos [("Huracan", "Armani"), ("Huracan", "Pepe")]) ~?= False,
    "equiposValidosNormal" ~: (equiposValidos [("Huracan", "Armani"), ("Boca", "Romero"), ("Estudiantes", "Pichichi")]) ~?= True]

correrTestsEquiposValidos = runTestTT testSuiteEquiposValidos

testSuitePorcentajeDeGoles = test [
    "porcentajeDeGolesSinArquero" ~: (porcentajeDeGoles " " [("Boca", "Romero")] [65]) ~?= 0,
    "porcentajeDeGolesSinEquipos" ~: (porcentajeDeGoles "Romero" [] [25]) ~?= 0,
    "porcentajeDeGolesSinGoles" ~: (porcentajeDeGoles "Romero" [("Boca", "Romero")] []) ~?= 0,
    "porcentajeDeGoles1Elemento" ~: (porcentajeDeGoles "Romero" [("Boca", "Romero")] [25]) ~?= 100,
    "porcentajeDeGoles2Elementos" ~: (porcentajeDeGoles "Romero" [("River", "Armani"), ("Boca", "Romero")] [50,50]) ~?= 50,
    "porcentajeDeGoles3Elementos" ~: (porcentajeDeGoles "Romero" [("River", "Armani"), ("Boca", "Romero"), ("Huracan", "Pedro")] [50,25,25]) ~?= 25]

correrTestsPorcentajeDeGoles = runTestTT testSuitePorcentajeDeGoles

testSuiteVallaMenosVencida = test [
    "vallaMenosVencidaSinEquipos" ~: (vallaMenosVencida [] [1,2,3]) ~?= " ",
    "vallaMenosVencidaSinGoles" ~: (vallaMenosVencida [("Boca", "Romero")] []) ~?= " ",
    "vallaMenosVencida1Elemento" ~: (vallaMenosVencida [("Boca", "Romero")] [24]) ~?= "Romero",
    "vallaMenosVencida2Elementos" ~: (vallaMenosVencida [("Boca", "Romero"), ("River", "Armani")] [23,27]) ~?= "Romero",
    "vallaMenosVencida3Elementos" ~: (vallaMenosVencida [("Boca", "Romero"), ("River", "Armani"), ("Huracan", "Pedro")] [23,12,34]) ~?= "Armani"]

correrTestsVallaMenosVencida = runTestTT testSuiteVallaMenosVencida