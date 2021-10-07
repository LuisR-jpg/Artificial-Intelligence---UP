
# Ejemplo 1. Intervalo de confianza para la media con sigma conocida.
# =====
# Funciones
# -----
IC_mu_sigma_conocida = function(x_barra, sigma, n, coef_conf) {
  alfa = 1 - coef_conf
  z_alfa_medios = qnorm(alfa/2, lower.tail=FALSE)
  
  LIC = x_barra - z_alfa_medios*sigma/sqrt(n)
  LSC = x_barra + z_alfa_medios*sigma/sqrt(n)
  
  resultado = list(lim_inf_conf=LIC, lim_sup_conf=LSC)
  
  return(resultado)
}

# Ejemplo.
# Suponga que cierta maquina fabrica resistencias electricas cuyo valor sigue una distribucion normal con una desviacion estandar de 2 Ohms
# Una muestra de tamaño 36 produce una resistencia promedio de 1458 Ohms
# Obtenga un IC de 95% para la verdadera resistencia promedio de las piezas producidas por la maquina


# Los puntajes de los aspirantes a un puesto en el área de Sistemas de una gran empresa se distribuyen normales con una desviación estándar de 21 puntos. El promedio de una muestra de 10 de tales puntajes fue de 442.7. Calcule un intervalo de confianza de 98% para el verdadero promedio de los puntajes de los aspirantes al puesto.
# Respuesta:
#   El verdadero promedio de los puntajes de los aspirantes al puesto está entre 427.251 y 458.149 con una confianza de 98%

media = 442.7
sigma = 21
tam_muestra = 10
coefConf = 0.98

IC1 = IC_mu_sigma_conocida(media, sigma, tam_muestra, coefConf)
IC1






# En una encuesta a los estudiantes de la Universidad se preguntó a 85 de ellos si había reprobado algún examen en el periodo anterior
# Suponga que 8 de ellos respondieron afirmativamente
# Calcule un intervalo de confianza de 95% para la verdadera proporción de estudiantes que reprobó algún examen en el periodo anterior
# R: P([0.032,0.156] ??? p) = 0.95


n = 85
p = 8/n
alpha = 1 - 0.95
p - qnorm(alpha/2, lower.tail = FALSE)*sqrt(p*(1 - p)/n)
p + qnorm(alpha/2, lower.tail = FALSE)*sqrt(p*(1 - p)/n)

# Suponga que el Sistema de Administración Tributaria realizó una encuesta entre sus usuarios y obtuvo que de entre los 1,100 entrevistados, 486 dijeron haber tenido algún problema con el sistema de emisión de comprobantes fiscales electrónicos
# Calcule un intervalo de confianza de 99% para el verdadero valor de la proporción de usuarios que ha tenido algún problema con el sistema de emisión de comprobantes electrónicos
# R: P([0.403,0.481] ??? p) = 0.99
n = 1100
p = 486/n
alpha = 1 - 0.99
p - qnorm(alpha/2, lower.tail = FALSE)*sqrt(p*(1 - p)/n)
p + qnorm(alpha/2, lower.tail = FALSE)*sqrt(p*(1 - p)/n)

