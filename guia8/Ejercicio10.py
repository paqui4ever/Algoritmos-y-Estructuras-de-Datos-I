from queue import LifoQueue as Pila

def buscar_el_maximo(p: Pila) -> int:
    temp = Pila()
    res = 0
    comparacion = []
    while not p.empty():
        elemento = p.get()
        temp.put(elemento)
        comparacion.append(elemento)
    while not temp.empty():
        p.put(temp.get())
    res = maximo(comparacion)
    return res
    
def maximo (lista: list) -> int:
    maximo = 0
    for elemento in lista:
        if elemento > maximo:
            maximo = elemento
    return maximo

t = Pila()
for i in range (10):
    t.put(i)

#print(buscar_el_maximo(t))