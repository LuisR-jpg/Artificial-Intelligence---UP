# Ejercicio 2. Regresión Lineal Múltiple. Ganancias de la industria Química.
source("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Regresion\\Multiple\\Ejercicios\\Dos\\Regresion_util.R")

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

ganancias = read.table("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Regresion\\Multiple\\Ejercicios\\Dos\\ProblemaDos.txt", header = TRUE)
ganancias

# a.	Ajuste un modelo de regresión lineal múltiple a los datos y estime los coeficientes de regresión utilizando todas las variables
ganancia_modelo = lm(Ganancia ~ Empleados + Dividendos + Inventario, data = ganancias)
ganancia_modelo
  # Call:
  #   lm(formula = Ganancia ~ Empleados + Dividendos + Inventario, 
  #      data = ganancias)
  # 
  # Coefficients:
  #   (Intercept)    Empleados   Dividendos   Inventario  
  # 965.2809       2.8653       6.7538       0.2873  
  # Por lo tanto, el modelo obtenido es:
  #   965.2809 + Empleados*2.8653 + Dividendos*6.7538 + Inventario*0.2873

# b.	Realice el contraste de hipótesis del Análisis de Varianza y diga si al menos una de las variables utilizadas es adecuada para pronosticar el valor de la Ganancia
summary(ganancia_modelo) 
  # Call:
  #   lm(formula = Ganancia ~ Empleados + Dividendos + Inventario, 
  #      data = ganancias)
  # 
  # Residuals:
  #   Min       1Q   Median       3Q      Max 
  # -1547.37  -666.32   -57.47   457.14  1974.68 
  # 
  # Coefficients:
  #   Estimate Std. Error t value Pr(>|t|)  
  # (Intercept) 965.2809   499.7502   1.932   0.0774 .
  # Empleados     2.8653     1.5828   1.810   0.0954 .
  # Dividendos    6.7538    10.2791   0.657   0.5236  
  # Inventario    0.2873     0.1111   2.586   0.0238 * <- '*' significativo, se puede rechazar la hipótesis de que este beta es 0.
  #   ---
  #   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
  # 
  # Residual standard error: 1009 on 12 degrees of freedom
  # Multiple R-squared:  0.7884,	Adjusted R-squared:  0.7355  <- El modelo explica el resultado en aproximadamente 75%, not bad
  # F-statistic:  14.9 on 3 and 12 DF,  p-value: 0.0002383 <- ESTADISTICO F DEL ANALISIS DE VARIANZA

    # En el estadístico F del análisis de varianza, como p-value < 0.05, se rechaza H0 de que todas las betas son cero.


    # Estimate/std Error gives errores estandarizados.

# c.	Identifique las variables que son útiles para pronosticar Y para ajustar un modelo corregido. Proporcione este nuevo modelo.

  # Observamos que las variables empleado e inventario son útiles para el modelo, y dividendos no. Asi que se reajusta el modelo omitiendo dividendos.
ganancia_modelo_dos = lm(Ganancia ~ Empleados + Inventario, 
                         data = ganancias)
ganancia_modelo_dos
summary(ganancia_modelo_dos)

# Call:
#   lm(formula = Ganancia ~ Empleados + Inventario, data = ganancias)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -1659.93  -660.42   -33.18   578.42  1837.34 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)  
# (Intercept) 1134.7613   418.5743   2.711   0.0178 *
#   Empleados      3.2575     1.4336   2.272   0.0407 *
#   Inventario     0.3099     0.1033   3.001   0.0102 *
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 986.7 on 13 degrees of freedom
# Multiple R-squared:  0.7808,	Adjusted R-squared:  0.747 
# F-statistic: 23.15 on 2 and 13 DF,  p-value: 5.198e-05
# 
# 
# # Se observa que el modelo ha mejorado, porque todos los coeficientes son significativamente distintos de cero y el valor de R^2 prácticamente no bajó.  
