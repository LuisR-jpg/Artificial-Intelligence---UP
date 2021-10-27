library('Deriv')

NewtonRaphson <- function(x, e, it = -1){
  xPrev = 0
  fDeriv = Deriv(f)
  sDeriv = Deriv(fDeriv)
  contIt = 0
  v = xPlot = yPlot = c()
  while(abs(x - xPrev) > e){
    xPrev = x
    v = c(v, x, f(x), fDeriv(x), sDeriv(x)) #CSV
    x = xPrev - fDeriv(x)/sDeriv(x)
    
    xPlot = c(xPlot, contIt <- contIt + 1)
    yPlot = c(yPlot, f(xPrev))

    if(!(it <- it - 1)) break
  }
  xPlot = c(xPlot, contIt + 1)
  yPlot = c(yPlot, f(x))
  cat("x =", x, "\nf(x) =", f(x), "\nf'(x) =", fDeriv(x), "\nf''(x) =", sDeriv(x))
  plot(xPlot, yPlot, type = "b", main = "Newton-Raphson", xlab = "Iteration", ylab = "Result")
  return(matrix(v, ncol = 4, byrow = TRUE)) #CSV
}

f <- function(x){
  x^2 + x^4
}
NewtonRaphson(-4, 1e-8, 10)
#write.csv(NewtonRaphson(-4, 1e-8, 10), file = "Git/School/Optimización y Metaheurísticas/ProblemaDerivadas/NewtonRaphson.csv") #CSV


