# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matemáticas
# Probabilidad y Estadística para Ingeniería
# 
# Luis Robles

# =====
# Distribución Poisson
# =====

#En la inspección de hojalata producida por un proceso electrolítico continuo, se identifican 0.2 imperfecciones en promedio por minuto. Determine las probabilidades de identificar:

lambdaUnMin = 0.2

# a) Exactamente una imperfección en un minuto.
# P(X = 1) 
UnaenUn = dpois(1, lambdaUnMin)
UnaenUn

# b) Al menos una imperfección en un minuto.
# 1 - P(X = 0)
CeroenUn = dpois(0, lambdaUnMin)
AlmenosUnaenUn = 1 - CeroenUn
AlmenosUnaenUn

# c) Exactamente una imperfección en 3 minutos.
# P(X = 1) en otro intervalo
lambdaTresMin = lambdaUnMin*3
UnaenTres = dpois(1, lambdaTresMin)
UnaenTres

# d) Al menos dos imperfecciones en 5 minutos
# P(X >= 2) = P(X > 1) = 1 - P(X = 1) - P(X = 0) en otro intervalo
lambdaCincoMin = lambdaUnMin*5
AlmenosDosenCinco = 1 - dpois(1, lambdaCincoMin) - dpois(0, lambdaCincoMin)
AlmenosDosenCinco

# e) Cuando mucho una imperfección en 15 minutos
# P(X <= 1) = P(X = 0) + P(X = 1) en otro intervalo
lambdaQuinceMin = lambdaUnMin*15
CuandoMuchoUnaenQuince = dpois(0, lambdaQuinceMin) + dpois(1, lambdaQuinceMin)
CuandoMuchoUnaenQuince



