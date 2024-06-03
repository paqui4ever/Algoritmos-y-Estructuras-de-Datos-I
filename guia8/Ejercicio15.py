from queue import Queue as Cola

def buscar_el_maximo (c: Cola[int]) -> int:
    lista: list = []
    temp: Cola = Cola()
    while not c.empty():
        elemento: int = c.get()
        lista.append(elemento)
        temp.put(elemento)
    while not temp.empty():
        c.put(temp.get())
    return maximo(lista)
        
def maximo (lista: list[int]) -> int:
    maximo: int = 0
    for i in range(len(lista)):
        if lista[i] > maximo:
            maximo = lista[i]
    return maximo

cola: Cola = Cola()
for i in range (6):
    cola.put(i)
    
#print(buscar_el_maximo(cola))