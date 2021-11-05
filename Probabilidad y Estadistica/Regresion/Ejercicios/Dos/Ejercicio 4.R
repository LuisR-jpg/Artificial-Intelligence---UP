source("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Regresion\\Ejercicios\\Dos\\Regresion_util.r")

# 4. La Comisión Federal de Comunicaciones (FCC, por sus siglas en inglés) de Estados Unidos especifica
# que las emisiones electromagnéticas radiadas por dispositivos digitales se deben medir en un sitio
# de prueba de campo abierto. A fin de verificar la aceptabilidad de un sitio de prueba es preciso
# evaluar la atenuación del sitio (es decir, la pérdida de transmisión desde un dipolo de media onda hasta la salida de otro cuando ambos dipolos se colocan sobre el plano de tierra).
# Un estudio realizado en un sitio de prueba en Fort Collins, Colorado, produjo los siguientes datos de atenuación del sitio (en decibeles) y frecuencia de transmisión (en megahertz) para dipolos a una distancia de 3 metros.

# Frecuencia de transmisión, x, MHz
fTransmision = c(50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000)
# Atenuación del sitio, y, dBL 
atenuacion = c(11.5, 15.8, 18.2, 22.6, 26.2, 27.1, 29.5, 30.7, 31.3, 32.6, 34.97)

# a. Elabore un diagrama de dispersión para los datos. ¿Es evidente una relación lineal entre x y y?
regresion_lineal_simple(data.frame(cbind(fTransmision, atenuacion)))
# Sí, presenta un comportamiento lineal

# b. Encuentre la línea de mínimos cuadrados que relaciona la atenuación del sitio y con la frecuencia de transmisión x.
# c. Trace la línea de mínimos cuadrados sobre el diagrama de dispersión para verificar sus cálculos.
# d. Interprete los valores de BetaGorroCero y BetaGorroUno.
# BetaGorroCero representa el punto donde se corta al eje de las Y. O sea, es nuestra línea evaluada en 0
# BetaGorroUno es la pendiente de la recta
# e. Elabore y analice las graficas de residuos estandarizados para ver si identifica violaciones a las suposiciones del modelo.
# Todas las gráficas se ven correctas. Aunque hay una correlación positive en la grafica secuencial de residuos.
