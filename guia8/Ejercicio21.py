""" { perro: 3
      tero: 43
      nabu: 20
}
"""

def la_palabra_mas_frecuente (nombre_archivo: str) -> str:
    archivo = open("nombre_archivo.txt", "r")
    lineas: list[str] = archivo.readlines()
    frecuencia: dict[str] = {}
    for linea in lineas:
        palabras = split(linea)
        for palabra in palabras:
            if palabra in frecuencia:
                frecuencia[palabra] += 1
            else:
                frecuencia[palabra] = 1
    for palabra in frecuencia:
        maximo = 0
        key = ""
        if frecuencia[palabra] > maximo:
            maximo = frecuencia[palabra]
            key += palabra
    return key    
            
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
    
