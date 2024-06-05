def invertir_lineas (nombre_archivo: str):
    original = open(f"{nombre_archivo}", "r")
    reverso = open("reverso.txt", "w")
    lineas = original.readlines()
    for i in range (len(lineas)-1, -1, -1): 
        reverso.write(lineas[i])
        reverso.write("\n")
    """
    El loop lo pongo hasta -1 porque es exlusivo, entonces realmente el rango es [len(lineas)-1, 0] y empiezo en len(lineas)-1 porque las listas de n longitud van de 0 a n-1
    """
    original.close()
    reverso.close()
    
invertir_lineas("original.txt")