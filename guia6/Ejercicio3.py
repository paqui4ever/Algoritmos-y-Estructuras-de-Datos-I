def alguno_es_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 or numero2 == 0

print (alguno_es_0 (2,0))

def ambos_son_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 and numero2 == 0

def es_nombre_largo (nombre: str) -> bool:
    return len(nombre) >= 3 and len(nombre) <= 8

def es_bisiesto (año: int) -> bool:
    return año % 4 == 0 and año % 100 != 0

print (es_bisiesto (2024))

