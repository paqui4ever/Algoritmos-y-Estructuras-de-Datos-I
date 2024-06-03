from queue import Queue as Cola
from queue import LifoQueue as Pila
import random

def generar_nros_al_azar (cantidad: int, desde: int, hasta: int) -> Pila[int]:
    p: Pila = Pila() 
    for i in range (1, cantidad):
        numero: int = random.randint(desde, hasta)
        p.put(numero)
    return p

def armar_cola (pila: Pila[int]) -> Cola[int]:
    cola: Cola = Cola()
    while not pila.empty():
        cola.put(pila.get())
    return cola

