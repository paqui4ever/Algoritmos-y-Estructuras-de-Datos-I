# Ejercicio 1

def devolver_el_doble_si_es_par(numero: int) -> int:
    if numero % 2 == 0:
        return numero * 2
    else:
        return numero
    
# Ejercicio 2

def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if numero % 2 == 0:
        return numero
    else:
        return numero + 1
    
# Ejercicio 3

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if numero % 3 == 0:
        return numero * 2
    elif numero % 9 == 0:
        return numero * 3
    else:
        return numero
    
# Ejercicio 4

def lindo_nombre(nombre: str) -> str:
    if len (nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"
        
print (lindo_nombre ("Silvano"))

# Ejercicio 5

def elRango(numero: int) -> str:
    if numero in range (0,5):
        return "Menor a 5"
    elif numero in range (10,20):
        return "Entre 10 y 20"
    elif numero > 20:
        return "Mayor a 20"
    
# Ejercicio 6

def jubilados(sexo: chr, edad: int) -> str:
    if sexo == 'M' and edad >= 65:
        return "Anda de vacaciones"
    if sexo == 'M' and edad < 65:
        return "Te toca trabajar"
    elif sexo == 'F' and edad >= 60:
        return "Anda de vacaciones"
    elif sexo == 'F' and edad < 60:
        return "Te toca trabajar"
    

        