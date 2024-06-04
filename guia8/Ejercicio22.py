from queue import LifoQueue as Pila

pila_silvano = Pila()
pila_pedro = Pila()
pila_nabu = Pila()

historiales: dict[str, Pila[str]] = {
    "Silvano": pila_silvano,
    "Pedro": pila_pedro,
    "Nabu": pila_nabu
}

def visitar_sitio (historiales: dict[str, Pila[str]], usuario:str, sitio:str) -> dict[str, Pila[str]]:
    for key in historiales:
        if key == usuario:
            historiales[key].put(sitio)
    return historiales

#print(visitar_sitio(historiales, "Silvano", "google.com"))

def navegar_atras (historiales: dict[str, Pila[str]], usuario: str) -> dict[str, Pila[str]]:
    for key in historiales:
        if key == usuario:
            historiales[key].get()
    return historiales

visitar_sitio(historiales, "Pedro", "google.com")
visitar_sitio(historiales, "Pedro", "facebook.com")
navegar_atras(historiales, "Pedro")
while not historiales["Pedro"].empty(): #Solamente la uso para ver que funcionen las funciones
    print(historiales["Pedro"].get())