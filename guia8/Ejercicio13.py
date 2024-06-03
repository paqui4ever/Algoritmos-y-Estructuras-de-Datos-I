from queue import Queue as Cola
from queue import LifoQueue as Pila
import random

def generar_nros_al_azar (cantidad: int, desde: int, hasta: int) -> Pila:
    p = Pila() 
    for i in range (1, cantidad):
        numero = random.randint(desde, hasta)
        p.put(numero)
    return p

def armar_cola (pila: Pila) -> Cola:
    cola: Cola = Cola()
    while not pila.empty():
        cola.put(pila.get())
    return cola

