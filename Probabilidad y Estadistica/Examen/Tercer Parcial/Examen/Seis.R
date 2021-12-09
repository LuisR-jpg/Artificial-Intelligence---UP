tiendas = read.csv("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Examen\\Tercer Parcial\\Examen\\Cinco.csv", header = TRUE)
tiendas
modeloTiendas = lm(Venta ~ Area + Cajones + Ingresos, data = tiendas)
modeloTiendas
summary(modeloTiendas)
modeloTiendas = lm(Venta ~ Area + Cajones, data = tiendas)
modeloTiendas
summary(modeloTiendas)