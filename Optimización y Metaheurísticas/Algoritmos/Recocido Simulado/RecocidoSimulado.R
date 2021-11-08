# funcion objetivo con penalizacion de restricciones g1 y g2
f1 <- function(x){
  res <- (x[1]-1)^2 + (x[2]-5)^2
  if((-x[1]^2 + x[2]-4)> 0) res <- res + 1000 # g1
  if((-(x[1]-2)^2 + x[2]-3)> 0) res <- res + 1000 # g2
  return(res)
}
# Restriccion g1
g1 <- function(x) -x[1]^2 + x[2] - 4
# Restriccion g2
g2 <- function(x) -(x[1]-2)^2 + x[2] - 3
RecocidoS <- function(iteraciones){
  # Paso 0
  mejorX <- c(-1.0,1.0)
  mejorFx <- f1(mejorX)
  historial <- c(1, mejorX, f1(mejorX),g1(mejorX),g2(mejorX))
  temp <- 1000
  for(i in 1:iteraciones){
    # Paso 1
    nuevoX <- mejorX + rnorm(2, 0, 1)
    # Paso 2
    if(f1(nuevoX) < f1(mejorX)){
      mejorX <- nuevoX
      mejorFx <- f1(nuevoX)
      historial <- rbind(historial, c(i+1, mejorX, f1(mejorX),g1(mejorX),g2(mejorX)))
    }else{
      aleatorio <- runif(1)
      if(aleatorio < exp((f1(mejorX)-f1(nuevoX))/temp)){
        mejorX <- nuevoX
        mejorFx <- f1(nuevoX)
        historial <- rbind(historial, c(i+1, mejorX, f1(mejorX),g1(mejorX),g2(mejorX)))
      }
    }
    # Paso 3
    temp <- 0.95*temp
  }
  colnames(historial) <- c("x","x1","x2","f1(x)","g1(x)","g2(x)")
  print(historial)
  cat('x1 = ',mejorX[1], ' x2 = ', mejorX[2], 'con f(x1, x2)=', mejorFx,'\n')
}
set.seed(1984)
RecocidoS(20000)