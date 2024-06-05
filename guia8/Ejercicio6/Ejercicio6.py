def listar_palabras_de_archivo (nombre_archivo: str) -> list:
    archivo = open(f"{nombre_archivo}","rb")
    lineas = archivo.read()
    auxiliar = [] # Lista que voy a usar para juntar los chars
    palabras = [] # Lista que voy a usar para luego returnear las palabras por si solas
    frase = "" # Armo un string completo y lo spliteo por palabras
    for linea in lineas:
        char = chr(linea)
        if (char >= 'A' and char <= 'Z') or (char >= 'a' and char <= 'z') or char == ' ' or char == '_': # Necesito contemplar el caso en que hay un ' ' para filtrar palabras en el proximo loop 
            auxiliar.append(char)
    for i in range(len(auxiliar)):
        if auxiliar[i] == (char > 'A' and char < 'Z') or (char > 'a' and char < 'z') or char == '_':
            frase += auxiliar[i]
    palabras.append(frase) # Agrego la frase a palabras
    auxiliar.clear() # Saco todos los elementos de auxiliar porque no la voy a usar más
    archivo.close() # Cierro el archivo porque ya no lo usaré
    return split(frase) # Uso split en la frase asi puedo devolver una lista con palabras

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

print(listar_palabras_de_archivo("prueba.txt"))

def juntar_char_en_string (chars: list[chr]) -> str: # No la termino usando
    palabra = ""
    for char in chars:
        palabra += char
    return palabra
