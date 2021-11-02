# Segundo examen parcial

################ 1. Intervalo de confianza para media.
icMedia <- function(media, sigma, tam, coef){
  alfa = 1 - coef
  zAlfamedios = qnorm(alfa/2, lower.tail = FALSE)
  LIC = media - zAlfamedios*sigma/sqrt(tam)
  LSC = media + zAlfamedios*sigma/sqrt(tam)
  return(list(lic = LIC, lsc = LSC))
}

# Datos
media = 4.2
n = 100
sdMuestral = 1.75
conf = 90
icMedia(media, sdMuestral, n, conf/100)



################ 2. 

################ 3. Sea X ~ F(2, 8), entonces P(X < 0.76):


################ 10. X ~ X^2 -> P(30 < x < 50) = P(50) - P(30)
# P(50) - P(30) = 0.7848 - 0.0667 = 0.7181

################ 11.

varianza = function(desv_std, n, coef_conf) {
  alfa = 1 - coef_conf
  ji2_alfa_medios = qchisq(alfa/2, n-1, lower.tail=FALSE)
  ji2_1_menos_alfa_medios = qchisq(1 - alfa/2, n-1, lower.tail=FALSE)
  
  LIC = (n-1)*desv_std^2/ji2_alfa_medios
  LSC = (n-1)*desv_std^2/ji2_1_menos_alfa_medios
  
  resultado = list(lim_inf_conf=LIC, lim_sup_conf=LSC)
  
  return(resultado)
}
icVarianza <- function(muestra, coef){
  alfa = 1 - coef
  jiAlfamedios = qchisq(alfa/2, length(muestra) - 1, lower.tail = FALSE)
  jiUnomenos = qchisq(1 - alfa/2, length(muestra)-1, lower.tail = FALSE)
  LIC = (length(muestra) - 1)*sd(muestra)^2/jiAlfamedios
  LSC = (length(muestra) - 1)*sd(muestra)^2/jiUnomenos
  return(list(lic = LIC, lsc = LSC))
}

# Datos
icVarianza(c(2.3, 1.9, 2.1, 2.8, 2.3, 3.6, 1.4), 90/100)

################ 14. 
# Hipótesis
## H0: nCD >= 50%
##Ha: nCD < 50%
pZ = 0.5
# Datos:
n = 200
nCD = 108 #Nu mero carga y descarga
a = 0.01
# Procedimiento:
pGorro = nCD/n
zCalc = (pGorro - pZ)/sqrt(pZ*(1 - pZ)/n)
print(zCalc < -pnorm(0.01/2))
cat(zCalc, -qnorm(0.01/2, lower.tail = FALSE))


