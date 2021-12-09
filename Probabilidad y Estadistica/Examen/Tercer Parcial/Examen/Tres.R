tiempos = read.csv("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Examen\\Tercer Parcial\\Examen\\Uno.csv", header = TRUE)
tiempos
x = tiempos[,1]
y = tiempos[,2]
n = dim(tiempos)[1]
Sxx = sum(x^2) - 1/n*(sum(x))^2
Sxy = sum(x*y) - 1/n*(sum(x))*sum(y)
Syy = sum(y^2) - 1/n*(sum(y))^2
r = Sxy/sqrt(Sxx*Syy)
rCuadrada = r^2
cat("r = ", r, "\nr^2 = ", rCuadrada, sep = "")