# Ejercicio 1

def ind_nesima_aparicion (s: list[int], n: int, elem: int) -> int:
    numero_apariciones = contar_apariciones(s, elem)
    longitud = len(s)
    if numero_apariciones < n:
        return -1
    else:
        contador = 0
        for i in range(longitud):
            if s[i] == elem:
                contador += 1
            if contador == n:
                return i
    
def contar_apariciones(s: list[int], elem: int) -> int:
    contador = 0
    for elemento in s:
        if elem == elemento:
            contador += 1
    return contador
    
#s = [-1, 1, 1, 5, -7, 1, 3]
#n = 2
#elem = 1
#print(ind_nesima_aparicion(s, n, elem))

# Ejercicio 2

#Las posiciones pares de res tendrán los elementos de s1 
# y las posiciones impares los elementos de s2, respetando el orden original.

def mezclar(s1: list[int], s2: list[int]) -> list[int]:
    res: list[int] = []
    for i in range(len(s1)):
        res.append(s1[i])
        res.append(s2[i])
    return res

#s1 = [1, 3, 0, 1]
#s2 = [4, 0, 2, 3]
#print(mezclar(s1, s2))

# Ejercicio 3

caballos= ["linda", "petisa", "mister", "luck" ]
carreras= {"carrera1":["linda", "petisa", "mister", "luck"],
                  "carrera2":["petisa", "mister", "linda", "luck"]}

def armar_posiciones (lista: list[str], caballos: list[str]) -> dict[str, list[int]]: # No la termino usando
    res: dict[str, list[int]] = {}
    for i in range(len(caballos)):
        if lista[i] in caballos:
            lista_ceros = [0]*len(caballos)
            if caballos[i] == lista[i]:
                lista_ceros[i] += 1
                res[caballos[i]] = lista_ceros
    return res

def frecuencia_posiciones_por_caballo2 (caballos: list[str], carreras: dict[str, list[str]]) -> dict[str, list[int]]:
    res: dict[str, list[int]] = {}
    for i in range (len(caballos)): # Itero sobre la lista de caballos
        if caballos[i] not in res: # Verifico que ese caballo no esté en res
           lista_ceros = [0]*len(caballos) # Inicializo la lista de ceros de igual longitud que la lista de caballos
           for keys, values in carreras.items():
               for caballo in range (len(values)): # Veo los caballos con posiciones en la lista de values
                   if values[caballo] == caballos[i]: # Si encuentro al caballo[i] en x posicion agrego un 1 en la lista de 0s en esa posicion y agrego ese valor al res
                       lista_ceros[caballo] += 1
                       res[caballos[i]] = lista_ceros
    return res
             
# Ejercicio 4

def matriz_capicua (m: list[list[int]]) -> bool:
    for matriz in m:
        if not es_capicua(matriz):
            return False
    return True    
    
def es_capicua (m: list[int]):
    for i in range(0, len(m) // 2, 1):
        j = len(m) - 1 - i
        if m[i] != m[j]:
            return False
    return True

m = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
print(matriz_capicua(m))