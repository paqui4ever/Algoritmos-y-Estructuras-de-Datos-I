# Ejercicio 1 

def imprimir_numeros_del_uno_al_diez ():
    for num in range (1, 11, 1):
        print (num)
        
# imprimir_numeros_del_uno_al_diez ()

# Ejercicio 2

def imprimir_pares_entre_10_y_40 ():
    for num in range (10, 41, 2):
        print (num)
        
# imprimir_pares_entre_10_y_40 ()

# Ejercicio 3

def imprimir_eco ():
    for num in range (1, 11, 1):
        print ("eco")
        
# imprimir_eco ()

# Ejercicio 4

def despegue ():
    for num in range (10, 0, -1):
        print (num)
    print ("Despegue")
    
# despegue ()

# Ejercicio 5

def monitor_de_viaje (año_de_partida: int, año_de_llegada: int) -> str:
    for num in range (año_de_partida, año_de_llegada, -1):
        print (f"Viajo un año al pasado, estamos en el año {num - 1}")
        
# monitor_de_viaje (2024, 2020)

# Ejercicio 6

def visitando_a_aristoteles (año_de_partida: int) -> str:
    for num in range (año_de_partida, -385, -20):
        print (f"Viajo 20 años en el pasado, estamos en el año {num - 20}")
        if num - 20 <= -384:
            print (f"Ya esta con Aristoteles")
            break
            
# visitando_a_aristoteles (2024)