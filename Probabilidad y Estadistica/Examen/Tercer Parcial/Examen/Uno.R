tiempos = read.csv("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Examen\\Tercer Parcial\\Examen\\Uno.csv", header = TRUE)
tiempos
x = tiempos[,1]
y = tiempos[,2]
n = dim(tiempos)[1]

Sxx = sum(x^2) - 1/n*(sum(x))^2
Sxy = sum(x*y) - 1/n*(sum(x))*sum(y)
b1 = Sxy/Sxx
b0 = mean(y) - b1*mean(x)
cat("y = ", b0, " + ", b1, "x", sep = "")