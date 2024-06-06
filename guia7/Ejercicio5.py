import numpy as np
import random

# Ejercicio 1

def pertenece_a_cada_uno_version_1 (s: list, e: int) -> list:
    res = []
    for i in range(0, len(s), 1):
        if e  not in s[i]:
            res.append (False)
        else:
            res.append (True)
    return res

#print(pertenece_a_cada_uno_version_1 ([[1,2,3],[2,3,4],[5,2,4]], 4))

# Ejercicio 2

def pertenece_a_cada_uno_version_2 (s: list, e: int) -> list: #Mi implementación cumple las dos especificaciones
    res = []
    for i in range(0, len(s), 1):
        if e  not in s[i]:
            res.append (False)
        else:
            res.append (True)
    return res

# Ejercicio 3

def es_matriz (s: list) -> bool:
    for i in range(len(s)):
        if verificar_longitudes(s) == False or len(s[i]) != len(s[0]):
            return False
    return True
    
def verificar_longitudes (s: list) -> bool:
    if len(s) < 0 or len(s[0]) < 0:
        return False
    else:
        return True
 
#print(es_matriz([[1,2],[1,2],[1,2]]))   
#print(verificar_longitudes ([[1,2]]))

# Ejercicio 4

def ordenados (s: list) -> bool:
    for i in range (0, len(s)-1, 1): #Tomo len(s)-1 como pide la especificacion
        if s[i] > s[i+1]:   # Obligo a que compare con el anterior
            return False
    return True

def filas_ordenadas (m: list) -> list:
    res = []
    if es_matriz(m):
        for i in range(len(m)):
            if ordenados(m[i]) == False:
                res.append(False)
            else:
                res.append(True)
    else:
        print("La lista dada no es matriz")
    return res

#print(filas_ordenadas ([[1,2],[3,4],[5,6]]))

# Ejercicio 5

def matriz_elevada_a_p (d: int, p: int):
    m = np.random.random((d, d))*np.random.random((d, d))
    potencia = p * np.random.randint(-1000,1000)
    return m* potencia

print(matriz_elevada_a_p(3, 4))
