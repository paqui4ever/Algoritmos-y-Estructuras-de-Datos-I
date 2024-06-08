# Ejercicio 1

def acomodar (s: list[str]) -> list[str]:
    res: list[str] = []
    for partido in s:
        if partido == "UP":
            res.append(partido)
    for partido in s:
        if partido == "LLA":
            res.append(partido)
    return res

s = ["LLA", "UP", "LLA", "UP", "UP"]

# Ejercicio 2

def pos_umbral (s: list[int], u:int) -> int:
    for i in range(len(s)):
        if s[i] == u:
            return i
    return -1

s = [1,-2,0,5,-7,3]
u = 9

# Ejercicio 3

def columnas_repetidas (mat: list[list[int]]) -> bool:
    repetidas = []
    for matriz in mat:
        repetida = False
        for i in range (0, int(len(matriz) / 2), 1):
            for j in range (int(len(matriz) / 2), 0, -1):
                if matriz[i] == matriz[j+1] and matriz[i+1] == matriz[j]:
                    repetida = True
                    repetidas.append(repetida)
    if False in repetidas:
        return False
    else:
        return True

m = [[1,2,1,2,1,2],[-5,6,-5,6,-5,6],[0,1,0,1,-5,6]]

# Ejercicio 4

def cuenta_posiciones_por_nacion(naciones: list[str], torneos: dict[int, list[str]]) -> dict[str, list[int]]:
    res: dict[str, list[int]] = {}
    largo_naciones = len(naciones)
    for i in range (largo_naciones): # Armo la lista un pais a la vez
        posiciones_cero = [0]*largo_naciones # Por país creo la lista de posiciones
        for año, posiciones in torneos.items(): # Itero sobre tupla[0] (año) y tupla[1] (posiciones)
            for j in range(len(posiciones)): # Itero sobre la lista de posiciones
                if naciones[i] == posiciones[j]: # Si encuentro al país de indice i en la lista de naciones en la posicion j de la tupla[1] 
                                                 #agrego un 1 en esa posicion para posiciones_cero y agrego esa entrada al dict
                    posiciones_cero[j] += 1
                    res[naciones[i]] = posiciones_cero
    return res

def cuenta_posiciones_por_nacion2(naciones: list[str], torneos: dict[int, list[str]]) -> dict[str, list[int]]: # Son lo mismo pero con un for loop distinto
    res: dict[str, list[int]] = {}
    largo_naciones = len(naciones)
    for i in range (largo_naciones): # Itero sobre la lista de paises
        posiciones_cero = [0]*largo_naciones
        for tupla in torneos.items(): # Itero sobre las tuplas (key, value) de torneos que son de tipo tuple[int, list[str]]
            largo_lista_posiciones = len(tupla[1])
            posiciones = tupla[1] # Llamo posiciones al value (pos [1] en la tupla) asociado a la key (pos [0] en la tupla)
            for j in range(largo_lista_posiciones): # Itero sobre la lista de posiciones es decir sobre los values
                if naciones[i] == posiciones[j]: # Si se corresponde la nacion que estoy buscando con la que está en la lista posiciones, 
                                                 # le agrego un 1 a su posiciones_cero y agrego la entrada al dict
                    posiciones_cero[j] += 1
                    res[naciones[i]] = posiciones_cero
    return res

naciones= ["arg", "aus", "nz", "sud"]
torneos= {2023:["nz", "sud", "arg", "aus"], 2022:["nz", "sud", "aus", "arg"]}
def res_iguales (res1: dict[str, list[int]], res2: dict[str, list[int]]) -> bool:
    if res1 == res2:
        return True
    else:
        return False

funcion1 = cuenta_posiciones_por_nacion(naciones, torneos)
funcion2 = cuenta_posiciones_por_nacion2(naciones, torneos)
son_iguales = res_iguales(funcion1, funcion2)
print(son_iguales)
    

                    