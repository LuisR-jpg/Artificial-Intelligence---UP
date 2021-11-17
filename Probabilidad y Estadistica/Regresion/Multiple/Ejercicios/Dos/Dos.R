# Ejercicio 2. Regresión Lineal Múltiple. Ganancias de la industria Química.
source("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Regresion\\Multiple\\Ejercicios\\Dos\\Regresion_util.R")
ganancias = read.table("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Regresion\\Multiple\\Ejercicios\\Dos\\ProblemaDos.txt", header = TRUE)

# 2.	[Lind et al (2004). Estadística para administración y economía. Ejercicio 14.19, p. 535] El señor Steve Douglas fue contratado como gerente en capacitación por una importante empresa financiera. Como primer proyecto, se le pidió que estudiara la utilidad bruta en la industria química. ¿Qué factores afectan las utilidades en esa industria? Steve seleccionó una muestra aleatoria de 16 compañías y obtuvo datos respecto a la cantidad de empleados (EMPLEADOS), el número de dividendos consecutivos pagados en acciones comunes (DIVIDENDOS), el valor total del inventario al inicio del presente año (INVENTARIO) y la ganancia bruta (GANANCIA) de cada empresa.
# Ganancia	Empleados	Dividendos	Inventario
# 2800	140	12	1800
# 1300	65	21	320
# 1230	130	42	820
# 1600	115	80	76
# 4500	390	120	3600
# 5700	670	64	8400
# 3150	205	43	508
# 640	40	14	870
# 3400	480	88	5500
# 6700	810	98	9875
# 3700	120	44	6500
# 6440	590	110	9130
# 1280	440	38	1200
# 4160	280	24	890
# 3870	650	60	1200
# 980	150	24	1300
# a.	Ajuste un modelo de regresión lineal múltiple a los datos y estime los coeficientes de regresión utilizando todas las variables
# b.	Realice el contraste de hipótesis del Análisis de Varianza y diga si al menos una de las variables utilizadas es adecuada para pronosticar el valor de la Ganancia
# c.	Identifique las variables que son útiles para pronosticar Y para ajustar un modelo corregido. Proporcione este nuevo modelo.
