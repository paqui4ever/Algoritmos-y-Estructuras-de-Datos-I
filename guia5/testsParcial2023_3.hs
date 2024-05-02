import Test.HUnit
import Parcial2023_3

testSuitePorcentajeDeVotosAfirmativos = test [
    "porcentajeDeVotosAfirmativosSinFormulas" ~: (porcentajeDeVotosAfirmativos [] [12,3] 15) ~?= 0,
    "porcentajeDeVotosAfirmativosSinVotos" ~: (porcentajeDeVotosAfirmativos [("Juan", "Pedro"), ("Tomas", "Pepe")] [] 12) ~?= 0,
    "porcentajeDeVotosAfirmativosSinTotal" ~: (porcentajeDeVotosAfirmativos [("Juan", "Pedro"), ("Tomas", "Pepe")] [12,34] 0) ~?= 0,
    "porcentajeDeVotosAfirmativosConNada" ~: (porcentajeDeVotosAfirmativos [] [] 0) ~?= 0,
    "porcentajeDeVotosAfirmativos1Elemento" ~: (porcentajeDeVotosAfirmativos [("Juan", "Pedro")] [12] 12) ~?= 100,
    "porcentajeDeVotosAfirmativos2Elementos" ~: (porcentajeDeVotosAfirmativos [("Juan", "Pedro"), ("Tomas", "Pepe")] [12,12] 24) ~?= 100,
    "porcentajeDeVotosAfirmativos3Elementos" ~: (porcentajeDeVotosAfirmativos [("Juan", "Pedro"), ("Tomas", "Pepe"), ("Silvano", "Titi")] [12,23,50] 85) ~?= 100,
    "porcentajeDeVotosAfirmativosConBlancos" ~: (porcentajeDeVotosAfirmativos [("Juan", "Pedro"), ("Tomas", "Pepe"), ("Silvano", "Titi")] [12,23,50] 90) ~?= 94.44444]

correrTestsPorcentajeDeVotosAfirmativos = runTestTT testSuitePorcentajeDeVotosAfirmativos

testSuiteFormulasInvalidas = test [
    "formulasInvalidasSinFormulas" ~: (formulasInvalidas []) ~?= True,
    "formulasInvalidasPresidenteViceIguales" ~: (formulasInvalidas [("Silvano", "Silvano")]) ~?= True,
    "formulasInvalidasPresidentesIguales" ~: (formulasInvalidas [("Silvano", "Pepe"), ("Silvano", "Juan")]) ~?= True,
    "formulasInvalidasVicesIguales" ~: (formulasInvalidas [("Silvano", "Pepe"), ("Juan", "Pepe")]) ~?= True,
    "formulasInvalidasTodoIgual" ~: (formulasInvalidas [("Silvano", "Pepe"), ("Silvano", "Pepe")]) ~?= True,
    "formulasInvalidasConValidas" ~: (formulasInvalidas [("Silvano", "Juan"), ("Pedro", "Tomas"), ("Pepe", "Agustin")]) ~?= False]

correrTestsFormulasInvalidas = runTestTT testSuiteFormulasInvalidas

testSuitePorcentajeDeVotos = test [
    "porcentajeDeVotosSinVice" ~: (porcentajeDeVotos " " [("Juan", "Pedro")] [23]) ~?= 0,
    "porcentajeDeVotosSinFormulas" ~: (porcentajeDeVotos "Pedro" [] [23]) ~?= 0,
    "porcentajeDeVotosSinVotos" ~: (porcentajeDeVotos "Pedro" [("Juan", "Pedro")] []) ~?= 0,
    "porcentajeDeVotos2Elementos" ~: (porcentajeDeVotos "Silvano" [("Juan", "Silvano"), ("Pedro", "Tomas")] [20,30]) ~?= 40,
    "porcentajeDeVotos3Elementos" ~: (porcentajeDeVotos "Silvano" [("Tomas", "Juan"), ("Pepe", "Silvano"), ("Martina", "Pedro")] [20,30,43]) ~?= 32.258064]

correrTestsPorcentajeDeVotos = runTestTT testSuitePorcentajeDeVotos

testSuiteMenosVotado = test [
    "menosVotadoSinFormulas" ~: (menosVotado [] [1,23]) ~?= " ",
    "menosVotadoSinVotos" ~: (menosVotado [("Juan", "Tomas")] []) ~?= " ",
    "menosVotado1Elemento" ~: (menosVotado [("Juan", "Tomas")] [23]) ~?= "Juan",
    "menosVotado2Elementos" ~: (menosVotado [("Juan", "Tomas"), ("Silvano", "Titi")] [23,45]) ~?= "Juan",
    "menosVotado3Elementos" ~: (menosVotado [("Juan", "Tomas"), ("Pedro", "Pepe"), ("Silvano", "Titi")] [23,12,45]) ~?= "Pedro"]

correrTestsMenosVotado = runTestTT testSuiteMenosVotado
