library('Deriv')

Secante <- function(a, b, e, it = -1){
  flag = 0
  alpha = 0
  fDeriv = Deriv(f)
  h = xPlot = yPlot = c() #CSV
  itG = 0
  repeat{
    alpha = (a + b)/2
    xPlot = c(xPlot, itG <- itG + 1)
    yPlot = c(yPlot, alpha)
    if(fDeriv(a)*fDeriv(alpha) < 0){
      b = alpha;
      break;
    }
    else a = alpha;
    h = c(h, alpha, f(alpha), fDeriv(alpha)) #CSV
    if(!(it <- it - 1)) break
  }
  repeat{
    alpha = b - fDeriv(b)/(fDeriv(b) - fDeriv(a))/(b - a)
    xPlot = c(xPlot, itG <- itG + 1)
    yPlot = c(yPlot, alpha)
    if(fDeriv(alpha) > 0) b = alpha
    else a = alpha
    h = c(h, alpha, f(alpha), fDeriv(alpha)) #CSV
    if(abs(fDeriv(alpha)) < e) break
    if(!(it <- it - 1)) break
  }
  plot(xPlot, yPlot, type = "b", xlab = "Iteration", ylab = "Result", main = "Secant")
  return(matrix(h, ncol = 3, byrow = TRUE)) #CSV
}
f <- function(x){
  x^2 + x^4
}
Secante(-4, 2, 1e-8, 10)
#write.csv(Secante(-4, 2, 1e-8, 10), file = "Git/School/Optimización y Metaheurísticas/ProblemaDerivadas/Secante.csv") #CSV
