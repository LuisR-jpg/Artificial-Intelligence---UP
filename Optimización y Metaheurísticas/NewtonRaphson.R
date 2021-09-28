library('Deriv')

NewtonRaphson <- function(x, e, it = -1){
  xPrev = 0
  fDeriv = Deriv(f)
  sDeriv = Deriv(fDeriv)
  v = c()
  while(abs(x - xPrev) > e){
    xPrev = x
    v = c(v, x, f(x), fDeriv(x), sDeriv(x)) #CSV
    x = xPrev - fDeriv(x)/sDeriv(x)
    xPlot <- c(xPrev, x) #Graphing
    
    lines(xPlot, f(xPlot), type = "b") #Graphing
    if(!(it <- it - 1)) break
  }
  cat("x =", x, "\nf(x) =", f(x), "\nf'(x) =", fDeriv(x), "\nf''(x) =", sDeriv(x))
  return(matrix(v, ncol = 4, byrow = TRUE)) #CSV
}

grafica <- function(a, b){ #Graphing 
  x = seq(a, b, 0.1)
  plot(x, f(x), type="l")
}
f <- function(x){
  x^2 + x^4
}
#grafica(-5, 5) 
plot(c(-5, 5, 0), c(20, 20, -2))
write.csv(NewtonRaphson(-4, 1e-8, 10), file = "Git/School/Optimización y Metaheurísticas/NewtonRaphson.csv") #CSV


