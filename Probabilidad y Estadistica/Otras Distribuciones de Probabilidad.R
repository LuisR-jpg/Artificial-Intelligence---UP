
# Otras distribuciones continuas
# Surgidas de la Distribución Normal
# ===
# Distribución ji-cuadrada
# El cuantil de la distribución ji-cuadrada con 13 grados de libertad que deja una probabilidad igual a 0.1 en la cola derecha de la distribución
# P(X > x0) = 0.1 => x0 = 19.81
cuantil_01_derecho = qchisq(0.1, 13, lower.tail=FALSE)
#cuantil_01_derecho

#X~X^2(20); P(X > x0) = 0.05
qchisq(0.05, 20, lower.tail = FALSE)


# Distribución t de Student
# El cuantil de la distribución t de Student con 13 grados de libertad que deja una probabilidad igual a 0.05 en la cola derecha de la distribución
# P(X > x0) = 0.05 => x0 = 1.771
cuantil_05_derecho = qt(0.05, 13, lower.tail=FALSE)
#cuantil_05_derecho

#T~T(31); P(T > to) = 0.001
qt(0.001, 31, lower.tail = 0)



# Distribución F
# El cuantil de la distribución F con 5 y 10 grados de libertad que deja una probabilidad igual a 0.01 en la cola derecha de la distribución
# P(X > x0) = 0.01 => x0 = 5.64
cuantil_01_derecho = qf(0.01, 5, 10, lower.tail=FALSE)
#cuantil_01_derecho


#F~F(6, 9); P(F > f0) = 0.134
qf(0.134, 6, 9, lower.tail = 0)