import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

# Para usar pandas
data1 = pd.read_csv("precios_acciones.csv")
data1["Fecha"] = pd.to_datetime(data1["Fecha"])
data_filled = data1.fillna(data1.mean())

# Para usar numpy
data2 = np.genfromtxt("precios_acciones.csv", delimiter=",", skip_header=1)

columna_apertura = data2[:,1]
columna_maximo = data2[:,2]
columna_minimo = data2[:,3]
columna_cierre = data2[:,4]
columna_volumen = data2[:,5]

def calcular_stats_descriptivas (dataset):
    res = {}
    res["Apertura"] = {"Media": np.mean(columna_apertura), "Mediana": np.median(columna_apertura), "Desviacion standard": np.std(columna_apertura)}
    res["Maximo"] = {"Media": np.mean(columna_maximo), "Mediana": np.median(columna_maximo), "Desviacion standard": np.std(columna_maximo)}
    res["Minimo"] = {"Media": np.mean(columna_minimo), "Mediana": np.median(columna_minimo), "Desviacion standard": np.std(columna_minimo)}
    res["Cierre"] = {"Media": np.mean(columna_cierre), "Mediana": np.median(columna_cierre), "Desviacion standard": np.std(columna_cierre)}
    res["Volumen"] = {"Media": np.mean(columna_volumen), "Mediana": np.median(columna_volumen), "Desviacion standard": np.std(columna_volumen)}
    return res

estadisticas_pandas = data1.describe()
estadisticas_numpy = calcular_stats_descriptivas(data2)


def graficar ():
    fechas = data1["Fecha"]
    aperturas = data1["Apertura"]
    maximos = data1["Maximo"]
    minimos = data1["Minimo"]
    cierres = data1["Cierre"]
    volumenes = data1["Volumen"]
    fig, ax = plt.subplots(5, 1, figsize=(10,10))
    ax[0].plot(fechas, aperturas, marker ='o', label = "Aperturas")
    ax[1].plot(fechas, maximos, marker='o', label = "Maximos")
    ax[2].plot(fechas, minimos, marker = 'o', label= "Minimos")
    ax[3].plot(fechas, cierres, marker = 'o', label= "Cierres")
    ax[4].plot(fechas, volumenes, marker = 'o', label= "Volumenes")
    ax[0].legend()
    ax[1].legend()
    ax[2].legend()
    ax[3].legend()
    ax[4].legend()
    ax[0].set_xlabel("Fechas")
    ax[0].set_ylabel("Precio de apertura")
    ax[1].set_xlabel("Fechas")
    ax[1].set_ylabel("Precio máximo")
    ax[2].set_xlabel("Fechas")
    ax[2].set_ylabel("Precio mínimo")
    ax[3].set_xlabel("Fechas")
    ax[3].set_ylabel("Precio de cierre")
    ax[4].set_xlabel("Fechas")
    ax[4].set_ylabel("Volumen")
    
    plt.tight_layout()
    plt.show()
    
graficar()