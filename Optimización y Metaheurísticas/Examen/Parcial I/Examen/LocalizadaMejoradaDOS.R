
# Defino la funcion a optimizar
fobjetivo = function(x){
  -x[1]*sin(sqrt(abs(x[1])))-x[2]*sin(sqrt(abs(x[2])))
}

# Dibujar la funcion que quiero optimizar

# seleccion de colores
require(colorRamps)
my.cols <- matlab.like(9)

# Limites de graficacion para x1 y x2
x1 <- seq(-500, 500, length.out=100)
x2 <- seq(-500, 500, length.out=100)




# crear mallado con x1 y x2, y evaluar cada par de puntos en la funcion fr
z <- fobjetivo(expand.grid(x1, x2)) 

# grafica de contorno: x1, x2 = axis, matrix = vals(100, 100)
contour(x1, x2, matrix(z$Var, length(x1)), col=my.cols, lwd=1, lty=1, nlevels = 14, xlab='x1', ylab='x2')

vec = (0)

for(i in 1:30){
  # Paso 0 (inicializacion)
  x = c(0, 100)
  fx = fobjetivo(x)
  peorfx = fx
  k = 0
  b = c(0, 0)
  
  points(x[1], x[2], col="blue", pch=25)
  
  while(k < 1000){
    k = k + 1
  
    # Paso 1:
    dk = rnorm(2, mean = 0, sd = 100) # sigma pequeña, saltos pequeños; sigma grande, saltos grandes
    xhat = x + b + dk
    if(xhat[1] <= 500 && xhat[1] >= -500 && xhat[2] <= 500 && xhat[2] >= -500)
      fxhat = fobjetivo(xhat)
    else fxhat = fx
  
    if(fxhat > peorfx) peorfx = fxhat
    if(fxhat < fx){
      #arrows(x[1], x[2], xhat[1], xhat[2], length=1)
      x = xhat
      fx = fxhat
      b = 0.2*b + 0.4*dk
      points(x[1], x[2], col="green", pch=19)
    }else{
      points(xhat[1], xhat[2], col="red", pch=19)
      xhat = x + b - dk
      if(xhat[1] <= 500 && xhat[1] >= -500 && xhat[2] <= 500 && xhat[2] >= -500){
        if(fobjetivo(xhat) < fx){
          x = xhat
          b = b - 0.4*dk
        }
        else{
          b = 0.5*b
        }
      }
      else fxhat = fx
    }
  }
  options(digits=8) # digitos para los decimales
  #cat("Solucion x1=", x[1], "x2=", x[2], "con valor f(x1,x2)=", fx, '\n')
  vec = c(vec, peorfx)
  cat(fx, "\n")
}
cat(vec, sep="\n")
