def split (string: str) -> list:
    palabras = []
    palabra = "" # Defino un string vacio para luego poder agregarlo a la lista palabras
    i = 0 # Defino la variable a partir de la cual voy a contar
    termino_palabra: bool = None # Me dice si estoy dentro de una palabra o no
    while i < len(string):
        if string[i] == " " or string[i] == "\n":
            i += 1
        else:
            while i != len(string) and string[i] != " " and string[i] != "\n": # Agrego la palabra
                palabra += string[i]
                i += 1
                termino_palabra = True  
        
        if termino_palabra == True: # Reseteo termino_palabra y agrego la palabra completa al resultado
            palabras.append(palabra)
            termino_palabra = False
            palabra = ""

    return palabras


def agrupar_por_longitud (nombre_archivo: str) -> dict:
    archivo = open(nombre_archivo, "r")
    res: dict[int] = {}
    lineas = archivo.readlines()
    for linea in lineas:
        palabras = split(linea)
        for palabra in palabras:
            if len(palabra) in res:
                res[len(palabra)] += 1
            else:
                res[len(palabra)] = 1
    return res

print(agrupar_por_longitud("ejercicio19.txt"))

