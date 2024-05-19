# En una plantación de pinos, de cada árbol se conoce la altura expresada en metros. El peso de un pino se puede estimar
# a partir de la altura de la siguiente manera:
# 3 kg por cada centímetro hasta 3 metros,
# 2 kg por cada centímetro arriba de los 3 metros

def peso_pino (altura: int) -> int:
    altura_metros = altura * 100 
    if altura_metros <= 3:
        print (3 * altura_metros)
    else:
        print (2 * altura_metros)
    
def es_peso_util (peso: int) -> bool:
    if peso in range (400, 1000):
        return True
    else:
        return False

def sirve_pino (altura: int) -> bool:
    if es_peso_util (peso_pino (altura)) == True:
        return True
    else:
        return False
    
