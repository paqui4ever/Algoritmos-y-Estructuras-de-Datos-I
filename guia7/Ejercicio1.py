import numpy

# Ejercicio 1

def pertenece (s: list, e: int) -> bool:
    if e in s:
        return True
    else:
        return False
    
def pertenece_dos (s: list, e: int) -> bool:
    if s.count (e) >= 1:
        return True
    else:
        return False
    
def pertenece_tres (s: list, e: int) -> bool:
    for i in range (1, len (s), 1):
        if s[i] == e:
            return True
    else: 
        return False

#print (pertenece_tres ([3,2,1,5,3,9], 9))
 
# print (pertenece ([3,2,1,5,3,2], 1))

# Ejercicio 2

def divide_a_todos (s: list, e: int) -> bool:
    for i in range (1, len (s), 1):
        if s[i] % e == 0:
            return True
        else:
            return False

# print (divide_a_todos ([6,8,10,12], 3))    

# Ejercicio 3

def suma_total (s: list) -> int:
    total = 0
    for i in s:
        total += i
    return total

# print (suma_total ([2,2,2,2]))

# Ejercicio 4

def ordenados (s: list) -> bool:
    for i in range (0, len(s), 1):
        if s[i] > s[i+1]:   # Obligo a que compare con todos
            return False
    return True

# print(ordenados ([1,2,3,4,1]))

# Ejercicio 5

def palabras_largas (s: list) -> bool:
    for i in range (0, len(s), 1):
        if len(s[i]) >= 7:
            return True
    return False

# print (palabras_largas (["Juan", "Pedro", "Tomas", "Otorrinonaringologo"]))

# Ejercicio 6

def es_palindromo (palabra: str) -> bool:
    for i in range (0, len(palabra) // 2, 1):
        j = len(palabra) - 1 - i # quiero que el primero sea igual al ultimo entonces j = n-1-0, despues el segundo con anteultimo entonces j = n-1-1. Asi tengo que j = length - 1 - i
        if palabra [j] != palabra [i]:
            return False
    else:
        return True
    

#print (es_palindromo ("rapar"))

# Ejercicio 7

def fortaleza_de_contraseña (contraseña: str) -> str:
    longitud = len(contraseña)
    if cumple_requisitos_VERDE(contraseña):
        return "VERDE"
    elif cumple_requisitos_ROJO (contraseña):
        return "ROJO"
    else:
        return "AMARILLO"


def cumple_requisitos_VERDE (contraseña: str) -> bool:
    if cantidad_de_minusculas (contraseña) >= 1 and cantidad_de_digitos (contraseña) >= 1 and cantidad_de_mayusculas (contraseña) >= 1 and len(contraseña) > 8:
        return True
    else:
        return False    

def cumple_requisitos_ROJO (contraseña: str) -> bool:
    if len(contraseña) < 5:
        return True
    else:
        return False

def cantidad_de_minusculas (palabra: str) -> bool:
    contador = 0
    for letra in palabra:
        if tiene_minuscula (letra) == True:
            contador += 1
    return contador

def tiene_minuscula (letra: chr) -> bool:
    return 'a' <= letra <= 'z'

def cantidad_de_mayusculas (palabra: str) -> bool:
    contador = 0
    for letra in palabra:
        if tiene_mayuscula (letra) == True:
            contador += 1
    return contador

def tiene_mayuscula (letra: chr) -> bool:
    return 'A' <= letra <= 'Z'

def cantidad_de_digitos (palabra: str) -> bool:
    contador = 0
    for letra in palabra:
        if tiene_digitos_numericos (letra) == True:
            contador += 1
    return contador

def tiene_digitos_numericos (letra: chr) -> bool:
    return '0' <= letra <= '9'
    
#print (fortaleza_de_contraseña ("cader0"))


# Ejercicio 8

def operaciones (historial: list) -> int:
    balance = 0
    for movimiento in historial:
        if movimiento[0] == 'I':
            balance += movimiento[1]
        if movimiento[0] == 'R':
            balance -= movimiento[1]
    return balance

#print (operaciones([('I',2000), ('R', 300), ('I', 200)]))

# Ejercicio 9

vocales = ['a','e','i','o','u']

def vocales_distintas (palabra: str) -> bool:
    for letra in palabra:
        if es_vocal(letra) and palabra.count(letra) > 1 and contador_de_vocales (palabra) >= 3:
            return False
    return True

def es_vocal (letra: chr) -> bool:
    return letra in vocales

def contador_de_vocales (palabra: str) -> int:
    contador = 0
    for letra in palabra:
        for vocal in vocales:
            if letra == vocal:
                contador += 1
    return contador

#print(vocales_distintas ("anillo"))
