def agregar_frase_al_final(nombre_archivo: str, frase: str):
    archivo = open(f"{nombre_archivo}", "r")
    lineas = archivo.readlines()
    lineas.append(f"\n{frase}")
    archivo.close()
    archivo = open(f"{nombre_archivo}", "w")
    archivo.writelines(lineas)
    
#agregar_frase_al_final("prueba.txt","Nabu es peludo")