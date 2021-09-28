library('Deriv')

Secante <- function(a, b, e, it = -1){
  flag = 0
  alpha = 0
  fDeriv = Deriv(f)
  h = xPlot = c() #CSV
  repeat{
    alpha = (a + b)/2
    xPlot = c(xPlot, alpha)
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
    xPlot = c(xPlot, alpha)
    if(fDeriv(alpha) > 0) b = alpha
    else a = alpha
    h = c(h, alpha, f(alpha), fDeriv(alpha)) #CSV
    if(abs(fDeriv(alpha)) < e) break
    if(!(it <- it - 1)) break
  }
  lines(xPlot, f(xPlot), type = "b")
  return(matrix(h, ncol = 3, byrow = TRUE)) #CSV
}
grafica <- function(a, b){ #Graphing 
  x = seq(a, b, 0.1)
  plot(x, f(x), type="l")
}
f <- function(x){
  x^2 + x^4
}
#Secante(-4, 3, 0.00000001)

#grafica(-2, 2)
plot(0, 0)
write.csv(Secante(-4, 2, 1e-8, 10), file = "Git/School/Optimización y Metaheurísticas/Secante.csv") #CSV
