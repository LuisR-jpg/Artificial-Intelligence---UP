# Utilice la distribución N(0, 1) para obtener las siguientes probabilidades.
# 
# a) P(Z < -2.57) = 0.0051
pnorm(-2.57)
# b) P(Z < -1.96) = 0.0250
pnorm(-1.96)
# c) P(Z < -0.5) = 0.3085
pnorm(-0.5)
# a) P(Z > 2.33) = 0.0099
pnorm(2.33, lower.tail = FALSE)
1 - pnorm(2.33)
###Equivalentes
# b) P(Z > 1.96)
pnorm(1.96, lower.tail = FALSE)
# c) P(Z > -0.5)
pnorm(-0.5, lower.tail = FALSE)
# a) P(-1.64 < Z < 1.64) = 0.8990
pnorm(1.64) - pnorm(-1.64)
# b) P(-1.96 < Z < 1.96) = 0.9500
pnorm(1.96) - pnorm(-1.96)
# c) P(-2.57 < Z < 2.57) = 0.9898
pnorm(2.57) - pnorm(-2.57)
# d) P(-2.33 < Z < 1.15) = 0.8650
pnorm(1.15) - pnorm(-2.33)


# Ejercicio. Obtención de cuantiles de la distribución normal estándar
# Sea Z ~ N(0,1). Obtenga en cada caso el valor de z0
# P(Z < z0) = 0.0606 R: z0 = -1.55
qnorm(0.0606)
# P(Z < z0) = 0.0505 R: z0 = -1.64
qnorm(0.0505)
# P(Z < z0) = 0.5678 R: z0 = 0.171 
qnorm(0.5678)

# Sea Z ~ N(0,1). Obtenga en cada caso el valor de z0
# P(Z > z0) = 0.0505 R: z0 = 1.64
qnorm(0.0505, lower.tail = FALSE)
# P(Z > z0) = 0.0256 R: z0 = 1.95
qnorm(0.0256, lower.tail = FALSE)
# P(Z > z0) = 0.1234 R: z0 = 1.158
qnorm(0.1234, lower.tail = FALSE)


# Sea Z ~ N(0,1). Obtenga en cada caso el valor de z0
# P(-z0 < Z < z0) = 0.7814 R: z0 = 1.23
# 2*P(Z < z0) = 0.7814
qnorm((1 - 0.7814)/2, lower.tail = FALSE)
-qnorm((1 - 0.7814)/2)

# P(-z0 < Z < z0) = 0.8765 R: z0 = 1.54
qnorm((1 - 0.8765)/2, lower.tail = FALSE)
-qnorm((1 - 0.8765)/2)

# P(-z0 < Z < z0) = 0.7374 R: z0 = 1.12
qnorm((1 - 0.7374)/2, lower.tail = FALSE)
-qnorm((1 - 0.7374)/2)

# Una máquina de café llena vasos con capacidad nominal de 250ml con un promedio de 260ml con una desviación estándar de 3ml. Suponga que el volumen del líquido servido por la máquina es una variable aleatoria normal.
# Calcule la probabilidad de que se sirva un vaso con menos de 250ml. R = 0.0004
pnorm(250, mean = 260, sd = 3)
# Calcule la probabilidad de que se sirva un vaso con 265ml o más. R = 0.0478 (PQRS)
pnorm(265, mean = 260, sd = 3, lower.tail = FALSE)
# Calcule el contenido mínimo del 5% de los vasos que se llenan con el mayor volumen R = 264.93
qnorm(0.05, mean = 260, sd = 3, lower.tail = FALSE)
# Calcule el contenido máximo del 5% de los vasos que se llenan con el menor volumen R = 255.07
qnorm(0.05, mean = 260, sd = 3)

