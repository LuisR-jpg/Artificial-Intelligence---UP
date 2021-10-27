
Secante <- function(a, b, e, it = -1){
  flag = 0
  alpha = 0
  pAlpha = 0
  fDeriv = Deriv(f)
  h = xPlot = yPlot = c() #CSV
  xGraf = seq(-2, 1, 0.1)
  plot(xGraf, fDeriv(xGraf), type = "l", lwd = 1, main = "Secant", xlab = expression('x'[i]), ylab = expression("f'(x"[i]*")"))
  c = -1
  repeat{
    pAlpha = alpha
    alpha = (a + b)/2
    if((c = c + 1))
      lines(c(pAlpha, alpha), c(fDeriv(pAlpha), 0), type = "b", pch = 20, lty = 3)
    
    if(fDeriv(a)*fDeriv(alpha) < 0){
      b = alpha;
      break;
    }
    else a = alpha;
    h = c(h, alpha, f(alpha), fDeriv(alpha)) #CSV
    if(!(it <- it - 1)) break
  }
  repeat{
    pAlpha = alpha
    alpha = b - fDeriv(b)/(fDeriv(b) - fDeriv(a))/(b - a)
    if((c = c + 1))
      lines(c(pAlpha, alpha), c(fDeriv(pAlpha), 0), type = "b", pch = 20, lty = 3)

    if(fDeriv(alpha) > 0) b = alpha
    else a = alpha
    h = c(h, alpha, f(alpha), fDeriv(alpha)) #CSV
    if(abs(fDeriv(alpha)) < e) break
    if(!(it <- it - 1)) break
  }
  abline(h = 0, lty = 2, lwd = 1)
  abline(v = 0, lty = 2, lwd = 1)
  return(matrix(h, ncol = 3, byrow = TRUE)) #CSV
}
f <- function(x){
  x^2
}
#Secante(-4, 2, 1e-8, 10)
write.csv(Secante(-5, 4, 1e-8), file = "Git/School/Optimización y Metaheurísticas/ProblemaDerivadas/Ejercicio III/SecanteDos.csv") #CSV
