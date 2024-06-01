from queue import LifoQueue as Pila

def cantidad_elementos(p: Pila) -> int:
    temp = Pila()
    contador = 0
    while p.empty() == False:
        temp.put(p.get())
        contador += 1
    while temp.empty() == False:
        p.put(temp.get())
    return contador

m = Pila()
for i in range (0, 4, 1):
    m.put(i)
    
#print(cantidad_elementos(m))