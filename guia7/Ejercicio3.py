def aprobado (notas: list) -> int:
    if mayores_a_cuatro (notas) and promedio (notas) >= 7:
        return 1
    elif mayores_a_cuatro (notas) and promedio (notas) < 7 and promedio (notas) >= 4:
        return 2
    elif notas.count(4) >= 1 or promedio(notas) < 4:
        return 3
    
def mayores_a_cuatro (notas: list) -> bool:
    for i in range (0, len(notas), 1):
        if notas [i] < 4:
            return False
    return True

def promedio (notas: list) -> int:
    total = 0
    for nota in notas:
        total += nota
    return total / (len(notas))

# print (aprobado([9,9,7,9]))