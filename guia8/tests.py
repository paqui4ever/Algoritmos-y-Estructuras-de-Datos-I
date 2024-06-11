matriz = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
    ]
"""
for columna in range (len(matriz)): # Conveniente cuando quiero operar con columnas
    for fila in range (len(matriz)):
        elemento = matriz[fila][columna]
        print(f"El elemento {elemento} esta en la columna {columna} y fila {fila}")

for fila in range (len(matriz)): # Para operar sobre filas no conviene anidar los for loops
    for columna in range (len(matriz)):
        elemento = matriz[fila][columna]
        print(f"El elemento {elemento} esta en la columna {columna} y fila {fila}")
"""       
def split_homemade(texto: str) -> list[str]:
    palabras: list[str] = [] # Mi resultado
    palabra = ""
    termino_palabra: bool = None
    for caracter in texto:
        if caracter not in [" ", "\n"]:
            termino_palabra = True
            palabra += caracter
        elif caracter in [" ", "\n"]:
            termino_palabra = False 
            if not termino_palabra:
                palabras.append(palabra)
                palabra = "" 
    if palabra != "": # Si no lo agrego no me pondria la ultima palabra ya que se termina el texto y no hay caracter que cumpla el condicional
        palabras.append(palabra)
    return palabras
    
print(split_homemade("Hola como andas"))  

def split_homemade_v2 (texto:str) -> list[str]: # La hago de nuevo solo como practica
    palabra = ""
    palabras = []
    termino_palabra = None
    for caracter in texto:
        if caracter not in [" ", "\n"]:
            palabra += caracter
            termino_palabra = True
        else:
            termino_palabra = False
            if not termino_palabra:
                palabras.append(palabra)
                palabra = ""
    if palabra != "":
        palabras.append(palabra)
    return palabras

def resolviendo_tateti (tablero: list[list[str]]) -> int:
    res: int = 0
    for columna in range (len(tablero)):
        cantidad_de_X = 0
        cantidad_de_O = 0
        for fila in range (len(tablero)):
            elemento = tablero[fila][columna]
            if elemento == "X":
                cantidad_de_X += 1
                cantidad_de_O = 0
                if cantidad_de_X >= 3:
                    res += 1
            elif elemento == "O":
                cantidad_de_X = 0
                cantidad_de_O += 1
                if cantidad_de_O >= 3:
                    res += 2
            elif cantidad_de_X == cantidad_de_O:
                res = 3
                    
    return res