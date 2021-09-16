# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matemáticas
# Probabilidad y Estadística para Ingeniería
# 
# Paul RC
# 2021 09 13
# =====
# Distribución Poisson
# ---
# En la revisión de asientos contables de una gran empresa se encuentra que en promedio hay un error en la suma cada 50 páginas. Calcule la probabilidad de
# a) Encontrar al menos un error en las siguientes 50 páginas. R= 0.6321
# b) Observar menos de dos errores en las siguientes 50 páginas. R= 0.7358
# c) Que se encuentre exactamente un error en las siguientes 100 páginas. R= 0.2707
# d) Que se encuentre exactamente un error en las siguientes 10 páginas. R= 0.1637
# ---
# # a) P(X>=1) = 1 - P(X=0) = 0.6321
# lambda50 = 1 # Por cada 50 páginas
# prob_mayor_o_igual_1 = 1 - dpois(0,lambda50)
# prob_mayor_o_igual_1
# 
# # b) P(X<2) = P(X=0) + P(X=1) = 0.7358
# lambda50 = 1 # Por cada 50 páginas
# prob_menor_2 = dpois(0, lambda50) + dpois(1, lambda50)
# prob_menor_2
# prob_1_10
# # c) Un error en las siguientes 100 páginas
# # Como 100 páginas es el doble que 50, entonces el valor de lambda también se tiene que incrementar al doble
# # P(X=1) = 0.2707
# lambda100 = (100/50)*lambda50
# lambda100
# prob_1 = dpois(1, lambda100)
# prob_1
# 
# # d) Un error en las siguientes 10 páginas
# # Como el valor del intervalo de referencia cambió de 50 a 10, también hay que actualizar el valor de lambda
# # P(X=1) = 0.1637
# lambda10 = (10/50)*lambda50
# lambda10
# prob_1_10 = dpois(1, lambda10)
# prob_1_10


# Un empleado en un centro de atención telefónica trabaja de las 8:00 am a las 5:00 pm, con descansos de 10:30 a 10:45 y de 14:45 a 15:00
# Suponga que las llamadas llegan de acuerdo con un proceso Poisson con un número esperado de llamadas por hora igual a 6
# ¿Cuál es la probabilidad de que haya cuando mucho 2 llamadas durante los descansos?R = 0.4232
# ¿Cuál es la probabilidad de que la primer llamada llegue después de las 8:10 am?R = 0.3679 ( P(X = 0) )
# ¿Cuál es la probabilidad de que el empleado pueda realizar una actividad distinta durante 45 minutos sin que sea interrumpido por una llamada?R = 0.0111

lambda60 = 6
# a) P(x <= 2) = P(x = 0) + P(x = 3) + P(x = 2)
lambda30 = (30/60)*lambda60
lambda30
prob_menor_o_igual_2 = dpois(0, lambda30) + dpois(1, lambda30) + dpois(2, lambda30)
prob_menor_o_igual_2

# b) P(X = 0) en un intervalo de 10 minutos
lambda10 = (10/60)*lambda60
prob_0 = dpois(0, lambda10)
prob_0

# c) P(X = 0) en un intervalo de 45 minutos
lambda45 = 45/60*lambda60
prob_0 = dpois(0, lambda45)
prob_0

# Tareitaaaaaaa


