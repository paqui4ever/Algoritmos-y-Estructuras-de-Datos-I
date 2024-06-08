# Ejercicio 1

def mejores_precios (super1: list[tuple[str, float]], super2: list[tuple[str, float]]) -> list[tuple[str, float]]:
    res: list[tuple[str, float]] = []
    for i in range(len(super1)):
        if super1[i][1] < super2[i][1]:
            tupla = (super1[i][0], super1[i][1])
            res.append(tupla)
        elif super2[i][1] < super1[i][1]:
            tupla = (super2[i][0], super2[i][1])
            res.append(tupla)
    return res

def buscar_min (lista: list[float]) -> float:
    minimo = lista[0]
    for numero in lista:
        if numero < minimo:
            minimo = numero
    return minimo
    
super1 = [("leche", 151.0), ("yerba", 4719.5), ("jabón", 269.2)]
super2 = [("leche", 261.2), ("yerba", 3939.1), ("jabón", 319.2)]

# Ejercicio 2

def seguidilla (calificaciones: list[int], nota_minima: int) -> int:
    subsecuencia: list[int] = []
    for notas in calificaciones:
        if notas > nota_minima and notas not in subsecuencia:
            subsecuencia.append(notas)
    if subsecuencia == []:
        return 0
    else:
        return len(subsecuencia)
    
calificaciones = [10,55,60,65,54,64,65,55,45,57]
nota_minima = 70

# Ejercicio 3

def elem_en_pos_pares (matriz: list[list[int]], elem: int) -> list[bool]:
    res: list[bool] = []
    for sub_matriz in matriz:
        cumple: bool = False
        for i in range (len(sub_matriz)):
            if sub_matriz[i] == elem:
                if i % 2 == 0:
                    cumple = True
                    res.append(cumple)
        if cumple == False:
            res.append(cumple)        
    return res
        
elem= 1 
M = [
[1, 2, 3, 4, 5, 6, 7, 8, 9],
[9, 8, 7, 6, 4, 5, 3, 2, 1],
[0, 0, 0, 0, 0, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 4, 0, 0, 0],
[0, 1, 0, 0, 6, 0, 0, 1, 0],
]

# Ejercicio 4

"""
Por ejemplo, dado el siguiente diccionario y lista de usuarios:

viajes_diarios = {1 : ["Juan", "Maria"], 2 : ["Marcela","Juan"]}
usuarios = ["Juan", "Maria", "Marcela"]

resultado_esperado es:
{"Juan" : 2, "Maria" : 1, "Marcela": 1}

"""

def viajes_por_dia (viajes_diarios: dict[int, list[str]], usuarios: list[str]) -> dict[str, int]:
    res: dict[str, int] = {}
    for i in range(len(usuarios)):
        contador = 0
        for dia, personas in viajes_diarios.items():
            for persona in personas:
                if persona == usuarios[i]:
                    contador += 1
                    res[usuarios[i]] = contador
    return res

viajes_diarios = {1 : ["Juan", "Maria"], 2 : ["Marcela","Juan"]}
usuarios = ["Juan", "Maria", "Marcela"]
