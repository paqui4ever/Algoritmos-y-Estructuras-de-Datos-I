def clonar_sin_comentarios ():
    archivo_comentado = open("archivo_comentado.txt", "r")
    archivo_sin_comentarios = open("archivo_sin_comentarios.txt", "w")
    lineas = archivo_comentado.readlines()
    for linea in lineas:
        if not linea.strip()[0] == "#": #Saco los espacios en blanco y veo si el primer elemento de la lista es un "#"
            archivo_sin_comentarios.write(linea)
    archivo_comentado.close()
    archivo_sin_comentarios.close()
    
clonar_sin_comentarios()