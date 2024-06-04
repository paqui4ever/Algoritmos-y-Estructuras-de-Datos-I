from queue import Queue as Cola

# cola = [("Silvano Picard", 1234567, True, False), ("Juan Pedro", 5788901, False, True), ("Tomas Gallardo", 76802931, False, False)]
# Primero va Juan, despues Silvano. O sea que entra primero Juan en la cola de orden de atencion. Tomas es atendido ultimo, por tanto es metido ultimo en la cola de orden.

def atencion_a_clientes (c: Cola[(str,int,bool,bool)]) -> Cola[(str,int,bool,bool)]:
    temp: Cola = Cola()
    res: Cola = Cola()
    categorias: list = []
    orden: list = []
    while not c.empty():
        elemento = c.get()
        temp.put(elemento)
        categorias.append(categorizar_grupos(elemento))
    while not temp.empty():
        c.put(temp.get())
    print(categorias)
    for i in range (1, 4):
        res.put(categorias[i])
    while not res.empty():
        elemento = res.get()
        orden.append(elemento)
        temp.put(elemento)
    while not temp.empty():
        res.put(temp.get())
    return res and orden
    
def categorizar_grupos (tupla: tuple[str,int,bool,bool]) -> tuple[str,int,bool,bool]:
    if tupla[3] == True and tupla[2] == True:
        res = tupla + (1,)
    elif tupla[3] == True and tupla[2] == False:
        res = tupla + (2,)
    elif tupla[3] == False and tupla[2] == True:
        res = tupla + (3,)
    elif tupla[3] == False and tupla [2] == False:
        res = tupla + (4,) 

    return res

d: Cola = Cola()
d.put(("Silvano Picard", 1234567, True, False))
d.put(("Juan Pedro", 5788901, False, True))
d.put(("Tomas Gallardo", 76802931, False, False))

print(atencion_a_clientes(d))