from datetime import datetime

# Lista para almacenar los tiempos en segundos
tiempos_en_segundos = []
archivo_tiempos = 'TiemposDia1.txt'
# Leer tiempos desde el archivo
with open(archivo_tiempos, 'r') as file:
    lineas = file.readlines()

# Convertir cada tiempo a segundos
for linea in lineas:
    tiempo_str = linea.strip()
    tiempo_obj = datetime.strptime(tiempo_str, "%H:%M:%S")
    segundos = tiempo_obj.hour * 3600 + tiempo_obj.minute * 60 + tiempo_obj.second
    tiempos_en_segundos.append(segundos)

# Imprimir resultados
for i in range(1,len(tiempos_en_segundos)):
    print(f"Tiempo {i} - Diferencia: {tiempos_en_segundos[i]-tiempos_en_segundos[i-1]}")

archivo_tiempos_salida = 'TiemposDia1Sec.txt'
with open(archivo_tiempos_salida, 'w') as file_salida:
    for i in range(1,len(tiempos_en_segundos)):
        file_salida.write(f"{tiempos_en_segundos[i]-tiempos_en_segundos[i-1]}\n")