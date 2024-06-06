"""
v: Realiza un viaje (todos los viajes son de $56)
r: Recarga saldo (todas las recargas son de $350)
s: Visualiza el saldo actual (no modifica el saldo)
x: El usuario decide terminar el programa
"""

# Ejercicio 1

def verificar_transacciones (s: str) -> int:
    res: int = 350 * (ap_antes_corte('r', s)) - (56 * ap_antes_corte('v', s))
    if res < 0:
        res += 56    
    return res
    
def ap_antes_corte (c: chr, s: str) -> int:
    contador:int = 0
    saldo: int = 0
    for caracter in s:
        if caracter != 'x' and saldo >= 0:
            if caracter == c:
                contador += 1
            if caracter == 'v':
                saldo -= 56
            if caracter == 'r':
                saldo += 350
        if caracter == 'x' or saldo < 0:
            return contador
    return contador
    
s = "ssrvvrrvvsvvsxrvvv"
#print(ap_antes_corte('r', s))
#print(verificar_transacciones(s))

# Ejercicio 2

def valor_minimo (s: tuple[float, float]) -> float:
    minimo: int = s[0][0]
    for tupla in s:
        if tupla[0] < minimo:
            minimo = tupla[0]
    return minimo

#s = [(1.0, 5.2), (10.4, 15.1), (-25.0, 28.9), (25.4, 35.6), (12, 1.3)]    
#print(valor_minimo(s))

# Ejercicio 3

# cotizaciones_diarias = {"YPF" : [(1,10),(15, 3), (31,100)], 
# "ALUA" : [(1,0), (20, 50), (31,30)]}

def buscar_maximo (cotizaciones: list[tuple[int, float]]) -> float:
    maximo: int = 0
    for cotizacion in cotizaciones:
        if cotizacion[1] > maximo:
            maximo = cotizacion[1]
    return maximo

def buscar_minimo (cotizaciones: list[tuple[int, float]]) -> float:
    minimo: int = cotizaciones[0][1]
    for cotizacion in cotizaciones:
        if cotizacion[1] < minimo:
            minimo = cotizacion[1]
    return minimo

def valores_extremos (cotizaciones_diarias: dict[str, list[tuple[int, float]]]) -> dict[str, tuple[float, float]]:
    res: list[tuple[str, tuple[int, float]]] = []
    for elemento in cotizaciones_diarias.items():
        empresa: str = elemento[0]
        maximo_empresa = buscar_maximo(elemento[1])
        minimo_empresa = buscar_minimo(elemento[1])
        res.append((empresa, (minimo_empresa, maximo_empresa)))
    return dict(res)
    
cotizaciones_diarias = {"YPF" : [(1,10),(15, 3), (31,100)], "ALUA" : [(1,0), (20, 50), (31,30)]}
print(valores_extremos(cotizaciones_diarias))

#print(buscar_minimo([(1,10),(15, 3), (31,100)]))

# Ejercicio 4

def es_sudoku_valido (m: list[list[int]]) -> bool:
    return fila_valida(m) and columna_valida(m)
             
def fila_valida (m: list[int]) -> bool:
    numeros_vistos: list[int] = []
    for numero in m:
        if numero in numeros_vistos and numero != 0:
            return False
        else:
            numeros_vistos.append(numero)
    return True

def columna_valida (m: list[list[int]]) -> bool:
    for i in range(len(m)-1):
        for j in range (len(m[0])):
            if m[i][j] == m[i+1][j] and m[i][j] != 0 and m[i+1][j] != 0:
                return False
    return True

m =[
[1, 2, 3, 4, 5, 6, 7, 8, 9],
[9, 8, 7, 6, 4, 5, 3, 2, 1],
[0, 0, 0, 0, 0, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 4, 0, 0, 0],
[0, 0, 0, 0, 6, 0, 0, 0, 0],
[0, 0, 0, 5, 0, 0, 0, 0, 0],
[0, 0, 4, 0, 0, 0, 0, 0, 0],
[0, 3, 0, 0, 0, 0, 0, 0, 0],
[2, 0, 0, 0, 0, 0, 0, 0, 0]
]
#print(es_sudoku_valido(m))