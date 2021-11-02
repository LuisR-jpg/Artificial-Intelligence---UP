# Suponga que un examen de opción múltiple de Estadística consta de 10 preguntas
# Cada pregunta tiene cuatro respuestas posibles de las cuales solamente una es correcta
# Suponga que un alumno responde todas las preguntas al azar
# Obtenga la fmp de X = Número de respuestas correctas
# Calcule P(X = 0) R = 0.0563
# Calcule P(X > 0) R = 0.9437
# Calcule la probabilidad de que apruebe, si la calificación mínima aprobatoria es 7 R = 0.0035
# Calcule el número esperado de respuestas correctas que obtendrá R = 2.5
# 
#   # X ~ Bin(10, 0.25)
# a) P(x = 0)
n = 10
p = 0.25
p0 = dbinom(0, size=n, prob=p)
p0

#b) P(x > 0) 
p_mayor = 1 - p0
p_mayor

#c) Prob de que apruebe si 7 es la mínima
p_apruebe = sum(dbinom(7:10, size = 10, prob=0.25))
p_apruebe

E_x = n*p
E_x