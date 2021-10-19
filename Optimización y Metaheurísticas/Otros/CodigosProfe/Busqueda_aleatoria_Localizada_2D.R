
# Defino la funcion a optimizar
fobjetivo = function(x){
  0.5*((x[1]^4 - 16*x[1]^2 + 5*x[1]) + (x[2]^4 - 16*x[2]^2 + 5*x[2]))
}

# Dibujar la funcion que quiero optimizar

# seleccion de colores
require(colorRamps)
my.cols <- matlab.like(9)

# Limites de graficacion para x1 y x2
x1 <- seq(-4, 4, length.out=100)
x2 <- seq(-4, 4, length.out=100)

# crear mallado con x1 y x2, y evaluar cada par de puntos en la funcion fr
z <- fobjetivo(expand.grid(x1, x2))

# grafica de contorno
contour(x1, x2, matrix(z$Var, length(x1)), col=my.cols, lwd=1.8, lty=2, nlevels = 14, xlab='x1', ylab='x2')


# Paso 0 (inicializacion)
x = c(4, 4)
fx = fobjetivo(x)
k = 0

points(x[1], x[2], col="blue", pch=19)

while(k < 500){
  k = k + 1 
  
  # Paso 1:
  dk = rnorm(2, mean = 0, sd = 1.3) # sigma pequeña, saltos pequeños; sigma grande, saltos grandes
  xhat = x + dk
  fxhat = fobjetivo(xhat)
  
  if(fxhat < fx){
    x = xhat
    fx = fxhat
    points(x[1], x[2], col="green", pch=19)
  }
  else points(xhat[1], xhat[2], col="red", pch=19)
}
options(digits=8) # digitos para los decimales
cat("Solucion x1=", x[1], "x2=", x[2], "con valor f(x1,x2)=", fx, '\n')
