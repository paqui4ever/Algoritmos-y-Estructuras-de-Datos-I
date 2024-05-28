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

