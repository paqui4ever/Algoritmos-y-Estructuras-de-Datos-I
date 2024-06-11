# Ejercicio 1

# tupla de tipo (nombre, stock) en la entrada
# tupla de tipo (minimo historico, maximo historico)

def stock_productos (stock_cambios: list[tuple[str, int]]) -> dict[str, tuple[int, int]]:
    res: dict[str, tuple[int, int]] = {}
    for producto, stock in stock_cambios:
        for producto2, stock2 in stock_cambios:
            if producto == producto2 and stock != stock2:
                if stock > stock2:
                    maximo = stock
                    minimo = stock2
                else:
                    maximo = stock2
                    minimo = stock
        res[producto] = (minimo, maximo)
    return res
        
# Ejercicio 2

def filtrar_codigos_primos (codigos_barras: list[int]) -> list[int]:
    res:list[int] = []
    for numero in codigos_barras:
        if es_primo(ultimos_tres(numero)):
            res.append(ultimos_tres(numero))
    return res

def ultimos_tres (numero: int) -> int:
    ultimos = numero % 1000
    return ultimos

def es_primo (numero: int) -> bool:
    divisores = []
    primo = False
    for i in range (1, numero+1):
        if numero % i == 0:
            divisores.append(i)
    if len(divisores) == 2 and (1 and numero in divisores):
        primo = True
    else:
        primo = False
    return primo

# Ejercicio 3

def subsecuencia_mas_larga (tipos_pacientes_atendidos: list[str]) -> int:
    subsecuencia_mas_larga: list[str] = [] # Defino mi secuencia más larga
    indice_de_la_mas_larga: int = 0 
    i: int = 0
    perro_o_gato: bool = False
    while i < len(tipos_pacientes_atendidos):
        j: int = i
        subsecuencia_actual: list[str] = []
        if tipos_pacientes_atendidos[i] in ["perro", "gato"]:
            perro_o_gato: bool = True
            while j < len(tipos_pacientes_atendidos) and perro_o_gato: # Hago un loop desde i para ver si los siguientes también son perro o gato
                if tipos_pacientes_atendidos[j] in ["perro", "gato"]:
                    subsecuencia_actual.append(tipos_pacientes_atendidos[j])
                    j += 1
                else:
                    perro_o_gato = False # Salgo del loop con esto porque lo pido en la condicion del while
            if len(subsecuencia_actual) > len(subsecuencia_mas_larga):
                indice_de_la_mas_larga = i
                subsecuencia_mas_larga = subsecuencia_actual.copy()
        i += 1
                    
    return indice_de_la_mas_larga

def subsecuencia_mas_larga2 (tipos_pacientes_atendidos: list[str]) -> int:
    subsecuencia_mas_larga: list[str] = []
    indice_de_la_mas_larga: int = 0
    for i in range (len(tipos_pacientes_atendidos)):
        subsecuencia_actual: list[str] = []
        if tipos_pacientes_atendidos[i] in ["perro", "gato"]:
            subsecuencia_actual.append(tipos_pacientes_atendidos[i]) # Agrego ese "perro" o "gato" a la subsecuencia en la que trabajo
            for j in range (i, len(tipos_pacientes_atendidos)): # Empiezo un loop desde el indice i, para ver si los siguientes son tambien "perro" o "gato"
                if tipos_pacientes_atendidos[j] in ["perro", "gato"]:
                    subsecuencia_actual.append(tipos_pacientes_atendidos[j])
                else:
                    break
        if len(subsecuencia_actual) > len(subsecuencia_mas_larga):
            subsecuencia_mas_larga = subsecuencia_actual.copy()
            indice_de_la_mas_larga = i
            
    return indice_de_la_mas_larga

#print(subsecuencia_mas_larga2(["perro", "perro", "avestruz", "gato", "gato", "gato"]))

# Ejercicio 4

"""
Matrices de tipo [
    ["Juan", ...]
    ["Pedro", ...]
    ["Juan", ...]
    ["Juan", ...]
    ["Tomas", ...]
    ["Tomas", ...]
    ["Tomas", ...]
    ["Tomas", ...]
]
Cada fila representaria turnos de 9,10,11,12 y 14,15,16,17 con sus responsables correspondientes
Devuelve lista de tuplas de tipo (bool, bool), son True si los valores de turnos de la mañana son iguales entre si, lo mismo para los de la tarde
Hay una tupla por dia
"""

def un_responsable_por_turno (grilla_horaria: list[list[str]]) -> list[tuple[bool,bool]]:
    res: list[tuple[bool, bool]] = []
    for columna in range (len(grilla_horaria[0])):
        iguales_mañana = True
        iguales_tarde = True
        persona_mañana = grilla_horaria[0][columna] # Divido a la matriz en 2, mañana y tarde
        persona_tarde = grilla_horaria[4][columna]
        for fila in range(len(grilla_horaria)):
            persona_actual = grilla_horaria[fila][columna]
            if persona_actual != persona_mañana and fila < 4:
                iguales_mañana = False
            elif persona_actual != persona_tarde and fila >= 4:
                iguales_tarde = False
        res.append((iguales_mañana, iguales_tarde))
            
    return res
            
grilla = [
        # mañana
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"], 
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"], 
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"],
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"],
        # tarde
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"],
          ["Juan", "pepe", "pepe", "Juan", "pepe", "diego", "tito"],
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"],
          ["Tomas", "pepe", "pepe", "Juan", "pepe", "diego", "tito"]
          ]

print(un_responsable_por_turno(grilla))
