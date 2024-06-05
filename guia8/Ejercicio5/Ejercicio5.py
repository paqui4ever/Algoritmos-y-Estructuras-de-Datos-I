def agregar_frase_al_principio (nombre_archivo: str, frase: str):
    archivo = open(f"{nombre_archivo}", "r")
    lineas = archivo.readlines()
    lineas_nuevas = []
    lineas_nuevas.append(f"{frase}\n")
    for linea in lineas:
        lineas_nuevas.append(linea)
    archivo.close()
    archivo = open(f"{nombre_archivo}", "w")
    archivo.writelines(lineas_nuevas)
    
agregar_frase_al_principio("prueba.txt", "Hola")