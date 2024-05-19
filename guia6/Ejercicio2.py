import math

# Ejercicio 1

def imprime_saludo (nombre: str) -> str:
    print (f"Hola {nombre}")
    
imprime_saludo ("Silvano")

# Ejercicio 2

def raizCuadradaDe (numero: int) -> int:
    return math.sqrt (numero)

print (raizCuadradaDe (4))

# Ejercicio 3

def fahrenheit_a_celsius (temp_far: float) -> float:
    return ((temp_far - 32) * 5) / 9

print (fahrenheit_a_celsius (100))

# Ejercicio 4

def imprimir_dos_veces (estribillo: str) -> str:
    return estribillo * 2
    
print (imprimir_dos_veces ("Now here I go again \nI see the crystal visions \nI keep my visions to myself \nIt's only me who wants to wrap around your dreams \nAnd have you any dreams you'd like to sell? \nDreams of loneliness"))

# Ejercicio 5

def es_multiplo_de (n: int, m: int) -> bool:
    if n % m == 0:
        return True
    else:
        return False

print (es_multiplo_de (4,2))

# Ejercicio 6

def es_par (numero: int) -> bool:
    if es_multiplo_de (numero, 2) == True:
        return True
    else:
        return False
    
print (es_par (6))

def cantidad_de_pizzas(comensales: int , min_cant_de_porciones: int) -> int:
    return (comensales * min_cant_de_porciones) / 8 
    
print (cantidad_de_pizzas (4,8))
# cantidad_de_pizzas (4,4) => 4 personas con 4 porciones cada una => 4*4 = 16 y pizza tiene 8 porciones