import Test.HUnit
import Ejercicio1 

testSuiteLongitud = test [
    "longitudNumerosN" ~: (longitud [1,2,3,4,5,6,7,8,9,0,1,2,3]) ~?= 13]

correrTestsLongitud = runTestTT testSuiteLongitud

testSuiteUltimo = test [
    "ultimoNumeros" ~: (ultimo [1,2,3,(-4),23423,1231,21,(-1)]) ~?= (-1),
    "ultimoLetras" ~: (ultimo ['a','b','c','d','w']) ~?= 'w',
    "ultimoPalabras" ~: (ultimo ["hola", "perro", "titi"]) ~?= "titi",
    "ultimoBool" ~: (ultimo [True, False, False, True, False]) ~?= False]

correrTestsUltimo = runTestTT testSuiteUltimo

testSuitePrincipio = test [
    "principioNumeros" ~: (principio [1,(-1),7,2,(-3),(-1),2]) ~?= [1,(-1),7,2,(-3),(-1)],
    "principioLetras" ~: (principio ['a','b','c','d','w']) ~?= ['a','b','c','d'],
    "principioPalabras" ~: (principio ["Hola", "Juan", "Titi", "Pedro"]) ~?= ["Hola", "Juan", "Titi"],
    "principioBool" ~: (principio [True, False, True, True]) ~?= [True, False, True]]

correrTestsPrincipio = runTestTT testSuitePrincipio

testSuiteReverso = test [
    "reversoNumeros" ~: (reverso [1,(-2),3,(-4),6,(-1),7]) ~?= [7,(-1),6,(-4),3,(-2),1],
    "reversoLetras" ~: (reverso ['a','r','b','o','l']) ~?= ['l','o','b','r','a'],
    "reversoPalabras" ~: (reverso ["Titi", "Juan", "Pedro"]) ~?= ["Pedro", "Juan", "Titi"],
    "reversoBool" ~: (reverso [False, True, False, False]) ~?= [False, False, True, False]]

correrTestsReverso = runTestTT testSuiteReverso