# Ejercicio 1 - Regresion lineal multiple

# 1.	Se investigó el efecto del peso del vehículo (en toneladas) 
# y la temperatura ambiente promedio (en °F) sobre el rendimiento 
# del combustible, en una muestra aleatoria de 10 vehículos. Los 
# datos se muestran a continuación:

# Lectura de datos
rendimiento_datos = read.table("C:\\Users\\lalor\\Downloads\\Proba17112021\\Vehiculos.txt", header=TRUE)
rendimiento_datos

# a.	Obtenga una ecuación de mínimos cuadrados para el modelo de 
# regresión lineal que explique el Rendimiento de combustible del 
# vehículo con base en su Peso y la Temperatura ambiente promedio.

rendimiento_modelo = lm(Rendimiento ~ Peso + Temperatura,
                     data = rendimiento_datos)

rendimiento_modelo

summary(rendimiento_modelo)

# El modelo sería
# Rendimiento = 24.748874 - 4.159335*Peso -0.014895*Temperatura



# b.	¿Hay pruebas suficientes que indiquen que el modelo resulta 
# útil para predecir y? Pruebe con alfa = 0.10 usando el contraste de 
# hipótesis del Análisis de Varianza.

#  p-value: 2.798e-07 < 0.1 se rechaza la hipótesis nula de que todos los valores son 0.

# 2.91e-11 ***
# 9.28e-08 ***
# 0.00032 ***
## Todas las variables son útiles


# c.	Calcule un intervalo de predicción de 95% para el rendimiento 
# observado en un automóvil con un peso de 1.35 ton si la temperatura 
# ambiente es de 40° F. Interprete el intervalo.

# El modelo es:
#   Rendimiento = 24.748874 - 4.159335*Peso - 0.014895*Temperatura

# Estimación puntual
# peso = 1.35
# temperatura = 40
# y_p = 24.748874 - 4.159335*peso - 0.014895*temperatura
# y_p
# # Cuadrado Medio del Error
# MSE = sum(rendimiento_modelo$residuals^2)
# MSE
# 
# # Intervalo de predicción
# n = dim(rendimiento_datos)[1]
# LIP = y_p - sqrt(MSE*(1/n + ))
# 






