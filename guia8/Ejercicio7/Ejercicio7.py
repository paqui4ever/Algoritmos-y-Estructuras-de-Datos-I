def calcular_promedio_por_estudiante (nombre_archivo_notas: str, nombre_archivo_promedios: str):
    archivo_notas = open(f"{nombre_archivo_notas}", "r")
    archivo_promedios = open(f"{nombre_archivo_promedios}", "w")
    lineas_notas:list[str] = archivo_notas.readlines()
    lus: list[str] = []
    promedios: list[float] = []
    for linea in lineas_notas:
        linea_limpia: list[str] = split(linea)
        if linea_limpia[0] not in lus:
            lus.append(linea_limpia[0])
    for lu in lus:
        promedio: float = promedio_estudiante(nombre_archivo_notas, lu)    
        promedios.append(f"{lu}, {promedio}")
    for promedio in promedios:
        agregar_frase_al_final(nombre_archivo_promedios, promedio)
    archivo_notas.close()
    archivo_promedios.close()
    
def agregar_frase_al_final(nombre_archivo: str, frase: str):
    archivo = open(f"{nombre_archivo}", "r")
    lineas: list[str] = archivo.readlines()
    lineas.append(f"{frase}\n")
    archivo.close()
    archivo = open(f"{nombre_archivo}", "w")
    archivo.writelines(lineas)
    
def promedio_estudiante (nombre_archivo:str, lu:str) -> float: 
    archivo = open(f"{nombre_archivo}", "r")
    lineas: list[str] = archivo.readlines()
    notas: list[float] = []
    materias: int = 0
    for linea in lineas:
        elementos: list[str] = split(linea)
        if lu == elementos[0]:
            notas.append(elementos[3])
            materias += 1
    return suma_lista(notas) / materias

def suma_lista (lista: list[float]) -> float:
    total: int = 0
    for numero in lista:
        total += float(numero)
    return total
    
            
def split (string: str) -> list:
    palabras = []
    palabra = "" # Defino un string vacio para luego poder agregarlo a la lista palabras
    i = 0 # Defino la variable a partir de la cual voy a contar
    termino_palabra: bool = None # Me dice si estoy dentro de una palabra o no
    while i < len(string):
        if string[i] == "," or string[i] == "\n":
            i += 1
        else:
            while i != len(string) and string[i] != "," and string[i] != "\n": # Agrego la palabra
                palabra += string[i]
                i += 1
                termino_palabra = True  
        
        if termino_palabra == True: # Reseteo termino_palabra y agrego la palabra completa al resultado
            palabras.append(palabra)
            termino_palabra = False
            palabra = ""

    return palabras

calcular_promedio_por_estudiante("notas.csv", "promedios.csv")
print(promedio_estudiante("notas.csv", "437/24"))