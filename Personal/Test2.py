import numpy as np
import matplotlib.pyplot as plt

data = np.genfromtxt('Test2.csv', delimiter=',', skip_header=1)

def calcular_temp_promedio (data):
    temperaturas = []
    for array in data:
        temperaturas.append(array[1])
    temperatura_promedio = np.mean(temperaturas)
    return temperatura_promedio

def calcular_velocidad_viento_promedio (data):
    velocidades = []
    for array in data:
        velocidades.append(array[2])
    velocidades_promedio = np.mean(velocidades)
    return velocidades_promedio

def calcular_lluvia_promedio (data):
    lluvias = []
    for array in data:
        lluvias.append(array[3])
    lluvias_promedio = np.mean(lluvias)
    return lluvias_promedio

temperatura_promedio = calcular_temp_promedio(data)
velocidades_promedio = calcular_velocidad_viento_promedio(data)
lluvia_promedio = calcular_lluvia_promedio(data)

def calcular_dia (data):
    for i in range (1, len(data)+1):
        if data[i] == np.max(data):
            return i
    return 0

def buscar_max (data):
    lluvias = []
    temperaturas = []
    velocidades = []
    res = {}
    for array in data:
        temperaturas.append(array[1])
        velocidades.append(array[2])
        lluvias.append(array[3])
    res["Temperatura máxima"] = (f"Dia {calcular_dia(temperaturas)}", np.max (temperaturas))
    res["Velocidad máxima"] = (f"Dia {calcular_dia(velocidades)}", np.max(velocidades))
    res["Precipitaciones máxima"] = (f"Dia {calcular_dia(lluvias)}", np.max(lluvias))
    
    return res

def buscar_min (data):
    lluvias = []
    temperaturas = []
    velocidades = []
    res = {}
    for array in data:
        temperaturas.append(array[1])
        velocidades.append(array[2])
        lluvias.append(array[3])
    res["Temperatura minima"] = (f"Dia {calcular_dia(temperaturas)}", np.min (temperaturas))
    res["Velocidad minima"] = (f"Dia {calcular_dia(velocidades)}", np.min(velocidades))
    res["Precipitaciones minima"] = (f"Dia {calcular_dia(lluvias)}", np.min(lluvias))
    
    return res

lluvias = []
temperaturas = []
velocidades = []
for array in data:
        temperaturas.append(array[1])
        velocidades.append(array[2])
        lluvias.append(array[3])

maximos = buscar_max(data)
minimos = buscar_min(data)

def graficar (data):
    fig, ax = plt.subplots(3, 1, figsize = (10,10))
    dias = np.arange (1, len(data)+1)

    ax[0].plot(dias, temperaturas, marker = 'o', label = "Temperatura promedio")
    ax[0].set_title ("Temperaturas promedio")
    ax[0].set_xlabel("Dias")
    ax[0].set_ylabel ("Temperatura (°C)")
    ax[0].legend()
    
    ax[1].plot(dias, velocidades, marker = 'o', label = "Velocidades de viento promedio")
    ax[1].set_title ("Velocidades de viento promedio")
    ax[1].set_xlabel("Dias")
    ax[1].set_ylabel ("Velocidad (km/h)")
    ax[1].legend()
    
    ax[2].plot(dias, lluvias, marker = 'o', label = "Precipitaciones (en mm) promedio")
    ax[2].set_title("Precipitaciones promedio")
    ax[2].set_xlabel("Dias")
    ax[2].set_ylabel("Precipitacion (mm)")
    ax[2].legend()
    
    plt.tight_layout()
    plt.show()
    
graficar(data)
    
