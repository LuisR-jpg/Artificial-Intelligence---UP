library('Deriv')

NewtonRaphson <- function(x, e){
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
  }
  cat("x =", x, "\nf(x) =", f(x), "\nf'(x) =", fDeriv(x), "\nf''(x) =", sDeriv(x))
  return(matrix(v, ncol = 4, byrow = TRUE)) #CSV
}

grafica <- function(a, b){ #Graphing 
  x = seq(a, b, 0.1)
  plot(x, f(x), type="l")
}
f <- function(x){
  x^2 + 2*exp(-x)
}
grafica(0, 2) 
write.csv(NewtonRaphson(2, 0.001), file = "Git/School/Optimización y Metaheurísticas/NewtonRaphson.csv") #CSV


