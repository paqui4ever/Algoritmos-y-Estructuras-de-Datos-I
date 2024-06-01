import random

# Ejercicio 1

def construir_lista () -> list:
    lista = []
    while True:
        pregunta = input("Deme los nombres de sus estudiantes uno por uno: ")
        if pregunta == "listo":
            return lista
            break
        else:
            lista.append(pregunta)
    return lista
    
#print(construir_lista())

# Ejercicio 2

def historial_monedero () -> int:
    balance = 0
    historial = []
    while True:
        pregunta = input("Escriba C si quiere cargar créditos, D si quiere descontarlos y X para terminar con las operaciones: ")
        if pregunta == "C":
            numero = int(input("Monto a operar: "))
            historial.append(("C", numero))
            balance += numero
        if pregunta == "D":
            numero = int(input("Monto a operar: "))
            historial. append(("D", numero))
            balance -= numero
        if pregunta == "X":
            print (f"Balance final: {balance}")
            break
    return historial

#print(historial_monedero())

# Ejercicio 3

def cartas_crupier () -> float:
    cartas = [1,2,3,4,5,6,7,10,11,12]
    total_crupier = 0
    while total_crupier < 5.5:
        numero_crupier = random.choice(cartas)
        if numero_crupier == 10 or numero_crupier  == 11 or numero_crupier  == 12:
            total_crupier += 0.5
        elif total_crupier > 7.5:
            break
        else:
            total_crupier += 1
    return total_crupier

def siete_y_medio () -> list:
    cartas = [1,2,3,4,5,6,7,10,11,12]
    total = 0
    historial = []
    print ("Bienvenido al juego 7 y medio! Las cartas válidas van del 1 al 12 excluyendo el 8 y 9, todas las cartas menos las figuras suman 1 punto, ya que estas suma 0.5. Si se pasa de 7.5 pierde.")
    while True:
        carta = random.choice(cartas)
        decision = input("Desea sacar otra carta? Escriba 'si' si es el caso, si desea plantarse escriba 'no': ")
        if decision == "no":
            historial.append(carta)
            break
        if decision == "si":
            if carta == 10 or carta == 11 or carta == 12:
                total += 0.5
            else:
                total += 1 
            historial.append(carta)
        if total > 7.5:
            print("Ha perdido, su total se pasó de 7.5")
            break
    total_crupier = cartas_crupier()
    if total_crupier < total and total < 7.5:
        print("Ha ganado!")
    else:
        print("Ha perdido :(")
    print (f"Su historial de cartas fue el siguiente: {historial} y su total de puntos fue {total} y el numero de la banca era {total_crupier}")


# siete_y_medio()

