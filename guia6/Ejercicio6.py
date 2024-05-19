# Ejercicio 1

def imprimir_numeros_del_uno_al_diez ():
    numero = 1
    while numero <= 10:
        print (numero)
        numero += 1
        
#imprimir_numeros_del_uno_al_diez() 

# Ejercicio 2

def imprimir_pares_entre_10_y_40 ():
    numero = 10
    while numero <= 40:
        if numero % 2 == 0:
            print (numero)
            numero += 1
        else:
            numero += 1
        
#imprimir_pares_entre_10_y_40()

# Ejercicio 3

def imprimir_eco ():
    contador = 1
    while contador <= 10:
        print ("eco")
        contador += 1
        
# imprimir_eco ()

# Ejercicio 4

def despegue (numero):
    while True:
        if numero != 0:
            print (numero)
            numero -= 1
        else:
            print ("Despegue")
            break
    
# despegue (10)

# Ejercicio 5

def monitor_de_viaje (año_de_partida: int, año_de_llegada: int) -> str:
    while año_de_partida > año_de_llegada:
        print (f"Viajo un año al pasado, estamos en el año {año_de_partida - 1}")
        año_de_partida -= 1
        
# monitor_de_viaje (2024, 2020)

# Ejercicio 6

def visitando_a_aristoteles (año_de_partida: int) -> str:
    while año_de_partida > -384:
        print (f"Viajo 20 años al pasado, estamos en el año {año_de_partida - 20}")
        año_de_partida -= 20
        if año_de_partida <= -384:
            print ("Ya esta con Aristoteles")
            break
        
# visitando_a_aristoteles (2024)