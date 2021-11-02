
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





# Intervalo de confianza para la Varianza
# Ejemplo 1.
IC_Varianza = function(desv_std, n, coef_conf){
  alfa = 1 - coef_conf
  ji2_1_menos_alfa_medios = qchisq(1 - alfa/2, n - 1, lower.tail = FALSE)
  print(ji2_1_menos_alfa_medios)
  ji2_alfa_medios = qchisq(alfa/2, n - 1, lower.tail = FALSE)
  print(ji2_alfa_medios)
  
  LIC = (n-1)*desv_std^2/ji2_alfa_medios
  LSC = (n-1)*desv_std^2/ji2_1_menos_alfa_medios
  return(list(lim_inf_conf = LIC, lim_sup_conf = LSC))
}
n = 36
s = 1.8
coefConf = 0.99
IC1_var = IC_Varianza(s, n, coefConf)
IC1_var

# Ejemplo 2.
IC_Varianza(sd(c(18, 21, 16, 22, 19, 24, 17, 21, 23, 18, 14, 16, 16, 19, 18, 20, 12, 22, 15, 17)), 20, 0.98)




# Intervalos de confianza para comparar dos poblaciones

IC_mu1_mu2_sigmas_conocidas = function(x_barra1, n1, sigma1, x_barra2, n2, sigma2, coef_conf){
  alfa = 1 - coef_conf
  z_alfa_medios = qnorm(alfa/2, lower.tail = FALSE)
  LIC = (x_barra1 - x_barra2) - z_alfa_medios*sqrt(sigma1^2/n1 + sigma2^2/n2)
  LSC = (x_barra1 - x_barra2) + z_alfa_medios*sqrt(sigma1^2/n1 + sigma2^2/n2)
  resultado = list(lim_inf_conf = LIC, lim_sup_conf = LSC)
  return(resultado)
}

x_barra1 = 4.1
x_barra2 = 4.5
n1 = 100
n2 = 100
sigma1 = 1.8
sigma2 = 2
coefConf = 0.9
IC_mu1_mu2_sigmas_conocidas(x_barra1, n1, sigma1, x_barra2, n2, sigma2, coefConf)


# Intervalo de confianza para la diferencia de proporciones

IC_diferencia_proporciones = function(p1, p2, coef_conf, n1, n2){
  alfa = 1 - coef_conf
  z_alfa_medios = qnorm(alfa/2, lower.tail = FALSE)
  LIC = p1-p2 - z_alfa_medios*sqrt(p1*(1 - p1)/n1 + p2*(1 - p2)/n2)
  LSC = p1-p2 + z_alfa_medios*sqrt(p1*(1 - p1)/n1 + p2*(1 - p2)/n2)
  resultado = list(lim_inf_conf = LIC, lim_sup_conf = LSC)
  return(resultado)
}

IC_diferencia_proporciones(30/200, 180/600, 0.99, 200, 600)