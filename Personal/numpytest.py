import numpy as np

temperaturas = [22.5, 23.0, 21.0, 19.5, 25.0, 24.5, 20.0]

temp_array = np.array(temperaturas)
temperatura_media = np.mean(temp_array)
temperatura_max = np.max(temp_array)
temperatura_min = np.min(temp_array)
temp_array_menos_22 = temp_array[temp_array < 22]

matriz = np.array([[1,2,3], [4,5,6]])
suma_columnas = np.sum(matriz, axis=0)
suma_filas = np.sum(matriz, axis=1)
