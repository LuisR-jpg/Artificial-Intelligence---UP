tiempos = read.csv("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Examen\\Tercer Parcial\\Examen\\Uno.csv", header = TRUE)
tiempos
modeloTiempos = lm(Congestionamiento ~ ï..Vehiculos, data = tiempos)
modeloTiempos
summary(modeloTiempos)