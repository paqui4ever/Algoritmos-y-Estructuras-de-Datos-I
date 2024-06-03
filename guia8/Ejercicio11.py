from queue import LifoQueue as Pila

def esta_bien_balanceada (s: str) -> bool:
    pila: Pila = Pila()
    for i in range (len(s)):
        if s[i] == '(': 
            pila.put(1) #Pongo un 1 en la pila indicando que hay un parentesis abierto
        elif s[i] == ')' and pila.empty():
            return False # Encuentro que la pila esta vacia y hay un cierre de parentesis entonces devuelvo falso
        elif s[i] == ')' and not pila.empty():
            pila.get() # Veo que hay un cierre de parentesis pero la pila no está vacia (contiene un 1), entonces sigo 
                       #con el bucle indicando que se cerró el parentes previamente abierto
    return True

#print (esta_bien_balanceada ("1 + (1 x 3 - (20 / 5))"))

