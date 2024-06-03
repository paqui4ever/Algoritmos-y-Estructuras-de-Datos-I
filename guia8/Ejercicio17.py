from queue import Queue as Cola

# cola = [(1, Silvano, Traumatologia), (3, Juan, Cardiologia)]
# => cola.get() => (3, Juan, Cardiologia), hay que revisar cola.get()[0]

def n_pacientes_urgentes (c: Cola[(int,str,str)]) -> int:
    prioridades: list = []
    temp: Cola[(int,str,str)] = Cola()
    while not c.empty():
        elemento = c.get()
        temp.put(elemento)
        prioridades.append(elemento[0])
    prioridades_importantes: list[int] = filtrar_prioridades(prioridades)
    return contar_apariciones(prioridades_importantes)
    
def filtrar_prioridades (lista: list[int]) -> list[int]:
    filtrada = []
    for prioridad in lista:
        if prioridad <= 3:
            filtrada.append(prioridad)
    return filtrada
    
def contar_apariciones (lista:list[int]) -> int:
    apariciones = 0
    urgentes = [1,2,3]
    for i in range(len(lista)):
        if pertenece(lista[i], urgentes):
            apariciones += 1
    return apariciones
        
def pertenece (s, lista: list) -> bool:
    for i in range (len(lista)):
        if lista[i] == s:
            return True
    return False

cola:Cola = Cola()
cola.put((1, "Juan", "Cardiologia"))
cola.put((9, "Pedro", "Clinica"))
cola.put ((3, "Pepe", "Endocrinologia"))

print(n_pacientes_urgentes(cola))