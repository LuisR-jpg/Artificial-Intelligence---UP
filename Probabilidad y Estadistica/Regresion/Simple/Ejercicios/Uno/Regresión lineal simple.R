# Universidad Panamericana
# Campus Bonaterra
# Departamento de Matem�ticas
# Probabilidad y Estad�stica para Ingenier�a
# 
# Paul RC
# 2021 10 25
# =====
# Ejemplo 1. Modelo de Regresi�n Lineal Simple
# -----
# Funciones
# -----
regresion_lineal_simple = function(datos, x_nueva=NULL) {
  # Esta funci�n asume que la primera columna contiene los valores para x y la segunda para y
  x = datos[,1]
  y = datos[,2]
  n = dim(datos)[1]
  # ---
  # Calculamos beta_gorro0 y beta_gorro1
  Sxx = sum(x^2) - 1/n*(sum(x))^2
  Sxy = sum(x*y) - 1/n*(sum(x))*sum(y)
  beta_gorro1 = Sxy/Sxx
  beta_gorro0 = mean(y) - beta_gorro1*mean(x)
  
  # ---
  # Gr�fica de dispersi�n
  plot(x, y, main="Gr�fica de Dispersi�n",
       xlab=names(datos)[1], ylab=names(datos)[2],
       pch=16, col="blue")
  # Agregamos la recta de regresi�n
  abline(a=beta_gorro0, b=beta_gorro1, col="red")
  
  # ---
  # Pron�stico de y para x_nueva
  if (! is.null(x_nueva)) {
    y_nueva = beta_gorro0 + beta_gorro1*x_nueva
  } else {
    y_nueva = NULL
  }
  
  # ---
  # Devolvemos el resultado al programa principal
  resultado = list(beta_gorro0=beta_gorro0, beta_gorro1=beta_gorro1,
                   y_nueva=y_nueva)
  
  return(resultado)
}
# =====
# Programa principal

# Para estimar el inventario de este a�o (inventario en exceso), una compa��a de neum�ticos muestre� 5 comerciantes, obteniendo en cada caso las cifras de inventario tanto para el a�o pasado como para el presente. Los datos est�n en la tabla
# Elabore un modelo de regresi�n lineal simple para los datos.
# Interprete el valor de los coeficientes de regresi�n
# Estime el inventario para el a�o presente si el inventario del a�o pasado fue de 125 unidades


articulos = read.csv(file.choose(), header=TRUE)
articulos

# # Estimaci�n del modelo de regresi�n
# regresion1 = regresion_lineal_simple(articulos)
# regresion1
# 
# # Estimaci�n del modelo de regresi�n y c�lculo de y para x_nueva = 10
# regresion1 = regresion_lineal_simple(articulos, x_nueva=10)
# regresion1
# 
# # Estimaci�n del modelo de regresi�n y c�lculo de y para x_nueva = c(5, 10, 15, 20, 25)
# regresion1 = regresion_lineal_simple(articulos, x_nueva=c(5, 10, 15, 20, 25))
# regresion1

regresion_lineal_simple(articulos, 125)

