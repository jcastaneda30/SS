from datetime import datetime

# Lista para almacenar los tiempos en segundos
tiempos_en_segundos_llegadas = []
archivo_tiempos = 'TiemposLlegada.txt'
# Leer tiempos desde el archivo
with open('TiemposLlegada.txt', 'r') as file:
    lineas = file.readlines()

# Convertir cada tiempo a segundos
for linea in lineas:
    tiempo_str = linea.strip()
    tiempo_obj = datetime.strptime(tiempo_str, "%H:%M:%S")
    segundos = tiempo_obj.hour * 3600 + tiempo_obj.minute * 60 + tiempo_obj.second
    tiempos_en_segundos_llegadas.append(segundos)
    
archivo_tiempos_salida = 'TiemposEntreLlegadasSec.txt'
with open(archivo_tiempos_salida, 'w') as file_salida:
    for i in range(1,len(tiempos_en_segundos_llegadas)):
        print(f"{tiempos_en_segundos_llegadas[i]}\n")
        file_salida.write(f"{tiempos_en_segundos_llegadas[i]-tiempos_en_segundos_llegadas[i-1]}\n")
        
tiempos_en_segundos_pedidos = []
with open('TiemposDePedido.txt', 'r') as file:
    lineas = file.readlines()

# Convertir cada tiempo a segundos
for linea in lineas:
    tiempo_str = linea.strip()
    tiempo_obj = datetime.strptime(tiempo_str, "%H:%M:%S")
    segundos = tiempo_obj.hour * 3600 + tiempo_obj.minute * 60 + tiempo_obj.second
    tiempos_en_segundos_pedidos.append(segundos)
    
tiempos_en_segundos_servicio = []
with open('TiemposDeServicio.txt', 'r') as file:
    lineas = file.readlines()

# Convertir cada tiempo a segundos
for linea in lineas:
    tiempo_str = linea.strip()
    tiempo_obj = datetime.strptime(tiempo_str, "%H:%M:%S")
    segundos = tiempo_obj.hour * 3600 + tiempo_obj.minute * 60 + tiempo_obj.second
    tiempos_en_segundos_servicio.append(segundos)


