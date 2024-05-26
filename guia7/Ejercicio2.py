# Ejercicio 1

def borra_posiciones_pares (lista: list) -> list:
    for i in range (0, len(lista), 1):
        if i % 2 == 0:
            lista.remove(i)
            lista.insert(i, 0)
    return lista

#print(borra_posiciones_pares ([0,1,2,3,4,5,6]))

# Ejercicio 2

def borra_posiciones_paresV2 (lista: list) -> list:
    lista2: list = []
    for i in range (0, len(lista), 1):
        if i % 2 == 0:
            lista2.insert(i, 0)
        else:
            lista2.insert(i, lista[i])
    return lista2

#print(borra_posiciones_paresV2([0,1,2,3,4,5,6]))

# Ejercicio 3

vocales = ['a','e','i','o','u']

def es_vocal (letra: chr) -> bool:
    return letra in vocales

def borra_vocales (palabra: list) -> list:
    for caracter in palabra:
        if es_vocal(caracter):
            palabra.remove(caracter)
    return palabra

#print(borra_vocales(['a','r','b','o','l']))

# Ejercicio 4

def reemplaza_vocales (palabra: list) -> list:
    for i in range (len(palabra)):
        if es_vocal(palabra[i]):
            palabra.remove(palabra[i])
            palabra.insert(i, '_')
    return palabra

#print(reemplaza_vocales(['a','r','b','o','l']))

# Ejercicio 5

def da_vuelta_str (lista: list) -> list:
    lista2 = []
    for i in range (len(lista)):
        lista2.append(lista[len(lista)-1-i])
    return lista2

#print(da_vuelta_str(['a','b','c']))

# Ejercicio 6

def eliminar_repetidos (lista: list) -> list:
    for caracter in lista:
        if lista.count(caracter) > 1:
            lista.remove(caracter)
    return lista
        
def donde_aparece_repetido (lista: list) -> int: #No la termino usando
    for i in range (len(lista)):
        for j in range (i+1, len(lista)):
            if lista[i] == lista[j]:
                return j
    return 0

#print(donde_aparece_repetido('a',['a','b','d','a']))
#print(eliminar_repetidos(['a','b','d','a','b']))