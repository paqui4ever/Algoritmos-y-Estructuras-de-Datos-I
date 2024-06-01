from queue import LifoQueue as Pila
import random

def generar_nros_al_azar (cantidad: int, desde: int, hasta: int) -> list:
    p = Pila() 
    for i in range (1, cantidad):
        numero = random.randint(desde, hasta)
        p.put(numero)
    return p

