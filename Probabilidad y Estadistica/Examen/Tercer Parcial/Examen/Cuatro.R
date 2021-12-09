tiempos = read.csv("C:\\Users\\lalor\\Documents\\Git\\School\\Probabilidad y Estadistica\\Examen\\Tercer Parcial\\Examen\\Uno.csv", header = TRUE)
tiempos

x = tiempos[,1]
y = tiempos[,2]
n = dim(tiempos)[1]
Sxx = sum(x^2) - 1/n*(sum(x))^2
Sxy = sum(x*y) - 1/n*(sum(x))*sum(y)
bUno = Sxy/Sxx
bCero = mean(y) - bUno*mean(x)

yEstimada = bCero + bUno*x
residuos = y - yEstimada
resStd = (residuos - mean(residuos))/sd(residuos)

titulo = paste("Residuos Std vs", names(tiempos)[1])
plot(x, resStd, pch=16, col="green", main=titulo, xlab=names(tiempos)[1], ylab="Residuos Estandarizados")
abline(h=0, col="red")
hist(resStd, main="Histograma de Residuos Std",
     xlab="Residuos Estandarizados", ylab="Frecuencia", col="green")
qqnorm(resStd, pch=16, col="green",
       main="Gráfica de probabilidad Normal \n Residuos Estandarizados",
       xlab="Cuantiles Esperados", ylab="Cuantiles Observados")
qqline(resStd, col="red")
plot(resStd, pch=16, col="green", type="b",
     main="Gráfica secuencial de Residuos Std",
     xlab="Posición", ylab="Residuos Estandarizados")
abline(h=0, col="red", lty=2)