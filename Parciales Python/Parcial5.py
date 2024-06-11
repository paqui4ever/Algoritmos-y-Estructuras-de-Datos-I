from queue import Queue as Cola

# Ejercicio 1

# clientes en formato (nombre, tipo afiliado), tipo_afiliado es comun o vip

def reordenar_cola_priorizando_vips (filaClientes: Cola[tuple[str, str]]) -> Cola[str]:
    vips:list[str] = []
    comunes:list[str] = []
    temp:Cola[tuple[str,str]] = Cola()
    res:Cola[str] = Cola()
    while not filaClientes.empty():
        elemento: tuple[str, str] = filaClientes.get()
        temp.put(elemento)
        if elemento[1] == "vip":
            vips.append(elemento[0])
        elif elemento[1] == "comun":
            comunes.append(elemento[0])
    while not temp.empty():
        filaClientes.put(temp.get())
    for i in range(len(vips)):
        res.put(vips[i])
    for j in range(len(comunes)):
        res.put(comunes[j])
    return res

filaClientes = Cola()
filaClientes.put(("juan", "comun"))
filaClientes.put(("Pepe", "comun"))
filaClientes.put(("Tomas", "vip"))
filaClientes.put(("Silvano", "comun"))
filaClientes.put(("Jorge", "vip"))

resultado = reordenar_cola_priorizando_vips(filaClientes)
"""
res = []
while not resultado.empty():
    res.append(resultado.get())
    
print(res)
"""

# Ejercicio 2

def torneo_de_gallinas (estrategias: dict[str, str]) -> dict[str, int]:
    puntajes = {}
    for jugador, estrategia in estrategias.items():
        puntajes[jugador] = 0
        for oponente, estrategia_rival in estrategias.items():
            if oponente != jugador:
                if estrategia == "Me desvio siempre":
                    if estrategia_rival == "Me la banco y no me desvio":
                        puntajes[jugador] -= 15
                    else:
                        puntajes[jugador] -= 10
                else:
                    if estrategia_rival == "Me la banco y no me desvio":
                        puntajes[jugador] += 5
                    else:
                        puntajes[jugador] += 10
                        
    return puntajes
 
estrategias_prueba = {"Pepe": "Me desvio siempre", "Juan": "Me la banco y no me desvio", "Pedro": "Me la banco y no me desvio"}

# Ejercicio 3
 
def quien_gano_el_tateti_facilito (tablero: list[list[chr]]) -> int:
    contador: int = 0
    longitud_valida = len(tablero[0]) == len(tablero)
    for i in range(len(tablero)):
        for j in range (len(tablero)):
            if hay_consecutivas(tablero) and tablero[i][j] and tablero[i+1][j] and tablero[i+2][j] == "O" and longitud_valida:
                return 2
            elif hay_consecutivas(tablero) and tablero[i][j] and tablero[i+1][j] and tablero[i+2][j] == "X" and longitud_valida:
                return 1
            elif not hay_consecutivas(tablero) and longitud_valida:
                return 0
            elif not longitud_valida:
                return 3
            
def hay_consecutivas (tablero: list[list[str]]) -> bool:
    for i in range(-2, len(tablero)-2):
        for j in range(-2, len(tablero)-2):
            if tablero[i][j] == tablero[i+1][j] == tablero [i+2][j]:
                return True
            elif tablero[i][j] == tablero[i+1][j] == tablero [i+2][j]:
                return True
    return False

#print(hay_consecutivas([["O", "X", "O", "X"], ["O", "X", "X", "O"], ["X", "X", "O", "X"], ["X", "O", "X", "O"]]))

tablero = [["O", "X", "O", "X", "O"], ["X", "O", "X", "O", "X"], ["O", "X", "O", "X", "O"], ["O", "O", "X", "O", "X"], ["O", "X", "O", "X", "O"]]
#print(quien_gano_el_tateti_facilito(tablero))

# Ejercicio 4

def cuantos_sufijos_son_palindromos (texto: str) -> int:
    contador: int = 0
    texto_enlistado = split_homemade(texto)
    for palabra in texto_enlistado:
        palabra_partida = string_a_list_char(palabra)
        for i in range (len(palabra_partida)):
            if es_palindromo(palabra_partida):
                contador += 1
            palabra_partida.pop()
    return contador 
    
def es_palindromo (sufijo: list[chr]) -> bool:
    for i in range(len(sufijo) // 2):
        j = len(sufijo)-1-i
        if sufijo[i] != sufijo[j]:
            return False
    return True

def split_homemade(texto: str) -> list[str]:
    palabra: str = ""
    palabras: list[str] = []
    termino_palabra = None
    for i in range(len(texto)):
        if texto[i] != " " and texto[i] != "\n":
            termino_palabra = True
            palabra += texto[i]
        elif texto[i] == " " or texto[i] == "\n":
            termino_palabra = False
            if termino_palabra == False:
                palabras.append(palabra)
                palabra = ""
    if palabra != "":
        palabras.append(palabra)    
    return palabras

def string_a_list_char (string: str) -> list[chr]:
    res: list[chr] = []
    for letra in string:
        res.append(letra)
    return res
            