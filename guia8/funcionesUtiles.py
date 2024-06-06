def pertenece (s, lista: list) -> bool:
    for i in range (len(lista)):
        if lista[i] == s:
            return True
    return False

def pasar_lista_a_string (lista: list[chr]) -> str:
    frase: str = ""
    for i in range (len(lista)):
        frase += lista[i]
    return frase

def loopear (string: str):
    for palabra in string:
        print(palabra)
        
#loopear("Hola Como")

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
            
#print(split("Tomas Juan"))

def loopear_dict (diccionario: dict) -> str:
    for palabra in diccionario:
        print (palabra)

diccionario = {
    "nombre": "Silvano",
    "edad": 19,
    "universidad": "UBA"
}
   
#loopear_dict(diccionario) 
            
#print(diccionario.items())