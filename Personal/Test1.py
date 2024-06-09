import numpy as np
import matplotlib.pyplot as plt

semana_1 = {
    'Producto A': np.array([10, 12, 11, 14, 13, 15, 10]),
    'Producto B': np.array([20, 18, 19, 17, 20, 22, 21]),
    'Producto C': np.array([15, 16, 14, 15, 16, 18, 17])
}

semana_2 = {
    'Producto A': np.array([11, 13, 12, 15, 14, 16, 11]),
    'Producto B': np.array([21, 19, 20, 18, 21, 23, 22]),
    'Producto C': np.array([16, 17, 15, 16, 17, 19, 18])
}


def calcular_promedio_ventas (semana):
    res = {}
    for tupla in semana.items():
        res[f"{tupla[0]}"] = np.mean(tupla[1])
    return res

promedio_semana_1 = calcular_promedio_ventas(semana_1)
promedio_semana_2 = calcular_promedio_ventas(semana_2)


def encontrar_mas_vendido (semana):
    productos_mas_vendidos = []
    for dia in range (7):
        ventas_dia = {}
        for producto, ventas in semana.items():
            ventas_dia[producto] = ventas[dia]
        producto_mas_vendido = max (ventas_dia, key=ventas_dia.get)
        productos_mas_vendidos.append(producto_mas_vendido)
    return productos_mas_vendidos 
        
productos_mas_vendidos = encontrar_mas_vendido(semana_1)

def suma_total_ventas (semana1, semana2):
    res = {}
    for producto, ventas in semana1.items():
        if producto in res.keys():
            res[producto] += np.sum(ventas)
        else:
            res[producto] = np.sum(ventas)
    for producto, ventas in semana2.items():
        if producto in res.keys():
            res[producto] += np.sum(ventas)
        else:
            res[producto] = np.sum(ventas)
    return res

total_ventas_por_producto = suma_total_ventas(semana_1, semana_2)

def unidades_vendidas (semana1, semana2):
    precio_A = 5
    precio_B = 10
    precio_C = 8
    res = {}
    ventas = suma_total_ventas(semana1, semana2)
    for producto, total in ventas.items():
        if producto == "Producto A":
            res[producto] = total / precio_A
        elif producto == "Producto B":
            res[producto] = total / precio_B
        elif producto == "Producto C":
            res[producto] = total / precio_C
    return res

unidades_vendidas_por_producto = unidades_vendidas(semana_1, semana_2)

def filtrar_ventas_menores_12_A (semana2):
    for producto, ventas in semana2.items():
        if producto == "Producto A":
            res = ventas[ventas > 12]
    return res

ventas_mayores_a_12_A = filtrar_ventas_menores_12_A(semana_2)

def incrementar_ventas_en_5 (semana1, semana2):
    semanas = {}
    for producto, ventas in semana1.items():
        ventas_incrementada = ventas + 5
        semana1[producto] = ventas_incrementada
    for producto, ventas in semana2.items():
        ventas_incrementada = ventas + 5
        semana2[producto] = ventas_incrementada
    semanas["Semana 1"] = semana1
    semanas["Semana 2"] = semana2
    return semanas

ventas_incrementadas = incrementar_ventas_en_5(semana_1, semana_2)

def desviacion_standard_productos (semana1, semana2):
    producto_a = []
    producto_b = []
    producto_c = []
    for producto, ventas in semana1.items():
        if producto == "Producto A":
            producto_a.append(ventas)
        elif producto == "Producto B":
            producto_b.append(ventas)
        elif producto == "Producto C":
            producto_c.append(ventas)
    for producto, ventas in semana2.items():
        if producto == "Producto A":
            producto_a.append(ventas)
        elif producto == "Producto B":
            producto_b.append(ventas)
        elif producto == "Producto C":
            producto_c.append(ventas)
    desviacion_A = np.std(producto_a)
    desviacion_B = np.std (producto_b)
    desviacion_C = np.std (producto_c)
    desviaciones = {}
    desviaciones["Desviacion A"] = desviacion_A
    desviaciones["Desviacion B"] = desviacion_B
    desviaciones["Desviacion C"] = desviacion_C
    return desviaciones

desviaciones = desviacion_standard_productos(semana_1, semana_2)
    
fig, ax = plt.subplots(2, 1, figsize = (10,10))
dias = np.arange (1,8)
"""
for ventas, producto in semana_1.items():
    ax[0].plot(dias, ventas, marker='o', label = producto)
ax[0].set_title ('Ventas - Semana 1')
ax[0].set_xlabel('Dia')
ax[0].set_ylabel('Ventas')
ax[0].legend()

for ventas, producto in semana_2.items():
    ax[1].plot(dias, ventas, marker='o', label = producto)
ax[1].set_title('Ventas - Semana 2')
ax[1].set_xlabel('Dia')
ax[1].set_ylabel('Ventas')
ax[1].legend()

plt.tight_layout()
plt.show()

No funciona con el diccionario
"""


# Lo mismo que lo de arriba sin usar el for loop que lee el diccionario
array1 = np.array([10, 12, 11, 14, 13, 15, 10])
array2 = np.array([20, 18, 19, 17, 20, 22, 21])
array3 = np.array([15, 16, 14, 15, 16, 18, 17])   
ax[0].plot(dias, array1, marker = 'o', label = "Producto A")
ax[0].plot(dias, array2, marker = 'o', label = "Producto B")
ax[0].plot(dias, array3, marker = 'o', label = "Producto C")
ax[0].set_title ('Ventas - Semana 1')
ax[0].set_xlabel('Dia')
ax[0].set_ylabel('Ventas')
ax[0].legend()

array4 = np.array([11, 13, 12, 15, 14, 16, 11])
array5 = np.array([21, 19, 20, 18, 21, 23, 22])
array6 = np.array([16, 17, 15, 16, 17, 19, 18])
ax[1].plot(dias, array4, marker = 'o', label = "Producto A")
ax[1].plot(dias, array5, marker = 'o', label = "Producto B")
ax[1].plot(dias, array6, marker = 'o', label = "Producto C")
ax[1].set_title ('Ventas - Semana 2')
ax[1].set_xlabel('Dia')
ax[1].set_ylabel('Ventas')
ax[1].legend()

plt.tight_layout()
plt.show()    