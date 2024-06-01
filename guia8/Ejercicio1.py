# Ejercicio 1

def contar_lineas () -> int:
    total = 0
    contar_lineas = open("contar_lineas.txt", "r")
    for linea in contar_lineas:
        total += 1
    contar_lineas.close()
    return total

#print(contar_lineas ())

# Ejercicio 2

def existe_palabra (palabra: str) -> bool:
    existe_palabra = open("existe_palabra.txt", "r")
    lineas = existe_palabra.readlines()
    for linea in lineas:
        if palabra in linea:
            return True
    return False
    existe_palabra.close()
    
#print (existe_palabra("Rene"))

# Ejercicio 3

def cantidad_apariciones (palabra: str) -> int:
    apariciones = 0
    cantidad_apariciones = open("cantidad_apariciones.txt", "r")
    lineas = cantidad_apariciones.readlines()
    for linea in lineas:
        if palabra in linea:
            apariciones += 1
    return apariciones

#print(cantidad_apariciones("Juan"))
