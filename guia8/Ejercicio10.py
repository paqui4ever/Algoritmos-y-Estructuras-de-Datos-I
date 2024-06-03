from queue import LifoQueue as Pila

def buscar_el_maximo(p: Pila[int]) -> int:
    temp: Pila = Pila()
    res: int = 0
    comparacion: list = []
    while not p.empty():
        elemento: int = p.get()
        temp.put(elemento)
        comparacion.append(elemento)
    while not temp.empty():
        p.put(temp.get())
    res: int = maximo(comparacion)
    return res
    
def maximo (lista: list) -> int:
    maximo: int = 0
    for elemento in lista:
        if elemento > maximo:
            maximo = elemento
    return maximo

t = Pila()
for i in range (10):
    t.put(i)

#print(buscar_el_maximo(t))