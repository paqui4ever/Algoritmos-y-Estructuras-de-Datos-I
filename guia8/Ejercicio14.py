from queue import Queue as Cola

def cantidad_elementos (c: Cola) -> int:
    temp: Cola = Cola()
    contador = 0
    while not c.empty():
        temp.put(c.get())
        contador += 1
    while not temp.empty():
        c.put(temp.get())
    return contador

cola: Cola = Cola()
for i in range (5):
    cola.put(i)
    
#print(cantidad_elementos (cola))