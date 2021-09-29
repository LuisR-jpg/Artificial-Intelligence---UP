# f(x_1, x_2) = x_1^2 + x_2^2 - 2*x_1
# = f(x_1) = x_1^2 - 2*x_1 + f(x_2) = x_2^2

f <- function(xUno, xDos){
  xUno^2 + xDos^2 - 2*xUno
}
fUno <- function(x){
  x^2 - 2*x
}
fDos <- function(x){
  x^2
}

NewtonRaphson <- function(x, e, it = -1){
  xPrev = 0
  # fDeriv = Deriv(f)
  # sDeriv = Deriv(fDeriv)
  v = xPlot = yPlot = c()
  xGraf = seq(-4, 3, 0.1)
  plot(xGraf, fDeriv(xGraf), type = "l", lwd = 1, main = "Newton-Raphson", xlab = expression('x'[i]), ylab = expression("f'(x"[i]*")"))
  while(abs(x - xPrev) > e){
    xPrev = x
    v = c(v, x, f(x), fDeriv(x), sDeriv(x)) #CSV
    x = xPrev - fDeriv(x)/sDeriv(x)
    
    lines(c(xPrev, x), c(fDeriv(xPrev), 0), type = "b", pch = 20, lty = 3)
    # lines(c(xPrev, x), c(fDeriv(xPrev), 0), type = "p", pch = 20)
    # m = -fDeriv(xPrev)/(x - xPrev)
    # abline(-m*x, m, lty = 4)
    
    
    if(!(it <- it - 1)) break
  }
  abline(h = 0, lty = 2, lwd = 1)
  abline(v = 0, lty = 2, lwd = 1)
  cat("x =", x, "\nf(x) =", f(x), "\nf'(x) =", fDeriv(x), "\nf''(x) =", sDeriv(x))
  return(matrix(v, ncol = 4, byrow = TRUE)) #CSV
}

#NewtonRaphson(-4, 1e-8, 10)
write.csv(NewtonRaphson(-4, 1e-8, 10), file = "Git/School/Optimización y Metaheurísticas/ProblemaDerivadas/Ejercicio II/NewtonRaphson.csv") #CSV


