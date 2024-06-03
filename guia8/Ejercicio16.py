from queue import Queue as Cola
import random

def armar_secuencia_de_bingo () -> Cola[int]:
    cola: Cola = Cola()
    numeros = []
    for i in range (12):
        numero: int = random.randint(0,99)
        if numero not in numeros:
            cola.put(numero)
            numeros.append(numero)
    return cola

def generar_carton () -> list[int]:
    carton: list = []
    numeros = []
    for i in range (12):
        numero: int = random.randint(0,99)
        if numero not in numeros:
            carton.append(numero)
            numeros.append(numero)
    return carton
        
def jugar_carton_de_bingo (carton: list[int], bolillero: Cola[int]) -> int:
    contador = 0
    temp: Cola = Cola()
    while not bolillero.empty():
        contador += 1
        elemento = bolillero.get()
        if elemento in carton:
            carton.remove(elemento)
        if not carton:
            break
        while not temp.empty():
            bolillero.put(temp.get(elemento))
    return contador

bolillero = armar_secuencia_de_bingo()
carton = generar_carton()
print(jugar_carton_de_bingo (carton, bolillero))